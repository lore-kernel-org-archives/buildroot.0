Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11AFFC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:44:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C34D16105A
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C34D16105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A17A740132;
	Thu, 14 Oct 2021 21:44:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gxUFPuq-eWVj; Thu, 14 Oct 2021 21:44:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E361440623;
	Thu, 14 Oct 2021 21:44:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DBD11BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6A1D823EB
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:42:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BbblVn4ZaJRX for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:42:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C3C5829DC
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:42:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 122529525D; Thu, 14 Oct 2021 21:39:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 23:33:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 541fb5b581a0004156b20f2230eb97981c2d86db
X-Git-Newrev: 34ae90610e75841cd0308f506c52189bc906033a
X-Patchwork-Hint: ignore
Message-Id: <20211014213947.122529525D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iozone: bump to version 3_492
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

commit: https://git.buildroot.net/buildroot/commit/?id=34ae90610e75841cd0308f506c52189bc906033a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reworked existing patch to make it apply to this version

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../iozone/0001-Add-new-targets-for-iozone.patch   | 22 +++++++++++-----------
 package/iozone/iozone.hash                         |  2 +-
 package/iozone/iozone.mk                           |  4 ++--
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/package/iozone/0001-Add-new-targets-for-iozone.patch b/package/iozone/0001-Add-new-targets-for-iozone.patch
index e6bfc18de6..3cc184ec8f 100644
--- a/package/iozone/0001-Add-new-targets-for-iozone.patch
+++ b/package/iozone/0001-Add-new-targets-for-iozone.patch
@@ -1,6 +1,6 @@
-From 1584ffbfda3277b82997b9f1e0ef31a7061560e0 Mon Sep 17 00:00:00 2001
+From 5b1e973b2333e838624abf195b3ba9716591f304 Mon Sep 17 00:00:00 2001
 From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Sun, 26 Aug 2018 18:39:06 +0200
+Date: Sun, 10 Oct 2021 10:15:26 +0200
 Subject: [PATCH] Add new targets for iozone:
 
 linux-noaio is for linux targets without AIO (use case: uClibc)
@@ -11,18 +11,18 @@ And make largefile support optional via CFLAGS.
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
 ---
- src/current/makefile | 56 +++++++++++++++++++++++++++++++++++++++++++---------
+ src/current/makefile | 56 +++++++++++++++++++++++++++++++++++++-------
  1 file changed, 47 insertions(+), 9 deletions(-)
 
 diff --git a/src/current/makefile b/src/current/makefile
-index cfef879..7925e62 100644
+index 3a54701..3b17b1b 100644
 --- a/src/current/makefile
 +++ b/src/current/makefile
-@@ -168,10 +168,28 @@ hpux_no_ansi:	iozone_hpux_no.o  libbif.o
+@@ -172,10 +172,28 @@ hpux_no_ansi:	iozone_hpux_no.o  libbif.o
  # GNU 'C' compiler Linux build with threads, largefiles, async I/O 
  #
  linux:	iozone_linux.o libasync.o libbif.o fileop_linux.o pit_server.o
--	$(CC)  -O3 $(LDFLAGS) iozone_linux.o libasync.o libbif.o -lpthread \
+-	$(CC)  -O3 $(CFLAGS) iozone_linux.o libasync.o libbif.o -lpthread \
 +	$(CC)  $(CFLAGS) $(LDFLAGS) iozone_linux.o libasync.o libbif.o \
 +		-lpthread -lrt -o iozone
 +	$(CC)  $(CFLAGS) -Dlinux fileop_linux.o -o fileop
@@ -43,14 +43,14 @@ index cfef879..7925e62 100644
 +linux-noth: iozone_linux-noth.o libbif.o fileop_linux.o pit_server.o
 +	$(CC)  $(CFLAGS) $(LDFLAGS) iozone_linux-noth.o libbif.o \
  		-lrt -o iozone
--	$(CC)  -O3 -Dlinux fileop_linux.o -o fileop
--	$(CC)  -O3 -Dlinux pit_server.o -o pit_server
+-	$(CC)  -O3 $(CFLAGS) -Dlinux fileop_linux.o -o fileop
+-	$(CC)  -O3 $(CFLAGS) -Dlinux pit_server.o -o pit_server
 +	$(CC)  $(CFLAGS) -Dlinux fileop_linux.o -o fileop
 +	$(CC)  $(CFLAGS) -Dlinux pit_server.o -o pit_server
  
  #
  # GNU 'C' compiler Linux build for powerpc chip with threads, largefiles, async I/O 
-@@ -814,13 +832,33 @@ iozone_linux.o:	iozone.c libbif.c libasync.c
+@@ -841,13 +859,33 @@ iozone_linux.o:	iozone.c libbif.c libasync.c
  	@echo ""
  	@echo "Building iozone for Linux"
  	@echo ""
@@ -89,7 +89,7 @@ index cfef879..7925e62 100644
  
  fileop_AIX.o:	fileop.c
  	@echo ""
-@@ -924,7 +962,7 @@ fileop_linux.o:	fileop.c
+@@ -951,7 +989,7 @@ fileop_linux.o:	fileop.c
  	@echo ""
  	@echo "Building fileop for Linux"
  	@echo ""
@@ -99,5 +99,5 @@ index cfef879..7925e62 100644
  fileop_openbsd.o:	fileop.c
  	@echo ""
 -- 
-2.7.4
+2.27.0
 
diff --git a/package/iozone/iozone.hash b/package/iozone/iozone.hash
index 61e8ff3abe..1255392e38 100644
--- a/package/iozone/iozone.hash
+++ b/package/iozone/iozone.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  5eadb4235ae2a956911204c50ebf2d8d8d59ddcd4a2841a1baf42f3145ad4fed  iozone3_490.tar
+sha256  93c9142d61e6a71ea43b0a266bad7f49f07ce5f5d31b36f8edf4dd386795c483  iozone3_492.tgz
diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
index 32d57ea76e..2282a44eb8 100644
--- a/package/iozone/iozone.mk
+++ b/package/iozone/iozone.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IOZONE_VERSION = 3.490
-IOZONE_SOURCE = iozone$(subst .,_,$(IOZONE_VERSION)).tar
+IOZONE_VERSION = 3.492
+IOZONE_SOURCE = iozone$(subst .,_,$(IOZONE_VERSION)).tgz
 IOZONE_SITE = http://www.iozone.org/src/current
 IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
 # IOzone license details can be found at:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
