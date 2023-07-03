Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E402DC001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 19:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8202B81378;
	Mon,  3 Jul 2023 19:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8202B81378
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r5A-J04_sux3; Mon,  3 Jul 2023 19:54:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B61C88139A;
	Mon,  3 Jul 2023 19:54:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B61C88139A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B1D8C1BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98FC48139A
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98FC48139A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3xU-OpBU43Bz for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 19:54:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8AA481351
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 19:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8AA481351
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97D5086516; Mon,  3 Jul 2023 19:54:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Jul 2023 21:54:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff037fe5430738e85d9c2270883e71cd77e99ff3
X-Git-Newrev: 6a21733f839478d902f3eab287a82b456e55f708
X-Patchwork-Hint: ignore
Message-Id: <20230703195451.97D5086516@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/e2fsprogs: bump version to 1.47.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a21733f839478d902f3eab287a82b456e55f708
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://e2fsprogs.sourceforge.net/e2fsprogs-release.html

Removed patch which is included this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...s-add-sanity-check-to-extent-manipulation.patch | 59 ----------------------
 package/e2fsprogs/e2fsprogs.hash                   |  4 +-
 package/e2fsprogs/e2fsprogs.mk                     |  2 +-
 4 files changed, 3 insertions(+), 63 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a48712460f..d3e5af4129 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -378,7 +378,6 @@ package/dvblast/0002-fix-int-types.patch Upstream
 package/dvbsnoop/0001-musl-types-h.patch Upstream
 package/dvdrw-tools/0001-limits.h.patch Upstream
 package/dvdrw-tools/0002-Include-sysmacros.h-to-compile-with-newer-gcc.patch Upstream
-package/e2fsprogs/0001-libext2fs-add-sanity-check-to-extent-manipulation.patch Upstream
 package/earlyoom/0001-main.c-fix-build-with-kernel-4.3.patch Upstream
 package/earlyoom/S02earlyoom Indent Shellcheck
 package/ebtables/0001-replace-ebtables-save-perl-script-with-bash.patch Upstream
diff --git a/package/e2fsprogs/0001-libext2fs-add-sanity-check-to-extent-manipulation.patch b/package/e2fsprogs/0001-libext2fs-add-sanity-check-to-extent-manipulation.patch
deleted file mode 100644
index b5299a2a78..0000000000
--- a/package/e2fsprogs/0001-libext2fs-add-sanity-check-to-extent-manipulation.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From ab51d587bb9b229b1fade1afd02e1574c1ba5c76 Mon Sep 17 00:00:00 2001
-From: Lukas Czerner <lczerner@redhat.com>
-Date: Thu, 21 Apr 2022 19:31:48 +0200
-Subject: libext2fs: add sanity check to extent manipulation
-
-It is possible to have a corrupted extent tree in such a way that a leaf
-node contains zero extents in it. Currently if that happens and we try
-to traverse the tree we can end up accessing wrong data, or possibly
-even uninitialized memory. Make sure we don't do that.
-
-Additionally make sure that we have a sane number of bytes passed to
-memmove() in ext2fs_extent_delete().
-
-Note that e2fsck is currently unable to spot and fix such corruption in
-pass1.
-
-Signed-off-by: Lukas Czerner <lczerner@redhat.com>
-Reported-by: Nils Bars <nils_bars@t-online.de>
-Addresses: https://bugzilla.redhat.com/show_bug.cgi?id=2068113
-Addresses: CVE-2022-1304
-Addresses-Debian-Bug: #1010263
-Signed-off-by: Theodore Ts'o <tytso@mit.edu>
-
-[Retrieved from:
-https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?h=maint&id=ab51d587bb9b229b1fade1afd02e1574c1ba5c76]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/ext2fs/extent.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/lib/ext2fs/extent.c b/lib/ext2fs/extent.c
-index b324c7b0..1a206a16 100644
---- a/lib/ext2fs/extent.c
-+++ b/lib/ext2fs/extent.c
-@@ -495,6 +495,10 @@ retry:
- 			ext2fs_le16_to_cpu(eh->eh_entries);
- 		newpath->max_entries = ext2fs_le16_to_cpu(eh->eh_max);
- 
-+		/* Make sure there is at least one extent present */
-+		if (newpath->left <= 0)
-+			return EXT2_ET_EXTENT_NO_DOWN;
-+
- 		if (path->left > 0) {
- 			ix++;
- 			newpath->end_blk = ext2fs_le32_to_cpu(ix->ei_block);
-@@ -1630,6 +1634,10 @@ errcode_t ext2fs_extent_delete(ext2_extent_handle_t handle, int flags)
- 
- 	cp = path->curr;
- 
-+	/* Sanity check before memmove() */
-+	if (path->left < 0)
-+		return EXT2_ET_EXTENT_LEAF_BAD;
-+
- 	if (path->left) {
- 		memmove(cp, cp + sizeof(struct ext3_extent_idx),
- 			path->left * sizeof(struct ext3_extent_idx));
--- 
-cgit 
-
diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
index 452c8d5689..28a47c15d1 100644
--- a/package/e2fsprogs/e2fsprogs.hash
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -1,5 +1,5 @@
-# From https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.46.5/sha256sums.asc
-sha256  2f16c9176704cf645dc69d5b15ff704ae722d665df38b2ed3cfc249757d8d81e  e2fsprogs-1.46.5.tar.xz
+# From https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.47.0/sha256sums.asc
+sha256  144af53f2bbd921cef6f8bea88bb9faddca865da3fbc657cc9b4d2001097d5db  e2fsprogs-1.47.0.tar.xz
 # Locally calculated
 sha256  5da5ef153e559c1d990d4c3eedbedd4442db892d37eae1f35fff069de8ec9020  NOTICE
 sha256  032989b508f1a72ebee5b3417e55d06d473f9ee203e45ab11864a7e49cdec63d  lib/ss/mit-sipb-copyright.h
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 39c9e07644..75214be8c7 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.46.5
+E2FSPROGS_VERSION = 1.47.0
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
