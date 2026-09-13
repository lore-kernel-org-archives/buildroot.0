Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B0BC88E63
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 17:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1883180CA3;
	Sun, 13 Sep 2026 17:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sdLOUsCA-6-j; Sun, 13 Sep 2026 17:01:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 14EE880D2C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789318904;
	b=ZCkJpGRgHAqKCouZXuosZSawmghvM3pnM7HJZ0vtn0FVrDKz+BjRZsxCeuh8nfV8XrYt
	 1Fy/At+cX3brzaIj6Atg5g84dqlYnnafKc9IFm6rtHe+PtvsRbEBMDZMADbPHqXmWLTcF
	 hPON1xgIyfB3ASOPX46B5KVl6INbJK9rVvCm3yiFxFgvf4gCsMRRnYkEUquNqokmaDDW3
	 2m1iB9XOWFsmnt6tbPL/eq4p9C/qAu8j++l0o5ymDV6spAF/yrXXHI5rlDK0RIDubIVpu
	 B5X9GKK0CwU71U9tepIiJwyWPybZPYePj2BnMLSMmgQF3gO3aPGH0SKVCiheRViefsA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789318904;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=9RqxzKdSQ6+VCD/vfbU9dbdlcyjfNlVhmC3nlDTqGAA=;
	b=O5nw16jxqE70dgQ+9xzwNGE0hgLJoFHw7R4367KfG1CzYaLzabaU8amnOnVVD01vrSOg
	 fEZrmpUPubDOElGWd7H4VaRNohPOeL5U1vLOgA9J+4yfbQ17lcxbnM/yXTHPKqGYrrJpo
	 96e0b+Brb8wzy6ptMU9c6w0yXPo5o6jfqRhuW2sqdNoUd2MBK32tbWQzeFTQYWVqq0kGr
	 q6FAr5jXqN0T/saJH+9TtYUMTdBYgRFbCfz9SQGNz52sFE+BMZc7Mk4O+hYUgCA7caBkt
	 C7V8OoMc+GI+WO4Ga7cbKjPXj1gnMlwkgMcqZOroIqw9wRn7L94BLRP2WnietSb80Vg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789318904;
	bh=9RqxzKdSQ6+VCD/vfbU9dbdlcyjfNlVhmC3nlDTqGAA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=VKDAlToGHlNW6sqsKyqGxPX1vX+e1AVVuwQx94plx3B35H9Nf2o0yEJrYuD1/tGNA
	 NHhgHNyimz2WLBh+HMMgF+ZV62G+hE47iVIcWaxmOOn2makPcRJaMhiutYyuZgP47T
	 hGFDr0XB1R/4gs5rF3/PCeHateKZ2AHyXZJrvUj3HIn6JhdG5AknuIaTAxq4D8ZjSi
	 49/74iBlmrH504SNTWK/anuqAryMnxwaTrqgeTigFqAlWiKY76MIfIwjZvpPxi9nJa
	 i8fHFhTdtVb93Ccf0Ds+9sYYZO6doeYRRye4vhKxmH2PuQxYx8DGVBlbjxFn8VSSqX
	 oAabNvX+FbunQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14EE880D2C;
	Sun, 13 Sep 2026 17:01:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A0F1629B
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 17:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8709E80D2C
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 17:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P53c8-aKdih2 for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 17:01:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 14B8980CA3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789318901;
 b=ZVRHw9jeh9+m3UWUZ3ru6orCLybCjaMDtN6XABvjFH5idKhbEUaY5pNapS6k1244mWM1
 3nIg1By9jB7cVCy+riubXsfmdeoKWb3wHWOcUa0masKG9YN4BE9caSY7xlLvNz3FNaHK8
 VjHebVTHDk2nYF6t2vUDCBtqT2QbFJqWhjmvBYR0YCissk/RQzPOD1Gz0DrJWWXX6ttKK
 v9UeMOo/6Dbq6RVomuqGe5GcoZoLdq3Bzh+pc77Tmw0FNGgnWtVA2DuWbfcBciRXBVuSP
 dm50uwbkxRPwwebcVPyrjmiWDVVTs/vhmAPqTa+KkfyiEc0aKiKb/KeSwu6KPYgufnQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789318901;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=EgoSr1LyEyL6eW334EuwHFgnMtvRh+85vwWqAlrlBCg=;
 b=mpkFbjLkDoeZp64LLyryFUQq0BjHImBE3Hdizk2MjrdiLGPiIASjQWwM8FlkfadB8nT8
 BQakt3044vrGXbjJU0SmFC2ENM54nS8IrhlYmBisOtNRVRPKyrVdEDplIEM/nREZMaKbY
 1vLIsymZBVhy62oK9ZzB18VPZ/pvG5n1XiO1GFaR5oKK4Ypw8IqGW9Pss/lMhz8cVcMAa
 1JNtLBGlUs58wQdjZJ3TVZtkPQeq1s+uoA7asFyWPpGqSitSTy817FXozWUe1VgOXmDiI
 wlfZk9vezSZ+fI3ZjaxT/0ietKvIzmV9f2ifUU1IIiFLBushTty569GHz0M7Jral2gg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=kwhkXkDw; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 14B8980CA3
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 17:01:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 51DCBC63454
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 17:02:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 78A0F60435;
 Sun, 13 Sep 2026 17:01:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 792CB11C78D5A; 
 Sun, 13 Sep 2026 19:01:34 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 13 Sep 2026 19:01:32 +0200
Message-ID: <20260913170133.1695626-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/webkitgtk: propagate gst1-libav
 architecture dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_PACKAGE_WEBKITGTK_MULTIMEDIA selects BR2_PACKAGE_GST1_LIBAV, which
depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS, but doesn't propagate
this dependency. In practice, there is no issue, as webkitgtk is only
available on a subset of CPU architectures, while
BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS makes ffmpeg available on pretty much
all CPU architectures, except Cortex-M, m68k coldfire, and some
specific cases of OpenRISC, which are not supported by webkitgtk.

But for the sake of having correct dependency propagation, let's fix
this.

The other packages selected by BR2_PACKAGE_WEBKITGTK_MULTIMEDIA have
dependencies that are already handled at the top-level
BR2_PACKAGE_WEBKITGTK option.

Fixes: e6e549b9e40d42dbb6a551ecaeb040c1e401f21a ("ffmpeg: add BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/webkitgtk/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index cfb05fd0d3..13a65e57dc 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -112,6 +112,7 @@ comment "webkitgtk https support needs a toolchain w/ dynamic library"
 
 config BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
 	bool "multimedia support"
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS # gst1-libav
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BAD
 	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
