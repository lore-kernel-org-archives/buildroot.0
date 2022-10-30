Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE887C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96B12402F7;
	Sun, 30 Oct 2022 11:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96B12402F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aaYXnh2bFkZP; Sun, 30 Oct 2022 11:08:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F29C4052F;
	Sun, 30 Oct 2022 11:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F29C4052F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D2361BF956
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03DAF812E9
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03DAF812E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XpCu_txn1jnv for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:04:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4E5B812F9
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4E5B812F9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B69688746D; Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 11:54:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5cf6429e2b6f3e2ee292b6c7dc6c0a1c2171bb9c
X-Git-Newrev: 90d8ca33ef27b3b47999aa0c2c5a499afe362752
X-Patchwork-Hint: ignore
Message-Id: <20221030110443.B69688746D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liblinear: bump to version 2.45
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

commit: https://git.buildroot.net/buildroot/commit/?id=90d8ca33ef27b3b47999aa0c2c5a499afe362752
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 2.45 released on August 11, 2022. Some minor bugs are fixed.

Drop first patch (not needed since
https://github.com/cjlin1/liblinear/commit/7cf5d6e1c05d3147ee7890865c900757fc42d9ef)

https://github.com/cjlin1/liblinear/compare/v244...v245

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-blas-don-t-overwrite-ar-options.patch     | 36 ----------------------
 ...tatic-lib.patch => 0001-build-static-lib.patch} |  0
 package/liblinear/liblinear.hash                   |  2 +-
 package/liblinear/liblinear.mk                     |  2 +-
 4 files changed, 2 insertions(+), 38 deletions(-)

diff --git a/package/liblinear/0001-blas-don-t-overwrite-ar-options.patch b/package/liblinear/0001-blas-don-t-overwrite-ar-options.patch
deleted file mode 100644
index 23ed6dd227..0000000000
--- a/package/liblinear/0001-blas-don-t-overwrite-ar-options.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From cae4c3b80fee0f3637d70f6d33946888c8105637 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Sat, 13 Dec 2014 17:16:58 +0100
-Subject: [PATCH] blas: don't overwrite ar options
-
-ar's rcv options get lost when AR is passed on
-the command line.
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- blas/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/blas/Makefile b/blas/Makefile
-index 895fd24..78cec9a 100644
---- a/blas/Makefile
-+++ b/blas/Makefile
-@@ -1,4 +1,4 @@
--AR     = ar rcv
-+AR     = ar
- RANLIB = ranlib
- 
- HEADERS = blas.h blasp.h
-@@ -8,7 +8,7 @@ CFLAGS = $(OPTFLAGS)
- FFLAGS = $(OPTFLAGS)
- 
- blas: $(FILES) $(HEADERS)
--	$(AR) blas.a $(FILES)
-+	$(AR) rcv blas.a $(FILES)  
- 	$(RANLIB) blas.a
- 
- clean:
--- 
-1.9.3
-
diff --git a/package/liblinear/0002-build-static-lib.patch b/package/liblinear/0001-build-static-lib.patch
similarity index 100%
rename from package/liblinear/0002-build-static-lib.patch
rename to package/liblinear/0001-build-static-lib.patch
diff --git a/package/liblinear/liblinear.hash b/package/liblinear/liblinear.hash
index 27aa4e3e87..6bc72909d0 100644
--- a/package/liblinear/liblinear.hash
+++ b/package/liblinear/liblinear.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  45572b99d4eeffc3e8ad7b72c27370be867edf3523c396d8b278a2c873bfbb5c  liblinear-2.44.tar.gz
+sha256  3c64eec45c01943a656baac7aeb8ffd782fe0aea53629aa9f5fdb8eec177c92f  liblinear-2.45.tar.gz
 sha256  d49b7898fd9ea7c29f0478e8c409ee7c0f621533d5eca7b7912e80391dc564e3  COPYRIGHT
diff --git a/package/liblinear/liblinear.mk b/package/liblinear/liblinear.mk
index c100ccc6c5..014f9e2de4 100644
--- a/package/liblinear/liblinear.mk
+++ b/package/liblinear/liblinear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLINEAR_VERSION = 2.44
+LIBLINEAR_VERSION = 2.45
 LIBLINEAR_SITE = http://www.csie.ntu.edu.tw/~cjlin/liblinear
 LIBLINEAR_LICENSE = BSD-3-Clause
 LIBLINEAR_LICENSE_FILES = COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
