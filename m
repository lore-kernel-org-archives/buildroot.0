Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AED3C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 10:07:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9CBC60E05
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 10:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9CBC60E05
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64636818D0;
	Wed, 27 Oct 2021 10:07:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TAoE9KlQdTfo; Wed, 27 Oct 2021 10:07:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C44C0818C4;
	Wed, 27 Oct 2021 10:07:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 80CBF1BF2F4
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 10:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F7EF6064E
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 10:07:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z7f5-hYUzGwd for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 10:07:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3FB2605F2
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 10:07:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 651E888FA1; Wed, 27 Oct 2021 10:04:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 12:07:36 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: cec899184287eb5857f87899bfa20dc770796ab4
X-Git-Newrev: 20ce8f444983c8c5d9f66c2dbd46339153a329a2
X-Patchwork-Hint: ignore
Message-Id: <20211027100415.651E888FA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/lrzip: security
 bump to version 0.641
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

commit: https://git.buildroot.net/buildroot/commit/?id=20ce8f444983c8c5d9f66c2dbd46339153a329a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

- Fix CVE-2021-27347: Use after free in lzma_decompress_buf function in
  stream.c in Irzip 0.631 allows attackers to cause Denial of Service
  (DoS) via a crafted compressed file.
- Fix CVE-2021-27345: A null pointer dereference was discovered in
  ucompthread in stream.c in Irzip 0.631 which allows attackers to cause
  a denial of service (DOS) via a crafted compressed file.
- Fix CVE-2020-25467: A null pointer dereference was discovered
  lzo_decompress_buf in stream.c in Irzip 0.621 which allows an attacker
  to cause a denial of service (DOS) via a crafted compressed file.
- lz4 is a mandatory dependency since version 0.640 and
  https://github.com/ckolivas/lrzip/commit/3345a239b7f5353a1c1296d6a5d6b90729d4b669

https://github.com/ckolivas/lrzip/compare/7f3bf46203bf45ea115d8bd9f310ea219be88af4...v0.641

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3332c143c0675818beeebf1be6880dc282527519)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lrzip/Config.in  | 1 +
 package/lrzip/lrzip.hash | 2 +-
 package/lrzip/lrzip.mk   | 6 +++---
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/lrzip/Config.in b/package/lrzip/Config.in
index 885b84dbb0..870094796b 100644
--- a/package/lrzip/Config.in
+++ b/package/lrzip/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LRZIP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LZ4
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_BZIP2
 	help
diff --git a/package/lrzip/lrzip.hash b/package/lrzip/lrzip.hash
index 3e188c41e5..19295383c3 100644
--- a/package/lrzip/lrzip.hash
+++ b/package/lrzip/lrzip.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  4d31c429491f1378e868afe06867f68f8b1332fdca0758de24cc4da22103acfb  lrzip-7f3bf46203bf45ea115d8bd9f310ea219be88af4.tar.gz
+sha256  9b6b4bb1ae76dafbaab96ec9d50d41af5fed45a6c4f2e06feea828c2cd8025c0  lrzip-0.641.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/lrzip/lrzip.mk b/package/lrzip/lrzip.mk
index 7419bb1ed9..409d9912d8 100644
--- a/package/lrzip/lrzip.mk
+++ b/package/lrzip/lrzip.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LRZIP_VERSION = 7f3bf46203bf45ea115d8bd9f310ea219be88af4
-LRZIP_SITE = $(call github,ckolivas,lrzip,$(LRZIP_VERSION))
+LRZIP_VERSION = 0.641
+LRZIP_SITE = $(call github,ckolivas,lrzip,v$(LRZIP_VERSION))
 LRZIP_AUTORECONF = YES
 LRZIP_LICENSE = GPL-2.0+
 LRZIP_LICENSE_FILES = COPYING
-LRZIP_DEPENDENCIES = zlib lzo bzip2
+LRZIP_DEPENDENCIES = zlib lz4 lzo bzip2
 
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
 LRZIP_DEPENDENCIES += host-nasm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
