Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB89C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 12:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECA5481361;
	Thu, 30 Dec 2021 12:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8AiRwQU7tmXJ; Thu, 30 Dec 2021 12:27:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 491E680DA6;
	Thu, 30 Dec 2021 12:27:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D6EE41C1148
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 12:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C53D440530
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 12:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id InW4oU5nebtq for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 12:26:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC18640523
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 12:26:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1973C82DB1; Thu, 30 Dec 2021 12:20:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 13:21:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5084994d3f6dce350de091cd813047e658b9363d
X-Git-Newrev: e2f2186ffa1873c31d252865cff07ad3bf3f159e
X-Patchwork-Hint: ignore
Message-Id: <20211230122038.1973C82DB1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libosmium: bump version to 2.17.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=e2f2186ffa1873c31d252865cff07ad3bf3f159e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/osmcode/libosmium/releases/tag/v2.17.2

Since commit ac5a20e64b: "Github actions: Use lz4 library in CI builds"
lz4 is mandatory dependency, so move it to permanent dependencies list.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libosmium/Config.in      | 1 +
 package/libosmium/libosmium.hash | 2 +-
 package/libosmium/libosmium.mk   | 8 ++------
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/libosmium/Config.in b/package/libosmium/Config.in
index 9f002d3516..3a4c64e9d2 100644
--- a/package/libosmium/Config.in
+++ b/package/libosmium/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBOSMIUM
 	depends on BR2_USE_WCHAR # boost
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_PROTOZERO
+	select BR2_PACKAGE_LZ4
 	help
 	  A fast and flexible C++ library for working with OpenStreetMap
 	  data. Libosmium works on Linux, macOS and Windows.
diff --git a/package/libosmium/libosmium.hash b/package/libosmium/libosmium.hash
index ce3c7b6020..564b7c07d7 100644
--- a/package/libosmium/libosmium.hash
+++ b/package/libosmium/libosmium.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6faa7952aa1210dcd9ae4ef83e7653a4f8eb880e6a4e5b37f87a5d4835f6327b  libosmium-2.17.1.tar.gz
+sha256  f30e37c28f37ca3857b8107a12e6d138a0719831eca52a836692909801c8b0bd  libosmium-2.17.2.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/libosmium/libosmium.mk b/package/libosmium/libosmium.mk
index a969f2c4dc..82dd274bba 100644
--- a/package/libosmium/libosmium.mk
+++ b/package/libosmium/libosmium.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBOSMIUM_VERSION = 2.17.1
+LIBOSMIUM_VERSION = 2.17.2
 LIBOSMIUM_SITE = $(call github,osmcode,libosmium,v$(LIBOSMIUM_VERSION))
 LIBOSMIUM_LICENSE = BSL-1.0
 LIBOSMIUM_LICENSE_FILES = LICENSE
 LIBOSMIUM_INSTALL_STAGING = YES
-LIBOSMIUM_DEPENDENCIES = boost protozero
+LIBOSMIUM_DEPENDENCIES = boost protozero lz4
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 LIBOSMIUM_DEPENDENCIES += bzip2
@@ -23,10 +23,6 @@ ifeq ($(BR2_PACKAGE_LIBGEOS),y)
 LIBOSMIUM_DEPENDENCIES += libgeos
 endif
 
-ifeq ($(BR2_PACKAGE_LZ4),y)
-LIBOSMIUM_DEPENDENCIES += lz4
-endif
-
 ifeq ($(BR2_PACKAGE_PROJ),y)
 LIBOSMIUM_DEPENDENCIES += proj
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
