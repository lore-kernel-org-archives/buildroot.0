Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A82D10BF8
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 12:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EDE2605E5;
	Sat, 26 Oct 2024 12:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8HzjAHNNSHLz; Sat, 26 Oct 2024 12:56:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 402A3605E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 402A3605E6;
	Sat, 26 Oct 2024 12:56:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 948182318
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 12:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F3B8605CB
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 12:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P2T8rlr8OVBg for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 12:56:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFFA3605E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFFA3605E6
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 12:56:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97F1883A40; Sat, 26 Oct 2024 12:56:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 14:55:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa7217276d0da805229739b1ede8eb3a1fe365aa
X-Git-Newrev: f14929c657a7b1794dcd39ac469d2ad826465d98
X-Patchwork-Hint: ignore
Message-Id: <20241026125614.97F1883A40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: update to 2.40.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f14929c657a7b1794dcd39ac469d2ad826465d98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable lsfd for uClibc-ng until 1.0.51 is out.
Some files now are licensed under MIT.
README.licensing was changed, MIT was added, GPL-2.0 was
renamed to GPL-2.0-only.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/util-linux/Config.in       |  6 ++++--
 package/util-linux/util-linux.hash |  7 ++++---
 package/util-linux/util-linux.mk   | 11 +++++++----
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 1f5dacec2f..a168abe720 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -220,13 +220,15 @@ config BR2_PACKAGE_UTIL_LINUX_LSFD
 	bool "lsfd"
 	depends on BR2_USE_MMU # libsmartcols
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # process_vm_readv
 	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
 	help
 	  List file descriptors (modern replacement for lsof)
 
-comment "lsfd needs a toolchain w/ headers >= 3.19"
+comment "lsfd needs a musl or glibc toolchain w/ headers >= 3.19"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19 \
+		|| BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_PACKAGE_UTIL_LINUX_LSLOGINS
 	bool "lslogins"
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index d47f47fdba..317efebcbf 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,9 +1,10 @@
-# From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.39/sha256sums.asc
-sha256  7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f  util-linux-2.39.3.tar.xz
+# From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.40/sha256sums.asc
+sha256  d78b37a66f5922d70edf3bdfb01a6b33d34ed3c3cafd6628203b2a2b67c8e8b3  util-linux-2.40.2.tar.xz
 # License files, locally calculated
-sha256  13f0ea46d12d798c095a6ad39d7ddc988e2e4d274c6494115f6b463f7bc4f702  README.licensing
+sha256  27f25514040a401b2ceb7057eae1f46cedb1666664b519b5be7e0960d1b35164  README.licensing
 sha256  9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
 sha256  ba7640f00d93e72e92b94b9d71f25ec53bac2f1682f5c4adcccb0018359f60f8  Documentation/licenses/COPYING.BSD-4-Clause-UC
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/licenses/COPYING.GPL-2.0-or-later
 sha256  e53348ce276358e9997014071c5294b36a18c4b34f32f00ee57b9acce0aafd63  Documentation/licenses/COPYING.ISC
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Documentation/licenses/COPYING.LGPL-2.1-or-later
+sha256  8555341619542abb48c102afd954e42d4478e5be16ad3d5af7b0ff71009e7348  Documentation/licenses/COPYING.MIT
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index f2821978c5..c3737a8d12 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -7,8 +7,8 @@
 # When making changes to this file, please check if
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
-UTIL_LINUX_VERSION_MAJOR = 2.39
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).3
+UTIL_LINUX_VERSION_MAJOR = 2.40
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
@@ -21,13 +21,15 @@ UTIL_LINUX_LICENSE = \
 	LGPL-2.1+ (libblkid, libfdisk, libmount), \
 	BSD-3-Clause (libuuid), \
 	BSD-2-Clause (xxhash), \
-	ISC (rfkill)
+	ISC (rfkill) \
+	MIT (hardlink, flock)
 UTIL_LINUX_LICENSE_FILES = README.licensing \
 	Documentation/licenses/COPYING.BSD-3-Clause \
 	Documentation/licenses/COPYING.BSD-4-Clause-UC \
 	Documentation/licenses/COPYING.GPL-2.0-or-later \
 	Documentation/licenses/COPYING.ISC \
-	Documentation/licenses/COPYING.LGPL-2.1-or-later
+	Documentation/licenses/COPYING.LGPL-2.1-or-later \
+	Documentation/licenses/COPYING.MIT
 
 UTIL_LINUX_CPE_ID_VENDOR = kernel
 
@@ -226,6 +228,7 @@ HOST_UTIL_LINUX_CONF_OPTS += \
 	--disable-chfn-chsh \
 	--disable-chmem \
 	--disable-ipcmk \
+	--disable-liblastlog2 \
 	--disable-login \
 	--disable-lsfd \
 	--disable-lslogins \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
