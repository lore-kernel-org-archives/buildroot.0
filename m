Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009F0C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 20:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B15F760B44;
	Mon, 24 Jun 2024 20:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fm3Phzp4C9z1; Mon, 24 Jun 2024 20:02:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFB4D60B4E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFB4D60B4E;
	Mon, 24 Jun 2024 20:02:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E9B61BF95D
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6073240AD9
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vy_0e6eky6hL for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 338CD40025
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 338CD40025
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1EE5282B60; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 21:30:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e04faea50f5554ab24f8b756860b9a7922094a6f
X-Git-Newrev: 47e497eaeec01733ba8edbb5a7c01d1b53281cce
X-Patchwork-Hint: ignore
Message-Id: <20240624200226.1EE5282B60@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bzip2: update the patches to be
 applied with fuzz 0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=47e497eaeec01733ba8edbb5a7c01d1b53281cce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit allows the package patches to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/bzip2/0001-build-objects-twice.patch  | 14 ++++++++------
 package/bzip2/0002-improve-build-system.patch | 12 +++++++-----
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/package/bzip2/0001-build-objects-twice.patch b/package/bzip2/0001-build-objects-twice.patch
index 9bde0f6488..52b234f65a 100644
--- a/package/bzip2/0001-build-objects-twice.patch
+++ b/package/bzip2/0001-build-objects-twice.patch
@@ -8,14 +8,16 @@ and build the shared objects as *.sho instead of *.o.
 Then, we use these objects to create the shared library.
 
 Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 Index: bzip2-1.0.6/Makefile-libbz2_so
 ===================================================================
 --- bzip2-1.0.6.orig/Makefile-libbz2_so
 +++ bzip2-1.0.6/Makefile-libbz2_so
-@@ -25,13 +25,13 @@ SHELL=/bin/sh
- CC=gcc
- override CFLAGS += -fpic -fPIC -Wall
+@@ -26,13 +26,13 @@ CC=gcc
+ BIGFILES=-D_FILE_OFFSET_BITS=64
+ CFLAGS=-fpic -fPIC -Wall -Winline -O2 -g $(BIGFILES)
  
 -OBJS= blocksort.o  \
 -      huffman.o    \
@@ -33,10 +35,10 @@ Index: bzip2-1.0.6/Makefile-libbz2_so
 +      bzlib.sho
  
  all: $(OBJS)
- 	$(CC) -shared -Wl,-soname -Wl,libbz2.so.1.0 -o libbz2.so.1.0.6 $(OBJS)
-@@ -45,17 +45,5 @@ install:
+ 	$(CC) -shared -Wl,-soname -Wl,libbz2.so.1.0 -o libbz2.so.1.0.8 $(OBJS)
+@@ -43,17 +43,5 @@ all: $(OBJS)
  clean: 
- 	rm -f $(OBJS) bzip2.o libbz2.so.1.0.6 libbz2.so.1.0 bzip2-shared
+ 	rm -f $(OBJS) bzip2.o libbz2.so.1.0.8 libbz2.so.1.0 bzip2-shared
  
 -blocksort.o: blocksort.c
 -	$(CC) $(CFLAGS) -c blocksort.c
diff --git a/package/bzip2/0002-improve-build-system.patch b/package/bzip2/0002-improve-build-system.patch
index 2d6e2cf900..11a856e49c 100644
--- a/package/bzip2/0002-improve-build-system.patch
+++ b/package/bzip2/0002-improve-build-system.patch
@@ -20,12 +20,14 @@ This patch makes a number of improvements to the bzip2 build system:
    appropriate symbolic links.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 Index: b/Makefile
 ===================================================================
 --- a/Makefile
 +++ b/Makefile
-@@ -20,8 +20,7 @@
+@@ -20,8 +20,7 @@ AR=ar
  RANLIB=ranlib
  LDFLAGS=
  
@@ -35,7 +37,7 @@ Index: b/Makefile
  
  # Where you want it installed when you do 'make install'
  PREFIX=/usr/local
-@@ -90,14 +89,14 @@
+@@ -90,14 +89,14 @@ install: bzip2 bzip2recover
  	cp -f libbz2.a $(PREFIX)/lib
  	chmod a+r $(PREFIX)/lib/libbz2.a
  	cp -f bzgrep $(PREFIX)/bin/bzgrep
@@ -66,9 +68,9 @@ Index: b/Makefile-libbz2_so
 -CFLAGS=-fpic -fPIC -Wall -Winline -O2 -g $(BIGFILES)
 +override CFLAGS += -fpic -fPIC -Wall
  
- OBJS= blocksort.o  \
-       huffman.o    \
-@@ -37,8 +36,11 @@
+ OBJS= blocksort.sho  \
+       huffman.sho    \
+@@ -37,8 +36,11 @@ OBJS= blocksort.sho  \
  all: $(OBJS)
  	$(CC) -shared -Wl,-soname -Wl,libbz2.so.1.0 -o libbz2.so.1.0.8 $(OBJS)
  	$(CC) $(CFLAGS) -o bzip2-shared bzip2.c libbz2.so.1.0.8
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
