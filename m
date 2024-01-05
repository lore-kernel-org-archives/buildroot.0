Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14551C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 13:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA92F436F6;
	Fri,  5 Jan 2024 13:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA92F436F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9BF6MupF6Ipd; Fri,  5 Jan 2024 13:01:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 669FA436E9;
	Fri,  5 Jan 2024 13:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 669FA436E9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 855901BF990
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EC9B42208
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:01:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EC9B42208
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rxhAmd7xZg7m for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 13:01:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B7AB42207
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 13:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B7AB42207
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A8BA844F5; Fri,  5 Jan 2024 13:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 14:00:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55b0434940d46bd16ec1d6063f124c9560e4ceb4
X-Git-Newrev: 2f8feb66204ff661e9fd5f508e2dfd1ebc0f2813
X-Patchwork-Hint: ignore
Message-Id: <20240105130113.5A8BA844F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/botan: bump to version 3.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f8feb66204ff661e9fd5f508e2dfd1ebc0f2813
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patches (already in version)
- Update hash of license.txt (update in year:
  https://github.com/randombit/botan/commit/4d0371816763f16ea0b9694155016db591293c8e)

https://github.com/randombit/botan/blob/3.2.0/news.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  2 --
 .../0001-Add-superh-alias-needed-by-Debian.patch   | 22 ----------------
 ...build-data-arch-superh.txt-add-sh4-eb-aeb.patch | 30 ----------------------
 package/botan/botan.hash                           |  4 +--
 package/botan/botan.mk                             |  2 +-
 5 files changed, 3 insertions(+), 57 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 24780870e5..e13c66f7bb 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -208,8 +208,6 @@ package/bmx7/0001-Fix-schedule.c-378-36-error-SIOCGSTAMP-undeclared.patch Upstre
 package/bmx7/0002-Fix-linking-error.patch Upstream
 package/bmx7/0003-Reorder-includes-to-avoid-ethhdr-collision.patch Upstream
 package/boinc/S99boinc-client Indent Shellcheck Variables
-package/botan/0001-Add-superh-alias-needed-by-Debian.patch Upstream
-package/botan/0002-src-build-data-arch-superh.txt-add-sh4-eb-aeb.patch Upstream
 package/brickd/S70brickd Indent Shellcheck Variables
 package/bridge-utils/0001-fix-build-on-musl.patch Upstream
 package/brltty/0001-Fix-linking-error-on-mips64el.patch Upstream
diff --git a/package/botan/0001-Add-superh-alias-needed-by-Debian.patch b/package/botan/0001-Add-superh-alias-needed-by-Debian.patch
deleted file mode 100644
index c6236849e9..0000000000
--- a/package/botan/0001-Add-superh-alias-needed-by-Debian.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From 454c7c04385a47d511cf8999ccff2746afbab06b Mon Sep 17 00:00:00 2001
-From: Jack Lloyd <jack@randombit.net>
-Date: Sat, 21 Nov 2020 12:37:06 -0500
-Subject: [PATCH] Add superh alias needed by Debian
-
-[Retrieved from:
-https://github.com/randombit/botan/commit/454c7c04385a47d511cf8999ccff2746afbab06b]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/build-data/arch/superh.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/build-data/arch/superh.txt b/src/build-data/arch/superh.txt
-index 6af6dbe682..8e2833a914 100644
---- a/src/build-data/arch/superh.txt
-+++ b/src/build-data/arch/superh.txt
-@@ -1,4 +1,5 @@
- 
- <aliases>
- sh4
-+sh4a
- </aliases>
diff --git a/package/botan/0002-src-build-data-arch-superh.txt-add-sh4-eb-aeb.patch b/package/botan/0002-src-build-data-arch-superh.txt-add-sh4-eb-aeb.patch
deleted file mode 100644
index aa9f3ad5ba..0000000000
--- a/package/botan/0002-src-build-data-arch-superh.txt-add-sh4-eb-aeb.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c88897ebaf173b97068811b520a4741039f09dcd Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 20 Aug 2022 15:16:22 +0200
-Subject: [PATCH] src/build-data/arch/superh.txt: add sh4{eb,aeb}
-
-Fix the following build failure with sh4{eb,aeb}:
-
-  ERROR: Unknown or unidentifiable processor "sh4aeb"
-
-Fixes:
- - http://autobuild.buildroot.org/results/d7750b734736a66e10bc5a8ee06708041b36443a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/randombit/botan/commit/c88897ebaf173b97068811b520a4741039f09dcd]
----
- src/build-data/arch/superh.txt | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/build-data/arch/superh.txt b/src/build-data/arch/superh.txt
-index 8e2833a914..e17edb097a 100644
---- a/src/build-data/arch/superh.txt
-+++ b/src/build-data/arch/superh.txt
-@@ -2,4 +2,6 @@
- <aliases>
- sh4
- sh4a
-+sh4eb
-+sh4aeb
- </aliases>
diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index 64da04415e..840191aa4b 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,4 +1,4 @@
 # From https://botan.randombit.net/releases/sha256sums.txt
-sha256  dae047f399c5a47f087db5d3d9d9e8f11ae4985d14c928d71da1aff801802d55  Botan-2.19.3.tar.xz
+sha256  049c847835fcf6ef3a9e206b33de05dd38999c325e247482772a5598d9e5ece3  Botan-3.2.0.tar.xz
 # Locally computed
-sha256  472faf6d2231130382779f96de506be19296473750356449fc426ddc9cb03b50  license.txt
+sha256  1833cde7c7cc03296b1ef2ddc178b1cd7fd1c476840f32cf6aedb09ab0bc9004  license.txt
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 52019f36eb..74cf6175dd 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOTAN_VERSION = 2.19.3
+BOTAN_VERSION = 3.2.0
 BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
