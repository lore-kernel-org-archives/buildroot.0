Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93470C7115B
	for <buildroot@archiver.kernel.org>; Fri, 20 Jun 2025 16:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C3864178D;
	Fri, 20 Jun 2025 16:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bj8QTPAm2G7u; Fri, 20 Jun 2025 16:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7478041791
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7478041791;
	Fri, 20 Jun 2025 16:37:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E96C6C8
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 16:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E671083CFD
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 16:37:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wPvSBeO7jsLW for <buildroot@buildroot.org>;
 Fri, 20 Jun 2025 16:37:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C06080AE0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C06080AE0
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 16:37:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE61483CCF; Fri, 20 Jun 2025 16:37:04 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 20 Jun 2025 18:36:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 477a0cad139c0668f229fc178dc31a93c6ac7eb8
X-Git-Newrev: 255fa160283567ffc05e95b0f5ffeb11cb89586f
X-Patchwork-Hint: ignore
Message-Id: <20250620163704.EE61483CCF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zfs: bump version to 2.3.3
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
Content-Type: multipart/mixed; boundary="===============1641404398240542895=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1641404398240542895==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=255fa160283567ffc05e95b0f5ffeb11cb89586f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed backported patch:
- 0001-fix-S_IFMT-undeclared-at-statx_c.patch
Merged upstream in:
https://github.com/openzfs/zfs/commit/a2593c16101dc551454a641a5a42f195ef34f393

For release note, see:
https://github.com/openzfs/zfs/releases/tag/zfs-2.3.3

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
[Julien: add link to upstream commit of the removed patch]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-fix-S_IFMT-undeclared-at-statx_c.patch    | 36 ----------------------
 package/zfs/zfs.hash                               |  4 +--
 package/zfs/zfs.mk                                 |  2 +-
 3 files changed, 3 insertions(+), 39 deletions(-)

diff --git a/package/zfs/0001-fix-S_IFMT-undeclared-at-statx_c.patch b/package/zfs/0001-fix-S_IFMT-undeclared-at-statx_c.patch
deleted file mode 100644
index 233118f7f6..0000000000
--- a/package/zfs/0001-fix-S_IFMT-undeclared-at-statx_c.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 8e9fcdac6f7bbc4ec92e89b8cdce1dcc404f1999 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
- <salvador.joseluis@gmail.com>
-Date: Fri, 2 May 2025 08:10:08 +0200
-Subject: [PATCH] tests: fix `S_IFMT` undeclared at `statx.c`
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-`S_IFMT` is declared in `sys/stat.h`, but we cannot include this header
-because it redeclares the `statx` function with different argument
-types. Therefore, we define `S_IFMT` ourselves, in the same way as the
-other definitions.
-
-Closes: #17293
-
-Upstream: https://github.com/openzfs/zfs/commit/634c172ee89f5303493a75dc7ff55e0a355b503a
-Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
----
- tests/zfs-tests/cmd/statx.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/tests/zfs-tests/cmd/statx.c b/tests/zfs-tests/cmd/statx.c
-index 89939f6efb40..1acc7e58c5ce 100644
---- a/tests/zfs-tests/cmd/statx.c
-+++ b/tests/zfs-tests/cmd/statx.c
-@@ -109,6 +109,9 @@ _statx(int fd, const char *path, int flags, unsigned int mask, void *stx)
- #ifndef STATX_DIOALIGN
- #define	STATX_DIOALIGN	(1<<13)
- #endif
-+#ifndef S_IFMT
-+#define	S_IFMT 0170000
-+#endif
- 
- typedef struct {
- 	int64_t		tv_sec;
diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
index 4c607d84a4..87ee513aed 100644
--- a/package/zfs/zfs.hash
+++ b/package/zfs/zfs.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openzfs/zfs/releases/download/zfs-2.3.2/zfs-2.3.2.sha256.asc
-sha256  80da628a9543ec3355bf410617450e167706948ceb287541455a1b8d87b8758a  zfs-2.3.2.tar.gz
+# From https://github.com/openzfs/zfs/releases/download/zfs-2.3.3/zfs-2.3.3.sha256.asc
+sha256  844122118f0ea81205a01753bbcb1315330f8967c1f866dcd10155273131f071  zfs-2.3.3.tar.gz
 
 # Hash for license files:
 sha256  1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520  LICENSE
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index bdd7b2a3b0..ad4f3f232d 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZFS_VERSION = 2.3.2
+ZFS_VERSION = 2.3.3
 ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
 ZFS_SELINUX_MODULES = zfs
 ZFS_LICENSE = CDDL

--===============1641404398240542895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1641404398240542895==--
