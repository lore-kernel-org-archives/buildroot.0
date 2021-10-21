Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99BD5C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:36:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58D1F60C49
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 58D1F60C49
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3382382BBA;
	Thu, 21 Oct 2021 20:36:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2yeJXTCY7ooe; Thu, 21 Oct 2021 20:36:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D97B83CF4;
	Thu, 21 Oct 2021 20:36:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 702371BF318
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56A6E605BC
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:35:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J4gaORK2p9E9 for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 20:35:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F2F3605F8
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 20:35:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3FF2A88342; Thu, 21 Oct 2021 20:32:02 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Oct 2021 22:27:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6dbe782d49be8bd11e03877e4d31ed284dbd86ab
X-Git-Newrev: 90cbd3edab6db11fb52b8ca4704028617750eb36
X-Patchwork-Hint: ignore
Message-Id: <20211021203202.3FF2A88342@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nmap: bump to version 7.92
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

commit: https://git.buildroot.net/buildroot/commit/?id=90cbd3edab6db11fb52b8ca4704028617750eb36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In addition:
  - Remove upstream patch
  - Update license hash to reflect license version bump from 0.92 to 0.93

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/nmap/0002-ncat-unix-socket.patch | 30 ------------------------------
 package/nmap/nmap.hash                   |  6 +++---
 package/nmap/nmap.mk                     |  2 +-
 3 files changed, 4 insertions(+), 34 deletions(-)

diff --git a/package/nmap/0002-ncat-unix-socket.patch b/package/nmap/0002-ncat-unix-socket.patch
deleted file mode 100644
index b6484ebeea..0000000000
--- a/package/nmap/0002-ncat-unix-socket.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-ChangeLog:
-
-o [Ncat][GH#2154] Ncat no longer crashes when used with Unix domain sockets.
-
-Backported from: r38121
-
-Signed-off-by: Alexey Neyman <stilor@att.net>
-
-Index: ncat/ncat_main.c
-===================================================================
---- a/ncat/ncat_main.c	(revision 38120)
-+++ b/ncat/ncat_main.c	(revision 38121)
-@@ -846,7 +846,7 @@
-             targetaddrs->addr.un.sun_family = AF_UNIX;
-             strncpy(targetaddrs->addr.un.sun_path, argv[optind], sizeof(targetaddrs->addr.un.sun_path));
-             targetaddrs->addrlen = SUN_LEN(&targetaddrs->addr.un);
--            o.target = argv[optind];
-+            o.sslservername = o.target = argv[optind];
-             optind++;
-         } else
- #endif
-@@ -865,7 +865,7 @@
-                 targetaddrs->addr.vm.svm_cid = long_cid;
- 
-                 targetaddrs->addrlen = sizeof(targetaddrs->addr.vm);
--                o.target = argv[optind];
-+                o.sslservername = o.target = argv[optind];
-                 optind++;
-             }
-         } else
diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index 8f69bbf613..dc379f30d4 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,5 +1,5 @@
-# From https://nmap.org/dist/sigs/nmap-7.91.tar.bz2.digest.txt (lowercase)
-sha256  18cc4b5070511c51eb243cdd2b0b30ff9b2c4dc4544c6312f75ce3a67a593300  nmap-7.91.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.92.tar.bz2.digest.txt (lowercase)
+sha256  a5479f2f8a6b0b2516767d2f7189c386c1dc858d997167d7ec5cfc798c7571a1  nmap-7.92.tar.bz2
 
 # Locally calculated
-sha256  8254a9bc733f3312c6dcfe0d5a129c29e96ecb8b33408c652a8c7beb2e25b471  LICENSE
+sha256  133794301a764dfe8a60e38601e56657b7113e0337b452189725bbbed58baea0  LICENSE
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 34cf61ff0b..f3994e9b38 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.91
+NMAP_VERSION = 7.92
 NMAP_SITE = https://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = liblinear libpcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
