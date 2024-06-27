Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C70C2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 19:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A2FF60625;
	Thu, 27 Jun 2024 19:33:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Z4moNBK6RFH; Thu, 27 Jun 2024 19:33:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9851E6063E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9851E6063E;
	Thu, 27 Jun 2024 19:33:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 80FEC1BF3D9
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 19:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B44884181
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 19:33:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1GcCpGa0lfc for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 19:33:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1802E83F36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1802E83F36
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1802E83F36
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 19:33:40 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sMusE-008G4x-Os; Thu, 27 Jun 2024 21:33:38 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 200594cc;
 Thu, 27 Jun 2024 19:33:35 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 22:33:32 +0300
Message-ID: <20240627193335.4069574-5-aperez@igalia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240208095531.99049-1-aperez@igalia.com>
References: <20240208095531.99049-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RAI/rvVreC5ykI8/SlUmcDgl0akJZ3QB0k25gy7jcsU=; b=l020UPW4I99z+jhmnMLYvDRgGP
 PqDV2eai+Q59LBizUXB1PbKrelOUM6cMJx6zdq+5sLZoagFojEdnIuLMuMZ92bV+3Vh4jvn8J7BTt
 nbwy+8BO8YlzHhtpZgy1K0ewCYDdvmqYUM9G9QZQwm6/gH7qQwveKMOR6mbrVT4Zaptko2vYJlP6O
 xD4aJwLeOuvY7Ve7njUU25xyJiTQz5/CRA7y9vDOYLYgxnefcXUszcxhKSktQpATszSmjVmLnM9wE
 SYHEI9ocBdxSydj0E7DjZekw3e7tQYGivGgbCLyMR+nymYAVSobgB25ACAgyzGZdEIuucHcWRPPwQ
 zo/doodg==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=l020UPW4
Subject: [Buildroot] [PATCH v2 4/4] package/wpewebkit: disable libdrm usage
 when not available
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pass USE_LIBDRM=OFF to the wpewebkit CMake configuration step when the
libdrm package has not been selected.

WPE WebKit can be built without libdrm support, and it will still work
with backends that use other platform-specific methods to handle
graphics buffers and/or presenting content onto an output. For example
this is the case with wpebackend-rdk configured to use rpi-userland,
which uses dispmanx to produce the output instead of DRM/KMS.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/wpewebkit.mk | 7 +++++++
 1 file changed, 7 insertions(+)

---
v1 -> v2:
- Patch added.

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 382c2adca10..4071cbb0d83 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -87,6 +87,13 @@ else
 WPEWEBKIT_CONF_OPTS += -DUSE_LIBBACKTRACE=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+WPEWEBKIT_CONF_OPTS += -DUSE_LIBDRM=ON
+WPEWEBKIT_DEPENDENCIES += libdrm
+else
+WPEWEBKIT_CONF_OPTS += -DUSE_LIBDRM=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_WOFF2),y)
 WPEWEBKIT_CONF_OPTS += -DUSE_WOFF2=ON
 WPEWEBKIT_DEPENDENCIES += woff2
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
