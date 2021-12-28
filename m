Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF06BC433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 20:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59CC260B5B;
	Tue, 28 Dec 2021 20:21:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sQlDqiCrSE34; Tue, 28 Dec 2021 20:21:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFAC760B36;
	Tue, 28 Dec 2021 20:21:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B9401BF344
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 20:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 385B581B23
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 20:21:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qJ2XodYKqkZH for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 20:21:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6421C81AF4
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 20:21:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5A9B182BDA; Tue, 28 Dec 2021 20:15:31 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 21:20:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22ad0f2569ff849dd2eefdd6c0412d961c762f95
X-Git-Newrev: 396c2513253b38789f0ef46873870530a5fa4968
X-Patchwork-Hint: ignore
Message-Id: <20211228201531.5A9B182BDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/atkmm: bump to version 2.36.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=396c2513253b38789f0ef46873870530a5fa4968
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to meson-package as configure is not shipped anymore

This will fix the following build failure raised since bump of glibmm to
version 2.68.2 in commit dddb65efbdf2c7952f22a1e51009f17f1676db4a:

Package 'glibmm-2.4', required by 'virtual:world', not found

https://gitlab.gnome.org/GNOME/atkmm/-/blob/2.36.1/NEWS

Fixes:
 - http://autobuild.buildroot.org/results/0c4932738aa509f582074f399dfbe1c70ac74070

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/atkmm/atkmm.hash | 4 ++--
 package/atkmm/atkmm.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/atkmm/atkmm.hash b/package/atkmm/atkmm.hash
index 42cc2d7221..f965ad29cb 100644
--- a/package/atkmm/atkmm.hash
+++ b/package/atkmm/atkmm.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/atkmm/2.24/atkmm-2.24.2.sha256sum
-sha256  ff95385759e2af23828d4056356f25376cfabc41e690ac1df055371537e458bd  atkmm-2.24.2.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/atkmm/2.36/atkmm-2.36.1.sha256sum
+sha256  e11324bfed1b6e330a02db25cecc145dca03fb0dff47f0710c85e317687da458  atkmm-2.36.1.tar.xz
 # locally computed
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/atkmm/atkmm.mk b/package/atkmm/atkmm.mk
index 234a937bba..3bcb941c9f 100644
--- a/package/atkmm/atkmm.mk
+++ b/package/atkmm/atkmm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ATKMM_VERSION_MAJOR = 2.24
-ATKMM_VERSION = $(ATKMM_VERSION_MAJOR).2
+ATKMM_VERSION_MAJOR = 2.36
+ATKMM_VERSION = $(ATKMM_VERSION_MAJOR).1
 ATKMM_SOURCE = atkmm-$(ATKMM_VERSION).tar.xz
 ATKMM_SITE = http://ftp.gnome.org/pub/gnome/sources/atkmm/$(ATKMM_VERSION_MAJOR)
 ATKMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
@@ -13,4 +13,4 @@ ATKMM_LICENSE_FILES = COPYING COPYING.tools
 ATKMM_INSTALL_STAGING = YES
 ATKMM_DEPENDENCIES = atk glibmm libsigc host-pkgconf
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
