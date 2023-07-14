Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C39EB64DA
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 10:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1559B6144D;
	Fri, 14 Jul 2023 10:26:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1559B6144D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p93Ckj_lPoQH; Fri, 14 Jul 2023 10:26:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FB6F61452;
	Fri, 14 Jul 2023 10:26:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FB6F61452
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0598D1BF313
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0D9E4173B
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0D9E4173B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AAydIBca4KsP for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 10:26:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 975EB417C4
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 10:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 975EB417C4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DD5C87088; Fri, 14 Jul 2023 10:26:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 12:25:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ecfa41b6f1b8c4cec9048acc0d241521811447db
X-Git-Newrev: ad276d94a392fb13244e042851a44269e6254d61
X-Patchwork-Hint: ignore
Message-Id: <20230714102624.7DD5C87088@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: bump version to 2.39
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

commit: https://git.buildroot.net/buildroot/commit/?id=ad276d94a392fb13244e042851a44269e6254d61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.39/v2.39-ReleaseNotes

Removed patch which is included in this version bump.

Updated license hash due to upstream commit
https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=faeb1b64b36ededd1a0b62555cad65f002d47ac6
adding the BSD-2-Clause license:
https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/diff/README.licensing?id=faeb1b64b36ededd1a0b62555cad65f002d47ac6

Even though there is now some BSD-2-Clause code in util-linux, no
license file was added upstream with the BSD-2-Clause text.

Reformatted UTIL_LINUX_LICENSE and added BSD-2-Clause license.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...lsns-improve-dependence-on-NS_GET_-ioctls.patch | 34 ----------------------
 package/util-linux/util-linux.hash                 |  6 ++--
 package/util-linux/util-linux.mk                   | 10 +++++--
 4 files changed, 11 insertions(+), 40 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b88ad4ce90..dc7770eff9 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1532,7 +1532,6 @@ package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch Upstream
 package/ussp-push/0001-fix-build-against-bluez-4.patch Upstream
 package/ussp-push/0002-fix-build-again-obex-bluez.patch Upstream
 package/ussp-push/0003-add-OBEX_CharToUnicode.patch Upstream
-package/util-linux/0001-lsns-improve-dependence-on-NS_GET_-ioctls.patch Upstream
 package/vala/0001-dont-add-dirty-to-valac-version.patch Upstream
 package/vala/vala-wrapper Shellcheck
 package/valgrind/0001-workaround-SIGSEGV-on-PPC.patch Upstream
diff --git a/package/util-linux/0001-lsns-improve-dependence-on-NS_GET_-ioctls.patch b/package/util-linux/0001-lsns-improve-dependence-on-NS_GET_-ioctls.patch
deleted file mode 100644
index 8e79b8d4d3..0000000000
--- a/package/util-linux/0001-lsns-improve-dependence-on-NS_GET_-ioctls.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From fc686823b008bc95e2ebe904c706a117a03e2754 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Wed, 6 Apr 2022 10:38:43 +0200
-Subject: lsns: improve dependence on NS_GET_ ioctls
-
-Fixes: http://autobuild.buildroot.org/results/572ecf8e37ac733a4e4265f4f78f35230337278e
-Reported-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Signed-off-by: Karel Zak <kzak@redhat.com>
-
-[Retrieved from:
-https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=fc686823b008bc95e2ebe904c706a117a03e2754]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- sys-utils/lsns.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/sys-utils/lsns.c b/sys-utils/lsns.c
-index 1a7e9f333..75625b3a6 100644
---- a/sys-utils/lsns.c
-+++ b/sys-utils/lsns.c
-@@ -40,7 +40,9 @@
- 
- #ifdef HAVE_LINUX_NSFS_H
- # include <linux/nsfs.h>
--# define USE_NS_GET_API	1
-+# if defined(NS_GET_NSTYPE) && defined(NS_GET_OWNER_UID)
-+#  define USE_NS_GET_API	1
-+# endif
- #endif
- 
- #include "pathnames.h"
--- 
-cgit 
-
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 6f1bb74ecb..ab1807a287 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,7 +1,7 @@
-# From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.38/sha256sums.asc
-sha256  6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64  util-linux-2.38.tar.xz
+# From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.39/sha256sums.asc
+sha256  32b30a336cda903182ed61feb3e9b908b762a5e66fe14e43efb88d37162075cb  util-linux-2.39.tar.xz
 # License files, locally calculated
-sha256  869660b5269f4f40a8a679da7f403ea3a6e71d46087aab5e14871b09bcb55955  README.licensing
+sha256  64dfeae1519bf0e27563d905a71264310fb6a8fa74e5cf99bb36e4d30d7ef455  README.licensing
 sha256  9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
 sha256  ba7640f00d93e72e92b94b9d71f25ec53bac2f1682f5c4adcccb0018359f60f8  Documentation/licenses/COPYING.BSD-4-Clause-UC
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/licenses/COPYING.GPL-2.0-or-later
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 87ec3c19d7..621e43ba79 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -7,7 +7,7 @@
 # When making changes to this file, please check if
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
-UTIL_LINUX_VERSION_MAJOR = 2.38
+UTIL_LINUX_VERSION_MAJOR = 2.39
 UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
@@ -15,7 +15,13 @@ UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERS
 # README.licensing claims that some files are GPL-2.0 only, but this is not
 # true. Some files are GPL-3.0+ but only in tests and optionally in hwclock
 # (but we disable that option). rfkill uses an ISC-style license.
-UTIL_LINUX_LICENSE = GPL-2.0+, BSD-4-Clause, LGPL-2.1+ (libblkid, libfdisk, libmount), BSD-3-Clause (libuuid), ISC (rfkill)
+UTIL_LINUX_LICENSE = \
+	GPL-2.0+, \
+	BSD-4-Clause, \
+	LGPL-2.1+ (libblkid, libfdisk, libmount), \
+	BSD-3-Clause (libuuid), \
+	BSD-2-Clause (xxhash), \
+	ISC (rfkill)
 UTIL_LINUX_LICENSE_FILES = README.licensing \
 	Documentation/licenses/COPYING.BSD-3-Clause \
 	Documentation/licenses/COPYING.BSD-4-Clause-UC \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
