Return-Path: <SRS0=7Mk9=NP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D1AC4338F
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 07:10:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E594661368
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 07:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E594661368
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC7E960683;
	Tue, 24 Aug 2021 07:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H2-V-58JxLnf; Tue, 24 Aug 2021 07:10:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F7716069F;
	Tue, 24 Aug 2021 07:10:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D94291BF31B
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 07:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C78FF40242
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 07:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8tDRANp34StS for <buildroot@lists.busybox.net>;
 Tue, 24 Aug 2021 07:10:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD7DD400E7
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 07:10:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3FE068D1EE; Tue, 24 Aug 2021 07:09:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 24 Aug 2021 09:09:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6fb0dbe4038ccde96e4600ca566d6269911077bc
X-Git-Newrev: ddf37c819133d699e749ca401b8ce6fdf485a55e
X-Patchwork-Hint: ignore
Message-Id: <20210824070918.3FE068D1EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/libcap: don't overwrite
 'empty' when generating loader.txt"
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=ddf37c819133d699e749ca401b8ce6fdf485a55e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was for the next branch, not master...

This reverts commit 6fb0dbe4038ccde96e4600ca566d6269911077bc.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...file-don-t-overwrite-empty-when-generatin.patch | 50 ----------------------
 1 file changed, 50 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
