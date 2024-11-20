Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06B5D743D9
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 21:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25E3E403DE;
	Wed, 20 Nov 2024 21:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cbylrNIdYRTT; Wed, 20 Nov 2024 21:31:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBD2640328
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBD2640328;
	Wed, 20 Nov 2024 21:31:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 149EA5B28
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00DDB4057F
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:31:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HBuPYsmzOV0w for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 21:31:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA34D403AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA34D403AA
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:31:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B811186520; Wed, 20 Nov 2024 21:31:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 20 Nov 2024 22:10:16 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 6239e449d15e6f714714353bf10f100e0397d3fa
X-Git-Newrev: 22e818e66b242a6936126e3114d5bcc8256c6704
X-Patchwork-Hint: ignore
Message-Id: <20241120213142.B811186520@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/systemd: bump to
 256.7
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
Content-Type: multipart/mixed; boundary="===============2449922488877101225=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2449922488877101225==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=22e818e66b242a6936126e3114d5bcc8256c6704
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Remove patch that was applied upstream.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6ec14080cd20cfd4e265c37c85446f24a70b5db6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...issing_loop.h-fix-missing-LOOP_SET_BLOCK_.patch | 38 ----------------------
 package/systemd/systemd.hash                       |  2 +-
 package/systemd/systemd.mk                         |  2 +-
 3 files changed, 2 insertions(+), 40 deletions(-)

diff --git a/package/systemd/0001-src-basic-missing_loop.h-fix-missing-LOOP_SET_BLOCK_.patch b/package/systemd/0001-src-basic-missing_loop.h-fix-missing-LOOP_SET_BLOCK_.patch
deleted file mode 100644
index 0ab5a4e98d..0000000000
--- a/package/systemd/0001-src-basic-missing_loop.h-fix-missing-LOOP_SET_BLOCK_.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 56ab1c54497d9fac74380ff9e11aaf931a917d2b Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
-Date: Fri, 14 Jun 2024 14:37:29 +0200
-Subject: [PATCH] src/basic/missing_loop.h: fix missing LOOP_SET_BLOCK_SIZE
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Builds with kernels headers < 4.14 fail with:
-
-../src/shared/loop-util.c: In function ‘loop_configure_fallback’:
-../src/shared/loop-util.c:237:31: error: ‘LOOP_SET_BLOCK_SIZE’ undeclared (first use in this function); did you mean ‘LOOP_SET_DIRECT_IO’?
-                 if (ioctl(fd, LOOP_SET_BLOCK_SIZE, (unsigned long) c->block_size) < 0)
-                               ^~~~~~~~~~~~~~~~~~~
-                               LOOP_SET_DIRECT_IO
-
-Fixes: https://github.com/systemd/systemd/issues/33341
-Upstream: https://github.com/systemd/systemd/commit/56ab1c54497d9fac74380ff9e11aaf931a917d2b
-Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
----
- src/basic/missing_loop.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/basic/missing_loop.h b/src/basic/missing_loop.h
-index b88501d78b..f83a14c914 100644
---- a/src/basic/missing_loop.h
-+++ b/src/basic/missing_loop.h
-@@ -29,3 +29,7 @@ assert_cc(LOOP_SET_DIRECT_IO == 0x4C08);
- #ifndef LOOP_SET_STATUS_SETTABLE_FLAGS
- #  define LOOP_SET_STATUS_SETTABLE_FLAGS (LO_FLAGS_AUTOCLEAR | LO_FLAGS_PARTSCAN)
- #endif
-+
-+#ifndef LOOP_SET_BLOCK_SIZE
-+#  define LOOP_SET_BLOCK_SIZE 0x4C09
-+#endif
--- 
-2.34.1
-
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 399ac61492..976d88c1f5 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  7861d544190f938cac1b242624d78c96fe2ebbc7b72f86166e88b50451c6fa58  systemd-256.4.tar.gz
+sha256  896d76ff65c88f5fd9e42f90d152b0579049158a163431dd77cdc57748b1d7b0  systemd-256.7.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5dca8681bc..87a8285b8a 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 256.4
+SYSTEMD_VERSION = 256.7
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \

--===============2449922488877101225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2449922488877101225==--
