Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EAEC10F05
	for <buildroot@archiver.kernel.org>; Wed,  6 Dec 2023 13:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4335B812CA;
	Wed,  6 Dec 2023 13:00:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4335B812CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WJdW7RTnNt7J; Wed,  6 Dec 2023 13:00:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B4C081389;
	Wed,  6 Dec 2023 13:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B4C081389
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 340DB1BF34C
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 13:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19A354367C
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 13:00:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19A354367C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3iY7UrDkcz4w for <buildroot@lists.busybox.net>;
 Wed,  6 Dec 2023 13:00:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A96B43675
 for <buildroot@buildroot.org>; Wed,  6 Dec 2023 13:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A96B43675
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1E2C87A1C; Wed,  6 Dec 2023 13:00:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Dec 2023 13:44:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 41f49d2067db9c0b895efb0b0c9ae0c481920640
X-Git-Newrev: 363b28ca4f4a4f840474e05c340d0f8ebd3ac190
X-Patchwork-Hint: ignore
Message-Id: <20231206130008.F1E2C87A1C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ethtool: bump version to 6.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=363b28ca4f4a4f840474e05c340d0f8ebd3ac190
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch back to upstream-provided tarball after upstream fixed the
inclusion of header files needed for older kernels:
https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/commit/?id=988279e051e7a51d0b9e54a7366602ba2879d114

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ethtool/ethtool.hash | 3 ++-
 package/ethtool/ethtool.mk   | 9 +++------
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index 812e4dd8d1..a37c800015 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,4 +1,5 @@
+# From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
+sha256  833a8493cb9cd5809ab59743092d9a38742c282290800e9626407511bbcebf9e  ethtool-6.6.tar.xz
 # Locally calculated
-sha256  b1f5fa66f71c3bab9daeacbd77e010b52c47df0a711b216847f78405f3299189  ethtool-6.5.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1  LICENSE
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index ee710e0021..c9c2856612 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,12 +4,9 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 6.5
-ETHTOOL_SITE = https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/snapshot
-# needed only for autoreconf
-ETHTOOL_DEPENDENCIES = host-pkgconf
-# GIT version, shipped without configure
-ETHTOOL_AUTORECONF = YES
+ETHTOOL_VERSION = 6.6
+ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
+ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
 ETHTOOL_LICENSE_FILES = LICENSE COPYING
 ETHTOOL_CPE_ID_VENDOR = kernel
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
