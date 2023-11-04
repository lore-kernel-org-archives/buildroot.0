Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A47BC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 15:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0ACC440A61;
	Sat,  4 Nov 2023 15:14:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0ACC440A61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fs-5gT7XCtY4; Sat,  4 Nov 2023 15:14:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD9FE40A6F;
	Sat,  4 Nov 2023 15:14:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD9FE40A6F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0BA531BF584
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 15:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9873822C2
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 15:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9873822C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KVSASXMC-FPg for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 15:14:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB9CB822BD
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 15:14:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB9CB822BD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D730786670; Sat,  4 Nov 2023 15:14:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 16:12:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 61a38c7ee0e4829592f09f84dfabc9328da1370c
X-Git-Newrev: a000ac3c832e929a441f69c6e503ad8282ed4fb7
X-Patchwork-Hint: ignore
Message-Id: <20231104151426.D730786670@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libubootenv: bump to version 0.3.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=a000ac3c832e929a441f69c6e503ad8282ed4fb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...etenv-fix-bug-when-SPI-flash-write-size-s.patch | 71 ----------------------
 package/libubootenv/libubootenv.hash               |  2 +-
 package/libubootenv/libubootenv.mk                 |  2 +-
 3 files changed, 2 insertions(+), 73 deletions(-)

diff --git a/package/libubootenv/0002-Revert-fw_setenv-fix-bug-when-SPI-flash-write-size-s.patch b/package/libubootenv/0002-Revert-fw_setenv-fix-bug-when-SPI-flash-write-size-s.patch
deleted file mode 100644
index 414cb3d205..0000000000
--- a/package/libubootenv/0002-Revert-fw_setenv-fix-bug-when-SPI-flash-write-size-s.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 35bbc4d8155ed86ca7200e060dad98bdfbce684d Mon Sep 17 00:00:00 2001
-From: Stefano Babic <sbabic@denx.de>
-Date: Thu, 15 Jun 2023 16:54:46 +0200
-Subject: [PATCH] Revert "fw_setenv: fix bug when SPI flash write size !=
- sector size"
-
-This reverts commit 44ecc1c216007272a6f99a104a71c9d410969d9e.
-
-mtd writesize was errouneously interpreted as maximum allowed size, but
-it is the minimum size. The patch raises performance issues because on
-NOR flashes single bytes are written.
-
-Signed-off-by: Stefano Babic <sbabic@denx.de>
-Upstream: https://github.com/sbabic/libubootenv/commit/9f17a00ee56dc5cfb1d9b51e6639d67b64cb3309
-Signed-off-by: Brandon Maier <brandon.maier@collins.com>
----
- src/uboot_env.c | 29 +++++++++--------------------
- 1 file changed, 9 insertions(+), 20 deletions(-)
-
-diff --git a/src/uboot_env.c b/src/uboot_env.c
-index c5eefe7..76e2619 100644
---- a/src/uboot_env.c
-+++ b/src/uboot_env.c
-@@ -712,8 +712,6 @@ static int mtdwrite(struct uboot_flash_env *dev, void *data)
- 		sectors = dev->envsectors ? dev->envsectors : 1;
- 		buf = data;
- 		while (count > 0) {
--			int blockcount;
--
- 			erase.start = start;
- 
- 			skip = is_nand_badblock(dev, start);
-@@ -744,26 +742,17 @@ static int mtdwrite(struct uboot_flash_env *dev, void *data)
- 				ret =-EIO;
- 				goto devwrite_out;
- 			}
--
--			blockcount = blocksize;
--
--			/* writesize can be different than the sector size. */
--
--			while (blockcount > 0) {
--				if (lseek(dev->fd, start, SEEK_SET) < 0) {
--					ret =-EIO;
--					goto devwrite_out;
--				}
--				if (write(dev->fd, buf, dev->mtdinfo.writesize) != dev->mtdinfo.writesize) {
--					ret =-EIO;
--					goto devwrite_out;
--				}
--
--				blockcount -= dev->mtdinfo.writesize;
--				start += dev->mtdinfo.writesize;
--				buf += dev->mtdinfo.writesize;
-+			if (lseek(dev->fd, start, SEEK_SET) < 0) {
-+				ret =-EIO;
-+				goto devwrite_out;
-+			}
-+			if (write(dev->fd, buf, blocksize) != blocksize) {
-+				ret =-EIO;
-+				goto devwrite_out;
- 			}
- 			MTDLOCK(dev, &erase);
-+			start += dev->sectorsize;
-+			buf += blocksize;
- 			count -= blocksize;
- 			ret += blocksize;
- 		}
--- 
-2.41.0
-
diff --git a/package/libubootenv/libubootenv.hash b/package/libubootenv/libubootenv.hash
index b881994bfd..887ad6843d 100644
--- a/package/libubootenv/libubootenv.hash
+++ b/package/libubootenv/libubootenv.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  78faadcfac67e50273e5d4e95e6cf6fee3d486ce9dc568d1fe25312271a88768  libubootenv-0.3.4.tar.gz
+sha256  dc27ddcb377e259d898256e90449bc3128437660cacc33dc75f6630d3e52c44e  libubootenv-0.3.5.tar.gz
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSES/MIT.txt
diff --git a/package/libubootenv/libubootenv.mk b/package/libubootenv/libubootenv.mk
index b4c9588107..e5f5e9b15a 100644
--- a/package/libubootenv/libubootenv.mk
+++ b/package/libubootenv/libubootenv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUBOOTENV_VERSION = 0.3.4
+LIBUBOOTENV_VERSION = 0.3.5
 LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,v$(LIBUBOOTENV_VERSION))
 LIBUBOOTENV_LICENSE = LGPL-2.1+, MIT, CC0-1.0
 LIBUBOOTENV_LICENSE_FILES = LICENSES/CC0-1.0.txt \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
