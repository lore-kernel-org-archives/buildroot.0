Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F25C433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:08:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6317661029
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6317661029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F585842E6;
	Thu, 23 Sep 2021 21:08:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b3E9cL20wrYH; Thu, 23 Sep 2021 21:08:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68FE084314;
	Thu, 23 Sep 2021 21:08:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 252051BF317
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19856406EB
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:06:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8_UQsmBLCNqb for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 21:06:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3194E40767
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 21:06:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 962E58D211; Thu, 23 Sep 2021 21:04:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 23 Sep 2021 23:01:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2728b3410c2c3d4cb1ef43e3e395a3104d44007
X-Git-Newrev: 8f1770cb9b795668eb2df41a5b453b843f1fd112
X-Patchwork-Hint: ignore
Message-Id: <20210923210442.962E58D211@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsysfs: bump to version 2.1.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8f1770cb9b795668eb2df41a5b453b843f1fd112
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch to github to get latest release
- Not an uploaded tarball, so autoreconf is necessary
- Update hash of license files (gnu.org license files are used since
  https://github.com/linux-ras/sysfsutils/commit/b69c2046ce8307804e91403643d43baad086feb3)
  Paragraphs are rewrapped, URLs and addresses have changed, and some
  additional explanation from gnu.org is added. It's still just (L)GPL
  though.

https://github.com/linux-ras/sysfsutils/releases/tag/v2.1.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libsysfs/Config.in     | 2 +-
 package/libsysfs/libsysfs.hash | 6 +++---
 package/libsysfs/libsysfs.mk   | 7 ++++---
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/libsysfs/Config.in b/package/libsysfs/Config.in
index 2cbebaa530..076490ec42 100644
--- a/package/libsysfs/Config.in
+++ b/package/libsysfs/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LIBSYSFS
 	  These are a set of utilities built upon sysfs, a filesystem in
 	  Linux 2.6 kernels that exposes a system's device tree.
 
-	  http://linux-diag.sourceforge.net/Sysfsutils.html
+	  https://github.com/linux-ras/sysfsutils
diff --git a/package/libsysfs/libsysfs.hash b/package/libsysfs/libsysfs.hash
index 5d32300ad1..3d2d03fcdd 100644
--- a/package/libsysfs/libsysfs.hash
+++ b/package/libsysfs/libsysfs.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  e865de2c1f559fff0d3fc936e660c0efaf7afe662064f2fb97ccad1ec28d208a  sysfsutils-2.1.0.tar.gz
-sha256  88ced477f0659c5a4df22df3b65de2f12ea3a9c7b5e4750fdc757bc11e97aa79  cmd/GPL
-sha256  4eb1c0ea980e7e4c7fac34e025be0423f5e7ca7df501e1da7ef31f32f14d6cf9  lib/LGPL
+sha256  f7f669d27c997d3eb3f3e014b4c0aa1aa4d07ce4d6f9e41fa835240f2bf38810  libsysfs-2.1.1.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  cmd/GPL
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  lib/LGPL
diff --git a/package/libsysfs/libsysfs.mk b/package/libsysfs/libsysfs.mk
index 6cff8bf5fe..94de9e4314 100644
--- a/package/libsysfs/libsysfs.mk
+++ b/package/libsysfs/libsysfs.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-LIBSYSFS_VERSION = 2.1.0
-LIBSYSFS_SITE = http://downloads.sourceforge.net/project/linux-diag/sysfsutils/$(LIBSYSFS_VERSION)
-LIBSYSFS_SOURCE = sysfsutils-$(LIBSYSFS_VERSION).tar.gz
+LIBSYSFS_VERSION = 2.1.1
+LIBSYSFS_SITE = $(call github,linux-ras,sysfsutils,v$(LIBSYSFS_VERSION))
 LIBSYSFS_INSTALL_STAGING = YES
 LIBSYSFS_LICENSE = GPL-2.0 (utilities), LGPL-2.1+ (library)
 LIBSYSFS_LICENSE_FILES = cmd/GPL lib/LGPL
 LIBSYSFS_CPE_ID_VENDOR = sysfsutils_project
 LIBSYSFS_CPE_ID_PRODUCT = sysfsutils
+# From git
+LIBSYSFS_AUTORECONF = YES
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
