Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11501CA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 19:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B639A606DE;
	Tue,  6 Oct 2026 19:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7n_qGpu8HbLs; Tue,  6 Oct 2026 19:45:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B53DC607FA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791315905;
	b=VsRdlTbuqW8m92eLTh6Jq9/b8xgs/MtrJ/1fbXsDNtDKXE8lwjPuDFkxHFE1ppeZbiZz
	 GM3f4Zdku2igvvaH++RPDMEwm5HsD57+Frk6mbXa5lMPnQ9Dj5a0ir6IynKBxqOwgN9gS
	 WtNyQktil0bV7TyfXzWx3Su4dJcd1fpZJc8papHmhZHPsJrAlqP+v4Sc3FTlAqqvgGM2H
	 umk6Qqsa+IGrLrLhi1cMVE7GjcEx0lIbZttPzi05Du4sm3zNxF7/KiC9KhfvHW+hWG01s
	 xa15ray73BlfYjGHdUHILHWh+0xF9M4m1ngAm7SNCUvVWgA7r6l6a5Jdxyl7zRSRRnw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791315905;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BTtFxqoX9JA6u4kUUr580ps7aFTiAdHky+QsSXY6FcA=;
	b=MkexZfk2L9Q9eQI918n9x4cKkWLfIEnd3GDTTuwiFee/LU/jWCC+qqjWdBvRek4ndgZD
	 yi8UiJVboBsTm73VIbVAr5YMZUFBZvndV5VKaiWlUpmGfBVTjhZP1Wh0rJ2y4IRHoPfGo
	 g5HhBDVJJ9FMHkxBjRQ0w55AYOB3a4wdeasi4msVrO7tHUJq9EHlUnSp0xSY06ToX7cON
	 f0oJmQ+eBOy6NiZhqY3RTp0KbpTuqgO0rB6suid2yhZFI76a3mBPbY56wsO3F4fdRlZfY
	 9fai2/9q07qyOdXW0LcSHmAqatcNi3uShZGHCUWwVxUGZm4NlCUd+n7D/8GIn8j5/Lw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791315905;
	bh=BTtFxqoX9JA6u4kUUr580ps7aFTiAdHky+QsSXY6FcA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=n18grrtIYhLPOMVjJIJtWITK0X1ih5ZeyqLQtcsneRMR6LOuTYHpHSt0CKDHxjypY
	 RsIJ6hHDALjrWCV8uWPeFI67+W6ShAbM8ulHvVJoGfXlPr9RHLQwd23ZdDpzO8DtRZ
	 HZsZqrn6idzF+KPQDFl2f3vyTeRFb8wa0iLkY6dvpdO75xkIsc4RdxPbHN4fISWv2V
	 wiri+zPudtUVAyIor1SsexEPfUiH2gLttgy7fiKHQH4KDibM5NAykdm2HuEsYnnLlx
	 e+SjsC7WFqCjNX+CxdQEwEu01uenOT/oXM67WXqI2XJBZUHFObUHIqXkdN6eAYDVrl
	 1bOKEAdDqcSAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B53DC607FA;
	Tue,  6 Oct 2026 19:45:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D3D132F
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E71ED607F0
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fH_-jSCwNf1r for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 19:42:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 48769606DE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791315766;
 b=qZStF7VCeqRsubWIYhQCBLZxQYmBXMJz7isQVbYDQ2dr8X7UgOvLFXeBws/r8uitvlBo
 l5RqbxjyZ7nV2CrDINHpVEfLrcvpjZVtp8bCXxyaIJxGncBw50HurIPf5NadYp6VwRDCI
 ta8XI7tCJQZoiNKwWUzNajBUUDvODrotLvbvfMMTc7UaGABHoq1pjOCtphYmgXyyZ5Tgl
 VS6935CGmsoxkxUfCo23GtK/IeFUxzmvYvByhOt2haEBSGj2cStc4KbRPf6eKQ2sTWVe7
 QCZqsPmqcDtsWJ9AzRbYImX068iOPouH1GtOI8304Cgo/Qlux0bX+nC5sFpo4orQmgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791315766;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=dMm2FEO6tQ2KzbbbkKdXbjPRBCRHDxCS+XyGkI/jyxU=;
 b=LaPKjMuj0LzYwap5wSRNw32Som0z3d3KsY2uiluHSSzaBJj+YW2+WSGqkj0Oa4MD5rli
 Ij38UXSCAMf6biPE99+W3Tl0kV45aPRWgd5i6tYruYc+OFH2DQzK4pC7DQxoH4qwK2sNS
 F79ozCwxT2SYpSdk0tubQFTxDrJR8lkPMRHe4BhK59wtq4K+lodZ2M82LEjz4y8eHJHRP
 pAF3Ia8jZuWDLpI5MKWTUNCDveJgACH1KFMIPapwliZqMP6rtrVN+xpowOfQxFaz5LpTp
 TryjigL2UKUdNS5iyOgFtQT70dfvmAIAXPi59hfb4Fe2SIANBytmjsHumM3/emg6Tgw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmx.net; 
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=fWYPPtsv; 
 arc=none smtp.remote-ip=212.227.15.19
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48769606DE
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:42:44 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5wPh-1xL3c10Oyp-00EzoD; Tue, 06
 Oct 2026 21:42:42 +0200
To: buildroot@buildroot.org
Cc: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  6 Oct 2026 21:42:39 +0200
Message-ID: <20261006194239.947480-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:KrI5IkW02T+Z3/gHyQzQW6NVYYCkYsCxuF7zzohwsNoSTMKd4nG
 POHfu3MrXExWURjF8We5XAvLRYHowWMVx1R9O2is4/Yj8lNe/I6Xc/+/zWQlXEiI9qv1Rmu
 vJYQjy5XtqzevUI7vc27VP2bO5GX+tt9AvXLUtcjqlQo2vU/tvpob84+2+DTyRrMawzVx5K
 qotbUXoFJ0P5mtNp9jL2Q==
UI-OutboundReport: notjunk:1;M01:P0:SbRqLPOgH6I=;CvqvNziIlEb0+FYZMKDMizqlv+4
 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
 xeeH64pkLKSBQNHcg==
Subject: [Buildroot] [PATCH v1] package/openssh: security bump version to
 10.6p1
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- bump version to 10.6p1 (for details see [1])

[1] https://www.openssh.org/txt/release-10.6

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index aa84d011f8..a53ae817a4 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-10.5
-sha256  d44d28a839ea9daf969cc69150fde59910b2b39361dad81a3bd6cbd19218db11  openssh-10.5p1.tar.gz
+# From https://www.openssh.com/txt/release-10.6 (base64 encoded)
+sha256  a9dc9565dffe8640f64d863cd29a32bc4a3dbdec0566a7fc44c5d6ee767d5f39  openssh-10.6p1.tar.gz
 # Locally calculated
 sha256  5bb5b160726ef5756e4f32fe95b35249c294962419650f48d05134b486d27ccb  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index f2e1f235c0..6808db9962 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 10.5
+OPENSSH_VERSION_MAJOR = 10.6
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
