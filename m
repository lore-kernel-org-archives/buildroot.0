Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DBAC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 20:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 730A14015F;
	Mon,  1 Aug 2022 20:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 730A14015F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yLWurrEBDCrM; Mon,  1 Aug 2022 20:35:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CC4540129;
	Mon,  1 Aug 2022 20:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CC4540129
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B6651BF25B
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3386840129
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3386840129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id limv1eiXJRlq for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 20:35:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16E4940117
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 20:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16E4940117
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BD92586C15; Mon,  1 Aug 2022 20:21:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Aug 2022 22:21:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a6e0c24fbc090db4fc10a9b766ffba8a80065b01
X-Git-Newrev: e80c99e1519dafc2cf88ab4672eecda88359ecb1
X-Patchwork-Hint: ignore
Message-Id: <20220801202111.BD92586C15@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dump1090: bump to version 7.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e80c99e1519dafc2cf88ab4672eecda88359ecb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch to active fork as https://github.com/mutability/dump1090, a
  fork of https://github.com/MalcolmRobb/dump1090 is no longer
  maintained
- Update license to GPL-2.0+:
  https://github.com/flightaware/dump1090/commit/e02a2cdd44eae33173bc86fe4043eb6ff4f05b6f
- Drop patch (not needed thanks to
  https://github.com/flightaware/dump1090/commit/0793c64ee8ebbcea86b7a9dc71c7e28ec08db618)
- librtlsdr is now optional
- hackrf is a new optional dependency
- disable CPUFeatures
- ncurses is mandatory since
  https://github.com/flightaware/dump1090/commit/f6b1b94c7dca1b407b8e4f02ef3206e3ca3ad28f
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-dump1090.h-fix-build-with-gcc-10.patch    | 72 ----------------------
 package/dump1090/Config.in                         | 10 +--
 package/dump1090/dump1090.hash                     |  4 +-
 package/dump1090/dump1090.mk                       | 29 ++++++---
 4 files changed, 26 insertions(+), 89 deletions(-)

diff --git a/package/dump1090/0001-dump1090.h-fix-build-with-gcc-10.patch b/package/dump1090/0001-dump1090.h-fix-build-with-gcc-10.patch
deleted file mode 100644
index eeda03bcf0..0000000000
--- a/package/dump1090/0001-dump1090.h-fix-build-with-gcc-10.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 02153cb0b2d1083dcd587798d9ef7ce963739622 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 19 Aug 2020 18:46:17 +0200
-Subject: [PATCH] dump1090.h: fix build with gcc 10
-
-Fix the following build failures on gcc 10 (where -fno-common is enabled
-by default):
-
-/home/test/autobuild/run/instance-0/output-1/per-package/dump1090/host/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: interactive.o:/home/test/autobuild/run/instance-0/output-1/build/dump1090-bff92c4ad772a0a8d433f788d39dae97e00e4dbe/dump1090.h:373: multiple definition of `Modes'; /home/test/autobuild/run/instance-0/output-1/per-package/dump1090/host/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: interactive.o:/home/test/autobuild/run/instance-0/output-1/build/dump1090-bff92c4ad772a0a8d433f788d39dae97e00e4dbe/dump1090.h:373: multiple definition of `Modes'; dump1090.o:/home/test/autobuild/run/instance-0/output-1/build/dump1090-bff92c4ad772a0a8d433f788d39dae97e00e4dbe/dump1090.h:373: first defined here
-
-/home/test/autobuild/run/instance-0/output-1/per-package/dump1090/host/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: interactive.o:/home/test/autobuild/run/instance-0/output-1/build/dump1090-bff92c4ad772a0a8d433f788d39dae97e00e4dbe/dump1090.h:238: multiple definition of `tDF'; dump1090.o:/home/test/autobuild/run/instance-0/output-1/build/dump1090-bff92c4ad772a0a8d433f788d39dae97e00e4dbe/dump1090.h:238: first defined here
-/home/test/autobuild/run/instance-0/output-1/per-package/dump1090/host/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: view1090.o:/home/test/autobuild/run/instance-0/output-1/build/dump1090-bff92c4ad772a0a8d433f788d39dae97e00e4dbe/dump1090.h:373: first defined here
-
-Fixes:
- - http://autobuild.buildroot.org/results/88dc97fcaa649014edb3b54a5dd4bd8ec4715bbd
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/MalcolmRobb/dump1090/pull/96]
----
- dump1090.c | 3 +++
- dump1090.h | 4 ++--
- view1090.c | 3 +++
- 3 files changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/dump1090.c b/dump1090.c
-index 60882fc..1482224 100644
---- a/dump1090.c
-+++ b/dump1090.c
-@@ -29,6 +29,9 @@
- //
- #include "coaa.h"
- #include "dump1090.h"
-+
-+struct modes Modes;
-+
- //
- // ============================= Utility functions ==========================
- //
-diff --git a/dump1090.h b/dump1090.h
-index 9ad4de0..283e760 100644
---- a/dump1090.h
-+++ b/dump1090.h
-@@ -235,10 +235,10 @@ struct stDF {
-     uint64_t         llTimestamp;                // Timestamp at which the this packet was received
-     uint32_t         addr;                       // Timestamp at which the this packet was received
-     unsigned char    msg[MODES_LONG_MSG_BYTES];  // the binary
--} tDF;
-+};
- 
- // Program global state
--struct {                             // Internal state
-+extern struct modes {                             // Internal state
-     pthread_t       reader_thread;
- 
-     pthread_mutex_t data_mutex;      // Mutex to synchronize buffer access
-diff --git a/view1090.c b/view1090.c
-index 0b9b8b9..cc072fc 100644
---- a/view1090.c
-+++ b/view1090.c
-@@ -29,6 +29,9 @@
- //
- #include "coaa.h"
- #include "view1090.h"
-+
-+struct modes Modes;
-+
- //
- // ============================= Utility functions ==========================
- //
--- 
-2.27.0
-
diff --git a/package/dump1090/Config.in b/package/dump1090/Config.in
index 8f17929235..897ad46679 100644
--- a/package/dump1090/Config.in
+++ b/package/dump1090/Config.in
@@ -1,13 +1,7 @@
 config BR2_PACKAGE_DUMP1090
 	bool "dump1090"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # librtlsdr
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # librtlsdr -> libusb
-	select BR2_PACKAGE_LIBRTLSDR
+	select BR2_PACKAGE_NCURSES
 	help
 	  Dump1090 is a simple Mode S decoder for RTLSDR devices
 
-	  https://github.com/MalcolmRobb/dump1090
-
-comment "dump1090 needs a toolchain w/ threads, gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	  https://github.com/flightaware/dump1090
diff --git a/package/dump1090/dump1090.hash b/package/dump1090/dump1090.hash
index 48167de8ae..23178567ac 100644
--- a/package/dump1090/dump1090.hash
+++ b/package/dump1090/dump1090.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  72c1a94f3e6788af1e72b8cac13bb53e0989fe02cd13e191133f5519d2a2fefb  dump1090-bff92c4ad772a0a8d433f788d39dae97e00e4dbe.tar.gz
-sha256  29046ef7ee0b7b127bcc64faf135035820906dea2b379b2efcfc119131a39f7a  anet.h
+sha256  dfcf57b19f43e0262b1a03b0dc5069a9ddc48427d85378b7ef52fb4e74911eef  dump1090-7.2.tar.gz
+sha256  804f68c803eb5c127c53ad17c4f4e5033ef158e514bb76950dc7b1773f9ce4b0  LICENSE
diff --git a/package/dump1090/dump1090.mk b/package/dump1090/dump1090.mk
index 69fd67948c..82eaaf2cb8 100644
--- a/package/dump1090/dump1090.mk
+++ b/package/dump1090/dump1090.mk
@@ -4,15 +4,30 @@
 #
 ################################################################################
 
-DUMP1090_VERSION = bff92c4ad772a0a8d433f788d39dae97e00e4dbe
-DUMP1090_SITE = $(call github,MalcolmRobb,dump1090,$(DUMP1090_VERSION))
-DUMP1090_LICENSE = BSD-3-Clause
-# no real license file
-DUMP1090_LICENSE_FILES = anet.h
-DUMP1090_DEPENDENCIES = host-pkgconf librtlsdr
+DUMP1090_VERSION = 7.2
+DUMP1090_SITE = $(call github,flightaware,dump1090,v$(DUMP1090_VERSION))
+DUMP1090_LICENSE = GPL-2.0+
+DUMP1090_LICENSE_FILES = LICENSE
+DUMP1090_DEPENDENCIES = host-pkgconf ncurses
+DUMP1090_MAKE_OPTS = BLADERF=no CPUFEATURES=no LIMESDR=no
+
+ifeq ($(BR2_PACKAGE_HACKRF),y)
+DUMP1090_DEPENDENCIES += hackrf
+DUMP1090_MAKE_OPTS += HACKRF=yes
+else
+DUMP1090_MAKE_OPTS += HACKRF=no
+endif
+
+ifeq ($(BR2_PACKAGE_LIBRTLSDR),y)
+DUMP1090_DEPENDENCIES += librtlsdr
+DUMP1090_MAKE_OPTS += RTLSDR=yes
+else
+DUMP1090_MAKE_OPTS += RTLSDR=no
+endif
 
 define DUMP1090_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) PREFIX=/usr -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) PREFIX=/usr \
+		-C $(@D) $(DUMP1090_MAKE_OPTS)
 endef
 
 define DUMP1090_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
