Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E38C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 06:32:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E65661057
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 06:32:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E65661057
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5FA3607B9;
	Sun,  1 Aug 2021 06:32:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VHWCkgSLQkJi; Sun,  1 Aug 2021 06:32:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01497607C2;
	Sun,  1 Aug 2021 06:32:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 11EDE1BF86B
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 06:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E15A4158B
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 06:32:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HvAQvY02cQv8 for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 06:32:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39A7F405AA
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 06:32:49 +0000 (UTC)
Received: from fwd20.aul.t-online.de (fwd20.aul.t-online.de [172.20.26.140])
 by mailout08.t-online.de (Postfix) with SMTP id 2E5D685C;
 Sun,  1 Aug 2021 08:32:46 +0200 (CEST)
Received: from fli4l.lan.fli4l
 (Z2qe4BZc8h2CzJe1dkDJqKtGMmTO-SXAj7BQTUumJji2eChyzTKzTuPGGPERdLKwwT@[79.214.201.246])
 by fwd20.t-online.de with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mA51e-2PLkuG0; Sun, 1 Aug 2021 08:32:42 +0200
Received: from mahler.lan.fli4l ([192.168.1.1]:34230)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>)
 id 1mA51e-0004jU-1w; Sun, 01 Aug 2021 08:32:42 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 08:32:42 +0200
Message-Id: <20210801063242.12325-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-ID: Z2qe4BZc8h2CzJe1dkDJqKtGMmTO-SXAj7BQTUumJji2eChyzTKzTuPGGPERdLKwwT
X-TOI-EXPURGATEID: 150726::1627799562-00000BA7-1877C405/0/0 CLEAN NORMAL
X-TOI-MSGID: 7d163b7e-5fd4-460b-aead-8a93e6b729cf
Subject: [Buildroot] [PATCH 1/1] package/intel-mediasdk: bump version to
 21.2.3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Rebased patch.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../intel-mediasdk/0001-Don-t-force-fstack-protector.patch  | 6 ++++--
 package/intel-mediasdk/intel-mediasdk.hash                  | 2 +-
 package/intel-mediasdk/intel-mediasdk.mk                    | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch b/package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch
index a33c218c0a..a7e3b70294 100644
--- a/package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch
+++ b/package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch
@@ -7,6 +7,8 @@ This allows the environment to decide whether SSP should be used or
 not, for example to support toolchains that don't have SSP support.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[Bernd: rebased for 21.2.3]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  api/mfx_dispatch/linux/CMakeLists.txt | 2 +-
  builder/FindPackages.cmake            | 4 ++--
@@ -16,7 +18,7 @@ diff --git a/api/mfx_dispatch/linux/CMakeLists.txt b/api/mfx_dispatch/linux/CMak
 index 15a4bd9a..4415f840 100644
 --- a/api/mfx_dispatch/linux/CMakeLists.txt
 +++ b/api/mfx_dispatch/linux/CMakeLists.txt
-@@ -100,7 +100,7 @@ target_link_libraries(mfx dl)
+@@ -101,7 +101,7 @@ target_link_libraries(mfx dl)
  get_api_version(MFX_VERSION_MAJOR MFX_VERSION_MINOR)
  
  set_target_properties( mfx PROPERTIES LINK_FLAGS
@@ -38,7 +40,7 @@ index 7e36ae2d..5b8b9b9d 100644
  #  message( STATUS "Libva located at: ${PKG_LIBVA_LIBRARY_DIRS}" )
  
    if( ARGV1 MATCHES hw AND Linux )
-@@ -448,7 +448,7 @@ function(configure_dependencies target dependencies variant)
+@@ -445,7 +445,7 @@ function(configure_dependencies target dependencies variant)
    endforeach()
  
    set(SCOPE_CFLAGS ${SCOPE_CFLAGS} PARENT_SCOPE)
diff --git a/package/intel-mediasdk/intel-mediasdk.hash b/package/intel-mediasdk/intel-mediasdk.hash
index 27cfdda08d..7ae892b3bf 100644
--- a/package/intel-mediasdk/intel-mediasdk.hash
+++ b/package/intel-mediasdk/intel-mediasdk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f7750bd3a307d796e71a3d4ebb16a730b2e9364669513e110e9ec59af159b4cd  intel-mediasdk-21.2.2.tar.gz
+sha256  7791be83e5e9f6d55f31d6ad9037012fc78b846724644b9db2087d1b7dfec078  intel-mediasdk-21.2.3.tar.gz
 sha256  dfd67773578903698f9ff4a61eb8f2d84810cbecd56f3f3cee8c649f813b6ea6  LICENSE
diff --git a/package/intel-mediasdk/intel-mediasdk.mk b/package/intel-mediasdk/intel-mediasdk.mk
index c3412d622d..0aff54cafe 100644
--- a/package/intel-mediasdk/intel-mediasdk.mk
+++ b/package/intel-mediasdk/intel-mediasdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MEDIASDK_VERSION = 21.2.2
+INTEL_MEDIASDK_VERSION = 21.2.3
 INTEL_MEDIASDK_SITE = http://github.com/Intel-Media-SDK/MediaSDK/archive
 INTEL_MEDIASDK_LICENSE = MIT
 INTEL_MEDIASDK_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
