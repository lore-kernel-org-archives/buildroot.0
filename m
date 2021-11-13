Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5362C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92F2184B42;
	Mon,  6 Dec 2021 18:15:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lGkMzD_sQ-LU; Mon,  6 Dec 2021 18:15:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F20A280F4B;
	Mon,  6 Dec 2021 18:15:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 38A1D1BF989
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64A2A82AAA
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s3dpnaYGsC3z for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B574C84B8A
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5125281061; Mon,  6 Dec 2021 18:07:37 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 18:05:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 345087ee5137a1aa28f1d0f54e914b9cc186c3f8
X-Git-Newrev: 200f46b940965ea3eccab4b277f4990ec6ee755f
X-Patchwork-Hint: ignore
Message-Id: <20211206180737.5125281061@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libqb: bump to version 2.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=200f46b940965ea3eccab4b277f4990ec6ee755f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use official tarball and so drop autoreconf

https://github.com/ClusterLabs/libqb/releases/tag/v2.0.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libqb/libqb.hash | 4 +++-
 package/libqb/libqb.mk   | 7 ++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/libqb/libqb.hash b/package/libqb/libqb.hash
index 0a01a9bbb5..b2c216f24c 100644
--- a/package/libqb/libqb.hash
+++ b/package/libqb/libqb.hash
@@ -1,3 +1,5 @@
+# From https://github.com/ClusterLabs/libqb/releases/download/v2.0.3/libqb-2.0.3.sha256
+sha256  a74582bc886fa625f5238374c7c8ca98672a2519c8196b91276be55886d84e9c  libqb-2.0.3.tar.xz
+
 # Locally calculated
-sha256  f72769c66479c51ac176b56837637b29d200f9dad40d23c5fdcb10f3a53ab1e4  libqb-2.0.2.tar.gz
 sha256  00a89b0d18aacd4114decf79122db87bf35bddaf2bc50e383c9c9f4c263390b2  COPYING
diff --git a/package/libqb/libqb.mk b/package/libqb/libqb.mk
index a9cf5e3fb9..fb132365f1 100644
--- a/package/libqb/libqb.mk
+++ b/package/libqb/libqb.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-LIBQB_VERSION = 2.0.2
-LIBQB_SITE = $(call github,ClusterLabs,libqb,v$(LIBQB_VERSION))
+LIBQB_VERSION = 2.0.3
+LIBQB_SOURCE = libqb-$(LIBQB_VERSION).tar.xz
+LIBQB_SITE = \
+	https://github.com/ClusterLabs/libqb/releases/download/v$(LIBQB_VERSION)
 LIBQB_LICENSE = LGPL-2.1+
 LIBQB_LICENSE_FILES = COPYING
 LIBQB_CPE_ID_VENDOR = clusterlabs
 LIBQB_INSTALL_STAGING = YES
-LIBQB_AUTORECONF = YES
 LIBQB_DEPENDENCIES = libxml2
 
 # ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
