Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB50C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 11:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6374660A7E;
	Mon,  6 Feb 2023 11:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6374660A7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G4TJ4PHhW6js; Mon,  6 Feb 2023 11:21:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7ECCC607FE;
	Mon,  6 Feb 2023 11:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7ECCC607FE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B2C01BF397
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5553E81442
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:21:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5553E81442
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WS4fr2LRy2ms for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 11:21:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CAC48141D
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 11:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CAC48141D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56B1983AC8; Mon,  6 Feb 2023 11:21:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 12:20:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3def0679e3a424983354346eb517bbaa07b905df
X-Git-Newrev: b89eff429d4e8ad447addd53fde629676e19b76c
X-Patchwork-Hint: ignore
Message-Id: <20230206112141.56B1983AC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iputils: bump version to 20221126
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b89eff429d4e8ad447addd53fde629676e19b76c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This release removed: ninfod, rarpd, rdisc
=> add entries to Config.in.legacy.

LICENSE file got updated (just to use SPDX)
=> update checksum.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy             | 24 ++++++++++++++++++++++++
 package/iputils/Config.in    | 25 -------------------------
 package/iputils/iputils.hash |  6 +++---
 package/iputils/iputils.mk   |  9 ++-------
 4 files changed, 29 insertions(+), 35 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index e5cfcea8fa..94d6ce19f5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,30 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_IPUTILS_NINFOD
+	bool "iputils 20221126 removed ninfod"
+	select BR2_LEGACY
+	help
+	  iputils 20221126 removed ninfod.
+
+config BR2_PACKAGE_IPUTILS_RARPD
+	bool "iputils 20221126 removed rarpd"
+	select BR2_LEGACY
+	help
+	  iputils 20221126 removed rarpd.
+
+config BR2_PACKAGE_IPUTILS_RDISC
+	bool "iputils 20221126 removed rdisc"
+	select BR2_LEGACY
+	help
+	  iputils 20221126 removed rdisc.
+
+config BR2_PACKAGE_IPUTILS_RDISC_SERVER
+	bool "iputils 20221126 removed rdisc"
+	select BR2_LEGACY
+	help
+	  iputils 20221126 removed rdisc.
+
 config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_XINGMUX
 	bool "xingmux moved"
 	select BR2_LEGACY
diff --git a/package/iputils/Config.in b/package/iputils/Config.in
index 1a8b555570..ec7bc5418d 100644
--- a/package/iputils/Config.in
+++ b/package/iputils/Config.in
@@ -28,37 +28,12 @@ config BR2_PACKAGE_IPUTILS_PING
 	help
 	  Installs ping.
 
-config BR2_PACKAGE_IPUTILS_RARPD
-	bool "rarpd"
-	help
-	  Installs rarpd.
-
-config BR2_PACKAGE_IPUTILS_RDISC
-	bool "rdisc"
-	default y
-	help
-	  Installs rdisc.
-
-config BR2_PACKAGE_IPUTILS_RDISC_SERVER
-	bool "rdisc (server code)"
-	default y
-	depends on BR2_PACKAGE_IPUTILS_RDISC
-	help
-	  Builds rdisc with server code.
-
 config BR2_PACKAGE_IPUTILS_TRACEPATH
 	bool "tracepath"
 	default y
 	help
 	  Installs tracepath.
 
-config BR2_PACKAGE_IPUTILS_NINFOD
-	bool "ninfod"
-	default y
-	depends on BR2_TOOLCHAIN_HAS_THREADS # ninfod requires <pthread.h>
-	help
-	  Installs ninfod.
-
 comment "ninfod needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index db52d990f2..ea23f27f3c 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,6 +1,6 @@
-# https://github.com/iputils/iputils/releases/download/20211215/sha256sum.asc
-sha256  b6f67fc705490673ff4471d006221b4a2f1b1180b929d9fefd771352621ccedf  iputils-20211215.tar.gz
+# https://github.com/iputils/iputils/releases/download/20221126/sha256sum.asc
+sha256  745ea711fe06d5c57d470d21acce3c3ab866eb6afb69379a16c6d60b89bd4311  iputils-20221126.tar.gz
 # Locally computed
-sha256  973281334c2da6364fa6bdc44c1f0f8d60d80d73c782982ffc5d53b0a31aa042  LICENSE
+sha256  2c9f29d982c48665c30b3adaf400c048988fd256eb91c691e351eb3b6a8b2036  LICENSE
 sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  Documentation/LICENSE.BSD3
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/LICENSE.GPL2
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 84059de330..fe4468ec19 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -11,7 +11,7 @@
 # and IPv6 updates.
 # http://www.spinics.net/lists/netdev/msg279881.html
 
-IPUTILS_VERSION = 20211215
+IPUTILS_VERSION = 20221126
 IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
 IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
@@ -21,19 +21,14 @@ IPUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 # Selectively build binaries
 IPUTILS_CONF_OPTS += \
 	-DBUILD_CLOCKDIFF=$(if $(BR2_PACKAGE_IPUTILS_CLOCKDIFF),true,false) \
-	-DBUILD_RARPD=$(if $(BR2_PACKAGE_IPUTILS_RARPD),true,false) \
-	-DBUILD_RDISC=$(if $(BR2_PACKAGE_IPUTILS_RDISC),true,false) \
-	-DENABLE_RDISC_SERVER=$(if $(BR2_PACKAGE_IPUTILS_RDISC_SERVER),true,false) \
 	-DBUILD_TRACEPATH=$(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),true,false) \
-	-DBUILD_NINFOD=$(if $(BR2_PACKAGE_IPUTILS_NINFOD),true,false) \
 	-DSKIP_TESTS=true
 
 # Selectively select the appropriate SELinux refpolicy modules
 IPUTILS_SELINUX_MODULES = \
 	$(if $(BR2_PACKAGE_IPUTILS_ARPING),netutils) \
 	$(if $(BR2_PACKAGE_IPUTILS_PING),netutils) \
-	$(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),netutils) \
-	$(if $(BR2_PACKAGE_IPUTILS_RDISC),rdisc)
+	$(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),netutils)
 
 #
 # arping
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
