Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E75BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 20:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2787A4035A;
	Mon, 27 Dec 2021 20:01:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r8x6rbylkfND; Mon, 27 Dec 2021 20:00:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CAB240355;
	Mon, 27 Dec 2021 20:00:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0EF441BF8B4
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 20:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B40C2401A2
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 20:00:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N308KGqejWCo for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 20:00:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC3BC401AF
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 20:00:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 32E5A82BA8; Mon, 27 Dec 2021 19:54:33 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 20:59:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b2b1d26cc34553c651e32e8fa37111930e53b9e
X-Git-Newrev: 2a40e2ce48826dde89b46448acb99cb6bfe64456
X-Patchwork-Hint: ignore
Message-Id: <20211227195433.32E5A82BA8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package: mrp: bump to version 1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a40e2ce48826dde89b46448acb99cb6bfe64456
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version requires cfm package

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cfm/cfm.mk    | 1 +
 package/mrp/Config.in | 1 +
 package/mrp/mrp.hash  | 2 +-
 package/mrp/mrp.mk    | 4 ++--
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/cfm/cfm.mk b/package/cfm/cfm.mk
index a998bb11ca..850b8d604c 100644
--- a/package/cfm/cfm.mk
+++ b/package/cfm/cfm.mk
@@ -9,6 +9,7 @@ CFM_SITE = $(call github,microchip-ung,cfm,v$(CFM_VERSION))
 CFM_DEPENDENCIES = libev libmnl libnl
 CFM_LICENSE = GPL-2.0
 CFM_LICENSE_FILES = LICENSE
+CFM_INSTALL_STAGING = YES
 
 define CFM_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D $(CFM_PKGDIR)/S65cfm \
diff --git a/package/mrp/Config.in b/package/mrp/Config.in
index 0ca18a4ef2..ac42fa4773 100644
--- a/package/mrp/Config.in
+++ b/package/mrp/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_MRP
 	select BR2_PACKAGE_LIBEV
 	select BR2_PACKAGE_LIBMNL
 	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_CFM
 	help
 	  This is the userspace application that configures the kernel
 	  to run MRP protocol. The userspace application is made of 2
diff --git a/package/mrp/mrp.hash b/package/mrp/mrp.hash
index 02a848c7eb..47cf461882 100644
--- a/package/mrp/mrp.hash
+++ b/package/mrp/mrp.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  1a6c76d058bb425a7ec8b69a65de797650961161ec016b51ac8a1965e1ac304f  mrp-1.1.tar.gz
+sha256  2b960d14c861b4e0332f411440b41a9c1c06ecce8ed6197944a74b1c8279c1cc  mrp-1.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mrp/mrp.mk b/package/mrp/mrp.mk
index 7e31e442ce..213afbcdf5 100644
--- a/package/mrp/mrp.mk
+++ b/package/mrp/mrp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-MRP_VERSION = 1.1
+MRP_VERSION = 1.2
 MRP_SITE = $(call github,microchip-ung,mrp,v$(MRP_VERSION))
-MRP_DEPENDENCIES = libev libmnl libnl
+MRP_DEPENDENCIES = libev libmnl libnl cfm
 MRP_LICENSE = GPL-2.0
 MRP_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
