Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B749CF9C68
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 08:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A727960656;
	Sun, 22 Sep 2024 08:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fMKbqeK-KjBh; Sun, 22 Sep 2024 08:35:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B24616065A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B24616065A;
	Sun, 22 Sep 2024 08:35:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 176C91BF57C
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 08:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0672660656
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 08:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wquD0teGoYRJ for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 08:35:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4FF896065A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FF896065A
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4FF896065A
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 08:35:19 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 62C06352115D; Sun, 22 Sep 2024 10:35:17 +0200 (CEST)
Date: Sun, 22 Sep 2024 10:35:17 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zu/WxVZUYehjdlX3@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1726994117; bh=cxfD/xw8BfDcUN95sPcFC92G9W+jfUNJXb8IHFLYr4A=;
 h=Date:From:To:Subject:From;
 b=TyfDB+zwn20PsUd3BRUM4J7pbY/9tP5c4cVLNtXunjDHNV/CYEtmfdvHzNMEsa3qK
 QrqhaKHsIW5i9GzepinilMk82ecY+j6pmUEA1qzxxjaKJ8Y2AfpaD5ZBt+0nSssir+
 HeLV6IGkflCYS6hBSGPYm80ugWt56wqI+otF1iO2N4bpLrbgBv6KGD893KkZwpmNN5
 T2zVwaXCnxzqVjsws1r4LKK4+2+w331jJqiIEEXSf++xKTpAY78xwMA0Zgdr3rprjI
 pJj0WzsRVvqz2Za3QzONV8y27YYwczSlQCE4HuLTFRQpHdhJRsfQsrqZ0HQ/6fsoBt
 iuM2de1qdF3yw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=TyfDB+zw
Subject: [Buildroot] [PATCH] package/util-linux: update to 2.40.2
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

Disable lsfd for uClibc-ng until 1.0.51 is out.
Some files now are licensed under MIT.
README.licensing was changed, MIT was added, GPL-2.0 was
renamed to GPL-2.0-only.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
