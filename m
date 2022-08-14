Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6B9C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 10:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3DFF40283;
	Sun, 14 Aug 2022 10:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3DFF40283
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TYGqO1JLig6l; Sun, 14 Aug 2022 10:07:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24D194019B;
	Sun, 14 Aug 2022 10:07:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24D194019B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6A2F1BF96B
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE90A829B1
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:06:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE90A829B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fa6O3bF8IJch for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 10:06:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1082382893
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 10:06:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1082382893
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4406987430; Sun, 14 Aug 2022 09:52:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 12:06:33 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e992a3e7712f6f87fcbddb1844a5cbf51a1d82bb
X-Git-Newrev: 7c8e34f4d20598a6536a6d63b6c4a97eb3b794cf
X-Patchwork-Hint: ignore
Message-Id: <20220814095231.4406987430@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libgit2: bump to 1.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c8e34f4d20598a6536a6d63b6c4a97eb3b794cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

It includes an option to build a command line program that can be used
to replace git in simple cases.

The upcoming sha256 repository support made them steal the sha256 code
from RFC6234, hence the license change.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
