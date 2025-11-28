Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00046D116EA
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 22:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4F2E84299;
	Fri, 28 Nov 2025 22:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FdbtNykclwPj; Fri, 28 Nov 2025 22:00:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D91A6842B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D91A6842B5;
	Fri, 28 Nov 2025 22:00:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F70B273
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 22:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91539608B8
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 22:00:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMA-ZKgomuHk for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 22:00:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7495608A3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7495608A3
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 22:00:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A49198616F; Fri, 28 Nov 2025 22:00:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Nov 2025 22:47:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5bf0db998b4bd125500668953d5e4649ff37cb19
X-Git-Newrev: d2ed4565321c74772014681ca5ddcb433162e468
X-Patchwork-Hint: ignore
Message-Id: <20251128220037.A49198616F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/liburing: bump to
 version 2.12
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d2ed4565321c74772014681ca5ddcb433162e468
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Switch to github since git.kernel.dk is not always reachable and actual
tarball sha256 has changed. Also note that local patch is required because
it's been reverted wit this commit [1].

Release Notes:
https://github.com/axboe/liburing/releases/tag/liburing-2.12

[1]:
https://github.com/axboe/liburing/commit/6f8b3481cf511ade803fe7a2ea8fe3b99fce3658

Fixes:
https://autobuild.buildroot.net/results/ddf/ddfd0bb8f5623a1ce7aa4168c5759b2c54a933da/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/liburing/Config.in     | 2 +-
 package/liburing/liburing.hash | 4 ++--
 package/liburing/liburing.mk   | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/liburing/Config.in b/package/liburing/Config.in
index fc13f1c17c..29df944ce1 100644
--- a/package/liburing/Config.in
+++ b/package/liburing/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_LIBURING
 	  simplified interface for applications that don't need (or
 	  want) to deal with the full kernel side implementation.
 
-	  https://git.kernel.dk/cgit/liburing
+	  https://github.com/axboe/liburing
 
 comment "liburing needs a toolchain w/ gcc >= 4.9, headers >= 5.1"
 	depends on BR2_USE_MMU
diff --git a/package/liburing/liburing.hash b/package/liburing/liburing.hash
index f06dd187a7..d37b69497f 100644
--- a/package/liburing/liburing.hash
+++ b/package/liburing/liburing.hash
@@ -1,8 +1,8 @@
 # Locally calculated
-sha256  78bcc0dc0d004a238d8b5f597adbb4ec74926352a3983b872db7f0efdb72565d  liburing-2.6.tar.bz2
+sha256  f1d10cb058c97c953b4c0c446b11e9177e8c8b32a5a88b309f23fdd389e26370  liburing-2.12.tar.gz
 
 # Hash for license files
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
 sha256  2ec12f7934cdfce25ff72b0557738989d79fc7a496d1cf9b2d3f9464fd61edbe  LICENSE
-sha256  b0731ca09e6f4718d456a989d32b6c61bf27e5d4bab6ca31e409d75c5120d19e  README
+sha256  d98e81bb7a8fcfb5506f02c3190b5bc2e286970591072edc4575c26624d827dd  README
diff --git a/package/liburing/liburing.mk b/package/liburing/liburing.mk
index fc3993b38c..24ceb281b5 100644
--- a/package/liburing/liburing.mk
+++ b/package/liburing/liburing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBURING_VERSION = 2.6
-LIBURING_SOURCE = liburing-$(LIBURING_VERSION).tar.bz2
-LIBURING_SITE = https://git.kernel.dk/cgit/liburing/snapshot
+LIBURING_VERSION = liburing-2.12
+LIBURING_SOURCE = $(LIBURING_VERSION).tar.gz
+LIBURING_SITE = $(call github,axboe,liburing,$(LIBURING_VERSION))
 LIBURING_LICENSE = (GPL-2.0 with exceptions and LGPL-2.1+) or MIT
 LIBURING_LICENSE_FILES = COPYING COPYING.GPL LICENSE README
 LIBURING_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
