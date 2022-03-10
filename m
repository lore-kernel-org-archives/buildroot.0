Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F926C433FE
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 21:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E51F160F74;
	Thu, 10 Mar 2022 21:30:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6z946MA50E2X; Thu, 10 Mar 2022 21:30:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DE0C6128C;
	Thu, 10 Mar 2022 21:30:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E757B1BF2C1
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CAFD60B43
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:27:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C5Fb5dxIHtNA for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 21:27:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 622E66127E
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 21:27:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C530583C16; Thu, 10 Mar 2022 21:18:43 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 22:09:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 62451216135a86021278a24c8e8fc04c1a52f5b7
X-Git-Newrev: c2e32e655802ad917eb240b8c2b7ac343ab55ec1
X-Patchwork-Hint: ignore
Message-Id: <20220310211843.C530583C16@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erofs-utils: bump version to 1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=c2e32e655802ad917eb240b8c2b7ac343ab55ec1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- new upstream version;
- add 0001-erofs-utils-dump-fix-de-nid-issues.patch [1];
- add 0002-fsck-main.c-add-missing-include.patch [2];
- add 0003-erofs-utils-lib-fix-blobdev-without-Eforce-chunk-ind.patch [3];
- add 0004-erofs-utils-fix-Makefile-for-fsck.erofs-manpage.patch [4].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=17eb5c417bd56be4b2f7627c2d6879fbad6a86d6
[2] https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=1ca453ee89894b1669ac78d7f216bda172783e8d
[3] https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=eb255afa101b52096bd3e5e48f990576190f03bd
[4] https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=534eda7f8678e5b8fc8ca0f5cf0d9d7a932e0d48

Signed-off-by: Gao Xiang <hsiangkao@aol.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-erofs-utils-dump-fix-de-nid-issues.patch  | 134 +++++++++++++++++++++
 ...-manpage-only-install-erofsfuse.1-with-th.patch |  32 -----
 .../0002-fsck-main.c-add-missing-include.patch     |  31 +++++
 ...-lib-fix-blobdev-without-Eforce-chunk-ind.patch |  40 ++++++
 ...utils-fix-Makefile-for-fsck.erofs-manpage.patch |  29 +++++
 package/erofs-utils/erofs-utils.hash               |   2 +-
 package/erofs-utils/erofs-utils.mk                 |   2 +-
 7 files changed, 236 insertions(+), 34 deletions(-)

diff --git a/package/erofs-utils/0001-erofs-utils-dump-fix-de-nid-issues.patch b/package/erofs-utils/0001-erofs-utils-dump-fix-de-nid-issues.patch
new file mode 100644
index 0000000000..493ce59177
--- /dev/null
+++ b/package/erofs-utils/0001-erofs-utils-dump-fix-de-nid-issues.patch
@@ -0,0 +1,134 @@
+From 17eb5c417bd56be4b2f7627c2d6879fbad6a86d6 Mon Sep 17 00:00:00 2001
+From: Gao Xiang <xiang@kernel.org>
+Date: Mon, 22 Nov 2021 07:48:48 +0800
+Subject: [PATCH] erofs-utils: dump: fix de->nid issues
+
+As David Michael reported, "
+    In file included from main.c:11:
+    main.c: In function 'erofs_checkdirent':
+    ../include/erofs/print.h:68:25: error: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type '__le64' {aka 'long unsigned int'} [-Werror=format=]
+       68 |                         "<E> " PR_FMT_FUNC_LINE(fmt),   \
+          |                         ^~~~~~
+    main.c:264:17: note: in expansion of macro 'erofs_err'
+      264 |                 erofs_err("invalid file type %llu", de->nid);
+          |                 ^~~~~~~~~
+    main.c: In function 'erofs_read_dirent':
+    ../include/erofs/print.h:68:25: error: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type '__le64' {aka 'long unsigned int'} [-Werror=format=]
+       68 |                         "<E> " PR_FMT_FUNC_LINE(fmt),   \
+          |                         ^~~~~~
+    main.c:303:25: note: in expansion of macro 'erofs_err'
+      303 |                         erofs_err("parse dir nid %llu error occurred\n",
+          |                         ^~~~~~~~~
+    cc1: all warnings being treated as errors
+"
+
+Also there are many de->nid lacking of endianness handling.
+Should fix them together.
+
+Link: https://lore.kernel.org/r/20211121234848.12663-1-xiang@kernel.org
+Fixes: cf8be8a4352a ("erofs-utils: dump: add feature for collecting filesystem statistics")
+Cc: Wang Qi <mpiglet@outlook.com>
+Cc: Guo Xuenan <guoxuenan@huawei.com>
+Reported-by: David Michael <fedora.dm0@gmail.com>
+Signed-off-by: Gao Xiang <xiang@kernel.org>
+---
+ dump/main.c | 31 ++++++++++++++++---------------
+ 1 file changed, 16 insertions(+), 15 deletions(-)
+
+diff --git a/dump/main.c b/dump/main.c
+index b7560eca1080..f85903b059d2 100644
+--- a/dump/main.c
++++ b/dump/main.c
+@@ -242,11 +242,12 @@ static inline int erofs_checkdirent(struct erofs_dirent *de,
+ {
+ 	int dname_len;
+ 	unsigned int nameoff = le16_to_cpu(de->nameoff);
++	erofs_nid_t nid = le64_to_cpu(de->nid);
+ 
+ 	if (nameoff < sizeof(struct erofs_dirent) ||
+ 			nameoff >= PAGE_SIZE) {
+ 		erofs_err("invalid de[0].nameoff %u @ nid %llu",
+-				nameoff, de->nid | 0ULL);
++				nameoff, nid | 0ULL);
+ 		return -EFSCORRUPTED;
+ 	}
+ 
+@@ -255,13 +256,12 @@ static inline int erofs_checkdirent(struct erofs_dirent *de,
+ 	/* a corrupted entry is found */
+ 	if (nameoff + dname_len > maxsize ||
+ 			dname_len > EROFS_NAME_LEN) {
+-		erofs_err("bogus dirent @ nid %llu",
+-				le64_to_cpu(de->nid) | 0ULL);
++		erofs_err("bogus dirent @ nid %llu", nid | 0ULL);
+ 		DBG_BUGON(1);
+ 		return -EFSCORRUPTED;
+ 	}
+ 	if (de->file_type >= EROFS_FT_MAX) {
+-		erofs_err("invalid file type %llu", de->nid);
++		erofs_err("invalid file type %llu", nid | 0ULL);
+ 		return -EFSCORRUPTED;
+ 	}
+ 	return dname_len;
+@@ -273,7 +273,7 @@ static int erofs_read_dirent(struct erofs_dirent *de,
+ {
+ 	int err;
+ 	erofs_off_t occupied_size = 0;
+-	struct erofs_inode inode = { .nid = de->nid };
++	struct erofs_inode inode = { .nid = le64_to_cpu(de->nid) };
+ 
+ 	stats.files++;
+ 	stats.file_category_stat[de->file_type]++;
+@@ -296,12 +296,12 @@ static int erofs_read_dirent(struct erofs_dirent *de,
+ 		update_file_size_statatics(occupied_size, inode.i_size);
+ 	}
+ 
+-	if ((de->file_type == EROFS_FT_DIR)
+-			&& de->nid != nid && de->nid != parent_nid) {
+-		err = erofs_read_dir(de->nid, nid);
++	if (de->file_type == EROFS_FT_DIR && inode.nid != nid &&
++	    inode.nid != parent_nid) {
++		err = erofs_read_dir(inode.nid, nid);
+ 		if (err) {
+ 			erofs_err("parse dir nid %llu error occurred\n",
+-					de->nid);
++				  inode.nid | 0ULL);
+ 			return err;
+ 		}
+ 	}
+@@ -338,7 +338,8 @@ static int erofs_read_dir(erofs_nid_t nid, erofs_nid_t parent_nid)
+ 			int ret;
+ 
+ 			/* skip "." and ".." dentry */
+-			if (de->nid == nid || de->nid == parent_nid) {
++			if (le64_to_cpu(de->nid) == nid ||
++			    le64_to_cpu(de->nid) == parent_nid) {
+ 				de++;
+ 				continue;
+ 			}
+@@ -399,18 +400,18 @@ static int erofs_get_pathname(erofs_nid_t nid, erofs_nid_t parent_nid,
+ 			if (len < 0)
+ 				return len;
+ 
+-			if (de->nid == target) {
++			if (le64_to_cpu(de->nid) == target) {
+ 				memcpy(path + pos, dname, len);
+ 				path[pos + len] = '\0';
+ 				return 0;
+ 			}
+ 
+ 			if (de->file_type == EROFS_FT_DIR &&
+-					de->nid != parent_nid &&
+-					de->nid != nid) {
++			    le64_to_cpu(de->nid) != parent_nid &&
++			    le64_to_cpu(de->nid) != nid) {
+ 				memcpy(path + pos, dname, len);
+-				err = erofs_get_pathname(de->nid, nid,
+-						target, path, pos + len);
++				err = erofs_get_pathname(le64_to_cpu(de->nid),
++						nid, target, path, pos + len);
+ 				if (!err)
+ 					return 0;
+ 				memset(path + pos, 0, len);
+-- 
+2.30.2
+
diff --git a/package/erofs-utils/0001-erofs-utils-manpage-only-install-erofsfuse.1-with-th.patch b/package/erofs-utils/0001-erofs-utils-manpage-only-install-erofsfuse.1-with-th.patch
deleted file mode 100644
index 0aa99d5324..0000000000
--- a/package/erofs-utils/0001-erofs-utils-manpage-only-install-erofsfuse.1-with-th.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 7ab34000c672adca90388a8fcb1f70a7d391d35c Mon Sep 17 00:00:00 2001
-From: David Michael <fedora.dm0@gmail.com>
-Date: Thu, 3 Jun 2021 16:18:57 -0400
-Subject: [PATCH] erofs-utils: manpage: only install erofsfuse.1 with the
- command
-
-Link: https://lore.kernel.org/r/87lf7q3dn2.fsf@gmail.com
-Reviewed-by: Gao Xiang <xiang@kernel.org>
-Signed-off-by: David Michael <fedora.dm0@gmail.com>
-Signed-off-by: Gao Xiang <xiang@kernel.org>
----
- man/Makefile.am | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/man/Makefile.am b/man/Makefile.am
-index ffcf6f81c255..0df947b6fbf7 100644
---- a/man/Makefile.am
-+++ b/man/Makefile.am
-@@ -1,5 +1,9 @@
- # SPDX-License-Identifier: GPL-2.0+
- # Makefile.am
- 
--dist_man_MANS = mkfs.erofs.1 erofsfuse.1
-+dist_man_MANS = mkfs.erofs.1
- 
-+EXTRA_DIST = erofsfuse.1
-+if ENABLE_FUSE
-+man_MANS = erofsfuse.1
-+endif
--- 
-2.20.1
-
diff --git a/package/erofs-utils/0002-fsck-main.c-add-missing-include.patch b/package/erofs-utils/0002-fsck-main.c-add-missing-include.patch
new file mode 100644
index 0000000000..c4fe71c9e6
--- /dev/null
+++ b/package/erofs-utils/0002-fsck-main.c-add-missing-include.patch
@@ -0,0 +1,31 @@
+From 1ca453ee89894b1669ac78d7f216bda172783e8d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 6 Dec 2021 20:14:03 +0100
+Subject: [PATCH] fsck/main.c: add missing include
+
+Otherwise musl C library builds fail with missing S_IFMT/S_IFDIR
+definitions.
+
+Link: https://lore.kernel.org/r/20211206191403.1435229-1-alex@linutronix.de
+Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
+---
+ fsck/main.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/fsck/main.c b/fsck/main.c
+index aefa881f740a..ad48e35f587b 100644
+--- a/fsck/main.c
++++ b/fsck/main.c
+@@ -6,6 +6,7 @@
+ #include <stdlib.h>
+ #include <getopt.h>
+ #include <time.h>
++#include <sys/stat.h>
+ #include "erofs/print.h"
+ #include "erofs/io.h"
+ #include "erofs/decompress.h"
+-- 
+2.30.2
+
diff --git a/package/erofs-utils/0003-erofs-utils-lib-fix-blobdev-without-Eforce-chunk-ind.patch b/package/erofs-utils/0003-erofs-utils-lib-fix-blobdev-without-Eforce-chunk-ind.patch
new file mode 100644
index 0000000000..88979eb28f
--- /dev/null
+++ b/package/erofs-utils/0003-erofs-utils-lib-fix-blobdev-without-Eforce-chunk-ind.patch
@@ -0,0 +1,40 @@
+From eb255afa101b52096bd3e5e48f990576190f03bd Mon Sep 17 00:00:00 2001
+From: Gao Xiang <hsiangkao@linux.alibaba.com>
+Date: Thu, 23 Dec 2021 16:49:07 +0800
+Subject: [PATCH] erofs-utils: lib: fix --blobdev without -Eforce-chunk-indexes
+
+blockmap is used by default, chunk indexes should be switched
+instead if --blobdev is specified.
+
+Link: https://lore.kernel.org/r/20211223084907.93020-1-hsiangkao@linux.alibaba.com
+Fixes: 016bd812be1e ("erofs-utils: mkfs: enable block map chunk format")
+Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
+---
+ lib/blobchunk.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/blobchunk.c b/lib/blobchunk.c
+index 5e9a88a30af3..a145be917b4a 100644
+--- a/lib/blobchunk.c
++++ b/lib/blobchunk.c
+@@ -113,7 +113,7 @@ int erofs_blob_write_chunk_indexes(struct erofs_inode *inode,
+ 
+ 	if (multidev) {
+ 		idx.device_id = 1;
+-		inode->u.chunkformat |= EROFS_CHUNK_FORMAT_INDEXES;
++		DBG_BUGON(!(inode->u.chunkformat & EROFS_CHUNK_FORMAT_INDEXES));
+ 	} else {
+ 		base_blkaddr = remapped_base;
+ 	}
+@@ -171,6 +171,8 @@ int erofs_blob_write_chunked_file(struct erofs_inode *inode)
+ 	int fd, ret;
+ 
+ 	inode->u.chunkformat |= inode->u.chunkbits - LOG_BLOCK_SIZE;
++	if (multidev)
++		inode->u.chunkformat |= EROFS_CHUNK_FORMAT_INDEXES;
+ 
+ 	if (inode->u.chunkformat & EROFS_CHUNK_FORMAT_INDEXES)
+ 		unit = sizeof(struct erofs_inode_chunk_index);
+-- 
+2.30.2
+
diff --git a/package/erofs-utils/0004-erofs-utils-fix-Makefile-for-fsck.erofs-manpage.patch b/package/erofs-utils/0004-erofs-utils-fix-Makefile-for-fsck.erofs-manpage.patch
new file mode 100644
index 0000000000..27832d1e32
--- /dev/null
+++ b/package/erofs-utils/0004-erofs-utils-fix-Makefile-for-fsck.erofs-manpage.patch
@@ -0,0 +1,29 @@
+From 534eda7f8678e5b8fc8ca0f5cf0d9d7a932e0d48 Mon Sep 17 00:00:00 2001
+From: Gao Xiang <xiang@kernel.org>
+Date: Mon, 22 Nov 2021 07:58:40 +0800
+Subject: [PATCH] erofs-utils: fix Makefile for fsck.erofs manpage
+
+Add the missing dependency for fsck.erofs manpage.
+
+Link: https://lore.kernel.org/r/20211121235840.17600-1-xiang@kernel.org
+Fixes: f44043561491 ("erofs-utils: introduce fsck.erofs")
+Signed-off-by: Gao Xiang <xiang@kernel.org>
+---
+ man/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/man/Makefile.am b/man/Makefile.am
+index 769b5578a175..4628b85df2ef 100644
+--- a/man/Makefile.am
++++ b/man/Makefile.am
+@@ -1,6 +1,6 @@
+ # SPDX-License-Identifier: GPL-2.0+
+ 
+-dist_man_MANS = mkfs.erofs.1 dump.erofs.1
++dist_man_MANS = mkfs.erofs.1 dump.erofs.1 fsck.erofs.1
+ 
+ EXTRA_DIST = erofsfuse.1
+ if ENABLE_FUSE
+-- 
+2.30.2
+
diff --git a/package/erofs-utils/erofs-utils.hash b/package/erofs-utils/erofs-utils.hash
index 8bbb088568..aca5677d17 100644
--- a/package/erofs-utils/erofs-utils.hash
+++ b/package/erofs-utils/erofs-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  132635740039bbe76d743aea72378bfae30dbf034e123929f5d794198d4c0b12  erofs-utils-1.3.tar.gz
+sha256  67702b1fc5da05719d95ddb7c107e334b04365f5161a9717479d2831fca85a98  erofs-utils-1.4.tar.gz
 sha256  feee3b3157dcdf78d4f50edefbd5dd7adf8b6d52c11bfaaa746a85a373256713  COPYING
diff --git a/package/erofs-utils/erofs-utils.mk b/package/erofs-utils/erofs-utils.mk
index e35470b02e..03df2be366 100644
--- a/package/erofs-utils/erofs-utils.mk
+++ b/package/erofs-utils/erofs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EROFS_UTILS_VERSION = 1.3
+EROFS_UTILS_VERSION = 1.4
 EROFS_UTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot
 EROFS_UTILS_LICENSE = GPL-2.0+
 EROFS_UTILS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
