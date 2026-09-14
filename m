Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CB7C88E73
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 21:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B60140542;
	Mon, 14 Sep 2026 21:55:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zRmz8qiO4odR; Mon, 14 Sep 2026 21:54:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 74278404F5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789422899;
	b=p9x5JeicaoYhbWJkKwbrCNFhC1DUWedGdztn1wgIdXYtqwsrQAOCwoU7Y8ShOW/Y6DWp
	 ihoRNdwTCHJgLvfAVFlr758HK6VFz90jm+wFvRPNy7V78QngPFU58emYLUPb6iZNiSbk7
	 /eclcEkaAguIck++EyLaDx9gyJt8dnhw0m1o0D18y42gm/k6ESOZBFM9X/Kb44axZ4DQL
	 HEGGwWnrds0v+YpCEWvjhSnAnWwbV//RreIpFvHoJB/C7O1fOUL9mTE+sB5mv3Jjw7h9Z
	 LLP77Rta8D7T4vZVi6uef/N0xNcpGdbN1n5+foiISMschu1GQJgTPvNf9bU7j4hqBwQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789422899;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=w2UYO1dK9pgHciMXMRFgNJFGxzbWCEiWVoB/2hLJ2Uw=;
	b=I/8xNkpcO66w81Js8jkjHwCg5OWEmHU9FCQKKmLdgMiEOHlZyY278g5E/sIuV9KsYcl/
	 o1tO8eB2KDOb5DmkgJ8zlxEnrjSWghA6/zkVCpc7YIczbgU6pE11DOFtc/N1sDIQhMfrq
	 R6q5ce9dDDvbE4QBPRXt5oHT5j8Qvrxgxo+TPGsKl9W7bUusXB/r8R7U1a1UOJ02we53n
	 pggY+NqG+2EvHOs8XcmORjnnz1fqvlDjM8awdLoD4KGJubp+DvJONBoK4kLReLm80wotF
	 9LyLjU2JAQ47bznqRGdTB6VdE1wS6Fl1yEtUCpiAPdqujYl2zzxsCO9mtSqqJHtadJA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789422899;
	bh=w2UYO1dK9pgHciMXMRFgNJFGxzbWCEiWVoB/2hLJ2Uw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=GFsj7N+herJr2QAJnquatFKWZKFGO+YEUxov58Sx6jIV443eBjlBEm3umHuBA988e
	 x/HKVHD9GuOoVitPHW5WYOPynuDFZ/7acvcyfqtMFikiPMkaTDwiG77qxoqVKGy/V5
	 nM6qHAua22zxC4NKGpP8oNzUJhnl7keNmbZizfNmt7GMyWZmtjV+SisBG4qssnaVjF
	 60AtEvqEoDxRQWauWqJBlPVtiEAAL3cT3maYGkD9G9/Rhv8Vs/emCKBRJK1iyRHRY8
	 /B5qAwl4QlNGgL6dfibJ+8kjdO/A06q9TtaAKC90woCk1qOw5zZpac4NrfmGG7A+kL
	 NdLgIEuoD9UTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74278404F5;
	Mon, 14 Sep 2026 21:54:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C8FF224
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 21:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E908404EE
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 21:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LNOlgo_Eqixq for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 21:54:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 142A1404F2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789422897;
 b=fZOY2lf9hQOy5srGtJrAksNqOVGlwYo2F4SsloxlCxxiejUaAepAAaiTUHVpzJtgCdJQ
 bvZ48i4kdqywikFFPdKnp8ksxeOGQ1wzborHmmWw1+pWyOcOCrB/HyZNWg0ARaf9yqVau
 C1rzaarj66qeyKSAgPCIRKjQ9Riwh4tTKhM/po+JSBNJMAtlH2SLA5y6PES8kZpJwMmZN
 PmE0ZOxy0LuUzPgY15DAVOrMWPok31xgl855ovdyz+Z0/oAKXwBfVsswl5Bd3uJgGZgUE
 abtqZRIdAf1fyh5aHTSXJBj30qBrwIXy5psbKN+u0PTrHQszibsyGrjxLQ0XhD2N6qQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789422897;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=83mACpXkgQrTkk7jLCVNuNWIgaTxdQ4fjc0GnR4CGbk=;
 b=kq6QTN8i9RbvhpnghgVVZ6lI364zbfblOSuC71baFUYjU/D/FH5Wt0P0RFLt5NkXJe2i
 RNEC2ALsWPJvIGf1MS4RuY99C9nAgUDc9j0dEscpgmgV2krU10Vt+17T/LsLiYBKREsKj
 p7r6+Pf/x6iCqGtT2Zxe6C4eIIvY4Jb78hWGO5fl4m9duCN+p72Y34YlFGntqmAImu71G
 BtcWtX62cJ0drsCYSTaXTZFbqjT+4aiKhzLl78huVIW60m1ZnT14PaaZUujUseTajEnvz
 JZfkFJiMo2tzgR1GMf3ou8Ob/Jm1InODmsMPiksoAUUUVHyY31NJhPs443d+7WbnhdA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Drdli2oP; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 142A1404F2
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 21:54:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 707F94E40582
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 21:54:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 41E7C60323
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 21:54:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8E61311C7AFC3; 
 Mon, 14 Sep 2026 23:54:47 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Sep 2026 23:54:24 +0200
Message-ID: <20260914215426.1852105-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/gstreamer1/gst1-plugins-bad: fix
 dependency on gcc version
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

Since the bump of libabseil-cpp in commit
76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c, it requires gcc 10. As part
of this commit, the webrtc-audio-processing package was updated, but
not its reverse dependency gst1-plugins-bad. This commit fixes this
issue.

Fixes: 76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c ("package/libabseil-cpp: bump to version 20260817.0")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 45a8a44077..0586b7f327 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -674,18 +674,18 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP
 	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
 	help
 	  WebRTC echo-cancellation, gain control and noise suppression
 
-comment "webrtcdsp needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 8"
+comment "webrtcdsp needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 10"
 	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WPE
 	bool "wpe"
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
