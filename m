Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50CDC636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 17:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2806F409AA;
	Sun,  5 Feb 2023 17:09:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2806F409AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ktdU0M9paJRc; Sun,  5 Feb 2023 17:09:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEB2C409B4;
	Sun,  5 Feb 2023 17:09:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEB2C409B4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12A301BF869
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 17:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E121060692
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 17:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E121060692
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id baBIr6PzLyd1 for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 17:09:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEBFC60669
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 17:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEBFC60669
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD29B838DF; Sun,  5 Feb 2023 17:09:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 18:08:39 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 6b1a7b69abcc65517a443de986b5e249d30e9696
X-Git-Newrev: 3a7e02bdfd7e7175f7f55673a1b1563ab8b1633e
X-Patchwork-Hint: ignore
Message-Id: <20230205170914.DD29B838DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libgit2: bump to
 1.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a7e02bdfd7e7175f7f55673a1b1563ab8b1633e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

It includes an option to build a command line program that can be used
to replace git in simple cases.

The upcoming sha256 repository support made them steal the sha256 code
from RFC6234, hence the license change.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7c8e34f4d20598a6536a6d63b6c4a97eb3b794cf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgit2/Config.in    | 10 ++++++++++
 package/libgit2/libgit2.hash |  4 ++--
 package/libgit2/libgit2.mk   | 16 ++++++++++++++--
 3 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/package/libgit2/Config.in b/package/libgit2/Config.in
index a6a9728ff0..5d28f054f2 100644
--- a/package/libgit2/Config.in
+++ b/package/libgit2/Config.in
@@ -12,3 +12,13 @@ config BR2_PACKAGE_LIBGIT2
 
 comment "libgit2 needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
+
+if BR2_PACKAGE_LIBGIT2
+
+config BR2_PACKAGE_LIBGIT2_CLI
+	bool "enable command line interface (git2_cli)"
+	help
+	  Enable a command-line interface for libgit2.
+	  It aims to be git-compatible.
+
+endif
diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 3b5837f789..fb760fd4cc 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f48b961e463a9e4e7e7e58b21a0fb5a9b2a1d24d9ba4d15870a0c9b8ad965163  libgit2-1.4.3.tar.gz
-sha256  0092f24acc306ee3287dc05b5e85cb9e0e48cd3f11c60c4625b1a673a5912616  COPYING
+sha256  8de872a0f201b33d9522b817c92e14edb4efad18dae95cf156cf240b2efff93e  libgit2-1.5.0.tar.gz
+sha256  0fc09da43d666b5b0cf5695defc3100d5cf387936b260ebab37e396d7e0dbc83  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 9b5e2b897d..9409011eb4 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,9 +4,14 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.4.3
+LIBGIT2_VERSION = 1.5.0
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
-LIBGIT2_LICENSE = GPL-2.0 with linking exception, MIT (sha1), wildmatch license (wildmatch), CC0-1.0 (xoroshiro256)
+LIBGIT2_LICENSE = \
+	GPL-2.0 with linking exception, \
+	MIT (sha1), \
+	BSD-3-Clause (sha256), \
+	wildmatch license (wildmatch), \
+	CC0-1.0 (xoroshiro256)
 LIBGIT2_LICENSE_FILES = COPYING
 LIBGIT2_CPE_ID_VENDOR = libgit2_project
 LIBGIT2_INSTALL_STAGING = YES
@@ -44,8 +49,15 @@ else
 LIBGIT2_CONF_OPTS += -DUSE_HTTPS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGIT2_CLI),y)
+LIBGIT2_CONF_OPTS += -DBUILD_CLI=ON
+else
+LIBGIT2_CONF_OPTS += -DBUILD_CLI=OFF
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 LIBGIT2_CONF_OPTS += \
+	-DCMAKE_EXE_LINKER_FLAGS=-latomic \
 	-DCMAKE_SHARED_LINKER_FLAGS=-latomic
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
