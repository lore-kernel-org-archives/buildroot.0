Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885ADC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C00280F4B;
	Mon,  6 Dec 2021 18:15:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tty7SQPZ3a1A; Mon,  6 Dec 2021 18:15:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 811B484B8E;
	Mon,  6 Dec 2021 18:15:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E1BE1BF995
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C67D260D68
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WWJ2WDCVv8Iu for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B7D760D60
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9B41481468; Mon,  6 Dec 2021 18:07:37 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 14:36:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed4ec60500b4973adbc73f1e0a1e860c0c7f41df
X-Git-Newrev: e68fba55fd80022c691e677b71462b60d1083838
X-Patchwork-Hint: ignore
Message-Id: <20211206180737.9B41481468@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/squashfs: bump to version 4.5
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
Content-Type: multipart/mixed; boundary="===============7042613415978886960=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7042613415978886960==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e68fba55fd80022c691e677b71462b60d1083838
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Update indentation in hash file (two spaces)

https://github.com/plougher/squashfs-tools/blob/4.5/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...fs-tools-fix-build-failure-against-gcc-10.patch | 49 ----------------------
 package/squashfs/squashfs.hash                     |  4 +-
 package/squashfs/squashfs.mk                       |  2 +-
 3 files changed, 3 insertions(+), 52 deletions(-)

diff --git a/package/squashfs/0001-squashfs-tools-fix-build-failure-against-gcc-10.patch b/package/squashfs/0001-squashfs-tools-fix-build-failure-against-gcc-10.patch
deleted file mode 100644
index a5fc487aac..0000000000
--- a/package/squashfs/0001-squashfs-tools-fix-build-failure-against-gcc-10.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From e1cdcfd94172a0b1ba4c9df70f4d69a41c687404 Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyfox@gentoo.org>
-Date: Sun, 26 Jan 2020 18:35:13 +0000
-Subject: [PATCH] squashfs-tools: fix build failure against gcc-10
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-On gcc-10 (and gcc-9 -fno-common) build fails as:
-
-```
-cc ... -o mksquashfs
-ld: read_fs.o:(.bss+0x0):
-  multiple definition of `fwriter_buffer'; mksquashfs.o:(.bss+0x400c90): first defined here
-ld: read_fs.o:(.bss+0x8):
-  multiple definition of `bwriter_buffer'; mksquashfs.o:(.bss+0x400c98): first defined here
-```
-
-gcc-10 will change the default from -fcommon to fno-common:
-https://gcc.gnu.org/PR85678.
-
-The error also happens if CFLAGS=-fno-common passed explicitly.
-
-Reported-by: Toralf Förster
-Bug: https://bugs.gentoo.org/706456
-Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
-
-[Upstream: https://github.com/plougher/squashfs-tools/commit/fe2f5da4b0f8994169c53e84b7cb8a0feefc97b5.patch]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- squashfs-tools/mksquashfs.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/squashfs-tools/mksquashfs.h b/squashfs-tools/mksquashfs.h
-index 1beefef..b650306 100644
---- a/squashfs-tools/mksquashfs.h
-+++ b/squashfs-tools/mksquashfs.h
-@@ -143,7 +143,7 @@ struct append_file {
- #endif
- 
- extern struct cache *reader_buffer, *fragment_buffer, *reserve_cache;
--struct cache *bwriter_buffer, *fwriter_buffer;
-+extern struct cache *bwriter_buffer, *fwriter_buffer;
- extern struct queue *to_reader, *to_deflate, *to_writer, *from_writer,
- 	*to_frag, *locked_fragment, *to_process_frag;
- extern struct append_file **file_mapping;
--- 
-2.26.2
-
diff --git a/package/squashfs/squashfs.hash b/package/squashfs/squashfs.hash
index 1f08b530a0..09a2bae364 100644
--- a/package/squashfs/squashfs.hash
+++ b/package/squashfs/squashfs.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 a7fa4845e9908523c38d4acf92f8a41fdfcd19def41bd5090d7ad767a6dc75c3 squashfs-4.4.tar.gz
+sha256  b9e16188e6dc1857fe312633920f7d71cc36b0162eb50f3ecb1f0040f02edddd  squashfs-4.5.tar.gz
 
 # License files
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index cbc3c906d8..f64d441c9b 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUASHFS_VERSION = 4.4
+SQUASHFS_VERSION = 4.5
 SQUASHFS_SITE = $(call github,plougher,squashfs-tools,$(SQUASHFS_VERSION))
 SQUASHFS_LICENSE = GPL-2.0+
 SQUASHFS_LICENSE_FILES = COPYING

--===============7042613415978886960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7042613415978886960==--
