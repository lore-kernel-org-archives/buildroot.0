Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF50C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D42884B6B;
	Mon,  6 Dec 2021 18:44:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3qYvOZaC7FUo; Mon,  6 Dec 2021 18:44:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1750180BC8;
	Mon,  6 Dec 2021 18:44:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17B3A1BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C07AA41C21
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xj2M9dmr9Jz0 for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFD1B41C50
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8AA5B81468; Mon,  6 Dec 2021 18:07:42 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 22:56:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b33e39e3ea5078cc80d9658e8af63049189bd475
X-Git-Newrev: 2a3edc5e00b38f4f927894d0911990c9060e4415
X-Patchwork-Hint: ignore
Message-Id: <20211206180742.8AA5B81468@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libyang: bump verstion to 2.0.112
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a3edc5e00b38f4f927894d0911990c9060e4415
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libyang/Config.in    | 3 +--
 package/libyang/libyang.hash | 4 ++--
 package/libyang/libyang.mk   | 6 +++---
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/libyang/Config.in b/package/libyang/Config.in
index fec1160a6f..54df061b58 100644
--- a/package/libyang/Config.in
+++ b/package/libyang/Config.in
@@ -2,8 +2,7 @@ config BR2_PACKAGE_LIBYANG
 	bool "libyang"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_PCRE
-	select BR2_PACKAGE_PCRE_UCP
+	select BR2_PACKAGE_PCRE2
 	help
 	  Libyang is YANG data modeling language parser and toolkit
 	  written (and providing API) in C.
diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
index 755ecf390a..c129896a63 100644
--- a/package/libyang/libyang.hash
+++ b/package/libyang/libyang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8576cad398b451b1c622b0652a2030fcf83ee1d9a39e6cd93d17b0a5a43118d6  libyang-1.0.240.tar.gz
-sha256  f942fe693e03e4e3ff67a351c00dc8f468a042e0d7273b0aa6bc53060b568112  LICENSE
+sha256  184dd67c66c1ad968a2ee4d0950fb6b103834917b04b17af9c7bca80967636ee  libyang-2.0.112.tar.gz
+sha256  0b7ec43747d211a1e49c53588b0822062947bab6bdcc95238578beab34cba5bb  LICENSE
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index f784367ea3..7de9531bff 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -4,15 +4,15 @@
 #
 ################################################################################
 
-LIBYANG_VERSION = 1.0.240
+LIBYANG_VERSION = 2.0.112
 LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
 LIBYANG_LICENSE = BSD-3-Clause
 LIBYANG_LICENSE_FILES = LICENSE
 LIBYANG_INSTALL_STAGING = YES
 LIBYANG_CPE_ID_VENDOR = cesnet
 LIBYANG_SUPPORTS_IN_SOURCE_BUILD = NO
-LIBYANG_DEPENDENCIES = pcre
-HOST_LIBYANG_DEPENDENCIES = host-pcre
+LIBYANG_DEPENDENCIES = pcre2
+HOST_LIBYANG_DEPENDENCIES = host-pcre2
 
 LIBYANG_CONF_OPTS = \
 	-DENABLE_VALGRIND_TESTS=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
