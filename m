Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C9EC4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 17:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 165EC85249;
	Thu,  2 Nov 2023 17:36:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 165EC85249
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3qfD2OGXTy3l; Thu,  2 Nov 2023 17:36:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BB1B85254;
	Thu,  2 Nov 2023 17:36:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BB1B85254
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE3291BF350
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 17:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B548970750
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 17:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B548970750
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kwxhYXoJ0ESC for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 17:36:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0B4B70749
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 17:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0B4B70749
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C95F286526; Thu,  2 Nov 2023 17:36:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Nov 2023 18:35:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6bb275a59a2a0d8454a1121b2660d382c2476b2d
X-Git-Newrev: 70550024f01e2f5a685d1d765dec111a34d84c3d
X-Patchwork-Hint: ignore
Message-Id: <20231102173631.C95F286526@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strace: bump to version 6.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=70550024f01e2f5a685d1d765dec111a34d84c3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update hash of COPYING (year updated with
  https://github.com/strace/strace/commit/b45ed94f6926c9a7aae6bfb54f9a47ea313c0646)
- This bump will fix the following build failure with kernel >= 6.6 raised
  since
  https://github.com/torvalds/linux/commit/182741d287fb1ea870ee6ef45aa1915a0b031233
  thanks to
  https://github.com/strace/strace/commit/4eda6d7b61f46d81f7f87afa6fa802dcbe136ca1:

In file included from btrfs.c:51:
xlat/btrfs_key_types.h:167:37: error: 'BTRFS_EXTENT_REF_V0_KEY' undeclared here (not in a function); did you mean 'BTRFS_EXTENT_DATA_KEY'?
  167 | static_assert((unsigned long long) (BTRFS_EXTENT_REF_V0_KEY)
      |                                     ^~~~~~~~~~~~~~~~~~~~~~~
      |                                     BTRFS_EXTENT_DATA_KEY

https://github.com/strace/strace/releases/tag/v6.6

Fixes:
 - http://autobuild.buildroot.org/results/da026b8307a4ef1406d2c90d42564df38a172a50

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/strace/strace.hash | 6 +++---
 package/strace/strace.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index c43d3aabbc..75a35d7cf4 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/6.5/strace-6.5.tar.xz.asc
-sha256  dfb051702389e1979a151892b5901afc9e93bbc1c70d84c906ade3224ca91980  strace-6.5.tar.xz
-sha256  d92f973d08c8466993efff1e500453add0c038c20b4d2cbce3297938a296aea9  COPYING
+# https://strace.io/files/6.6/strace-6.6.tar.xz.asc
+sha256  421b4186c06b705163e64dc85f271ebdcf67660af8667283147d5e859fc8a96c  strace-6.6.tar.xz
+sha256  6e5648c0ed522b163f9df1dc500c73491b1743495bd78388e99685cecfa79707  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index d2ffaafc43..6279622fdb 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 6.5
+STRACE_VERSION = 6.6
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
