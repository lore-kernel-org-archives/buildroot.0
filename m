Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6562AC4706F
	for <buildroot@archiver.kernel.org>; Fri, 22 Dec 2023 20:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2D8C60A9F;
	Fri, 22 Dec 2023 20:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2D8C60A9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aLfaTDvmoVJT; Fri, 22 Dec 2023 20:38:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BB6260AEF;
	Fri, 22 Dec 2023 20:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BB6260AEF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 451BD1BF831
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 20:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B640400D7
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 20:38:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B640400D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L5nbEzdrEQ-t for <buildroot@lists.busybox.net>;
 Fri, 22 Dec 2023 20:38:30 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E95F4016F
 for <buildroot@buildroot.org>; Fri, 22 Dec 2023 20:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E95F4016F
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5952413F879;
 Fri, 22 Dec 2023 21:38:24 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 22 Dec 2023 21:38:10 +0100
Message-ID: <20231222203810.2235657-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703277506;
 bh=p9gdOtYpG8uz/06zlJAzHht2uzjZ6+G5V0/90x1hKo8=;
 h=From:To:Cc:Subject:Date:From;
 b=YoSwvy99N3HnehA/6HfzWrm1itGzjz66QaX/tvFipQRbcJywZinn5ZaMSZjpFM62l
 Z59lnpl7X3FLTyq0bBKADshd8jtjAQ/T0hcfd7Uvh0Cq34pA/VbUa5e20fznzA9BEj
 aYDb6UEplHE0jK3RL4Mz/78tp4xPkSu9Q3JtVaDy11FFBIF1OPTDxelMRKIU9PzfbL
 LLbJAvaiQ5DDFePY8rVjp0zd3WCuhhPiMN+ANT6A5PtMnP1mmlvHC9CaFi9NC3wRzP
 TRk3mBHa7ah/uATP2iX9yCNRhH7PUcpRfrOAHIsDASECvnK0iO/VEkFR4dLhcwUo8U
 2OfR3ZoMAgGJA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YoSwvy99
Subject: [Buildroot] [PATCH 1/1] boot/grub2: bump to version 2.12
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release announce on mailing list, see [1].
For release general news, see [2].

This commit removes all package patches, as they are all included in
this version.

The .checkpackageignore file is updated accordingly (the entry for
patch 0001 is removed).

This commit also removes GRUB2_AVOID_AUTORECONF hooks, since patch
0001 is removed.

This commit also removes the GRUB2_IGNORE_CVES entries associated to
the removed patches. The version bump should now explicitly exclude
those CVEs.

Finally, this commit introduces a new patch, adding a missing file in
the release tarball.

[1] https://lists.gnu.org/archive/html/grub-devel/2023-12/msg00052.html
[2] https://git.savannah.gnu.org/gitweb/?p=grub.git;a=blob;f=NEWS;hb=refs/tags/grub-2.12

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit e59346f, with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.boot.test_grub
    ...
    OK

Few comments, to help the review of this patch:

All the 20 package patches were fully checked (including content),
before removing.

Patch 0001 was merged upstream after it was added in
Buildroot. Therefore its "Upstream:" note was an URL to the mailing
list. This list include the actual upstream commit.

Patches 0008 and 0009 had incorrect upstream commit ID, in their
"Upstream:" data. This list gives the correct commit IDs.

All other patches were marked with upstream commit IDs.

To facilitate double-checking, the URL list of upstream commits
corresponding to each patch is provided below.

Patches / Upstream commit URL:

0001-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch
https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commitdiff;h=21a26dd57230ff85481e8785460701c6d67616d2

0002-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch
https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commitdiff;h=0adec29674561034771c13e446069b41ef41e4d4

0003-loader-efi-chainloader-Simplify-the-loader-state.patch
https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commitdiff;h=1469983ebb9674753ad333d37087fb8cb20e1dce

0004-commands-boot-Add-API-to-pass-context-to-loader.patch
https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commitdiff;h=14ceb3b3ff6db664649138442b6562c114dcf56e

0005-loader-efi-chainloader-Use-grub_loader_set_ex.patch
https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commitdiff;h=04c86e0bb7b58fc2f913f798cdb18934933e532d

0006-kern-efi-sb-Reject-non-kernel-files-in-the-shim_lock.patch
https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commitdiff;h=6fe755c5c07bb386fda58306bfd19e4a1c974c53

0007-video-Remove-trailing-whitespaces.patch
https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commitdiff;h=1f48917d8ddb490dcdc70176e0f58136b7f7811a

0008-video-readers-png-Abort-sooner-if-a-read-operation-f.patch
https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commitdiff;h=5bff31cdb6b93d738f850834e6291df1d0b136fa
NOTE: buildroot patch mention upstream is d5caac8ab79d068ad9a41030c772d03a4d4fbd7b
but is in fact 5bff31cdb6b93d738f850834e6291df1d0b136fa

0009-video-readers-png-Refuse-to-handle-multiple-image-he.patch
https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commitdiff;h=347880a13c239b4c2811c94c9a7cf78b607332e3
NOTE: buildroot patch mention upstream is 166a4d61448f74745afe1dac2f2cfb85d04909bf
but is in fact 347880a13c239b4c2811c94c9a7cf78b607332e3

0010-video-readers-png-Drop-greyscale-support-to-fix-heap.patch
https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commitdiff;h=e623866d9286410156e8b9d2c82d6253a1b22d08

0011-video-readers-png-Avoid-heap-OOB-R-W-inserting-huff-.patch
https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commitdiff;h=210245129c932dc9e1c2748d9d35524fb95b5042

0012-video-readers-jpeg-Block-int-underflow-wild-pointer-.patch
https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commitdiff;h=22a3f97d39f6a10b08ad7fd1cc47c4dcd10413f6

0013-net-ip-Do-IP-fragment-maths-safely.patch
https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commitdiff;h=3e4817538de828319ba6d59ced2fbb9b5ca13287

0014-net-http-Fix-OOB-write-for-split-http-headers.patch
https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commitdiff;h=ec6bfd3237394c1c7dbf2fd73417173318d22f4b

0015-net-http-Error-out-on-headers-with-LF-without-CR.patch
https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commitdiff;h=b26b4c08e7119281ff30d0fb4a6169bd2afa8fe4

0016-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch
https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commitdiff;h=9c76ec09ae08155df27cd237eaea150b4f02f532

0017-font-Fix-several-integer-overflows-in-grub_font_cons.patch
https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commitdiff;h=768e1ef2fc159f6e14e7246e4be09363708ac39e

0018-font-Fix-an-integer-underflow-in-blit_comb.patch
https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commitdiff;h=992c06191babc1e109caf40d6a07ec6fdef427af

0019-fs-ext2-Ignore-checksum-seed-incompat-feature.patch
https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commitdiff;h=7fd5feff97c4b1f446f8fcf6d37aca0c64e7c763

0020-fs-ext2-Ignore-the-large_dir-incompat-feature.patch
https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commitdiff;h=2e9fa73a040462b81bfbfe56c0bc7ad2d30b446b
---
 .checkpackageignore                           |   1 -
 ...-core-extra_deps.lst-file-in-release.patch |  37 +
 ...ub_fstest.pp-depend-on-config-util.h.patch |  45 --
 ...onfig-Restore-umask-for-the-grub.cfg.patch |  43 --
 ...hainloader-Simplify-the-loader-state.patch | 126 ----
 ...ot-Add-API-to-pass-context-to-loader.patch | 165 -----
 ...i-chainloader-Use-grub_loader_set_ex.patch |  80 --
 ...ct-non-kernel-files-in-the-shim_lock.patch | 105 ---
 ...07-video-Remove-trailing-whitespaces.patch | 689 ------------------
 ...g-Abort-sooner-if-a-read-operation-f.patch | 204 ------
 ...g-Refuse-to-handle-multiple-image-he.patch |  34 -
 ...g-Drop-greyscale-support-to-fix-heap.patch | 173 -----
 ...g-Avoid-heap-OOB-R-W-inserting-huff-.patch |  44 --
 ...eg-Block-int-underflow-wild-pointer-.patch |  78 --
 ...3-net-ip-Do-IP-fragment-maths-safely.patch |  56 --
 ...Fix-OOB-write-for-split-http-headers.patch |  50 --
 ...or-out-on-headers-with-LF-without-CR.patch |  52 --
 ...erflow-in-grub_font_get_glyph_intern.patch | 116 ---
 ...-integer-overflows-in-grub_font_cons.patch |  83 ---
 ...ix-an-integer-underflow-in-blit_comb.patch |  93 ---
 ...gnore-checksum-seed-incompat-feature.patch |  61 --
 ...gnore-the-large_dir-incompat-feature.patch |  60 --
 boot/grub2/grub2.hash                         |   4 +-
 boot/grub2/grub2.mk                           |  30 +-
 24 files changed, 40 insertions(+), 2389 deletions(-)
 create mode 100644 boot/grub2/0001-Add-missing-grub-core-extra_deps.lst-file-in-release.patch
 delete mode 100644 boot/grub2/0001-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch
 delete mode 100644 boot/grub2/0002-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch
 delete mode 100644 boot/grub2/0003-loader-efi-chainloader-Simplify-the-loader-state.patch
 delete mode 100644 boot/grub2/0004-commands-boot-Add-API-to-pass-context-to-loader.patch
 delete mode 100644 boot/grub2/0005-loader-efi-chainloader-Use-grub_loader_set_ex.patch
 delete mode 100644 boot/grub2/0006-kern-efi-sb-Reject-non-kernel-files-in-the-shim_lock.patch
 delete mode 100644 boot/grub2/0007-video-Remove-trailing-whitespaces.patch
 delete mode 100644 boot/grub2/0008-video-readers-png-Abort-sooner-if-a-read-operation-f.patch
 delete mode 100644 boot/grub2/0009-video-readers-png-Refuse-to-handle-multiple-image-he.patch
 delete mode 100644 boot/grub2/0010-video-readers-png-Drop-greyscale-support-to-fix-heap.patch
 delete mode 100644 boot/grub2/0011-video-readers-png-Avoid-heap-OOB-R-W-inserting-huff-.patch
 delete mode 100644 boot/grub2/0012-video-readers-jpeg-Block-int-underflow-wild-pointer-.patch
 delete mode 100644 boot/grub2/0013-net-ip-Do-IP-fragment-maths-safely.patch
 delete mode 100644 boot/grub2/0014-net-http-Fix-OOB-write-for-split-http-headers.patch
 delete mode 100644 boot/grub2/0015-net-http-Error-out-on-headers-with-LF-without-CR.patch
 delete mode 100644 boot/grub2/0016-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch
 delete mode 100644 boot/grub2/0017-font-Fix-several-integer-overflows-in-grub_font_cons.patch
 delete mode 100644 boot/grub2/0018-font-Fix-an-integer-underflow-in-blit_comb.patch
 delete mode 100644 boot/grub2/0019-fs-ext2-Ignore-checksum-seed-incompat-feature.patch
 delete mode 100644 boot/grub2/0020-fs-ext2-Ignore-the-large_dir-incompat-feature.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 962fa705ad..99e9e0e0c5 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -104,7 +104,6 @@ boot/at91bootstrap/0002-gcc-4.6.x-ldscript-fix.patch Upstream
 boot/at91bootstrap/0003-u-boot-relocation-fix.patch Upstream
 boot/at91dataflashboot/0001-do-not-install.patch Upstream
 boot/at91dataflashboot/0002-eabi-fixes.patch Upstream
-boot/grub2/0001-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch Upstream
 boot/optee-os/3.13.0/0001-core-zlib-fix-build-warning-when-_LFS64_LARGEFILE-is.patch Upstream
 boot/syslinux/0001-bios-Fix-alignment-change-with-gcc-5.patch Upstream
 boot/syslinux/0002-Disable-PIE-to-avoid-FTBFS-on-amd64.patch Upstream
diff --git a/boot/grub2/0001-Add-missing-grub-core-extra_deps.lst-file-in-release.patch b/boot/grub2/0001-Add-missing-grub-core-extra_deps.lst-file-in-release.patch
new file mode 100644
index 0000000000..2a7c206b2d
--- /dev/null
+++ b/boot/grub2/0001-Add-missing-grub-core-extra_deps.lst-file-in-release.patch
@@ -0,0 +1,37 @@
+From 4d4dae6a52b1749642261a15f5dcc1e3d4150b36 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Fri, 22 Dec 2023 19:02:53 +0100
+Subject: [PATCH] Add missing grub-core/extra_deps.lst file in release tarball
+
+A file is missing in the grub-2.12 release tarballs (both .gz and .xz).
+See [1]. The issue was reported in [2] and fixed upstream in [3].
+
+This patch adds the missing file, on top of the release tarball. This
+patch won't apply on upstream git, since the file is present in the
+source repository. Since the issue is fixed upstream in [3], it is
+expected upcoming releases tarballs will include the file.
+
+The file content was fetched from the upstream git repo:
+https://git.savannah.gnu.org/gitweb/?p=grub.git;a=blob_plain;f=grub-core/extra_deps.lst;hb=refs/tags/grub-2.12
+
+[1] https://ftp.gnu.org/gnu/grub/grub-2.12.tar.xz
+[2] https://lists.gnu.org/archive/html/grub-devel/2023-12/msg00054.html
+[3] https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=b835601c7639ed1890f2d3db91900a8506011a8e
+
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+Upstream: Fixed by: https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=b835601c7639ed1890f2d3db91900a8506011a8e
+---
+ grub-core/extra_deps.lst | 1 +
+ 1 file changed, 1 insertion(+)
+ create mode 100644 grub-core/extra_deps.lst
+
+diff --git a/grub-core/extra_deps.lst b/grub-core/extra_deps.lst
+new file mode 100644
+index 0000000..f44ad6a
+--- /dev/null
++++ b/grub-core/extra_deps.lst
+@@ -0,0 +1 @@
++depends bli part_gpt
+-- 
+2.43.0
+
diff --git a/boot/grub2/0001-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch b/boot/grub2/0001-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch
deleted file mode 100644
index ea8787de7a..0000000000
--- a/boot/grub2/0001-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From bb08b723fa7bc56439c7bc166cff361628e73453 Mon Sep 17 00:00:00 2001
-Message-Id: <bb08b723fa7bc56439c7bc166cff361628e73453.1659683176.git.stefan@agner.ch>
-From: Stefan Agner <stefan@agner.ch>
-Date: Fri, 5 Aug 2022 08:59:52 +0200
-Subject: [PATCH] Makefile: Make grub_fstest.pp depend on config-util.h
-
-Warning: This commit does not apply to the GRUB git repository. This
-patch applies against the release tarballs.
-
-Upstream status: https://lists.gnu.org/archive/html/grub-devel/2022-08/msg00045.html
-Signed-off-by: Stefan Agner <stefan@agner.ch>
----
- Makefile.am | 2 +-
- Makefile.in | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index bf9c1ba..f08cfc0 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -51,7 +51,7 @@ libgrub_a_init.c: libgrub_a_init.lst $(top_srcdir)/geninit.sh
- CLEANFILES += libgrub_a_init.c
- 
- # For grub-fstest
--grub_fstest.pp: $(grub_fstest_SOURCES)
-+grub_fstest.pp: config-util.h $(grub_fstest_SOURCES)
- 	$(CPP) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(grub_fstest_CPPFLAGS) $(CPPFLAGS) \
- 	  -D'GRUB_MOD_INIT(x)=@MARKER@x@' $^ > $@ || (rm -f $@; exit 1)
- CLEANFILES += grub_fstest.pp
-diff --git a/Makefile.in b/Makefile.in
-index 13f2eef..2c1d20b 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -13312,7 +13312,7 @@ libgrub_a_init.c: libgrub_a_init.lst $(top_srcdir)/geninit.sh
- 	sh $(top_srcdir)/geninit.sh `cat $<` > $@ || (rm -f $@; exit 1)
- 
- # For grub-fstest
--grub_fstest.pp: $(grub_fstest_SOURCES)
-+grub_fstest.pp: config-util.h $(grub_fstest_SOURCES)
- 	$(CPP) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(grub_fstest_CPPFLAGS) $(CPPFLAGS) \
- 	  -D'GRUB_MOD_INIT(x)=@MARKER@x@' $^ > $@ || (rm -f $@; exit 1)
- 
--- 
-2.37.1
-
diff --git a/boot/grub2/0002-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch b/boot/grub2/0002-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch
deleted file mode 100644
index ba9c8a9344..0000000000
--- a/boot/grub2/0002-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 4c1ad500e73d46c83dec369da85db39ae2fe62dd Mon Sep 17 00:00:00 2001
-From: Michael Chang <mchang@suse.com>
-Date: Fri, 3 Dec 2021 16:13:28 +0800
-Subject: [PATCH] grub-mkconfig: Restore umask for the grub.cfg
-
-The commit ab2e53c8a (grub-mkconfig: Honor a symlink when generating
-configuration by grub-mkconfig) has inadvertently discarded umask for
-creating grub.cfg in the process of running grub-mkconfig. The resulting
-wrong permission (0644) would allow unprivileged users to read GRUB
-configuration file content. This presents a low confidentiality risk
-as grub.cfg may contain non-secured plain-text passwords.
-
-This patch restores the missing umask and sets the creation file mode
-to 0600 preventing unprivileged access.
-
-Fixes: CVE-2021-3981
-
-Signed-off-by: Michael Chang <mchang@suse.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Upstream: https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=0adec29674561034771c13e446069b41ef41e4d4
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- util/grub-mkconfig.in | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/util/grub-mkconfig.in b/util/grub-mkconfig.in
-index f8cbb8d7a..84f356ea4 100644
---- a/util/grub-mkconfig.in
-+++ b/util/grub-mkconfig.in
-@@ -300,7 +300,10 @@ and /etc/grub.d/* files or please file a bug report with
-     exit 1
-   else
-     # none of the children aborted with error, install the new grub.cfg
-+    oldumask=$(umask)
-+    umask 077
-     cat ${grub_cfg}.new > ${grub_cfg}
-+    umask $oldumask
-     rm -f ${grub_cfg}.new
-   fi
- fi
--- 
-2.41.0
-
diff --git a/boot/grub2/0003-loader-efi-chainloader-Simplify-the-loader-state.patch b/boot/grub2/0003-loader-efi-chainloader-Simplify-the-loader-state.patch
deleted file mode 100644
index f6073add0b..0000000000
--- a/boot/grub2/0003-loader-efi-chainloader-Simplify-the-loader-state.patch
+++ /dev/null
@@ -1,126 +0,0 @@
-From dfdc742bdb22be468035f96cce0be5fee23b6df5 Mon Sep 17 00:00:00 2001
-From: Chris Coulson <chris.coulson@canonical.com>
-Date: Tue, 5 Apr 2022 10:02:04 +0100
-Subject: [PATCH] loader/efi/chainloader: Simplify the loader state
-
-The chainloader command retains the source buffer and device path passed
-to LoadImage(), requiring the unload hook passed to grub_loader_set() to
-free them. It isn't required to retain this state though - they aren't
-required by StartImage() or anything else in the boot hook, so clean them
-up before grub_cmd_chainloader() finishes.
-
-Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Upstream: 1469983ebb9674753ad333d37087fb8cb20e1dce
-[Thomas: needed to cherry-pick
-04c86e0bb7b58fc2f913f798cdb18934933e532d which fixes CVE-2022-28736]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- grub-core/loader/efi/chainloader.c | 38 +++++++++++++++++-------------
- 1 file changed, 21 insertions(+), 17 deletions(-)
-
-diff --git a/grub-core/loader/efi/chainloader.c b/grub-core/loader/efi/chainloader.c
-index 2bd80f4db..d1602c89b 100644
---- a/grub-core/loader/efi/chainloader.c
-+++ b/grub-core/loader/efi/chainloader.c
-@@ -44,25 +44,20 @@ GRUB_MOD_LICENSE ("GPLv3+");
- 
- static grub_dl_t my_mod;
- 
--static grub_efi_physical_address_t address;
--static grub_efi_uintn_t pages;
--static grub_efi_device_path_t *file_path;
- static grub_efi_handle_t image_handle;
--static grub_efi_char16_t *cmdline;
- 
- static grub_err_t
- grub_chainloader_unload (void)
- {
-+  grub_efi_loaded_image_t *loaded_image;
-   grub_efi_boot_services_t *b;
- 
-+  loaded_image = grub_efi_get_loaded_image (image_handle);
-+  if (loaded_image != NULL)
-+    grub_free (loaded_image->load_options);
-+
-   b = grub_efi_system_table->boot_services;
-   efi_call_1 (b->unload_image, image_handle);
--  efi_call_2 (b->free_pages, address, pages);
--
--  grub_free (file_path);
--  grub_free (cmdline);
--  cmdline = 0;
--  file_path = 0;
- 
-   grub_dl_unref (my_mod);
-   return GRUB_ERR_NONE;
-@@ -140,7 +135,7 @@ make_file_path (grub_efi_device_path_t *dp, const char *filename)
-   char *dir_start;
-   char *dir_end;
-   grub_size_t size;
--  grub_efi_device_path_t *d;
-+  grub_efi_device_path_t *d, *file_path;
- 
-   dir_start = grub_strchr (filename, ')');
-   if (! dir_start)
-@@ -222,11 +217,14 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
-   grub_efi_status_t status;
-   grub_efi_boot_services_t *b;
-   grub_device_t dev = 0;
--  grub_efi_device_path_t *dp = 0;
-+  grub_efi_device_path_t *dp = NULL, *file_path = NULL;
-   grub_efi_loaded_image_t *loaded_image;
-   char *filename;
-   void *boot_image = 0;
-   grub_efi_handle_t dev_handle = 0;
-+  grub_efi_physical_address_t address = 0;
-+  grub_efi_uintn_t pages = 0;
-+  grub_efi_char16_t *cmdline = NULL;
- 
-   if (argc == 0)
-     return grub_error (GRUB_ERR_BAD_ARGUMENT, N_("filename expected"));
-@@ -234,11 +232,6 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
- 
-   grub_dl_ref (my_mod);
- 
--  /* Initialize some global variables.  */
--  address = 0;
--  image_handle = 0;
--  file_path = 0;
--
-   b = grub_efi_system_table->boot_services;
- 
-   file = grub_file_open (filename, GRUB_FILE_TYPE_EFI_CHAINLOADED_IMAGE);
-@@ -408,6 +401,10 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
-   grub_file_close (file);
-   grub_device_close (dev);
- 
-+  /* We're finished with the source image buffer and file path now. */
-+  efi_call_2 (b->free_pages, address, pages);
-+  grub_free (file_path);
-+
-   grub_loader_set (grub_chainloader_boot, grub_chainloader_unload, 0);
-   return 0;
- 
-@@ -419,11 +416,18 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
-   if (file)
-     grub_file_close (file);
- 
-+  grub_free (cmdline);
-   grub_free (file_path);
- 
-   if (address)
-     efi_call_2 (b->free_pages, address, pages);
- 
-+  if (image_handle != NULL)
-+    {
-+      efi_call_1 (b->unload_image, image_handle);
-+      image_handle = NULL;
-+    }
-+
-   grub_dl_unref (my_mod);
- 
-   return grub_errno;
--- 
-2.41.0
-
diff --git a/boot/grub2/0004-commands-boot-Add-API-to-pass-context-to-loader.patch b/boot/grub2/0004-commands-boot-Add-API-to-pass-context-to-loader.patch
deleted file mode 100644
index 30b410e38a..0000000000
--- a/boot/grub2/0004-commands-boot-Add-API-to-pass-context-to-loader.patch
+++ /dev/null
@@ -1,165 +0,0 @@
-From 8b6336696d93b51703c2015eff3e2d8a02145e43 Mon Sep 17 00:00:00 2001
-From: Chris Coulson <chris.coulson@canonical.com>
-Date: Tue, 5 Apr 2022 10:58:28 +0100
-Subject: [PATCH] commands/boot: Add API to pass context to loader
-
-Loaders rely on global variables for saving context which is consumed
-in the boot hook and freed in the unload hook. In the case where a loader
-command is executed twice, calling grub_loader_set() a second time executes
-the unload hook, but in some cases this runs when the loader's global
-context has already been updated, resulting in the updated context being
-freed and potential use-after-free bugs when the boot hook is subsequently
-called.
-
-This adds a new API, grub_loader_set_ex(), which allows a loader to specify
-context that is passed to its boot and unload hooks. This is an alternative
-to requiring that loaders call grub_loader_unset() before mutating their
-global context.
-
-Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Upstream: 14ceb3b3ff6db664649138442b6562c114dcf56e
-[Thomas: needed to backport 04c86e0bb7b58fc2f913f798cdb18934933e532d,
-which fixes CVE-2022-28736]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- grub-core/commands/boot.c | 66 ++++++++++++++++++++++++++++++++++-----
- include/grub/loader.h     |  5 +++
- 2 files changed, 63 insertions(+), 8 deletions(-)
-
-diff --git a/grub-core/commands/boot.c b/grub-core/commands/boot.c
-index bbca81e94..61514788e 100644
---- a/grub-core/commands/boot.c
-+++ b/grub-core/commands/boot.c
-@@ -27,10 +27,20 @@
- 
- GRUB_MOD_LICENSE ("GPLv3+");
- 
--static grub_err_t (*grub_loader_boot_func) (void);
--static grub_err_t (*grub_loader_unload_func) (void);
-+static grub_err_t (*grub_loader_boot_func) (void *context);
-+static grub_err_t (*grub_loader_unload_func) (void *context);
-+static void *grub_loader_context;
- static int grub_loader_flags;
- 
-+struct grub_simple_loader_hooks
-+{
-+  grub_err_t (*boot) (void);
-+  grub_err_t (*unload) (void);
-+};
-+
-+/* Don't heap allocate this to avoid making grub_loader_set() fallible. */
-+static struct grub_simple_loader_hooks simple_loader_hooks;
-+
- struct grub_preboot
- {
-   grub_err_t (*preboot_func) (int);
-@@ -44,6 +54,29 @@ static int grub_loader_loaded;
- static struct grub_preboot *preboots_head = 0,
-   *preboots_tail = 0;
- 
-+static grub_err_t
-+grub_simple_boot_hook (void *context)
-+{
-+  struct grub_simple_loader_hooks *hooks;
-+
-+  hooks = (struct grub_simple_loader_hooks *) context;
-+  return hooks->boot ();
-+}
-+
-+static grub_err_t
-+grub_simple_unload_hook (void *context)
-+{
-+  struct grub_simple_loader_hooks *hooks;
-+  grub_err_t ret;
-+
-+  hooks = (struct grub_simple_loader_hooks *) context;
-+
-+  ret = hooks->unload ();
-+  grub_memset (hooks, 0, sizeof (*hooks));
-+
-+  return ret;
-+}
-+
- int
- grub_loader_is_loaded (void)
- {
-@@ -110,28 +143,45 @@ grub_loader_unregister_preboot_hook (struct grub_preboot *hnd)
- }
- 
- void
--grub_loader_set (grub_err_t (*boot) (void),
--		 grub_err_t (*unload) (void),
--		 int flags)
-+grub_loader_set_ex (grub_err_t (*boot) (void *context),
-+		    grub_err_t (*unload) (void *context),
-+		    void *context,
-+		    int flags)
- {
-   if (grub_loader_loaded && grub_loader_unload_func)
--    grub_loader_unload_func ();
-+    grub_loader_unload_func (grub_loader_context);
- 
-   grub_loader_boot_func = boot;
-   grub_loader_unload_func = unload;
-+  grub_loader_context = context;
-   grub_loader_flags = flags;
- 
-   grub_loader_loaded = 1;
- }
- 
-+void
-+grub_loader_set (grub_err_t (*boot) (void),
-+		 grub_err_t (*unload) (void),
-+		 int flags)
-+{
-+  grub_loader_set_ex (grub_simple_boot_hook,
-+		      grub_simple_unload_hook,
-+		      &simple_loader_hooks,
-+		      flags);
-+
-+  simple_loader_hooks.boot = boot;
-+  simple_loader_hooks.unload = unload;
-+}
-+
- void
- grub_loader_unset(void)
- {
-   if (grub_loader_loaded && grub_loader_unload_func)
--    grub_loader_unload_func ();
-+    grub_loader_unload_func (grub_loader_context);
- 
-   grub_loader_boot_func = 0;
-   grub_loader_unload_func = 0;
-+  grub_loader_context = 0;
- 
-   grub_loader_loaded = 0;
- }
-@@ -158,7 +208,7 @@ grub_loader_boot (void)
- 	  return err;
- 	}
-     }
--  err = (grub_loader_boot_func) ();
-+  err = (grub_loader_boot_func) (grub_loader_context);
- 
-   for (cur = preboots_tail; cur; cur = cur->prev)
-     if (! err)
-diff --git a/include/grub/loader.h b/include/grub/loader.h
-index b20864282..97f231054 100644
---- a/include/grub/loader.h
-+++ b/include/grub/loader.h
-@@ -40,6 +40,11 @@ void EXPORT_FUNC (grub_loader_set) (grub_err_t (*boot) (void),
- 				    grub_err_t (*unload) (void),
- 				    int flags);
- 
-+void EXPORT_FUNC (grub_loader_set_ex) (grub_err_t (*boot) (void *context),
-+				       grub_err_t (*unload) (void *context),
-+				       void *context,
-+				       int flags);
-+
- /* Unset current loader, if any.  */
- void EXPORT_FUNC (grub_loader_unset) (void);
- 
--- 
-2.41.0
-
diff --git a/boot/grub2/0005-loader-efi-chainloader-Use-grub_loader_set_ex.patch b/boot/grub2/0005-loader-efi-chainloader-Use-grub_loader_set_ex.patch
deleted file mode 100644
index 4308e3170f..0000000000
--- a/boot/grub2/0005-loader-efi-chainloader-Use-grub_loader_set_ex.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 583fca49f413e00fe26f8ae7abe0837bbc574f79 Mon Sep 17 00:00:00 2001
-From: Chris Coulson <chris.coulson@canonical.com>
-Date: Tue, 5 Apr 2022 11:48:58 +0100
-Subject: [PATCH] loader/efi/chainloader: Use grub_loader_set_ex()
-
-This ports the EFI chainloader to use grub_loader_set_ex() in order to fix
-a use-after-free bug that occurs when grub_cmd_chainloader() is executed
-more than once before a boot attempt is performed.
-
-Fixes: CVE-2022-28736
-
-Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Upstream: 04c86e0bb7b58fc2f913f798cdb18934933e532d
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- grub-core/loader/efi/chainloader.c | 16 +++++++---------
- 1 file changed, 7 insertions(+), 9 deletions(-)
-
-diff --git a/grub-core/loader/efi/chainloader.c b/grub-core/loader/efi/chainloader.c
-index d1602c89b..7557eb269 100644
---- a/grub-core/loader/efi/chainloader.c
-+++ b/grub-core/loader/efi/chainloader.c
-@@ -44,11 +44,10 @@ GRUB_MOD_LICENSE ("GPLv3+");
- 
- static grub_dl_t my_mod;
- 
--static grub_efi_handle_t image_handle;
--
- static grub_err_t
--grub_chainloader_unload (void)
-+grub_chainloader_unload (void *context)
- {
-+  grub_efi_handle_t image_handle = (grub_efi_handle_t) context;
-   grub_efi_loaded_image_t *loaded_image;
-   grub_efi_boot_services_t *b;
- 
-@@ -64,8 +63,9 @@ grub_chainloader_unload (void)
- }
- 
- static grub_err_t
--grub_chainloader_boot (void)
-+grub_chainloader_boot (void *context)
- {
-+  grub_efi_handle_t image_handle = (grub_efi_handle_t) context;
-   grub_efi_boot_services_t *b;
-   grub_efi_status_t status;
-   grub_efi_uintn_t exit_data_size;
-@@ -225,6 +225,7 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
-   grub_efi_physical_address_t address = 0;
-   grub_efi_uintn_t pages = 0;
-   grub_efi_char16_t *cmdline = NULL;
-+  grub_efi_handle_t image_handle = NULL;
- 
-   if (argc == 0)
-     return grub_error (GRUB_ERR_BAD_ARGUMENT, N_("filename expected"));
-@@ -405,7 +406,7 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
-   efi_call_2 (b->free_pages, address, pages);
-   grub_free (file_path);
- 
--  grub_loader_set (grub_chainloader_boot, grub_chainloader_unload, 0);
-+  grub_loader_set_ex (grub_chainloader_boot, grub_chainloader_unload, image_handle, 0);
-   return 0;
- 
-  fail:
-@@ -423,10 +424,7 @@ grub_cmd_chainloader (grub_command_t cmd __attribute__ ((unused)),
-     efi_call_2 (b->free_pages, address, pages);
- 
-   if (image_handle != NULL)
--    {
--      efi_call_1 (b->unload_image, image_handle);
--      image_handle = NULL;
--    }
-+    efi_call_1 (b->unload_image, image_handle);
- 
-   grub_dl_unref (my_mod);
- 
--- 
-2.41.0
-
diff --git a/boot/grub2/0006-kern-efi-sb-Reject-non-kernel-files-in-the-shim_lock.patch b/boot/grub2/0006-kern-efi-sb-Reject-non-kernel-files-in-the-shim_lock.patch
deleted file mode 100644
index b6fec1e6bb..0000000000
--- a/boot/grub2/0006-kern-efi-sb-Reject-non-kernel-files-in-the-shim_lock.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From 1e1b1271b7a7c6ac20a4c5f8e0dc29614b4975d1 Mon Sep 17 00:00:00 2001
-From: Julian Andres Klode <julian.klode@canonical.com>
-Date: Thu, 2 Dec 2021 15:03:53 +0100
-Subject: [PATCH] kern/efi/sb: Reject non-kernel files in the shim_lock
- verifier
-
-We must not allow other verifiers to pass things like the GRUB modules.
-Instead of maintaining a blocklist, maintain an allowlist of things
-that we do not care about.
-
-This allowlist really should be made reusable, and shared by the
-lockdown verifier, but this is the minimal patch addressing
-security concerns where the TPM verifier was able to mark modules
-as verified (or the OpenPGP verifier for that matter), when it
-should not do so on shim-powered secure boot systems.
-
-Fixes: CVE-2022-28735
-
-Signed-off-by: Julian Andres Klode <julian.klode@canonical.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Upstream: 6fe755c5c07bb386fda58306bfd19e4a1c974c53
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- grub-core/kern/efi/sb.c | 39 ++++++++++++++++++++++++++++++++++++---
- include/grub/verify.h   |  1 +
- 2 files changed, 37 insertions(+), 3 deletions(-)
-
-diff --git a/grub-core/kern/efi/sb.c b/grub-core/kern/efi/sb.c
-index c52ec6226..89c4bb3fd 100644
---- a/grub-core/kern/efi/sb.c
-+++ b/grub-core/kern/efi/sb.c
-@@ -119,10 +119,11 @@ shim_lock_verifier_init (grub_file_t io __attribute__ ((unused)),
- 			 void **context __attribute__ ((unused)),
- 			 enum grub_verify_flags *flags)
- {
--  *flags = GRUB_VERIFY_FLAGS_SKIP_VERIFICATION;
-+  *flags = GRUB_VERIFY_FLAGS_NONE;
- 
-   switch (type & GRUB_FILE_TYPE_MASK)
-     {
-+    /* Files we check. */
-     case GRUB_FILE_TYPE_LINUX_KERNEL:
-     case GRUB_FILE_TYPE_MULTIBOOT_KERNEL:
-     case GRUB_FILE_TYPE_BSD_KERNEL:
-@@ -130,11 +131,43 @@ shim_lock_verifier_init (grub_file_t io __attribute__ ((unused)),
-     case GRUB_FILE_TYPE_PLAN9_KERNEL:
-     case GRUB_FILE_TYPE_EFI_CHAINLOADED_IMAGE:
-       *flags = GRUB_VERIFY_FLAGS_SINGLE_CHUNK;
-+      return GRUB_ERR_NONE;
- 
--      /* Fall through. */
-+    /* Files that do not affect secureboot state. */
-+    case GRUB_FILE_TYPE_NONE:
-+    case GRUB_FILE_TYPE_LOOPBACK:
-+    case GRUB_FILE_TYPE_LINUX_INITRD:
-+    case GRUB_FILE_TYPE_OPENBSD_RAMDISK:
-+    case GRUB_FILE_TYPE_XNU_RAMDISK:
-+    case GRUB_FILE_TYPE_SIGNATURE:
-+    case GRUB_FILE_TYPE_PUBLIC_KEY:
-+    case GRUB_FILE_TYPE_PUBLIC_KEY_TRUST:
-+    case GRUB_FILE_TYPE_PRINT_BLOCKLIST:
-+    case GRUB_FILE_TYPE_TESTLOAD:
-+    case GRUB_FILE_TYPE_GET_SIZE:
-+    case GRUB_FILE_TYPE_FONT:
-+    case GRUB_FILE_TYPE_ZFS_ENCRYPTION_KEY:
-+    case GRUB_FILE_TYPE_CAT:
-+    case GRUB_FILE_TYPE_HEXCAT:
-+    case GRUB_FILE_TYPE_CMP:
-+    case GRUB_FILE_TYPE_HASHLIST:
-+    case GRUB_FILE_TYPE_TO_HASH:
-+    case GRUB_FILE_TYPE_KEYBOARD_LAYOUT:
-+    case GRUB_FILE_TYPE_PIXMAP:
-+    case GRUB_FILE_TYPE_GRUB_MODULE_LIST:
-+    case GRUB_FILE_TYPE_CONFIG:
-+    case GRUB_FILE_TYPE_THEME:
-+    case GRUB_FILE_TYPE_GETTEXT_CATALOG:
-+    case GRUB_FILE_TYPE_FS_SEARCH:
-+    case GRUB_FILE_TYPE_LOADENV:
-+    case GRUB_FILE_TYPE_SAVEENV:
-+    case GRUB_FILE_TYPE_VERIFY_SIGNATURE:
-+      *flags = GRUB_VERIFY_FLAGS_SKIP_VERIFICATION;
-+      return GRUB_ERR_NONE;
- 
-+    /* Other files. */
-     default:
--      return GRUB_ERR_NONE;
-+      return grub_error (GRUB_ERR_ACCESS_DENIED, N_("prohibited by secure boot policy"));
-     }
- }
- 
-diff --git a/include/grub/verify.h b/include/grub/verify.h
-index cd129c398..672ae1692 100644
---- a/include/grub/verify.h
-+++ b/include/grub/verify.h
-@@ -24,6 +24,7 @@
- 
- enum grub_verify_flags
-   {
-+    GRUB_VERIFY_FLAGS_NONE		= 0,
-     GRUB_VERIFY_FLAGS_SKIP_VERIFICATION	= 1,
-     GRUB_VERIFY_FLAGS_SINGLE_CHUNK	= 2,
-     /* Defer verification to another authority. */
--- 
-2.41.0
-
diff --git a/boot/grub2/0007-video-Remove-trailing-whitespaces.patch b/boot/grub2/0007-video-Remove-trailing-whitespaces.patch
deleted file mode 100644
index 94d6aeefe7..0000000000
--- a/boot/grub2/0007-video-Remove-trailing-whitespaces.patch
+++ /dev/null
@@ -1,689 +0,0 @@
-From 1faa412c502c7c4ca1230fc152be30b88847fdd2 Mon Sep 17 00:00:00 2001
-From: Elyes Haouas <ehaouas@noos.fr>
-Date: Fri, 4 Mar 2022 07:42:13 +0100
-Subject: [PATCH] video: Remove trailing whitespaces
-
-Signed-off-by: Elyes Haouas <ehaouas@noos.fr>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Upstream: 1f48917d8ddb490dcdc70176e0f58136b7f7811a
-[Thomas: needed to backport patches fixing CVEs in the video code]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- grub-core/video/bochs.c             |  2 +-
- grub-core/video/capture.c           |  2 +-
- grub-core/video/cirrus.c            |  4 ++--
- grub-core/video/coreboot/cbfb.c     |  2 +-
- grub-core/video/efi_gop.c           | 22 +++++++++----------
- grub-core/video/fb/fbblit.c         |  8 +++----
- grub-core/video/fb/video_fb.c       | 10 ++++-----
- grub-core/video/i386/pc/vbe.c       | 34 ++++++++++++++---------------
- grub-core/video/i386/pc/vga.c       |  6 ++---
- grub-core/video/ieee1275.c          |  4 ++--
- grub-core/video/radeon_fuloong2e.c  |  6 ++---
- grub-core/video/radeon_yeeloong3a.c |  6 ++---
- grub-core/video/readers/png.c       |  2 +-
- grub-core/video/readers/tga.c       |  2 +-
- grub-core/video/sis315_init.c       |  2 +-
- grub-core/video/sis315pro.c         |  8 +++----
- grub-core/video/sm712.c             | 10 ++++-----
- grub-core/video/video.c             |  8 +++----
- 18 files changed, 69 insertions(+), 69 deletions(-)
-
-diff --git a/grub-core/video/bochs.c b/grub-core/video/bochs.c
-index 30ea1bd82..edc651697 100644
---- a/grub-core/video/bochs.c
-+++ b/grub-core/video/bochs.c
-@@ -212,7 +212,7 @@ find_card (grub_pci_device_t dev, grub_pci_id_t pciid, void *data)
- 
-   if (((class >> 16) & 0xffff) != 0x0300 || pciid != 0x11111234)
-     return 0;
--  
-+
-   addr = grub_pci_make_address (dev, GRUB_PCI_REG_ADDRESS_REG0);
-   framebuffer.base = grub_pci_read (addr) & GRUB_PCI_ADDR_MEM_MASK;
-   if (!framebuffer.base)
-diff --git a/grub-core/video/capture.c b/grub-core/video/capture.c
-index 4d3195e01..c653d89f9 100644
---- a/grub-core/video/capture.c
-+++ b/grub-core/video/capture.c
-@@ -92,7 +92,7 @@ grub_video_capture_start (const struct grub_video_mode_info *mode_info,
-   framebuffer.ptr = grub_calloc (framebuffer.mode_info.height, framebuffer.mode_info.pitch);
-   if (!framebuffer.ptr)
-     return grub_errno;
--  
-+
-   err = grub_video_fb_create_render_target_from_pointer (&framebuffer.render_target,
- 							 &framebuffer.mode_info,
- 							 framebuffer.ptr);
-diff --git a/grub-core/video/cirrus.c b/grub-core/video/cirrus.c
-index e2149e8ce..f5542ccdc 100644
---- a/grub-core/video/cirrus.c
-+++ b/grub-core/video/cirrus.c
-@@ -354,11 +354,11 @@ grub_video_cirrus_setup (unsigned int width, unsigned int height,
-     grub_uint8_t sr_ext = 0, hidden_dac = 0;
- 
-     grub_vga_set_geometry (&config, grub_vga_cr_write);
--    
-+
-     grub_vga_gr_write (GRUB_VGA_GR_MODE_256_COLOR | GRUB_VGA_GR_MODE_READ_MODE1,
- 		       GRUB_VGA_GR_MODE);
-     grub_vga_gr_write (GRUB_VGA_GR_GR6_GRAPHICS_MODE, GRUB_VGA_GR_GR6);
--    
-+
-     grub_vga_sr_write (GRUB_VGA_SR_MEMORY_MODE_NORMAL, GRUB_VGA_SR_MEMORY_MODE);
- 
-     grub_vga_cr_write ((config.pitch >> CIRRUS_CR_EXTENDED_DISPLAY_PITCH_SHIFT)
-diff --git a/grub-core/video/coreboot/cbfb.c b/grub-core/video/coreboot/cbfb.c
-index 9af81fa5b..986003c51 100644
---- a/grub-core/video/coreboot/cbfb.c
-+++ b/grub-core/video/coreboot/cbfb.c
-@@ -106,7 +106,7 @@ grub_video_cbfb_setup (unsigned int width, unsigned int height,
- 
-   grub_video_fb_set_palette (0, GRUB_VIDEO_FBSTD_NUMCOLORS,
- 			     grub_video_fbstd_colors);
--    
-+
-   return err;
- }
- 
-diff --git a/grub-core/video/efi_gop.c b/grub-core/video/efi_gop.c
-index b7590dc6c..7a5054631 100644
---- a/grub-core/video/efi_gop.c
-+++ b/grub-core/video/efi_gop.c
-@@ -273,7 +273,7 @@ grub_video_gop_iterate (int (*hook) (const struct grub_video_mode_info *info, vo
-       grub_efi_status_t status;
-       struct grub_efi_gop_mode_info *info = NULL;
-       struct grub_video_mode_info mode_info;
--	 
-+
-       status = efi_call_4 (gop->query_mode, gop, mode, &size, &info);
- 
-       if (status)
-@@ -390,7 +390,7 @@ grub_video_gop_setup (unsigned int width, unsigned int height,
- 	  found = 1;
- 	}
-     }
-- 
-+
-   if (!found)
-     {
-       unsigned mode;
-@@ -399,7 +399,7 @@ grub_video_gop_setup (unsigned int width, unsigned int height,
- 	{
- 	  grub_efi_uintn_t size;
- 	  grub_efi_status_t status;
--	 
-+
- 	  status = efi_call_4 (gop->query_mode, gop, mode, &size, &info);
- 	  if (status)
- 	    {
-@@ -472,11 +472,11 @@ grub_video_gop_setup (unsigned int width, unsigned int height,
-   framebuffer.ptr = (void *) (grub_addr_t) gop->mode->fb_base;
-   framebuffer.offscreen
-     = grub_malloc (framebuffer.mode_info.height
--		   * framebuffer.mode_info.width 
-+		   * framebuffer.mode_info.width
- 		   * sizeof (struct grub_efi_gop_blt_pixel));
- 
-   buffer = framebuffer.offscreen;
--      
-+
-   if (!buffer)
-     {
-       grub_dprintf ("video", "GOP: couldn't allocate shadow\n");
-@@ -485,11 +485,11 @@ grub_video_gop_setup (unsigned int width, unsigned int height,
- 				     &framebuffer.mode_info);
-       buffer = framebuffer.ptr;
-     }
--    
-+
-   grub_dprintf ("video", "GOP: initialising FB @ %p %dx%dx%d\n",
- 		framebuffer.ptr, framebuffer.mode_info.width,
- 		framebuffer.mode_info.height, framebuffer.mode_info.bpp);
-- 
-+
-   err = grub_video_fb_create_render_target_from_pointer
-     (&framebuffer.render_target, &framebuffer.mode_info, buffer);
- 
-@@ -498,15 +498,15 @@ grub_video_gop_setup (unsigned int width, unsigned int height,
-       grub_dprintf ("video", "GOP: Couldn't create FB target\n");
-       return err;
-     }
-- 
-+
-   err = grub_video_fb_set_active_render_target (framebuffer.render_target);
-- 
-+
-   if (err)
-     {
-       grub_dprintf ("video", "GOP: Couldn't set FB target\n");
-       return err;
-     }
-- 
-+
-   err = grub_video_fb_set_palette (0, GRUB_VIDEO_FBSTD_NUMCOLORS,
- 				   grub_video_fbstd_colors);
- 
-@@ -514,7 +514,7 @@ grub_video_gop_setup (unsigned int width, unsigned int height,
-     grub_dprintf ("video", "GOP: Couldn't set palette\n");
-   else
-     grub_dprintf ("video", "GOP: Success\n");
-- 
-+
-   return err;
- }
- 
-diff --git a/grub-core/video/fb/fbblit.c b/grub-core/video/fb/fbblit.c
-index d55924837..1010ef393 100644
---- a/grub-core/video/fb/fbblit.c
-+++ b/grub-core/video/fb/fbblit.c
-@@ -466,7 +466,7 @@ grub_video_fbblit_replace_24bit_indexa (struct grub_video_fbblit_info *dst,
-       for (i = 0; i < width; i++)
-         {
- 	  register grub_uint32_t col;
--	  if (*srcptr == 0xf0)	      
-+	  if (*srcptr == 0xf0)
- 	    col = palette[16];
- 	  else
- 	    col = palette[*srcptr & 0xf];
-@@ -478,7 +478,7 @@ grub_video_fbblit_replace_24bit_indexa (struct grub_video_fbblit_info *dst,
- 	  *dstptr++ = col >> 0;
- 	  *dstptr++ = col >> 8;
- 	  *dstptr++ = col >> 16;
--#endif	  
-+#endif
- 	  srcptr++;
-         }
- 
-@@ -651,7 +651,7 @@ grub_video_fbblit_blend_24bit_indexa (struct grub_video_fbblit_info *dst,
-       for (i = 0; i < width; i++)
-         {
- 	  register grub_uint32_t col;
--	  if (*srcptr != 0xf0)	      
-+	  if (*srcptr != 0xf0)
- 	    {
- 	      col = palette[*srcptr & 0xf];
- #ifdef GRUB_CPU_WORDS_BIGENDIAN
-@@ -662,7 +662,7 @@ grub_video_fbblit_blend_24bit_indexa (struct grub_video_fbblit_info *dst,
- 	      *dstptr++ = col >> 0;
- 	      *dstptr++ = col >> 8;
- 	      *dstptr++ = col >> 16;
--#endif	  
-+#endif
- 	    }
- 	  else
- 	    dstptr += 3;
-diff --git a/grub-core/video/fb/video_fb.c b/grub-core/video/fb/video_fb.c
-index ae6b89f9a..fa4ebde26 100644
---- a/grub-core/video/fb/video_fb.c
-+++ b/grub-core/video/fb/video_fb.c
-@@ -754,7 +754,7 @@ grub_video_fb_unmap_color_int (struct grub_video_fbblit_info * source,
-           *alpha = 0;
-           return;
-         }
--	
-+
-       /* If we have an out-of-bounds color, return transparent black.  */
-       if (color > 255)
-         {
-@@ -1141,7 +1141,7 @@ grub_video_fb_scroll (grub_video_color_t color, int dx, int dy)
-       /* If everything is aligned on 32-bit use 32-bit copy.  */
-       if ((grub_addr_t) grub_video_fb_get_video_ptr (&target, src_x, src_y)
- 	  % sizeof (grub_uint32_t) == 0
--	  && (grub_addr_t) grub_video_fb_get_video_ptr (&target, dst_x, dst_y) 
-+	  && (grub_addr_t) grub_video_fb_get_video_ptr (&target, dst_x, dst_y)
- 	  % sizeof (grub_uint32_t) == 0
- 	  && linelen % sizeof (grub_uint32_t) == 0
- 	  && linedelta % sizeof (grub_uint32_t) == 0)
-@@ -1155,7 +1155,7 @@ grub_video_fb_scroll (grub_video_color_t color, int dx, int dy)
-       else if ((grub_addr_t) grub_video_fb_get_video_ptr (&target, src_x, src_y)
- 	       % sizeof (grub_uint16_t) == 0
- 	       && (grub_addr_t) grub_video_fb_get_video_ptr (&target,
--							     dst_x, dst_y) 
-+							     dst_x, dst_y)
- 	       % sizeof (grub_uint16_t) == 0
- 	       && linelen % sizeof (grub_uint16_t) == 0
- 	       && linedelta % sizeof (grub_uint16_t) == 0)
-@@ -1170,7 +1170,7 @@ grub_video_fb_scroll (grub_video_color_t color, int dx, int dy)
- 	{
- 	  grub_uint8_t *src, *dst;
- 	  DO_SCROLL
--	}	
-+	}
-     }
- 
-   /* 4. Fill empty space with specified color.  In this implementation
-@@ -1615,7 +1615,7 @@ grub_video_fb_setup (unsigned int mode_type, unsigned int mode_mask,
- 	  framebuffer.render_target = framebuffer.back_target;
- 	  return GRUB_ERR_NONE;
- 	}
--      
-+
-       mode_info->mode_type &= ~(GRUB_VIDEO_MODE_TYPE_DOUBLE_BUFFERED
- 				| GRUB_VIDEO_MODE_TYPE_UPDATING_SWAP);
- 
-diff --git a/grub-core/video/i386/pc/vbe.c b/grub-core/video/i386/pc/vbe.c
-index b7f911926..0e65b5206 100644
---- a/grub-core/video/i386/pc/vbe.c
-+++ b/grub-core/video/i386/pc/vbe.c
-@@ -219,7 +219,7 @@ grub_vbe_disable_mtrr (int mtrr)
- }
- 
- /* Call VESA BIOS 0x4f09 to set palette data, return status.  */
--static grub_vbe_status_t 
-+static grub_vbe_status_t
- grub_vbe_bios_set_palette_data (grub_uint32_t color_count,
- 				grub_uint32_t start_index,
- 				struct grub_vbe_palette_data *palette_data)
-@@ -237,7 +237,7 @@ grub_vbe_bios_set_palette_data (grub_uint32_t color_count,
- }
- 
- /* Call VESA BIOS 0x4f00 to get VBE Controller Information, return status.  */
--grub_vbe_status_t 
-+grub_vbe_status_t
- grub_vbe_bios_get_controller_info (struct grub_vbe_info_block *ci)
- {
-   struct grub_bios_int_registers regs;
-@@ -251,7 +251,7 @@ grub_vbe_bios_get_controller_info (struct grub_vbe_info_block *ci)
- }
- 
- /* Call VESA BIOS 0x4f01 to get VBE Mode Information, return status.  */
--grub_vbe_status_t 
-+grub_vbe_status_t
- grub_vbe_bios_get_mode_info (grub_uint32_t mode,
- 			     struct grub_vbe_mode_info_block *mode_info)
- {
-@@ -285,7 +285,7 @@ grub_vbe_bios_set_mode (grub_uint32_t mode,
- }
- 
- /* Call VESA BIOS 0x4f03 to return current VBE Mode, return status.  */
--grub_vbe_status_t 
-+grub_vbe_status_t
- grub_vbe_bios_get_mode (grub_uint32_t *mode)
- {
-   struct grub_bios_int_registers regs;
-@@ -298,7 +298,7 @@ grub_vbe_bios_get_mode (grub_uint32_t *mode)
-   return regs.eax & 0xffff;
- }
- 
--grub_vbe_status_t 
-+grub_vbe_status_t
- grub_vbe_bios_getset_dac_palette_width (int set, int *dac_mask_size)
- {
-   struct grub_bios_int_registers regs;
-@@ -346,7 +346,7 @@ grub_vbe_bios_get_memory_window (grub_uint32_t window,
- }
- 
- /* Call VESA BIOS 0x4f06 to set scanline length (in bytes), return status.  */
--grub_vbe_status_t 
-+grub_vbe_status_t
- grub_vbe_bios_set_scanline_length (grub_uint32_t length)
- {
-   struct grub_bios_int_registers regs;
-@@ -354,14 +354,14 @@ grub_vbe_bios_set_scanline_length (grub_uint32_t length)
-   regs.ecx = length;
-   regs.eax = 0x4f06;
-   /* BL = 2, Set Scan Line in Bytes.  */
--  regs.ebx = 0x0002;	
-+  regs.ebx = 0x0002;
-   regs.flags = GRUB_CPU_INT_FLAGS_DEFAULT;
-   grub_bios_interrupt (0x10, &regs);
-   return regs.eax & 0xffff;
- }
- 
- /* Call VESA BIOS 0x4f06 to return scanline length (in bytes), return status.  */
--grub_vbe_status_t 
-+grub_vbe_status_t
- grub_vbe_bios_get_scanline_length (grub_uint32_t *length)
- {
-   struct grub_bios_int_registers regs;
-@@ -377,7 +377,7 @@ grub_vbe_bios_get_scanline_length (grub_uint32_t *length)
- }
- 
- /* Call VESA BIOS 0x4f07 to set display start, return status.  */
--static grub_vbe_status_t 
-+static grub_vbe_status_t
- grub_vbe_bios_set_display_start (grub_uint32_t x, grub_uint32_t y)
- {
-   struct grub_bios_int_registers regs;
-@@ -390,7 +390,7 @@ grub_vbe_bios_set_display_start (grub_uint32_t x, grub_uint32_t y)
-   regs.edx = y;
-   regs.eax = 0x4f07;
-   /* BL = 80h, Set Display Start during Vertical Retrace.  */
--  regs.ebx = 0x0080;	
-+  regs.ebx = 0x0080;
-   regs.flags = GRUB_CPU_INT_FLAGS_DEFAULT;
-   grub_bios_interrupt (0x10, &regs);
- 
-@@ -401,7 +401,7 @@ grub_vbe_bios_set_display_start (grub_uint32_t x, grub_uint32_t y)
- }
- 
- /* Call VESA BIOS 0x4f07 to get display start, return status.  */
--grub_vbe_status_t 
-+grub_vbe_status_t
- grub_vbe_bios_get_display_start (grub_uint32_t *x,
- 				 grub_uint32_t *y)
- {
-@@ -419,7 +419,7 @@ grub_vbe_bios_get_display_start (grub_uint32_t *x,
- }
- 
- /* Call VESA BIOS 0x4f0a.  */
--grub_vbe_status_t 
-+grub_vbe_status_t
- grub_vbe_bios_get_pm_interface (grub_uint16_t *segment, grub_uint16_t *offset,
- 				grub_uint16_t *length)
- {
-@@ -896,7 +896,7 @@ vbe2videoinfo (grub_uint32_t mode,
-     case GRUB_VBE_MEMORY_MODEL_YUV:
-       mode_info->mode_type |= GRUB_VIDEO_MODE_TYPE_YUV;
-       break;
--      
-+
-     case GRUB_VBE_MEMORY_MODEL_DIRECT_COLOR:
-       mode_info->mode_type |= GRUB_VIDEO_MODE_TYPE_RGB;
-       break;
-@@ -923,10 +923,10 @@ vbe2videoinfo (grub_uint32_t mode,
-       break;
-     case 8:
-       mode_info->bytes_per_pixel = 1;
--      break;  
-+      break;
-     case 4:
-       mode_info->bytes_per_pixel = 0;
--      break;  
-+      break;
-     }
- 
-   if (controller_info.version >= 0x300)
-@@ -976,7 +976,7 @@ grub_video_vbe_iterate (int (*hook) (const struct grub_video_mode_info *info, vo
- 
- static grub_err_t
- grub_video_vbe_setup (unsigned int width, unsigned int height,
--                      grub_video_mode_type_t mode_type, 
-+                      grub_video_mode_type_t mode_type,
- 		      grub_video_mode_type_t mode_mask)
- {
-   grub_uint16_t *p;
-@@ -1193,7 +1193,7 @@ grub_video_vbe_print_adapter_specific_info (void)
- 		controller_info.version & 0xFF,
- 		controller_info.oem_software_rev >> 8,
- 		controller_info.oem_software_rev & 0xFF);
--  
-+
-   /* The total_memory field is in 64 KiB units.  */
-   grub_printf_ (N_("              total memory: %d KiB\n"),
- 		(controller_info.total_memory << 6));
-diff --git a/grub-core/video/i386/pc/vga.c b/grub-core/video/i386/pc/vga.c
-index b2f776c99..50d0b5e02 100644
---- a/grub-core/video/i386/pc/vga.c
-+++ b/grub-core/video/i386/pc/vga.c
-@@ -48,7 +48,7 @@ static struct
-   int back_page;
- } framebuffer;
- 
--static unsigned char 
-+static unsigned char
- grub_vga_set_mode (unsigned char mode)
- {
-   struct grub_bios_int_registers regs;
-@@ -182,10 +182,10 @@ grub_video_vga_setup (unsigned int width, unsigned int height,
- 
-   is_target = 1;
-   err = grub_video_fb_set_active_render_target (framebuffer.render_target);
-- 
-+
-   if (err)
-     return err;
-- 
-+
-   err = grub_video_fb_set_palette (0, GRUB_VIDEO_FBSTD_NUMCOLORS,
- 				   grub_video_fbstd_colors);
- 
-diff --git a/grub-core/video/ieee1275.c b/grub-core/video/ieee1275.c
-index 17a3dbbb5..f8cf94d96 100644
---- a/grub-core/video/ieee1275.c
-+++ b/grub-core/video/ieee1275.c
-@@ -234,7 +234,7 @@ grub_video_ieee1275_setup (unsigned int width, unsigned int height,
-       /* TODO. */
-       return grub_error (GRUB_ERR_IO, "can't set mode %dx%d", width, height);
-     }
--  
-+
-   err = grub_video_ieee1275_fill_mode_info (dev, &framebuffer.mode_info);
-   if (err)
-     {
-@@ -261,7 +261,7 @@ grub_video_ieee1275_setup (unsigned int width, unsigned int height,
- 
-   grub_video_ieee1275_set_palette (0, framebuffer.mode_info.number_of_colors,
- 				   grub_video_fbstd_colors);
--    
-+
-   return err;
- }
- 
-diff --git a/grub-core/video/radeon_fuloong2e.c b/grub-core/video/radeon_fuloong2e.c
-index b4da34b5e..40917acb7 100644
---- a/grub-core/video/radeon_fuloong2e.c
-+++ b/grub-core/video/radeon_fuloong2e.c
-@@ -75,7 +75,7 @@ find_card (grub_pci_device_t dev, grub_pci_id_t pciid, void *data)
-   if (((class >> 16) & 0xffff) != GRUB_PCI_CLASS_SUBCLASS_VGA
-       || pciid != 0x515a1002)
-     return 0;
--  
-+
-   *found = 1;
- 
-   addr = grub_pci_make_address (dev, GRUB_PCI_REG_ADDRESS_REG0);
-@@ -139,7 +139,7 @@ grub_video_radeon_fuloong2e_setup (unsigned int width, unsigned int height,
-   framebuffer.mapped = 1;
- 
-   /* Prevent garbage from appearing on the screen.  */
--  grub_memset (framebuffer.ptr, 0x55, 
-+  grub_memset (framebuffer.ptr, 0x55,
- 	       framebuffer.mode_info.height * framebuffer.mode_info.pitch);
- 
- #ifndef TEST
-@@ -152,7 +152,7 @@ grub_video_radeon_fuloong2e_setup (unsigned int width, unsigned int height,
-     return err;
- 
-   err = grub_video_fb_set_active_render_target (framebuffer.render_target);
--  
-+
-   if (err)
-     return err;
- 
-diff --git a/grub-core/video/radeon_yeeloong3a.c b/grub-core/video/radeon_yeeloong3a.c
-index 52614feb6..48631c181 100644
---- a/grub-core/video/radeon_yeeloong3a.c
-+++ b/grub-core/video/radeon_yeeloong3a.c
-@@ -74,7 +74,7 @@ find_card (grub_pci_device_t dev, grub_pci_id_t pciid, void *data)
-   if (((class >> 16) & 0xffff) != GRUB_PCI_CLASS_SUBCLASS_VGA
-       || pciid != 0x96151002)
-     return 0;
--  
-+
-   *found = 1;
- 
-   addr = grub_pci_make_address (dev, GRUB_PCI_REG_ADDRESS_REG0);
-@@ -137,7 +137,7 @@ grub_video_radeon_yeeloong3a_setup (unsigned int width, unsigned int height,
- #endif
- 
-   /* Prevent garbage from appearing on the screen.  */
--  grub_memset (framebuffer.ptr, 0, 
-+  grub_memset (framebuffer.ptr, 0,
- 	       framebuffer.mode_info.height * framebuffer.mode_info.pitch);
- 
- #ifndef TEST
-@@ -150,7 +150,7 @@ grub_video_radeon_yeeloong3a_setup (unsigned int width, unsigned int height,
-     return err;
- 
-   err = grub_video_fb_set_active_render_target (framebuffer.render_target);
--  
-+
-   if (err)
-     return err;
- 
-diff --git a/grub-core/video/readers/png.c b/grub-core/video/readers/png.c
-index 0157ff742..54dfedf43 100644
---- a/grub-core/video/readers/png.c
-+++ b/grub-core/video/readers/png.c
-@@ -916,7 +916,7 @@ grub_png_convert_image (struct grub_png_data *data)
- 	}
-       return;
-     }
--  
-+
-   if (data->is_gray)
-     {
-       switch (data->bpp)
-diff --git a/grub-core/video/readers/tga.c b/grub-core/video/readers/tga.c
-index 7cb9d1d2a..a9ec3a1b6 100644
---- a/grub-core/video/readers/tga.c
-+++ b/grub-core/video/readers/tga.c
-@@ -127,7 +127,7 @@ tga_load_palette (struct tga_data *data)
- 
-   if (len > sizeof (data->palette))
-     len = sizeof (data->palette);
--  
-+
-   if (grub_file_read (data->file, &data->palette, len)
-       != (grub_ssize_t) len)
-     return grub_errno;
-diff --git a/grub-core/video/sis315_init.c b/grub-core/video/sis315_init.c
-index ae5c1419c..09c3c7bbe 100644
---- a/grub-core/video/sis315_init.c
-+++ b/grub-core/video/sis315_init.c
-@@ -1,4 +1,4 @@
--static const struct { grub_uint8_t reg; grub_uint8_t val; } sr_dump [] = 
-+static const struct { grub_uint8_t reg; grub_uint8_t val; } sr_dump [] =
- {
-   { 0x28, 0x81 },
-   { 0x2a, 0x00 },
-diff --git a/grub-core/video/sis315pro.c b/grub-core/video/sis315pro.c
-index 22a0c85a6..4d2f9999a 100644
---- a/grub-core/video/sis315pro.c
-+++ b/grub-core/video/sis315pro.c
-@@ -103,7 +103,7 @@ find_card (grub_pci_device_t dev, grub_pci_id_t pciid, void *data)
-   if (((class >> 16) & 0xffff) != GRUB_PCI_CLASS_SUBCLASS_VGA
-       || pciid != GRUB_SIS315PRO_PCIID)
-     return 0;
--  
-+
-   *found = 1;
- 
-   addr = grub_pci_make_address (dev, GRUB_PCI_REG_ADDRESS_REG0);
-@@ -218,7 +218,7 @@ grub_video_sis315pro_setup (unsigned int width, unsigned int height,
- 
- #ifndef TEST
-   /* Prevent garbage from appearing on the screen.  */
--  grub_memset (framebuffer.ptr, 0, 
-+  grub_memset (framebuffer.ptr, 0,
- 	       framebuffer.mode_info.height * framebuffer.mode_info.pitch);
-   grub_arch_sync_dma_caches (framebuffer.ptr,
- 			     framebuffer.mode_info.height
-@@ -231,7 +231,7 @@ grub_video_sis315pro_setup (unsigned int width, unsigned int height,
- 	     | GRUB_VGA_IO_MISC_EXTERNAL_CLOCK_0
- 	     | GRUB_VGA_IO_MISC_28MHZ
- 	     | GRUB_VGA_IO_MISC_ENABLE_VRAM_ACCESS
--	     | GRUB_VGA_IO_MISC_COLOR, 
-+	     | GRUB_VGA_IO_MISC_COLOR,
- 	     GRUB_VGA_IO_MISC_WRITE + GRUB_MACHINE_PCI_IO_BASE);
- 
-   grub_vga_sr_write (0x86, 5);
-@@ -335,7 +335,7 @@ grub_video_sis315pro_setup (unsigned int width, unsigned int height,
-   {
-     if (read_sis_cmd (0x5) != 0xa1)
-       write_sis_cmd (0x86, 0x5);
--    
-+
-     write_sis_cmd (read_sis_cmd (0x20) | 0xa1, 0x20);
-     write_sis_cmd (read_sis_cmd (0x1e) | 0xda, 0x1e);
- 
-diff --git a/grub-core/video/sm712.c b/grub-core/video/sm712.c
-index 10c46eb65..65f59f84b 100644
---- a/grub-core/video/sm712.c
-+++ b/grub-core/video/sm712.c
-@@ -167,7 +167,7 @@ enum
-     GRUB_SM712_CR_SHADOW_VGA_VBLANK_START = 0x46,
-     GRUB_SM712_CR_SHADOW_VGA_VBLANK_END = 0x47,
-     GRUB_SM712_CR_SHADOW_VGA_VRETRACE_START = 0x48,
--    GRUB_SM712_CR_SHADOW_VGA_VRETRACE_END = 0x49,    
-+    GRUB_SM712_CR_SHADOW_VGA_VRETRACE_END = 0x49,
-     GRUB_SM712_CR_SHADOW_VGA_OVERFLOW = 0x4a,
-     GRUB_SM712_CR_SHADOW_VGA_CELL_HEIGHT = 0x4b,
-     GRUB_SM712_CR_SHADOW_VGA_HDISPLAY_END = 0x4c,
-@@ -375,7 +375,7 @@ find_card (grub_pci_device_t dev, grub_pci_id_t pciid, void *data)
-   if (((class >> 16) & 0xffff) != GRUB_PCI_CLASS_SUBCLASS_VGA
-       || pciid != GRUB_SM712_PCIID)
-     return 0;
--  
-+
-   *found = 1;
- 
-   addr = grub_pci_make_address (dev, GRUB_PCI_REG_ADDRESS_REG0);
-@@ -471,7 +471,7 @@ grub_video_sm712_setup (unsigned int width, unsigned int height,
- 
- #if !defined (TEST) && !defined(GENINIT)
-   /* Prevent garbage from appearing on the screen.  */
--  grub_memset ((void *) framebuffer.cached_ptr, 0, 
-+  grub_memset ((void *) framebuffer.cached_ptr, 0,
- 	       framebuffer.mode_info.height * framebuffer.mode_info.pitch);
- #endif
- 
-@@ -482,7 +482,7 @@ grub_video_sm712_setup (unsigned int width, unsigned int height,
-   grub_sm712_sr_write (0x2, 0x6b);
-   grub_sm712_write_reg (0, GRUB_VGA_IO_PIXEL_MASK);
-   grub_sm712_sr_write (GRUB_VGA_SR_RESET_ASYNC, GRUB_VGA_SR_RESET);
--  grub_sm712_write_reg (GRUB_VGA_IO_MISC_NEGATIVE_VERT_POLARITY 
-+  grub_sm712_write_reg (GRUB_VGA_IO_MISC_NEGATIVE_VERT_POLARITY
- 			| GRUB_VGA_IO_MISC_NEGATIVE_HORIZ_POLARITY
- 			| GRUB_VGA_IO_MISC_UPPER_64K
- 			| GRUB_VGA_IO_MISC_EXTERNAL_CLOCK_0
-@@ -694,7 +694,7 @@ grub_video_sm712_setup (unsigned int width, unsigned int height,
-   for (i = 0; i < ARRAY_SIZE (dda_lookups); i++)
-     grub_sm712_write_dda_lookup (i, dda_lookups[i].compare, dda_lookups[i].dda,
- 				 dda_lookups[i].vcentering);
--  
-+
-   /* Undocumented  */
-   grub_sm712_cr_write (0, 0x9c);
-   grub_sm712_cr_write (0, 0x9d);
-diff --git a/grub-core/video/video.c b/grub-core/video/video.c
-index 983424107..8937da745 100644
---- a/grub-core/video/video.c
-+++ b/grub-core/video/video.c
-@@ -491,13 +491,13 @@ parse_modespec (const char *current_mode, int *width, int *height, int *depth)
- 		       current_mode);
- 
-   param++;
--  
-+
-   *width = grub_strtoul (value, 0, 0);
-   if (grub_errno != GRUB_ERR_NONE)
-       return grub_error (GRUB_ERR_BAD_ARGUMENT,
- 			 N_("invalid video mode specification `%s'"),
- 			 current_mode);
--  
-+
-   /* Find height value.  */
-   value = param;
-   param = grub_strchr(param, 'x');
-@@ -513,13 +513,13 @@ parse_modespec (const char *current_mode, int *width, int *height, int *depth)
-     {
-       /* We have optional color depth value.  */
-       param++;
--      
-+
-       *height = grub_strtoul (value, 0, 0);
-       if (grub_errno != GRUB_ERR_NONE)
- 	return grub_error (GRUB_ERR_BAD_ARGUMENT,
- 			   N_("invalid video mode specification `%s'"),
- 			   current_mode);
--      
-+
-       /* Convert color depth value.  */
-       value = param;
-       *depth = grub_strtoul (value, 0, 0);
--- 
-2.41.0
-
diff --git a/boot/grub2/0008-video-readers-png-Abort-sooner-if-a-read-operation-f.patch b/boot/grub2/0008-video-readers-png-Abort-sooner-if-a-read-operation-f.patch
deleted file mode 100644
index 94431a4ef1..0000000000
--- a/boot/grub2/0008-video-readers-png-Abort-sooner-if-a-read-operation-f.patch
+++ /dev/null
@@ -1,204 +0,0 @@
-From 91d16e415b79f5080fa2bcc21bff6471f6be9f08 Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Tue, 6 Jul 2021 14:02:55 +1000
-Subject: [PATCH] video/readers/png: Abort sooner if a read operation fails
-
-Fuzzing revealed some inputs that were taking a long time, potentially
-forever, because they did not bail quickly upon encountering an I/O error.
-
-Try to catch I/O errors sooner and bail out.
-
-Signed-off-by: Daniel Axtens <dja@axtens.net>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Upstream: d5caac8ab79d068ad9a41030c772d03a4d4fbd7b
-[Thomas: needed to cherry-pick
-e623866d9286410156e8b9d2c82d6253a1b22d08, which fixes CVE-2021-3695]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- grub-core/video/readers/png.c | 55 ++++++++++++++++++++++++++++++-----
- 1 file changed, 47 insertions(+), 8 deletions(-)
-
-diff --git a/grub-core/video/readers/png.c b/grub-core/video/readers/png.c
-index 54dfedf43..d715c4629 100644
---- a/grub-core/video/readers/png.c
-+++ b/grub-core/video/readers/png.c
-@@ -142,6 +142,7 @@ static grub_uint8_t
- grub_png_get_byte (struct grub_png_data *data)
- {
-   grub_uint8_t r;
-+  grub_ssize_t bytes_read = 0;
- 
-   if ((data->inside_idat) && (data->idat_remain == 0))
-     {
-@@ -175,7 +176,14 @@ grub_png_get_byte (struct grub_png_data *data)
-     }
- 
-   r = 0;
--  grub_file_read (data->file, &r, 1);
-+  bytes_read = grub_file_read (data->file, &r, 1);
-+
-+  if (bytes_read != 1)
-+    {
-+      grub_error (GRUB_ERR_BAD_FILE_TYPE,
-+		  "png: unexpected end of data");
-+      return 0;
-+    }
- 
-   if (data->inside_idat)
-     data->idat_remain--;
-@@ -231,15 +239,16 @@ grub_png_decode_image_palette (struct grub_png_data *data,
-   if (len == 0)
-     return GRUB_ERR_NONE;
- 
--  for (i = 0; 3 * i < len && i < 256; i++)
-+  grub_errno = GRUB_ERR_NONE;
-+  for (i = 0; 3 * i < len && i < 256 && grub_errno == GRUB_ERR_NONE; i++)
-     for (j = 0; j < 3; j++)
-       data->palette[i][j] = grub_png_get_byte (data);
--  for (i *= 3; i < len; i++)
-+  for (i *= 3; i < len && grub_errno == GRUB_ERR_NONE; i++)
-     grub_png_get_byte (data);
- 
-   grub_png_get_dword (data);
- 
--  return GRUB_ERR_NONE;
-+  return grub_errno;
- }
- 
- static grub_err_t
-@@ -256,9 +265,13 @@ grub_png_decode_image_header (struct grub_png_data *data)
-     return grub_error (GRUB_ERR_BAD_FILE_TYPE, "png: invalid image size");
- 
-   color_bits = grub_png_get_byte (data);
-+  if (grub_errno != GRUB_ERR_NONE)
-+    return grub_errno;
-   data->is_16bit = (color_bits == 16);
- 
-   color_type = grub_png_get_byte (data);
-+  if (grub_errno != GRUB_ERR_NONE)
-+    return grub_errno;
- 
-   /* According to PNG spec, no other types are valid.  */
-   if ((color_type & ~(PNG_COLOR_MASK_ALPHA | PNG_COLOR_MASK_COLOR))
-@@ -340,14 +353,20 @@ grub_png_decode_image_header (struct grub_png_data *data)
-   if (grub_png_get_byte (data) != PNG_COMPRESSION_BASE)
-     return grub_error (GRUB_ERR_BAD_FILE_TYPE,
- 		       "png: compression method not supported");
-+  if (grub_errno != GRUB_ERR_NONE)
-+    return grub_errno;
- 
-   if (grub_png_get_byte (data) != PNG_FILTER_TYPE_BASE)
-     return grub_error (GRUB_ERR_BAD_FILE_TYPE,
- 		       "png: filter method not supported");
-+  if (grub_errno != GRUB_ERR_NONE)
-+    return grub_errno;
- 
-   if (grub_png_get_byte (data) != PNG_INTERLACE_NONE)
-     return grub_error (GRUB_ERR_BAD_FILE_TYPE,
- 		       "png: interlace method not supported");
-+  if (grub_errno != GRUB_ERR_NONE)
-+    return grub_errno;
- 
-   /* Skip crc checksum.  */
-   grub_png_get_dword (data);
-@@ -449,7 +468,7 @@ grub_png_get_huff_code (struct grub_png_data *data, struct huff_table *ht)
-   int code, i;
- 
-   code = 0;
--  for (i = 0; i < ht->max_length; i++)
-+  for (i = 0; i < ht->max_length && grub_errno == GRUB_ERR_NONE; i++)
-     {
-       code = (code << 1) + grub_png_get_bits (data, 1);
-       if (code < ht->maxval[i])
-@@ -504,8 +523,14 @@ grub_png_init_dynamic_block (struct grub_png_data *data)
-   grub_uint8_t lens[DEFLATE_HCLEN_MAX];
- 
-   nl = DEFLATE_HLIT_BASE + grub_png_get_bits (data, 5);
-+  if (grub_errno != GRUB_ERR_NONE)
-+    return grub_errno;
-   nd = DEFLATE_HDIST_BASE + grub_png_get_bits (data, 5);
-+  if (grub_errno != GRUB_ERR_NONE)
-+    return grub_errno;
-   nb = DEFLATE_HCLEN_BASE + grub_png_get_bits (data, 4);
-+  if (grub_errno != GRUB_ERR_NONE)
-+    return grub_errno;
- 
-   if ((nl > DEFLATE_HLIT_MAX) || (nd > DEFLATE_HDIST_MAX) ||
-       (nb > DEFLATE_HCLEN_MAX))
-@@ -533,7 +558,7 @@ grub_png_init_dynamic_block (struct grub_png_data *data)
- 			    data->dist_offset);
- 
-   prev = 0;
--  for (i = 0; i < nl + nd; i++)
-+  for (i = 0; i < nl + nd && grub_errno == GRUB_ERR_NONE; i++)
-     {
-       int n, code;
-       struct huff_table *ht;
-@@ -721,17 +746,21 @@ grub_png_read_dynamic_block (struct grub_png_data *data)
- 	  len = cplens[n];
- 	  if (cplext[n])
- 	    len += grub_png_get_bits (data, cplext[n]);
-+	  if (grub_errno != GRUB_ERR_NONE)
-+	    return grub_errno;
- 
- 	  n = grub_png_get_huff_code (data, &data->dist_table);
- 	  dist = cpdist[n];
- 	  if (cpdext[n])
- 	    dist += grub_png_get_bits (data, cpdext[n]);
-+	  if (grub_errno != GRUB_ERR_NONE)
-+	    return grub_errno;
- 
- 	  pos = data->wp - dist;
- 	  if (pos < 0)
- 	    pos += WSIZE;
- 
--	  while (len > 0)
-+	  while (len > 0 && grub_errno == GRUB_ERR_NONE)
- 	    {
- 	      data->slide[data->wp] = data->slide[pos];
- 	      grub_png_output_byte (data, data->slide[data->wp]);
-@@ -759,7 +788,11 @@ grub_png_decode_image_data (struct grub_png_data *data)
-   int final;
- 
-   cmf = grub_png_get_byte (data);
-+  if (grub_errno != GRUB_ERR_NONE)
-+    return grub_errno;
-   flg = grub_png_get_byte (data);
-+  if (grub_errno != GRUB_ERR_NONE)
-+    return grub_errno;
- 
-   if ((cmf & 0xF) != Z_DEFLATED)
-     return grub_error (GRUB_ERR_BAD_FILE_TYPE,
-@@ -774,7 +807,11 @@ grub_png_decode_image_data (struct grub_png_data *data)
-       int block_type;
- 
-       final = grub_png_get_bits (data, 1);
-+      if (grub_errno != GRUB_ERR_NONE)
-+	return grub_errno;
-       block_type = grub_png_get_bits (data, 2);
-+      if (grub_errno != GRUB_ERR_NONE)
-+	return grub_errno;
- 
-       switch (block_type)
- 	{
-@@ -790,7 +827,7 @@ grub_png_decode_image_data (struct grub_png_data *data)
- 	    grub_png_get_byte (data);
- 	    grub_png_get_byte (data);
- 
--	    for (i = 0; i < len; i++)
-+	    for (i = 0; i < len && grub_errno == GRUB_ERR_NONE; i++)
- 	      grub_png_output_byte (data, grub_png_get_byte (data));
- 
- 	    break;
-@@ -1045,6 +1082,8 @@ grub_png_decode_png (struct grub_png_data *data)
- 
-       len = grub_png_get_dword (data);
-       type = grub_png_get_dword (data);
-+      if (grub_errno != GRUB_ERR_NONE)
-+	break;
-       data->next_offset = data->file->offset + len + 4;
- 
-       switch (type)
--- 
-2.41.0
-
diff --git a/boot/grub2/0009-video-readers-png-Refuse-to-handle-multiple-image-he.patch b/boot/grub2/0009-video-readers-png-Refuse-to-handle-multiple-image-he.patch
deleted file mode 100644
index 903d33b7b5..0000000000
--- a/boot/grub2/0009-video-readers-png-Refuse-to-handle-multiple-image-he.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e170edd18fcfdd9e6f91ba750fd022cef8d43cd4 Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Tue, 6 Jul 2021 14:13:40 +1000
-Subject: [PATCH] video/readers/png: Refuse to handle multiple image headers
-
-This causes the bitmap to be leaked. Do not permit multiple image headers.
-
-Signed-off-by: Daniel Axtens <dja@axtens.net>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Upstream: 166a4d61448f74745afe1dac2f2cfb85d04909bf
-[Thomas: needed to cherry-pick
-e623866d9286410156e8b9d2c82d6253a1b22d08, which fixes CVE-2021-3695]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- grub-core/video/readers/png.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/grub-core/video/readers/png.c b/grub-core/video/readers/png.c
-index d715c4629..35ae553c8 100644
---- a/grub-core/video/readers/png.c
-+++ b/grub-core/video/readers/png.c
-@@ -258,6 +258,9 @@ grub_png_decode_image_header (struct grub_png_data *data)
-   int color_bits;
-   enum grub_video_blit_format blt;
- 
-+  if (data->image_width || data->image_height)
-+    return grub_error (GRUB_ERR_BAD_FILE_TYPE, "png: two image headers found");
-+
-   data->image_width = grub_png_get_dword (data);
-   data->image_height = grub_png_get_dword (data);
- 
--- 
-2.41.0
-
diff --git a/boot/grub2/0010-video-readers-png-Drop-greyscale-support-to-fix-heap.patch b/boot/grub2/0010-video-readers-png-Drop-greyscale-support-to-fix-heap.patch
deleted file mode 100644
index 686a0beafd..0000000000
--- a/boot/grub2/0010-video-readers-png-Drop-greyscale-support-to-fix-heap.patch
+++ /dev/null
@@ -1,173 +0,0 @@
-From 5b42d132a029c1d245d94c813a45836522b46226 Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Tue, 6 Jul 2021 18:51:35 +1000
-Subject: [PATCH] video/readers/png: Drop greyscale support to fix heap
- out-of-bounds write
-
-A 16-bit greyscale PNG without alpha is processed in the following loop:
-
-      for (i = 0; i < (data->image_width * data->image_height);
-	   i++, d1 += 4, d2 += 2)
-	{
-	  d1[R3] = d2[1];
-	  d1[G3] = d2[1];
-	  d1[B3] = d2[1];
-	}
-
-The increment of d1 is wrong. d1 is incremented by 4 bytes per iteration,
-but there are only 3 bytes allocated for storage. This means that image
-data will overwrite somewhat-attacker-controlled parts of memory - 3 bytes
-out of every 4 following the end of the image.
-
-This has existed since greyscale support was added in 2013 in commit
-3ccf16dff98f (grub-core/video/readers/png.c: Support grayscale).
-
-Saving starfield.png as a 16-bit greyscale image without alpha in the gimp
-and attempting to load it causes grub-emu to crash - I don't think this code
-has ever worked.
-
-Delete all PNG greyscale support.
-
-Fixes: CVE-2021-3695
-
-Signed-off-by: Daniel Axtens <dja@axtens.net>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Upstream: e623866d9286410156e8b9d2c82d6253a1b22d08
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- grub-core/video/readers/png.c | 87 +++--------------------------------
- 1 file changed, 7 insertions(+), 80 deletions(-)
-
-diff --git a/grub-core/video/readers/png.c b/grub-core/video/readers/png.c
-index 35ae553c8..a3161e25b 100644
---- a/grub-core/video/readers/png.c
-+++ b/grub-core/video/readers/png.c
-@@ -100,7 +100,7 @@ struct grub_png_data
- 
-   unsigned image_width, image_height;
-   int bpp, is_16bit;
--  int raw_bytes, is_gray, is_alpha, is_palette;
-+  int raw_bytes, is_alpha, is_palette;
-   int row_bytes, color_bits;
-   grub_uint8_t *image_data;
- 
-@@ -296,13 +296,13 @@ grub_png_decode_image_header (struct grub_png_data *data)
-     data->bpp = 3;
-   else
-     {
--      data->is_gray = 1;
--      data->bpp = 1;
-+      return grub_error (GRUB_ERR_BAD_FILE_TYPE,
-+			 "png: color type not supported");
-     }
- 
-   if ((color_bits != 8) && (color_bits != 16)
-       && (color_bits != 4
--	  || !(data->is_gray || data->is_palette)))
-+	  || !data->is_palette))
-     return grub_error (GRUB_ERR_BAD_FILE_TYPE,
-                        "png: bit depth must be 8 or 16");
- 
-@@ -331,7 +331,7 @@ grub_png_decode_image_header (struct grub_png_data *data)
-     }
- 
- #ifndef GRUB_CPU_WORDS_BIGENDIAN
--  if (data->is_16bit || data->is_gray || data->is_palette)
-+  if (data->is_16bit || data->is_palette)
- #endif
-     {
-       data->image_data = grub_calloc (data->image_height, data->row_bytes);
-@@ -899,27 +899,8 @@ grub_png_convert_image (struct grub_png_data *data)
-       int shift;
-       int mask = (1 << data->color_bits) - 1;
-       unsigned j;
--      if (data->is_gray)
--	{
--	  /* Generic formula is
--	     (0xff * i) / ((1U << data->color_bits) - 1)
--	     but for allowed bit depth of 1, 2 and for it's
--	     equivalent to
--	     (0xff / ((1U << data->color_bits) - 1)) * i
--	     Precompute the multipliers to avoid division.
--	  */
--
--	  const grub_uint8_t multipliers[5] = { 0xff, 0xff, 0x55, 0x24, 0x11 };
--	  for (i = 0; i < (1U << data->color_bits); i++)
--	    {
--	      grub_uint8_t col = multipliers[data->color_bits] * i;
--	      palette[i][0] = col;
--	      palette[i][1] = col;
--	      palette[i][2] = col;
--	    }
--	}
--      else
--	grub_memcpy (palette, data->palette, 3 << data->color_bits);
-+
-+      grub_memcpy (palette, data->palette, 3 << data->color_bits);
-       d1c = d1;
-       d2c = d2;
-       for (j = 0; j < data->image_height; j++, d1c += data->image_width * 3,
-@@ -957,60 +938,6 @@ grub_png_convert_image (struct grub_png_data *data)
-       return;
-     }
- 
--  if (data->is_gray)
--    {
--      switch (data->bpp)
--	{
--	case 4:
--	  /* 16-bit gray with alpha.  */
--	  for (i = 0; i < (data->image_width * data->image_height);
--	       i++, d1 += 4, d2 += 4)
--	    {
--	      d1[R4] = d2[3];
--	      d1[G4] = d2[3];
--	      d1[B4] = d2[3];
--	      d1[A4] = d2[1];
--	    }
--	  break;
--	case 2:
--	  if (data->is_16bit)
--	    /* 16-bit gray without alpha.  */
--	    {
--	      for (i = 0; i < (data->image_width * data->image_height);
--		   i++, d1 += 4, d2 += 2)
--		{
--		  d1[R3] = d2[1];
--		  d1[G3] = d2[1];
--		  d1[B3] = d2[1];
--		}
--	    }
--	  else
--	    /* 8-bit gray with alpha.  */
--	    {
--	      for (i = 0; i < (data->image_width * data->image_height);
--		   i++, d1 += 4, d2 += 2)
--		{
--		  d1[R4] = d2[1];
--		  d1[G4] = d2[1];
--		  d1[B4] = d2[1];
--		  d1[A4] = d2[0];
--		}
--	    }
--	  break;
--	  /* 8-bit gray without alpha.  */
--	case 1:
--	  for (i = 0; i < (data->image_width * data->image_height);
--	       i++, d1 += 3, d2++)
--	    {
--	      d1[R3] = d2[0];
--	      d1[G3] = d2[0];
--	      d1[B3] = d2[0];
--	    }
--	  break;
--	}
--      return;
--    }
--
-     {
-   /* Only copy the upper 8 bit.  */
- #ifndef GRUB_CPU_WORDS_BIGENDIAN
--- 
-2.41.0
-
diff --git a/boot/grub2/0011-video-readers-png-Avoid-heap-OOB-R-W-inserting-huff-.patch b/boot/grub2/0011-video-readers-png-Avoid-heap-OOB-R-W-inserting-huff-.patch
deleted file mode 100644
index 19fde07060..0000000000
--- a/boot/grub2/0011-video-readers-png-Avoid-heap-OOB-R-W-inserting-huff-.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 43a7d9cb829467993ba683a26c980fcfdaa924c8 Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Tue, 6 Jul 2021 23:25:07 +1000
-Subject: [PATCH] video/readers/png: Avoid heap OOB R/W inserting huff table
- items
-
-In fuzzing we observed crashes where a code would attempt to be inserted
-into a huffman table before the start, leading to a set of heap OOB reads
-and writes as table entries with negative indices were shifted around and
-the new code written in.
-
-Catch the case where we would underflow the array and bail.
-
-Fixes: CVE-2021-3696
-
-Signed-off-by: Daniel Axtens <dja@axtens.net>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Upstream: 210245129c932dc9e1c2748d9d35524fb95b5042
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- grub-core/video/readers/png.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/grub-core/video/readers/png.c b/grub-core/video/readers/png.c
-index a3161e25b..d7ed5aa6c 100644
---- a/grub-core/video/readers/png.c
-+++ b/grub-core/video/readers/png.c
-@@ -438,6 +438,13 @@ grub_png_insert_huff_item (struct huff_table *ht, int code, int len)
-   for (i = len; i < ht->max_length; i++)
-     n += ht->maxval[i];
- 
-+  if (n > ht->num_values)
-+    {
-+      grub_error (GRUB_ERR_BAD_FILE_TYPE,
-+		  "png: out of range inserting huffman table item");
-+      return;
-+    }
-+
-   for (i = 0; i < n; i++)
-     ht->values[ht->num_values - i] = ht->values[ht->num_values - i - 1];
- 
--- 
-2.41.0
-
diff --git a/boot/grub2/0012-video-readers-jpeg-Block-int-underflow-wild-pointer-.patch b/boot/grub2/0012-video-readers-jpeg-Block-int-underflow-wild-pointer-.patch
deleted file mode 100644
index 75c3f8e43b..0000000000
--- a/boot/grub2/0012-video-readers-jpeg-Block-int-underflow-wild-pointer-.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 6be7ccfcc33da513de66f71de63fdc129fa019c2 Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Wed, 7 Jul 2021 15:38:19 +1000
-Subject: [PATCH] video/readers/jpeg: Block int underflow -> wild pointer write
-
-Certain 1 px wide images caused a wild pointer write in
-grub_jpeg_ycrcb_to_rgb(). This was caused because in grub_jpeg_decode_data(),
-we have the following loop:
-
-for (; data->r1 < nr1 && (!data->dri || rst);
-     data->r1++, data->bitmap_ptr += (vb * data->image_width - hb * nc1) * 3)
-
-We did not check if vb * width >= hb * nc1.
-
-On a 64-bit platform, if that turns out to be negative, it will underflow,
-be interpreted as unsigned 64-bit, then be added to the 64-bit pointer, so
-we see data->bitmap_ptr jump, e.g.:
-
-0x6180_0000_0480 to
-0x6181_0000_0498
-     ^
-     ~--- carry has occurred and this pointer is now far away from
-          any object.
-
-On a 32-bit platform, it will decrement the pointer, creating a pointer
-that won't crash but will overwrite random data.
-
-Catch the underflow and error out.
-
-Fixes: CVE-2021-3697
-
-Signed-off-by: Daniel Axtens <dja@axtens.net>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Upstream: 22a3f97d39f6a10b08ad7fd1cc47c4dcd10413f6
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- grub-core/video/readers/jpeg.c | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/grub-core/video/readers/jpeg.c b/grub-core/video/readers/jpeg.c
-index e31602f76..1d256af01 100644
---- a/grub-core/video/readers/jpeg.c
-+++ b/grub-core/video/readers/jpeg.c
-@@ -23,6 +23,7 @@
- #include <grub/mm.h>
- #include <grub/misc.h>
- #include <grub/bufio.h>
-+#include <grub/safemath.h>
- 
- GRUB_MOD_LICENSE ("GPLv3+");
- 
-@@ -639,6 +640,7 @@ static grub_err_t
- grub_jpeg_decode_data (struct grub_jpeg_data *data)
- {
-   unsigned c1, vb, hb, nr1, nc1;
-+  unsigned stride_a, stride_b, stride;
-   int rst = data->dri;
- 
-   vb = 8 << data->log_vs;
-@@ -650,8 +652,14 @@ grub_jpeg_decode_data (struct grub_jpeg_data *data)
-     return grub_error(GRUB_ERR_BAD_FILE_TYPE,
- 		      "jpeg: attempted to decode data before start of stream");
- 
-+  if (grub_mul(vb, data->image_width, &stride_a) ||
-+      grub_mul(hb, nc1, &stride_b) ||
-+      grub_sub(stride_a, stride_b, &stride))
-+    return grub_error (GRUB_ERR_BAD_FILE_TYPE,
-+		       "jpeg: cannot decode image with these dimensions");
-+
-   for (; data->r1 < nr1 && (!data->dri || rst);
--       data->r1++, data->bitmap_ptr += (vb * data->image_width - hb * nc1) * 3)
-+       data->r1++, data->bitmap_ptr += stride * 3)
-     for (c1 = 0;  c1 < nc1 && (!data->dri || rst);
- 	c1++, rst--, data->bitmap_ptr += hb * 3)
-       {
--- 
-2.41.0
-
diff --git a/boot/grub2/0013-net-ip-Do-IP-fragment-maths-safely.patch b/boot/grub2/0013-net-ip-Do-IP-fragment-maths-safely.patch
deleted file mode 100644
index 3acec5cc20..0000000000
--- a/boot/grub2/0013-net-ip-Do-IP-fragment-maths-safely.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From cadde7e36b8797060ac8cdf7cca7d8e1e09697e6 Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Mon, 20 Dec 2021 19:41:21 +1100
-Subject: [PATCH] net/ip: Do IP fragment maths safely
-
-We can receive packets with invalid IP fragmentation information. This
-can lead to rsm->total_len underflowing and becoming very large.
-
-Then, in grub_netbuff_alloc(), we add to this very large number, which can
-cause it to overflow and wrap back around to a small positive number.
-The allocation then succeeds, but the resulting buffer is too small and
-subsequent operations can write past the end of the buffer.
-
-Catch the underflow here.
-
-Fixes: CVE-2022-28733
-
-Signed-off-by: Daniel Axtens <dja@axtens.net>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Upstream: 3e4817538de828319ba6d59ced2fbb9b5ca13287
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- grub-core/net/ip.c | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/grub-core/net/ip.c b/grub-core/net/ip.c
-index ea5edf8f1..74e4e8b06 100644
---- a/grub-core/net/ip.c
-+++ b/grub-core/net/ip.c
-@@ -25,6 +25,7 @@
- #include <grub/net/netbuff.h>
- #include <grub/mm.h>
- #include <grub/priority_queue.h>
-+#include <grub/safemath.h>
- #include <grub/time.h>
- 
- struct iphdr {
-@@ -512,7 +513,14 @@ grub_net_recv_ip4_packets (struct grub_net_buff *nb,
-     {
-       rsm->total_len = (8 * (grub_be_to_cpu16 (iph->frags) & OFFSET_MASK)
- 			+ (nb->tail - nb->data));
--      rsm->total_len -= ((iph->verhdrlen & 0xf) * sizeof (grub_uint32_t));
-+
-+      if (grub_sub (rsm->total_len, (iph->verhdrlen & 0xf) * sizeof (grub_uint32_t),
-+		    &rsm->total_len))
-+	{
-+	  grub_dprintf ("net", "IP reassembly size underflow\n");
-+	  return GRUB_ERR_NONE;
-+	}
-+
-       rsm->asm_netbuff = grub_netbuff_alloc (rsm->total_len);
-       if (!rsm->asm_netbuff)
- 	{
--- 
-2.41.0
-
diff --git a/boot/grub2/0014-net-http-Fix-OOB-write-for-split-http-headers.patch b/boot/grub2/0014-net-http-Fix-OOB-write-for-split-http-headers.patch
deleted file mode 100644
index cd249299be..0000000000
--- a/boot/grub2/0014-net-http-Fix-OOB-write-for-split-http-headers.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 6bb49bda656e1121fd303cf3e69709172e267718 Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Tue, 8 Mar 2022 18:17:03 +1100
-Subject: [PATCH] net/http: Fix OOB write for split http headers
-
-GRUB has special code for handling an http header that is split
-across two packets.
-
-The code tracks the end of line by looking for a "\n" byte. The
-code for split headers has always advanced the pointer just past the
-end of the line, whereas the code that handles unsplit headers does
-not advance the pointer. This extra advance causes the length to be
-one greater, which breaks an assumption in parse_line(), leading to
-it writing a NUL byte one byte past the end of the buffer where we
-reconstruct the line from the two packets.
-
-It's conceivable that an attacker controlled set of packets could
-cause this to zero out the first byte of the "next" pointer of the
-grub_mm_region structure following the current_line buffer.
-
-Do not advance the pointer in the split header case.
-
-Fixes: CVE-2022-28734
-
-Signed-off-by: Daniel Axtens <dja@axtens.net>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Upstream: ec6bfd3237394c1c7dbf2fd73417173318d22f4b
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- grub-core/net/http.c | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/grub-core/net/http.c b/grub-core/net/http.c
-index b616cf40b..a19b0a205 100644
---- a/grub-core/net/http.c
-+++ b/grub-core/net/http.c
-@@ -190,9 +190,7 @@ http_receive (grub_net_tcp_socket_t sock __attribute__ ((unused)),
- 	  int have_line = 1;
- 	  char *t;
- 	  ptr = grub_memchr (nb->data, '\n', nb->tail - nb->data);
--	  if (ptr)
--	    ptr++;
--	  else
-+	  if (ptr == NULL)
- 	    {
- 	      have_line = 0;
- 	      ptr = (char *) nb->tail;
--- 
-2.41.0
-
diff --git a/boot/grub2/0015-net-http-Error-out-on-headers-with-LF-without-CR.patch b/boot/grub2/0015-net-http-Error-out-on-headers-with-LF-without-CR.patch
deleted file mode 100644
index 684bb88a9c..0000000000
--- a/boot/grub2/0015-net-http-Error-out-on-headers-with-LF-without-CR.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 2974684d2f7f85a5c57af8155cc3b70c04ec1d6b Mon Sep 17 00:00:00 2001
-From: Daniel Axtens <dja@axtens.net>
-Date: Tue, 8 Mar 2022 19:04:40 +1100
-Subject: [PATCH] net/http: Error out on headers with LF without CR
-
-In a similar vein to the previous patch, parse_line() would write
-a NUL byte past the end of the buffer if there was an HTTP header
-with a LF rather than a CRLF.
-
-RFC-2616 says:
-
-  Many HTTP/1.1 header field values consist of words separated by LWS
-  or special characters. These special characters MUST be in a quoted
-  string to be used within a parameter value (as defined in section 3.6).
-
-We don't support quoted sections or continuation lines, etc.
-
-If we see an LF that's not part of a CRLF, bail out.
-
-Fixes: CVE-2022-28734
-
-Signed-off-by: Daniel Axtens <dja@axtens.net>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Upstream: b26b4c08e7119281ff30d0fb4a6169bd2afa8fe4
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- grub-core/net/http.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/grub-core/net/http.c b/grub-core/net/http.c
-index a19b0a205..1fa62b5cb 100644
---- a/grub-core/net/http.c
-+++ b/grub-core/net/http.c
-@@ -68,7 +68,15 @@ parse_line (grub_file_t file, http_data_t data, char *ptr, grub_size_t len)
-   char *end = ptr + len;
-   while (end > ptr && *(end - 1) == '\r')
-     end--;
-+
-+  /* LF without CR. */
-+  if (end == ptr + len)
-+    {
-+      data->errmsg = grub_strdup (_("invalid HTTP header - LF without CR"));
-+      return GRUB_ERR_NONE;
-+    }
-   *end = 0;
-+
-   /* Trailing CRLF.  */
-   if (data->in_chunk_len == 1)
-     {
--- 
-2.41.0
-
diff --git a/boot/grub2/0016-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch b/boot/grub2/0016-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch
deleted file mode 100644
index 680df1f5e9..0000000000
--- a/boot/grub2/0016-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From 1aefeca0f6304a20c1a3711cb9e89c5fdb901b6b Mon Sep 17 00:00:00 2001
-From: Zhang Boyang <zhangboyang.id@gmail.com>
-Date: Fri, 5 Aug 2022 00:51:20 +0800
-Subject: [PATCH] font: Fix size overflow in grub_font_get_glyph_internal()
-
-The length of memory allocation and file read may overflow. This patch
-fixes the problem by using safemath macros.
-
-There is a lot of code repetition like "(x * y + 7) / 8". It is unsafe
-if overflow happens. This patch introduces grub_video_bitmap_calc_1bpp_bufsz().
-It is safe replacement for such code. It has safemath-like prototype.
-
-This patch also introduces grub_cast(value, pointer), it casts value to
-typeof(*pointer) then store the value to *pointer. It returns true when
-overflow occurs or false if there is no overflow. The semantics of arguments
-and return value are designed to be consistent with other safemath macros.
-
-Signed-off-by: Zhang Boyang <zhangboyang.id@gmail.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Upstream: 9c76ec09ae08155df27cd237eaea150b4f02f532
-[Thomas: needed to backport 768e1ef2fc159f6e14e7246e4be09363708ac39e,
-which fixes CVE-2022-2601]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- grub-core/font/font.c   | 17 +++++++++++++----
- include/grub/bitmap.h   | 18 ++++++++++++++++++
- include/grub/safemath.h |  2 ++
- 3 files changed, 33 insertions(+), 4 deletions(-)
-
-diff --git a/grub-core/font/font.c b/grub-core/font/font.c
-index d09bb38d8..876b5b695 100644
---- a/grub-core/font/font.c
-+++ b/grub-core/font/font.c
-@@ -739,7 +739,8 @@ grub_font_get_glyph_internal (grub_font_t font, grub_uint32_t code)
-       grub_int16_t xoff;
-       grub_int16_t yoff;
-       grub_int16_t dwidth;
--      int len;
-+      grub_ssize_t len;
-+      grub_size_t sz;
- 
-       if (index_entry->glyph)
- 	/* Return cached glyph.  */
-@@ -766,9 +767,17 @@ grub_font_get_glyph_internal (grub_font_t font, grub_uint32_t code)
- 	  return 0;
- 	}
- 
--      len = (width * height + 7) / 8;
--      glyph = grub_malloc (sizeof (struct grub_font_glyph) + len);
--      if (!glyph)
-+      /* Calculate real struct size of current glyph. */
-+      if (grub_video_bitmap_calc_1bpp_bufsz (width, height, &len) ||
-+	  grub_add (sizeof (struct grub_font_glyph), len, &sz))
-+	{
-+	  remove_font (font);
-+	  return 0;
-+	}
-+
-+      /* Allocate and initialize the glyph struct. */
-+      glyph = grub_malloc (sz);
-+      if (glyph == NULL)
- 	{
- 	  remove_font (font);
- 	  return 0;
-diff --git a/include/grub/bitmap.h b/include/grub/bitmap.h
-index 5728f8ca3..0d9603f61 100644
---- a/include/grub/bitmap.h
-+++ b/include/grub/bitmap.h
-@@ -23,6 +23,7 @@
- #include <grub/symbol.h>
- #include <grub/types.h>
- #include <grub/video.h>
-+#include <grub/safemath.h>
- 
- struct grub_video_bitmap
- {
-@@ -79,6 +80,23 @@ grub_video_bitmap_get_height (struct grub_video_bitmap *bitmap)
-   return bitmap->mode_info.height;
- }
- 
-+/*
-+ * Calculate and store the size of data buffer of 1bit bitmap in result.
-+ * Equivalent to "*result = (width * height + 7) / 8" if no overflow occurs.
-+ * Return true when overflow occurs or false if there is no overflow.
-+ * This function is intentionally implemented as a macro instead of
-+ * an inline function. Although a bit awkward, it preserves data types for
-+ * safemath macros and reduces macro side effects as much as possible.
-+ *
-+ * XXX: Will report false overflow if width * height > UINT64_MAX.
-+ */
-+#define grub_video_bitmap_calc_1bpp_bufsz(width, height, result) \
-+({ \
-+  grub_uint64_t _bitmap_pixels; \
-+  grub_mul ((width), (height), &_bitmap_pixels) ? 1 : \
-+    grub_cast (_bitmap_pixels / GRUB_CHAR_BIT + !!(_bitmap_pixels % GRUB_CHAR_BIT), (result)); \
-+})
-+
- void EXPORT_FUNC (grub_video_bitmap_get_mode_info) (struct grub_video_bitmap *bitmap,
- 						    struct grub_video_mode_info *mode_info);
- 
-diff --git a/include/grub/safemath.h b/include/grub/safemath.h
-index c17b89bba..bb0f826de 100644
---- a/include/grub/safemath.h
-+++ b/include/grub/safemath.h
-@@ -30,6 +30,8 @@
- #define grub_sub(a, b, res)	__builtin_sub_overflow(a, b, res)
- #define grub_mul(a, b, res)	__builtin_mul_overflow(a, b, res)
- 
-+#define grub_cast(a, res)	grub_add ((a), 0, (res))
-+
- #else
- #error gcc 5.1 or newer or clang 3.8 or newer is required
- #endif
--- 
-2.41.0
-
diff --git a/boot/grub2/0017-font-Fix-several-integer-overflows-in-grub_font_cons.patch b/boot/grub2/0017-font-Fix-several-integer-overflows-in-grub_font_cons.patch
deleted file mode 100644
index d8e5835e18..0000000000
--- a/boot/grub2/0017-font-Fix-several-integer-overflows-in-grub_font_cons.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From fefba72d17364d6212cfd3be2232f4ce0ba23b82 Mon Sep 17 00:00:00 2001
-From: Zhang Boyang <zhangboyang.id@gmail.com>
-Date: Fri, 5 Aug 2022 01:58:27 +0800
-Subject: [PATCH] font: Fix several integer overflows in
- grub_font_construct_glyph()
-
-This patch fixes several integer overflows in grub_font_construct_glyph().
-Glyphs of invalid size, zero or leading to an overflow, are rejected.
-The inconsistency between "glyph" and "max_glyph_size" when grub_malloc()
-returns NULL is fixed too.
-
-Fixes: CVE-2022-2601
-
-Reported-by: Zhang Boyang <zhangboyang.id@gmail.com>
-Signed-off-by: Zhang Boyang <zhangboyang.id@gmail.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Upstream: 768e1ef2fc159f6e14e7246e4be09363708ac39e
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- grub-core/font/font.c | 29 +++++++++++++++++------------
- 1 file changed, 17 insertions(+), 12 deletions(-)
-
-diff --git a/grub-core/font/font.c b/grub-core/font/font.c
-index 876b5b695..0ff552578 100644
---- a/grub-core/font/font.c
-+++ b/grub-core/font/font.c
-@@ -1515,6 +1515,7 @@ grub_font_construct_glyph (grub_font_t hinted_font,
-   struct grub_video_signed_rect bounds;
-   static struct grub_font_glyph *glyph = 0;
-   static grub_size_t max_glyph_size = 0;
-+  grub_size_t cur_glyph_size;
- 
-   ensure_comb_space (glyph_id);
- 
-@@ -1531,29 +1532,33 @@ grub_font_construct_glyph (grub_font_t hinted_font,
-   if (!glyph_id->ncomb && !glyph_id->attributes)
-     return main_glyph;
- 
--  if (max_glyph_size < sizeof (*glyph) + (bounds.width * bounds.height + GRUB_CHAR_BIT - 1) / GRUB_CHAR_BIT)
-+  if (grub_video_bitmap_calc_1bpp_bufsz (bounds.width, bounds.height, &cur_glyph_size) ||
-+      grub_add (sizeof (*glyph), cur_glyph_size, &cur_glyph_size))
-+    return main_glyph;
-+
-+  if (max_glyph_size < cur_glyph_size)
-     {
-       grub_free (glyph);
--      max_glyph_size = (sizeof (*glyph) + (bounds.width * bounds.height + GRUB_CHAR_BIT - 1) / GRUB_CHAR_BIT) * 2;
--      if (max_glyph_size < 8)
--	max_glyph_size = 8;
--      glyph = grub_malloc (max_glyph_size);
-+      if (grub_mul (cur_glyph_size, 2, &max_glyph_size))
-+	max_glyph_size = 0;
-+      glyph = max_glyph_size > 0 ? grub_malloc (max_glyph_size) : NULL;
-     }
-   if (!glyph)
-     {
-+      max_glyph_size = 0;
-       grub_errno = GRUB_ERR_NONE;
-       return main_glyph;
-     }
- 
--  grub_memset (glyph, 0, sizeof (*glyph)
--	       + (bounds.width * bounds.height
--		  + GRUB_CHAR_BIT - 1) / GRUB_CHAR_BIT);
-+  grub_memset (glyph, 0, cur_glyph_size);
- 
-   glyph->font = main_glyph->font;
--  glyph->width = bounds.width;
--  glyph->height = bounds.height;
--  glyph->offset_x = bounds.x;
--  glyph->offset_y = bounds.y;
-+  if (bounds.width == 0 || bounds.height == 0 ||
-+      grub_cast (bounds.width, &glyph->width) ||
-+      grub_cast (bounds.height, &glyph->height) ||
-+      grub_cast (bounds.x, &glyph->offset_x) ||
-+      grub_cast (bounds.y, &glyph->offset_y))
-+    return main_glyph;
- 
-   if (glyph_id->attributes & GRUB_UNICODE_GLYPH_ATTRIBUTE_MIRROR)
-     grub_font_blit_glyph_mirror (glyph, main_glyph,
--- 
-2.41.0
-
diff --git a/boot/grub2/0018-font-Fix-an-integer-underflow-in-blit_comb.patch b/boot/grub2/0018-font-Fix-an-integer-underflow-in-blit_comb.patch
deleted file mode 100644
index 1d3d26fb7b..0000000000
--- a/boot/grub2/0018-font-Fix-an-integer-underflow-in-blit_comb.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 79bd19e078c5053d800b1b4d3a901083da947e70 Mon Sep 17 00:00:00 2001
-From: Zhang Boyang <zhangboyang.id@gmail.com>
-Date: Mon, 24 Oct 2022 08:05:35 +0800
-Subject: [PATCH] font: Fix an integer underflow in blit_comb()
-
-The expression (ctx.bounds.height - combining_glyphs[i]->height) / 2 may
-evaluate to a very big invalid value even if both ctx.bounds.height and
-combining_glyphs[i]->height are small integers. For example, if
-ctx.bounds.height is 10 and combining_glyphs[i]->height is 12, this
-expression evaluates to 2147483647 (expected -1). This is because
-coordinates are allowed to be negative but ctx.bounds.height is an
-unsigned int. So, the subtraction operates on unsigned ints and
-underflows to a very big value. The division makes things even worse.
-The quotient is still an invalid value even if converted back to int.
-
-This patch fixes the problem by casting ctx.bounds.height to int. As
-a result the subtraction will operate on int and grub_uint16_t which
-will be promoted to an int. So, the underflow will no longer happen. Other
-uses of ctx.bounds.height (and ctx.bounds.width) are also casted to int,
-to ensure coordinates are always calculated on signed integers.
-
-Fixes: CVE-2022-3775
-
-Reported-by: Daniel Axtens <dja@axtens.net>
-Signed-off-by: Zhang Boyang <zhangboyang.id@gmail.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Upstream: 992c06191babc1e109caf40d6a07ec6fdef427af
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- grub-core/font/font.c | 16 ++++++++--------
- 1 file changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/grub-core/font/font.c b/grub-core/font/font.c
-index 0ff552578..7b1cbde07 100644
---- a/grub-core/font/font.c
-+++ b/grub-core/font/font.c
-@@ -1206,12 +1206,12 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
-   ctx.bounds.height = main_glyph->height;
- 
-   above_rightx = main_glyph->offset_x + main_glyph->width;
--  above_righty = ctx.bounds.y + ctx.bounds.height;
-+  above_righty = ctx.bounds.y + (int) ctx.bounds.height;
- 
-   above_leftx = main_glyph->offset_x;
--  above_lefty = ctx.bounds.y + ctx.bounds.height;
-+  above_lefty = ctx.bounds.y + (int) ctx.bounds.height;
- 
--  below_rightx = ctx.bounds.x + ctx.bounds.width;
-+  below_rightx = ctx.bounds.x + (int) ctx.bounds.width;
-   below_righty = ctx.bounds.y;
- 
-   comb = grub_unicode_get_comb (glyph_id);
-@@ -1224,7 +1224,7 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
- 
-       if (!combining_glyphs[i])
- 	continue;
--      targetx = (ctx.bounds.width - combining_glyphs[i]->width) / 2 + ctx.bounds.x;
-+      targetx = ((int) ctx.bounds.width - combining_glyphs[i]->width) / 2 + ctx.bounds.x;
-       /* CGJ is to avoid diacritics reordering. */
-       if (comb[i].code
- 	  == GRUB_UNICODE_COMBINING_GRAPHEME_JOINER)
-@@ -1234,8 +1234,8 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
- 	case GRUB_UNICODE_COMB_OVERLAY:
- 	  do_blit (combining_glyphs[i],
- 		   targetx,
--		   (ctx.bounds.height - combining_glyphs[i]->height) / 2
--		   - (ctx.bounds.height + ctx.bounds.y), &ctx);
-+		   ((int) ctx.bounds.height - combining_glyphs[i]->height) / 2
-+		   - ((int) ctx.bounds.height + ctx.bounds.y), &ctx);
- 	  if (min_devwidth < combining_glyphs[i]->width)
- 	    min_devwidth = combining_glyphs[i]->width;
- 	  break;
-@@ -1308,7 +1308,7 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
- 	  /* Fallthrough.  */
- 	case GRUB_UNICODE_STACK_ATTACHED_ABOVE:
- 	  do_blit (combining_glyphs[i], targetx,
--		   -(ctx.bounds.height + ctx.bounds.y + space
-+		   -((int) ctx.bounds.height + ctx.bounds.y + space
- 		     + combining_glyphs[i]->height), &ctx);
- 	  if (min_devwidth < combining_glyphs[i]->width)
- 	    min_devwidth = combining_glyphs[i]->width;
-@@ -1316,7 +1316,7 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
- 
- 	case GRUB_UNICODE_COMB_HEBREW_DAGESH:
- 	  do_blit (combining_glyphs[i], targetx,
--		   -(ctx.bounds.height / 2 + ctx.bounds.y
-+		   -((int) ctx.bounds.height / 2 + ctx.bounds.y
- 		     + combining_glyphs[i]->height / 2), &ctx);
- 	  if (min_devwidth < combining_glyphs[i]->width)
- 	    min_devwidth = combining_glyphs[i]->width;
--- 
-2.41.0
-
diff --git a/boot/grub2/0019-fs-ext2-Ignore-checksum-seed-incompat-feature.patch b/boot/grub2/0019-fs-ext2-Ignore-checksum-seed-incompat-feature.patch
deleted file mode 100644
index 9a913e2279..0000000000
--- a/boot/grub2/0019-fs-ext2-Ignore-checksum-seed-incompat-feature.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 7fd5feff97c4b1f446f8fcf6d37aca0c64e7c763 Mon Sep 17 00:00:00 2001
-From: Javier Martinez Canillas <javierm@redhat.com>
-Date: Fri, 11 Jun 2021 21:36:16 +0200
-Subject: [PATCH] fs/ext2: Ignore checksum seed incompat feature
-
-This incompat feature is used to denote that the filesystem stored its
-metadata checksum seed in the superblock. This is used to allow tune2fs
-changing the UUID on a mounted metdata_csum filesystem without having
-to rewrite all the disk metadata. However, the GRUB doesn't use the
-metadata checksum at all. So, it can just ignore this feature if it
-is enabled. This is consistent with the GRUB filesystem code in general
-which just does a best effort to access the filesystem's data.
-
-The checksum seed incompat feature has to be removed from the ignore
-list if the support for metadata checksum verification is added to the
-GRUB ext2 driver later.
-
-Suggested-by: Eric Sandeen <esandeen@redhat.com>
-Suggested-by: Lukas Czerner <lczerner@redhat.com>
-Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
-Reviewed-by: Lukas Czerner <lczerner@redhat.com>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Upstream: 7fd5feff97c4b1f446f8fcf6d37aca0c64e7c763
-Signed-off-by: Jens Maus <mail@jens-maus.de>
----
- grub-core/fs/ext2.c | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/grub-core/fs/ext2.c b/grub-core/fs/ext2.c
-index e7dd78e66..4953a1591 100644
---- a/grub-core/fs/ext2.c
-+++ b/grub-core/fs/ext2.c
-@@ -103,6 +103,7 @@ GRUB_MOD_LICENSE ("GPLv3+");
- #define EXT4_FEATURE_INCOMPAT_64BIT		0x0080
- #define EXT4_FEATURE_INCOMPAT_MMP		0x0100
- #define EXT4_FEATURE_INCOMPAT_FLEX_BG		0x0200
-+#define EXT4_FEATURE_INCOMPAT_CSUM_SEED		0x2000
- #define EXT4_FEATURE_INCOMPAT_ENCRYPT          0x10000
- 
- /* The set of back-incompatible features this driver DOES support. Add (OR)
-@@ -123,10 +124,15 @@ GRUB_MOD_LICENSE ("GPLv3+");
-  * mmp:            Not really back-incompatible - was added as such to
-  *                 avoid multiple read-write mounts. Safe to ignore for this
-  *                 RO driver.
-+ * checksum seed:  Not really back-incompatible - was added to allow tools
-+ *                 such as tune2fs to change the UUID on a mounted metadata
-+ *                 checksummed filesystem. Safe to ignore for now since the
-+ *                 driver doesn't support checksum verification. However, it
-+ *                 has to be removed from this list if the support is added later.
-  */
- #define EXT2_DRIVER_IGNORED_INCOMPAT ( EXT3_FEATURE_INCOMPAT_RECOVER \
--				     | EXT4_FEATURE_INCOMPAT_MMP)
--
-+				     | EXT4_FEATURE_INCOMPAT_MMP \
-+				     | EXT4_FEATURE_INCOMPAT_CSUM_SEED)
- 
- #define EXT3_JOURNAL_MAGIC_NUMBER	0xc03b3998U
- 
--- 
-2.34.1
-
diff --git a/boot/grub2/0020-fs-ext2-Ignore-the-large_dir-incompat-feature.patch b/boot/grub2/0020-fs-ext2-Ignore-the-large_dir-incompat-feature.patch
deleted file mode 100644
index 43b182f968..0000000000
--- a/boot/grub2/0020-fs-ext2-Ignore-the-large_dir-incompat-feature.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 2e9fa73a040462b81bfbfe56c0bc7ad2d30b446b Mon Sep 17 00:00:00 2001
-From: Theodore Ts'o <tytso@mit.edu>
-Date: Tue, 30 Aug 2022 22:41:59 -0400
-Subject: [PATCH] fs/ext2: Ignore the large_dir incompat feature
-
-Recently, ext4 added the large_dir feature, which adds support for
-a 3 level htree directory support.
-
-The GRUB supports existing file systems with htree directories by
-ignoring their existence, and since the index nodes for the hash tree
-look like deleted directory entries (by design), the GRUB can simply do
-a brute force O(n) linear search of directories. The same is true for
-3 level deep htrees indicated by large_dir feature flag.
-
-Hence, it is safe for the GRUB to ignore the large_dir incompat feature.
-
-Fixes: https://savannah.gnu.org/bugs/?61606
-
-Signed-off-by: Theodore Ts'o <tytso@mit.edu>
-Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
-Upstream: 2e9fa73a040462b81bfbfe56c0bc7ad2d30b446b
-Signed-off-by: Jens Maus <mail@jens-maus.de>
----
- grub-core/fs/ext2.c | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/grub-core/fs/ext2.c b/grub-core/fs/ext2.c
-index 0989e26e1..e1cc5e62a 100644
---- a/grub-core/fs/ext2.c
-+++ b/grub-core/fs/ext2.c
-@@ -104,6 +104,7 @@ GRUB_MOD_LICENSE ("GPLv3+");
- #define EXT4_FEATURE_INCOMPAT_MMP		0x0100
- #define EXT4_FEATURE_INCOMPAT_FLEX_BG		0x0200
- #define EXT4_FEATURE_INCOMPAT_CSUM_SEED		0x2000
-+#define EXT4_FEATURE_INCOMPAT_LARGEDIR		0x4000 /* >2GB or 3 level htree */
- #define EXT4_FEATURE_INCOMPAT_ENCRYPT          0x10000
- 
- /* The set of back-incompatible features this driver DOES support. Add (OR)
-@@ -129,10 +130,17 @@ GRUB_MOD_LICENSE ("GPLv3+");
-  *                 checksummed filesystem. Safe to ignore for now since the
-  *                 driver doesn't support checksum verification. However, it
-  *                 has to be removed from this list if the support is added later.
-+ * large_dir:      Not back-incompatible given that the GRUB ext2 driver does
-+ *                 not implement EXT2_FEATURE_COMPAT_DIR_INDEX. If the GRUB
-+ *                 eventually supports the htree feature (aka dir_index)
-+ *                 it should support 3 level htrees and then move
-+ *                 EXT4_FEATURE_INCOMPAT_LARGEDIR to
-+ *                 EXT2_DRIVER_SUPPORTED_INCOMPAT.
-  */
- #define EXT2_DRIVER_IGNORED_INCOMPAT ( EXT3_FEATURE_INCOMPAT_RECOVER \
- 				     | EXT4_FEATURE_INCOMPAT_MMP \
--				     | EXT4_FEATURE_INCOMPAT_CSUM_SEED)
-+				     | EXT4_FEATURE_INCOMPAT_CSUM_SEED \
-+				     | EXT4_FEATURE_INCOMPAT_LARGEDIR)
- 
- #define EXT3_JOURNAL_MAGIC_NUMBER	0xc03b3998U
- 
--- 
-2.34.1
-
diff --git a/boot/grub2/grub2.hash b/boot/grub2/grub2.hash
index 5d9db423d4..65a8ec8e4f 100644
--- a/boot/grub2/grub2.hash
+++ b/boot/grub2/grub2.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature
-# https://ftp.gnu.org/gnu/grub/grub-2.06.tar.xz.sig
-sha256  b79ea44af91b93d17cd3fe80bdae6ed43770678a9a5ae192ccea803ebb657ee1  grub-2.06.tar.xz
+# https://ftp.gnu.org/gnu/grub/grub-2.12.tar.xz.sig
+sha256  f3c97391f7c4eaa677a78e090c7e97e6dc47b16f655f04683ebd37bef7fe0faa  grub-2.12.tar.xz
 # Locally computed:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 6c3a861fb6..b9be826885 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRUB2_VERSION = 2.06
+GRUB2_VERSION = 2.12
 GRUB2_SITE = http://ftp.gnu.org/gnu/grub
 GRUB2_SOURCE = grub-$(GRUB2_VERSION).tar.xz
 GRUB2_LICENSE = GPL-3.0+
@@ -13,13 +13,6 @@ GRUB2_DEPENDENCIES = host-bison host-flex host-grub2
 HOST_GRUB2_DEPENDENCIES = host-bison host-flex
 GRUB2_INSTALL_IMAGES = YES
 
-# 0001-Makefile-Make-grub_fstest.pp-depend-on-config-util.h.patch
-define GRUB2_AVOID_AUTORECONF
-	$(Q)touch $(@D)/Makefile.in
-endef
-GRUB2_POST_PATCH_HOOKS += GRUB2_AVOID_AUTORECONF
-HOST_GRUB2_POST_PATCH_HOOKS += GRUB2_AVOID_AUTORECONF
-
 # CVE-2019-14865 is about a flaw in the grub2-set-bootflag tool, which
 # doesn't exist upstream, but is added by the Redhat/Fedora
 # packaging. Not applicable to Buildroot.
@@ -30,29 +23,8 @@ GRUB2_IGNORE_CVES += CVE-2019-14865
 # grub_linuxefi_secure_validate() is not implemented in the grub2
 # version available in Buildroot.
 GRUB2_IGNORE_CVES += CVE-2020-15705
-# 0002-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch
-GRUB2_IGNORE_CVES += CVE-2021-3981
 # vulnerability is specific to the SUSE distribution
 GRUB2_IGNORE_CVES += CVE-2021-46705
-# 0005-loader-efi-chainloader-Use-grub_loader_set_ex.patch
-GRUB2_IGNORE_CVES += CVE-2022-28736
-# 0006-kern-efi-sb-Reject-non-kernel-files-in-the-shim_lock.patch
-GRUB2_IGNORE_CVES += CVE-2022-28735
-# 0010-video-readers-png-Drop-greyscale-support-to-fix-heap.patch
-GRUB2_IGNORE_CVES += CVE-2021-3695
-# 0011-video-readers-png-Avoid-heap-OOB-R-W-inserting-huff-.patch
-GRUB2_IGNORE_CVES += CVE-2021-3696
-# 0012-video-readers-jpeg-Block-int-underflow-wild-pointer-.patch
-GRUB2_IGNORE_CVES += CVE-2021-3697
-# 0013-net-ip-Do-IP-fragment-maths-safely.patch
-GRUB2_IGNORE_CVES += CVE-2022-28733
-# 0014-net-http-Fix-OOB-write-for-split-http-headers.patch
-# 0015-net-http-Error-out-on-headers-with-LF-without-CR.patch
-GRUB2_IGNORE_CVES += CVE-2022-28734
-# 0017-font-Fix-several-integer-overflows-in-grub_font_cons.patch
-GRUB2_IGNORE_CVES += CVE-2022-2601
-# 0018-font-Fix-an-integer-underflow-in-blit_comb.patch
-GRUB2_IGNORE_CVES += CVE-2022-3775
 
 ifeq ($(BR2_TARGET_GRUB2_INSTALL_TOOLS),y)
 GRUB2_INSTALL_TARGET = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
