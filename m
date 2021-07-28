Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BD4C4338F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 21:00:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B4A261019
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 21:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B4A261019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D91BB60719;
	Wed, 28 Jul 2021 21:00:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LUBRdoKHXm-n; Wed, 28 Jul 2021 21:00:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F243C606CF;
	Wed, 28 Jul 2021 21:00:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7EAEB1BF2AF
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 21:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C8784025D
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 21:00:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4asN11MuPebb for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 21:00:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4117E4011A
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 21:00:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AE521874D6; Wed, 28 Jul 2021 20:25:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 28 Jul 2021 22:59:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d41d79656849d0a495db461272f691c8b6a916b9
X-Git-Newrev: aaf3322c2862a1cea6df1e597bb1774cd5929fef
X-Patchwork-Hint: ignore
Message-Id: <20210728202538.AE521874D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libosmium: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=aaf3322c2862a1cea6df1e597bb1774cd5929fef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A fast and flexible C++ library for working with OpenStreetMap data.
Libosmium works on Linux, macOS and Windows.

https://osmcode.org/libosmium/

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/libosmium/Config.in      | 17 +++++++++++++++++
 package/libosmium/libosmium.hash |  3 +++
 package/libosmium/libosmium.mk   | 38 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 60 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7fa4851627..e8bb9fd54a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1864,6 +1864,7 @@ N:	Max Filippov <jcmvbkbc@gmail.com>
 F:	arch/Config.in.xtensa
 
 N:	Maxim Kochetkov <fido_max@inbox.ru>
+F:	package/libosmium/
 F:	package/postgis/
 F:	package/protozero/
 F:	package/timescaledb/
diff --git a/package/Config.in b/package/Config.in
index 9ced0a139e..48ddbb63b2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1938,6 +1938,7 @@ menu "Other"
 	source "package/libloki/Config.in"
 	source "package/libnpth/Config.in"
 	source "package/libnspr/Config.in"
+	source "package/libosmium/Config.in"
 	source "package/libpfm4/Config.in"
 	source "package/libplatform/Config.in"
 	source "package/libplist/Config.in"
diff --git a/package/libosmium/Config.in b/package/libosmium/Config.in
new file mode 100644
index 0000000000..9f002d3516
--- /dev/null
+++ b/package/libosmium/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_LIBOSMIUM
+	bool "libosmium"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
+	depends on BR2_USE_WCHAR # boost
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_PROTOZERO
+	help
+	  A fast and flexible C++ library for working with OpenStreetMap
+	  data. Libosmium works on Linux, macOS and Windows.
+
+	  https://osmcode.org/libosmium/
+
+comment "libosmium needs a toolchain w/ C++,  wchar, threads, gcc >= 4.7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libosmium/libosmium.hash b/package/libosmium/libosmium.hash
new file mode 100644
index 0000000000..05d898bc7f
--- /dev/null
+++ b/package/libosmium/libosmium.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  4a7672d7caf4da3bc68619912b298462370c423c697871a0be6273c6686e10d6  libosmium-2.17.0.tar.gz
+sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/libosmium/libosmium.mk b/package/libosmium/libosmium.mk
new file mode 100644
index 0000000000..3beca73c4a
--- /dev/null
+++ b/package/libosmium/libosmium.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# libosmium
+#
+################################################################################
+
+LIBOSMIUM_VERSION = 2.17.0
+LIBOSMIUM_SITE = $(call github,osmcode,libosmium,v$(LIBOSMIUM_VERSION))
+LIBOSMIUM_LICENSE = BSL-1.0
+LIBOSMIUM_LICENSE_FILES = LICENSE
+LIBOSMIUM_INSTALL_STAGING = YES
+LIBOSMIUM_DEPENDENCIES = boost protozero
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+LIBOSMIUM_DEPENDENCIES += bzip2
+endif
+
+ifeq ($(BR2_PACKAGE_EXPAT),y)
+LIBOSMIUM_DEPENDENCIES += expat
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGEOS),y)
+LIBOSMIUM_DEPENDENCIES += libgeos
+endif
+
+ifeq ($(BR2_PACKAGE_LZ4),y)
+LIBOSMIUM_DEPENDENCIES += lz4
+endif
+
+ifeq ($(BR2_PACKAGE_PROJ),y)
+LIBOSMIUM_DEPENDENCIES += proj
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LIBOSMIUM_DEPENDENCIES += zlib
+endif
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
