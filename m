Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86040C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 21:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2159641750;
	Mon,  4 Dec 2023 21:13:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2159641750
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yhogL6eSLBwk; Mon,  4 Dec 2023 21:13:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F40C41466;
	Mon,  4 Dec 2023 21:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F40C41466
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C70F1BF30E
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 319324174F
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 319324174F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p-wQ43qNaFhW for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 21:13:05 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE9ED4011A
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 21:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE9ED4011A
Received: from fli4l.lan.fli4l (p4fd6c4a5.dip0.t-ipconnect.de [79.214.196.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D7EEAA4C042A
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 22:13:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35722)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rAGFQ-0006Wv-25
 for buildroot@buildroot.org; Mon, 04 Dec 2023 22:13:00 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  4 Dec 2023 22:13:00 +0100
Message-Id: <20231204211300.12560-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1701724380;
 bh=rgTg10xs9y7FrH+9aEWVWn/1utF3g1qkYpnEmten0q8=;
 h=From:To:Subject:Date:From;
 b=xvUC/7y2IzcyES1C1DRPC5AuSUiivbXIS2moP7b4jU+8uTDeKPQxRWruejHE3R3ON
 6wd+/Q3/yQj8aL7l/2emjydB/o62FCnotCQji1MWo/I3M1FZaAJf0K4WmGzJZyyVzZ
 EIS9nIcBNskiT5VwGPZ/S3avbuBrBKAjkaXaebW1W5rchZeaJz6Xl/G2m/UNIjToQw
 5NLA4JABE9iEcfBEQUL9H3clJXL5W9DzwH0wlojyra9q0dj9i8kcHPo9IYb86bmTzA
 JySin4vAUZipSkLSys4aTQpfhBhgXcu9ldUgdnkGcXIlvQYMZd6N9d5qGuyIEzd8qA
 M/j7JCpwREkeg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=xvUC/7y2
Subject: [Buildroot] [PATCH 1/1] package/libheif: bump version to 1.17.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/strukturag/libheif/releases

Added configure support for new codec plugins introduced in version
1.17.0: https://github.com/strukturag/libheif/releases/tag/v1.17.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libheif/libheif.hash |  2 +-
 package/libheif/libheif.mk   | 30 +++++++++++++++++++++++++++++-
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 50152abde5..6ea3ba6eec 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7f97e4205c0bd9f9b8560536c8bd2e841d1c9a6d610401eb3eb87ed9cdfe78ea  libheif-1.16.2.tar.gz
+sha256  38ab01938ef419dbebb98346dc0b1c8bb503a0449ea61a0e409a988786c2af5b  libheif-1.17.5.tar.gz
 sha256  b2eb4f6588b005bebac44cfb2dfd23f6a16c5ca9b8a619a315158b0215a917a3  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 65e64a02f7..419a864ef3 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.16.2
+LIBHEIF_VERSION = 1.17.5
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
@@ -30,6 +30,20 @@ else
 LIBHEIF_CONF_OPTS += -DWITH_DAV1D=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_FFMPEG),y)
+LIBHEIF_CONF_OPTS += -DWITH_FFMPEG_DECODER=ON
+LIBHEIF_DEPENDENCIES += ffmpeg
+else
+LIBHEIF_CONF_OPTS += -DWITH_FFMPEG_DECODER=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_KVAZAAR),y)
+LIBHEIF_CONF_OPTS += -DWITH_KVAZAAR=ON
+LIBHEIF_DEPENDENCIES += kvazaar
+else
+LIBHEIF_CONF_OPTS += -DWITH_KVAZAAR=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDE265),y)
 LIBHEIF_CONF_OPTS += -DWITH_LIBDE265=ON
 LIBHEIF_DEPENDENCIES += libde265
@@ -37,6 +51,20 @@ else
 LIBHEIF_CONF_OPTS += -DWITH_LIBDE265=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBJPEG),y)
+LIBHEIF_CONF_OPTS += -DWITH_JPEG_DECODER=ON -DWITH_JPEG_ENCODER=ON
+LIBHEIF_DEPENDENCIES += libjpeg
+else
+LIBHEIF_CONF_OPTS += -DWITH_JPEG_DECODER=OFF -DWITH_JPEG_ENCODER=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENJPEG),y)
+LIBHEIF_CONF_OPTS += -DWITH_OpenJPEG_DECODER=ON -DWITH_OpenJPEG_ENCODER=ON
+LIBHEIF_DEPENDENCIES += openjpeg
+else
+LIBHEIF_CONF_OPTS += -DWITH_OpenJPEG_DECODER=OFF -DWITH_OpenJPEG_ENCODER=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_X265),y)
 LIBHEIF_CONF_OPTS += -DWITH_X265=ON
 LIBHEIF_DEPENDENCIES += x265
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
