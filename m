Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55252C433EF
	for <buildroot@archiver.kernel.org>; Sun, 28 Nov 2021 13:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03C23606F9;
	Sun, 28 Nov 2021 13:33:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JVLc_83WcGde; Sun, 28 Nov 2021 13:33:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FFA160592;
	Sun, 28 Nov 2021 13:33:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 30F011BF958
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 13:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B9BD830E6
 for <buildroot@lists.busybox.net>; Sun, 28 Nov 2021 13:33:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GH4U4wPHAEC6 for <buildroot@lists.busybox.net>;
 Sun, 28 Nov 2021 13:33:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2100F832E8
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 13:33:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 996348F6D1; Sun, 28 Nov 2021 13:28:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Nov 2021 14:30:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 228727f046d184726b6705a1902a961b211df72c
X-Git-Newrev: 0ce776942d34d5d3bea6c11913cac38ea3e52f8b
X-Patchwork-Hint: ignore
Message-Id: <20211128132837.996348F6D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireshark: security bump to
 version 3.4.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ce776942d34d5d3bea6c11913cac38ea3e52f8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following security issues:
- https://www.wireshark.org/security/wnpa-sec-2021-07.html
  (CVE-2021-39929)
- https://www.wireshark.org/security/wnpa-sec-2021-08.html
  (CVE-2021-39926)
- https://www.wireshark.org/security/wnpa-sec-2021-09.html
  (CVE-2021-39925)
- https://www.wireshark.org/security/wnpa-sec-2021-10.html
  (CVE-2021-39924)
- https://www.wireshark.org/security/wnpa-sec-2021-11.html
- https://www.wireshark.org/security/wnpa-sec-2021-12.html
  (CVE-2021-39922)
- https://www.wireshark.org/security/wnpa-sec-2021-13.html
  (CVE-2021-39928)
- https://www.wireshark.org/security/wnpa-sec-2021-14.html
  (CVE-2021-39921)
- https://www.wireshark.org/security/wnpa-sec-2021-15.html
  (CVE-2021-39920)

Drop WIRESHARK_BUILD_LEMON_TOOL and set LEMON_C_COMPILER which is
available since
https://gitlab.com/wireshark/wireshark/-/commit/61e66c37abb1b7f59726e4407ac8dd53e6b75cac

https://www.wireshark.org/docs/relnotes/wireshark-3.4.10.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-cmake-lemon-wipe-CMAKE_SYSROOT-if-needed.patch | 30 ++++++++++++++++++++++
 package/wireshark/wireshark.hash                   |  6 ++---
 package/wireshark/wireshark.mk                     | 23 +++--------------
 3 files changed, 36 insertions(+), 23 deletions(-)

diff --git a/package/wireshark/0001-cmake-lemon-wipe-CMAKE_SYSROOT-if-needed.patch b/package/wireshark/0001-cmake-lemon-wipe-CMAKE_SYSROOT-if-needed.patch
new file mode 100644
index 0000000000..51875fd267
--- /dev/null
+++ b/package/wireshark/0001-cmake-lemon-wipe-CMAKE_SYSROOT-if-needed.patch
@@ -0,0 +1,30 @@
+From 982e5ab072816e29f6f2dc84d9a00ee7c4fdee40 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 26 Nov 2021 17:45:23 +0100
+Subject: [PATCH] cmake: lemon: wipe CMAKE_SYSROOT if needed
+
+Wipe CMAKE_SYSROOT when LEMON_C_COMPILER is set to avoid a build failure
+when cross-compiling (e.g. with buildroot)
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.com/wireshark/wireshark/-/merge_requests/5224]
+---
+ tools/lemon/CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/lemon/CMakeLists.txt b/tools/lemon/CMakeLists.txt
+index 8742aa9fc9..7c8cc23a35 100644
+--- a/tools/lemon/CMakeLists.txt
++++ b/tools/lemon/CMakeLists.txt
+@@ -12,6 +12,7 @@ add_executable(lemon lemon.c)
+ if(DEFINED LEMON_C_COMPILER)
+ 	set(CMAKE_C_COMPILER "${LEMON_C_COMPILER}")
+ 	set(CMAKE_C_FLAGS "")
++	set(CMAKE_SYSROOT "")
+ endif()
+ 
+ # To keep lemon.c as close to upstream as possible, deliberately ignore
+-- 
+2.33.0
+
diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 0876703e49..bc7c9f4d7e 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.7.txt
-sha1  3fa4bb774030442b9908243a9927d38479c52bf5  wireshark-3.4.7.tar.xz
-sha256  6c4cee51ef997cb9d9aaee84113525a5629157d3c743d7c4e320000de804a09d  wireshark-3.4.7.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.10.txt
+sha1  63839abd94d3ae376f860e2d2969777680106578  wireshark-3.4.10.tar.xz
+sha256  8aa7ef4a44ae62bb8db463cf761e2cc03b97305e0e77ed5be53fa83729187cef  wireshark-3.4.10.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 75b9c8b897..2ba81d1f39 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.4.7
+WIRESHARK_VERSION = 3.4.10
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
@@ -20,29 +20,12 @@ WIRESHARK_DEPENDENCIES = \
 	libpcap \
 	speexdsp
 
-WIRESHARK_MAKE_ENV = \
-	$(TARGET_MAKE_ENV) \
-	PATH="$(@D)/bin:$(BR_PATH)"
-
 WIRESHARK_CONF_OPTS = \
 	-DDISABLE_WERROR=ON \
 	-DENABLE_ILBC=OFF \
 	-DENABLE_PCAP=ON \
-	-DENABLE_SMI=OFF
-
-# wireshark needs the host version of lemon during compilation.
-# This binrary is provided by sqlite-src (which is different from
-# sqlite-autotools that is currently packaged in buildroot) moreover wireshark
-# adds several patches.
-# So, instead of creating a separate host package and installing lemon to
-# $(HOST_DIR), this binary is compiled on-the-fly
-define WIRESHARK_BUILD_LEMON_TOOL
-	cd $(@D); \
-	mkdir -p $(@D)/bin; \
-	$(HOSTCC) $(HOST_CFLAGS) -o $(@D)/bin/lemon tools/lemon/lemon.c
-endef
-
-WIRESHARK_PRE_BUILD_HOOKS += WIRESHARK_BUILD_LEMON_TOOL
+	-DENABLE_SMI=OFF \
+	-DLEMON_C_COMPILER=$(HOSTCC)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 WIRESHARK_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
