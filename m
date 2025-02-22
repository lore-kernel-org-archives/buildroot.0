Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8B3C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E119E7047D;
	Fri, 28 Feb 2025 17:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bn8ucTnfyNs2; Fri, 28 Feb 2025 17:21:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDE6570734
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDE6570734;
	Fri, 28 Feb 2025 17:21:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 102F1711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E1E546562
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O9gUXqkWwrCq for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A10AC4745D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A10AC4745D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96D6680114; Fri, 28 Feb 2025 16:30:45 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 22 Feb 2025 12:08:27 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 843a4faa6d2fd047c307178bd07549c32ec76eae
X-Git-Newrev: 13c53ae3bbde4ceb264ee6767b33c157636e4b95
X-Patchwork-Hint: ignore
Message-Id: <20250228163045.96D6680114@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/zstd: bump to version
 1.5.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============8113587250142286316=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8113587250142286316==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=13c53ae3bbde4ceb264ee6767b33c157636e4b95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For release note, see:
https://github.com/facebook/zstd/releases/tag/v1.5.7

This commit also removes the package patch, included in release.

Signed-off-by: Nuno Gonçalves <nunog@fr24.com>
[Julien: add link to release note]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ....mk-fix-typo-in-the-definition-of-LIB_BIN.patch | 47 ----------------------
 package/zstd/zstd.hash                             |  4 +-
 package/zstd/zstd.mk                               |  2 +-
 3 files changed, 3 insertions(+), 50 deletions(-)

diff --git a/package/zstd/0001-lib-libzstd.mk-fix-typo-in-the-definition-of-LIB_BIN.patch b/package/zstd/0001-lib-libzstd.mk-fix-typo-in-the-definition-of-LIB_BIN.patch
deleted file mode 100644
index 5fc930128a..0000000000
--- a/package/zstd/0001-lib-libzstd.mk-fix-typo-in-the-definition-of-LIB_BIN.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 4de25344f7c01f00d99bc467e76bc6f9b6971dd7 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 13 Jul 2024 13:53:53 +0200
-Subject: [PATCH] lib/libzstd.mk: fix typo in the definition of LIB_BINDIR
-
-Commit f4dbfce79cb2b82fb496fcd2518ecd3315051b7d ("define LIB_SRCDIR
-and LIB_BINDIR") significantly reworked the build logic, but in its
-introduction of LIB_BINDIR a typo was made.
-
-It was introduced as such:
-
-+LIB_SRCDIR ?= $(dir $(realpath $(lastword $(MAKEFILE_LIST))))
-+LIB_BINDIR ?= $(LIBSRC_DIR)
-
-But the definition of LIB_BINDIR has a typo: it should use
-$(LIB_SRCDIR) not $(LIBSRC_DIR).
-
-Due to this, $(LIB_BINDIR) is empty, therefore in programs/Makefile,
--L$(LIB_BINDIR) is expanded to just -L, and consequently when trying
-to link the "zstd" binary with the libzstd library, it cannot find it:
-
-host/lib/gcc/powerpc64-buildroot-linux-gnu/13.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: cannot find -lzstd: No such file or directory
-
-This commit fixes the build by fixing this typo.
-
-Upstream: https://github.com/facebook/zstd/pull/4096
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- lib/libzstd.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/libzstd.mk b/lib/libzstd.mk
-index a308a6ef..c7ae2ff4 100644
---- a/lib/libzstd.mk
-+++ b/lib/libzstd.mk
-@@ -22,7 +22,7 @@ LIBZSTD_MK_INCLUDED := 1
- 
- # By default, library's directory is same as this included makefile
- LIB_SRCDIR ?= $(dir $(realpath $(lastword $(MAKEFILE_LIST))))
--LIB_BINDIR ?= $(LIBSRC_DIR)
-+LIB_BINDIR ?= $(LIB_SRCDIR)
- 
- # ZSTD_LIB_MINIFY is a helper variable that
- # configures a bunch of other variables to space-optimized defaults.
--- 
-2.45.2
-
diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
index 8be85c356a..2cd26ffc77 100644
--- a/package/zstd/zstd.hash
+++ b/package/zstd/zstd.hash
@@ -1,5 +1,5 @@
-# From https://github.com/facebook/zstd/releases/download/v1.5.6/zstd-1.5.6.tar.gz.sha256
-sha256  8c29e06cf42aacc1eafc4077ae2ec6c6fcb96a626157e0593d5e82a34fd403c1  zstd-1.5.6.tar.gz
+# From https://github.com/facebook/zstd/releases/download/v1.5.7/zstd-1.5.7.tar.gz.sha256
+sha256  eb33e51f49a15e023950cd7825ca74a4a2b43db8354825ac24fc1b7ee09e6fa3  zstd-1.5.7.tar.gz
 
 # License files (locally computed)
 sha256  7055266497633c9025b777c78eb7235af13922117480ed5c674677adc381c9d8  LICENSE
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index bf04b4793c..70da1e7354 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZSTD_VERSION = 1.5.6
+ZSTD_VERSION = 1.5.7
 ZSTD_SITE = https://github.com/facebook/zstd/releases/download/v$(ZSTD_VERSION)
 ZSTD_INSTALL_STAGING = YES
 ZSTD_LICENSE = BSD-3-Clause or GPL-2.0

--===============8113587250142286316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8113587250142286316==--
