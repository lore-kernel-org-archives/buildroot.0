Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBEFC77B73
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 07:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06D7D605AF;
	Mon,  1 May 2023 07:18:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06D7D605AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yRI6j0HW_4hG; Mon,  1 May 2023 07:18:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3709B6111C;
	Mon,  1 May 2023 07:18:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3709B6111C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 43E5C1BF2EF
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 07:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E61B40182
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 07:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E61B40182
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NEjH60JZG_4o for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 07:18:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E229400B8
 for <buildroot@buildroot.org>; Mon,  1 May 2023 07:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E229400B8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2772D8465D; Mon,  1 May 2023 07:18:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 1 May 2023 09:14:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1fb66e2852cb004ed31b54d28b5e12181d6d2df5
X-Git-Newrev: 987a80f8f44659d206ab564bbf6f51271b0bb2d8
X-Patchwork-Hint: ignore
Message-Id: <20230501071802.2772D8465D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 23.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=987a80f8f44659d206ab564bbf6f51271b0bb2d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2023-March/000713.html
https://lists.freedesktop.org/archives/mesa-announce/2023-April/000714.html
https://lists.freedesktop.org/archives/mesa-announce/2023-April/000717.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index a9ab1de8ea..4685ad6695 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 23.0.0
+MESA3D_HEADERS_VERSION = 23.0.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 17dc2e7c00..0de11663f4 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2023-February/000706.html
-sha256  01f3cff3763f09e0adabcb8011e4aebc6ad48f6a4dd4bae904fe918707d253e4  mesa-23.0.0.tar.xz
-sha512  127e2759a2a31cacd65a0891719ab7bb4a9188844022b4bccaebbedce9c550b9ccb160ad519178ea0d851c4bcb8f0f56febda248ed2ba82b5ddf804855e4694b  mesa-23.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2023-April/000717.html
+sha256  386362a5d80df3b096636b67f340e1ce67b705b44767d5bdd11d2ed1037192d5  mesa-23.0.3.tar.xz
+sha512  52c778de61daa406c6a1e96a657e9b6fdcc71c8cfda80b7f53acc6470556c7d502c057b9481bb0c3d57ef0263263413fd0d25d53ebf5aa0246fbcc3309de64ae  mesa-23.0.3.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index a09c157b33..09a12b4b7e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 23.0.0
+MESA3D_VERSION = 23.0.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
