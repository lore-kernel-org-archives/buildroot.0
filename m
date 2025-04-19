Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75119C369CB
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 14:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4158A60688;
	Sat, 19 Apr 2025 14:43:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tURqssWj0hzk; Sat, 19 Apr 2025 14:43:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 782766069F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 782766069F;
	Sat, 19 Apr 2025 14:43:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A42F7231
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 959868198D
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:43:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JwE9mSUYAW3R for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 14:43:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFE2080B64
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFE2080B64
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:43:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3C3F85AAC; Sat, 19 Apr 2025 14:43:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 16:38:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b9a021dfd7f3ea9c17f2ce354c509659adfa099
X-Git-Newrev: 44c11a6862aa41ae025aa0cf248e2e7236b46d21
X-Patchwork-Hint: ignore
Message-Id: <20250419144348.B3C3F85AAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libubox: bump version to 3868f47
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=44c11a6862aa41ae025aa0cf248e2e7236b46d21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:

 - 3868f47 blob: constify attr argument to blob_memdup
 - eb9bcb6 ustream: prevent recursive calls to the read callback
 - 12bda4b CI: add CodeQL workflow tests
 - a2fce00 CI: add build test run
 - c1be505 udebug: fix crash in udebug_entry_vprintf with longer strings
 - 6339204 CMakeLists.txt: bump minimum cmake version
 - ca3f6d0 udebug: fix file descriptor initialization for __udebug_buf_map
 - df5b714 udebug: add mips specific quirk
 - d27acfe udebug: add more checks for uninitialized buffers
 - 40acbe3 udebug: wait for response after buffer add/remove
 - e84c000 udebug: add inline helper function to test if a buffer is allocated
 - 325fea5 udebug: add functions for manipulating entry length
 - e80dc00 link librt if needed for shm_open
 - 260ad5b udebug: add ulog support
 - b77f2a4 uloop: fix build using C++ compilers
 - d4c3066 udebug: add udebug library code
 - b3fa3d9 uloop: reset flags after __uloop_fd_delete call
 - 8a5a431 uloop: fix typo in signal handling rework
 - f7d1569 uloop: properly initialize signal handler mask
 - 13d9b04 uloop: add support for user defined signal handlers
 - 82fa648 uloop: add support for interval timers

Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libubox/libubox.hash | 2 +-
 package/libubox/libubox.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libubox/libubox.hash b/package/libubox/libubox.hash
index 7738caf223..eb37d33230 100644
--- a/package/libubox/libubox.hash
+++ b/package/libubox/libubox.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  918acc85199117ef109f2a204020f6fe4d5a1724a09888f45b70b6474345d6fe  libubox-75a3b870cace1171faf57bd55e5a9a2f1564f757-git4.tar.gz
+sha256  df6e1350fd11016ef30242a279cec195d91e6748c11c40e0991593718c46fa52  libubox-3868f47c8f6c6570e62a3cdf8a7f26ffb1a67e6a-git4.tar.gz
diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index d6da078c7b..00ae2b0595 100644
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUBOX_VERSION = 75a3b870cace1171faf57bd55e5a9a2f1564f757
+LIBUBOX_VERSION = 3868f47c8f6c6570e62a3cdf8a7f26ffb1a67e6a
 LIBUBOX_SITE = https://git.openwrt.org/project/libubox.git
 LIBUBOX_SITE_METHOD = git
 LIBUBOX_LICENSE = ISC, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
