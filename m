Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05508C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5EC34022C;
	Mon,  6 Dec 2021 18:17:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3BtQwOuuC4YE; Mon,  6 Dec 2021 18:17:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E5C841C17;
	Mon,  6 Dec 2021 18:17:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29A971BF989
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BCB260D6B
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mB_rnUKfhqaw for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83E6060D65
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2D22081503; Mon,  6 Dec 2021 18:07:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:10:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8bff717dfbde3c461a8fad3409293e7fccee621
X-Git-Newrev: ab4e346c52b804949c9e2da2e4374654e0abe54d
X-Patchwork-Hint: ignore
Message-Id: <20211206180738.2D22081503@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ell: bump version to 0.45
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

commit: https://git.buildroot.net/buildroot/commit/?id=ab4e346c52b804949c9e2da2e4374654e0abe54d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Changelog (since 0.44, from [1]):

  ver 0.45:
    Fix issue with ICMPv6 and handling re-entrantly callbacks.

[1] https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index 84016c0ce0..4bb2688c48 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
-sha256  41a6f8fa4d285b52cb7a5a87bda3e7370ecaac02d94aaa7ec1a23f0480b8bc3f  ell-0.44.tar.xz
+sha256  fedfcceee56eb63ab1eb98bf120a3cfbecee50bcd893874328c889f1b381e7d7  ell-0.45.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index 47137e2530..963fad4bae 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.44
+ELL_VERSION = 0.45
 ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
 ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
