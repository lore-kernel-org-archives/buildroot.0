Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F313C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:15:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16A1260724
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16A1260724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5BC6403DF;
	Mon, 25 Oct 2021 20:15:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wpEeAT3K4h2e; Mon, 25 Oct 2021 20:15:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCC7C403E9;
	Mon, 25 Oct 2021 20:15:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8CA341BF870
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78185403D5
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:14:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mHqvPO30jQ3o for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 20:14:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57CDE403E0
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 20:14:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9428C8889C; Mon, 25 Oct 2021 20:11:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 22:12:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 23ca2efef1528c73f04b5db8aff66a826fab1b9e
X-Git-Newrev: 17358061ad2b58d3eb96ea8c5631e235a484ac87
X-Patchwork-Hint: ignore
Message-Id: <20211025201120.9428C8889C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gobject-introspection: needs host
 gcc >= 7
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

commit: https://git.buildroot.net/buildroot/commit/?id=17358061ad2b58d3eb96ea8c5631e235a484ac87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 33c69c02fb4c1176584d1e2dd336b74ed39f5d65 forgot to propagate
host gcc >= 7 dependency to reverse dependencies of host-qemu resulting
in the following build failure:

ERROR: You need at least GCC v7.5 or Clang v6.0 (or XCode Clang v10.0)

Fixes:
 - http://autobuild.buildroot.org/results/14cd0250d55c5ca5dc1d297aee1b927fda889531

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gobject-introspection/Config.in | 6 ++++--
 package/python-bluezero/Config.in       | 6 ++++--
 package/python-gobject/Config.in        | 6 ++++--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
index bacf44363c..c631c84755 100644
--- a/package/gobject-introspection/Config.in
+++ b/package/gobject-introspection/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_GOBJECT_INTROSPECTION
 	# compile errors with locale.c. As such, require 4.9 until this
 	# can be verified.
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-qemu
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	# gobject-introspection does not require python3 to run on the
 	# target; however, because the tools run in a qemu wrapper, a
@@ -41,8 +42,9 @@ comment "gobject-introspection needs python3"
 	depends on !BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 
-comment "gobject-introspection needs a glibc toolchain, gcc >= 4.9"
+comment "gobject-introspection needs a glibc toolchain, gcc >= 4.9, host gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_7
diff --git a/package/python-bluezero/Config.in b/package/python-bluezero/Config.in
index c391bfa858..3d40b1e275 100644
--- a/package/python-bluezero/Config.in
+++ b/package/python-bluezero/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_BLUEZERO
 	bool "python-bluezero"
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # python-gobject -> gobject-introspection
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-gobject -> gobject-introspection
+	depends on BR2_HOST_GCC_AT_LEAST_7 # python-gobject -> gobject-introspection -> host-qemu
 	depends on BR2_TOOLCHAIN_USES_GLIBC # python-gobject -> gobject-introspection
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_DBUS # runtime
@@ -12,8 +13,9 @@ config BR2_PACKAGE_PYTHON_BLUEZERO
 
 	  https://github.com/ukBaz/python-bluezero
 
-comment "python-bluezero needs a glibc toolchain, gcc >= 4.9"
+comment "python-bluezero needs a glibc toolchain, gcc >= 4.9, host gcc >= 7"
 	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_7
diff --git a/package/python-gobject/Config.in b/package/python-gobject/Config.in
index 1c9303b0ba..910f990026 100644
--- a/package/python-gobject/Config.in
+++ b/package/python-gobject/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_GOBJECT
 	depends on BR2_USE_MMU # libglib2, gobject-introspection
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # gobject-introspection
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
+	depends on BR2_HOST_GCC_AT_LEAST_7 # gobject-introspection -> host-qemu
 	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
 	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection
 	select BR2_PACKAGE_GOBJECT_INTROSPECTION
@@ -12,8 +13,9 @@ config BR2_PACKAGE_PYTHON_GOBJECT
 
 	  https://wiki.gnome.org/action/show/Projects/PyGObject
 
-comment "python-gobject needs a glibc toolchain, gcc >= 4.9"
+comment "python-gobject needs a glibc toolchain, gcc >= 4.9, host gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_7
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
