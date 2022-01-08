Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9B9C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 10:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BB96428A5;
	Sat,  8 Jan 2022 10:54:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U9ihYwzMFcWY; Sat,  8 Jan 2022 10:54:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A91AB4289F;
	Sat,  8 Jan 2022 10:54:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A078E1BF957
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EB1981425
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:53:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j_A4npbWbPFU for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 10:53:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC0EC81421
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 10:53:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A7F1C82B5A; Sat,  8 Jan 2022 10:47:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 11:49:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: efd0435add883e24b1a7053c12e2d71df7f5c247
X-Git-Newrev: 5260f3189b6479dac1aa07af41f55056352a3c40
X-Patchwork-Hint: ignore
Message-Id: <20220108104742.A7F1C82B5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcap: bump version to 2.62
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

commit: https://git.buildroot.net/buildroot/commit/?id=5260f3189b6479dac1aa07af41f55056352a3c40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which was applied upstream:
https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=afbc554d16a32ed352191e49b3673f2f72d0002f

Release notes:
https://sites.google.com/site/fullycapable/release-notes-for-libcap

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...file-don-t-overwrite-empty-when-generatin.patch | 50 ----------------------
 package/libcap/libcap.hash                         |  2 +-
 package/libcap/libcap.mk                           |  2 +-
 3 files changed, 2 insertions(+), 52 deletions(-)

diff --git a/package/libcap/0001-libcap-Makefile-don-t-overwrite-empty-when-generatin.patch b/package/libcap/0001-libcap-Makefile-don-t-overwrite-empty-when-generatin.patch
deleted file mode 100644
index a47a2c788e..0000000000
--- a/package/libcap/0001-libcap-Makefile-don-t-overwrite-empty-when-generatin.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From dc507a812d931c24f1ac98c811fdd29bffa21da9 Mon Sep 17 00:00:00 2001
-From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
-Date: Tue, 24 Aug 2021 00:36:40 +0200
-Subject: [PATCH] libcap/Makefile: don't overwrite 'empty' when generating
- loader.txt
-
-objcopy takes an input file and an output file as arguments. If the
-output file is left out, the input file will be overwritten.
-
-Since the objcopy command used to generate loader.txt only does a
-dump-section and no filtering, in practice there is no change to empty.
-However, as a side-effect, its timestamp is updated. The timestamp of
-empty and of loader.txt will be more or less the same; however,
-loader.txt is closed just before the output file is closed, so it's
-possible that the timestamp of loader.txt is just a little bit earlier.
-If this happens, it causes loader.txt to be rebuilt later, which in turn
-causes a number of other object files to be rebuilt.
-
-Usually that's harmless, but it sometimes causes the rebuild to happen
-during 'make install'. This is particularly annoying if 'make install'
-is done as root, since loader.txt becomes owned by root in that case.
-
-Fix this by specifying a harmless output file: /dev/null.
-
-While we're at it, take in an upstream change that removes the redundant
-redirect.
-
-Fixes: ee3b25c0a877fa74d1aec88f325ac45b09963c82
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- libcap/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libcap/Makefile b/libcap/Makefile
-index 47cf8f4..18e4f4f 100644
---- a/libcap/Makefile
-+++ b/libcap/Makefile
-@@ -105,7 +105,7 @@ empty: empty.c
- 	$(CC) -o $@ $<
- 
- loader.txt: empty
--	$(OBJCOPY) --dump-section .interp=/dev/stdout $< > $@
-+	$(OBJCOPY) --dump-section .interp=$@ $< /dev/null
- 
- cap_magic.o: execable.h execable.c loader.txt
- 	$(CC) $(CFLAGS) $(IPATH) -DLIBRARY_VERSION=\"$(LIBTITLE)-$(VERSION).$(MINOR)\" -DSHARED_LOADER=\"$(shell cat loader.txt)\" -c execable.c -o $@
--- 
-2.31.1
-
diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
index eb8fe43f6f..396e592c5b 100644
--- a/package/libcap/libcap.hash
+++ b/package/libcap/libcap.hash
@@ -1,5 +1,5 @@
 # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
-sha256  a2faacd55ae5959db1b0c695f91f256ac4c5e6b10acaeaeaf508ea1ee887fa97  libcap-2.52.tar.xz
+sha256  190c5baac9bee06a129eae20d3e827de62f664fe3507f0bf6c50a9a59fbd83a2  libcap-2.62.tar.xz
 
 # Hash for license file:
 sha256  f58c80bcce8c929db39a23c32e924876e3311f3ffa54f66076c38056d38fa59b  License
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 45700e56ec..42acca9082 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_VERSION = 2.52
+LIBCAP_VERSION = 2.62
 LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
