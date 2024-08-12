Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7DDE6FE47
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 19:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39FF784124;
	Fri,  6 Sep 2024 19:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3PwNZZ7h7AZH; Fri,  6 Sep 2024 19:59:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40FAF84192
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40FAF84192;
	Fri,  6 Sep 2024 19:59:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DEE01BF37F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10EB16077B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xE0Z91kjoXEz for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7A816066B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7A816066B
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C652286EE4; Fri,  6 Sep 2024 19:58:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Aug 2024 21:27:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25ef4c7d708b882d0433fe1e82ae470135479469
X-Git-Newrev: 542b0dc4f601d550a69a209614520673fb4c0583
X-Patchwork-Hint: ignore
Message-Id: <20240906195852.C652286EE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: fix st_mtim issue
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
Content-Type: multipart/mixed; boundary="===============5249303045289637955=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5249303045289637955==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=542b0dc4f601d550a69a209614520673fb4c0583
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The first patch to fix this issue was incomplete.
Add a patch to also fix all other architectures.

Fixes:
 - http://autobuild.buildroot.net/results/f3b/f3b3942b6b645d9523ab08d179a3f8aca7d6641c

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Reviewed-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-Declare-st_mtim-if-defined-__USE_XOPEN2K.patch | 132 +++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/package/uclibc/0005-bits-stat.h-Declare-st_mtim-if-defined-__USE_XOPEN2K.patch b/package/uclibc/0005-bits-stat.h-Declare-st_mtim-if-defined-__USE_XOPEN2K.patch
new file mode 100644
index 0000000000..749a098406
--- /dev/null
+++ b/package/uclibc/0005-bits-stat.h-Declare-st_mtim-if-defined-__USE_XOPEN2K.patch
@@ -0,0 +1,132 @@
+From 354129807db12c792696b74d0cd38f2c5d2fd704 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Fri, 9 Aug 2024 06:16:02 +0200
+Subject: [PATCH] bits/stat.h: Declare st_mtim if defined(__USE_XOPEN2K8),
+ add missing
+
+d0c8c185b439187b12644457bb2aa0326f25aaf7 was not complete, add
+missing architectures.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=354129807db12c792696b74d0cd38f2c5d2fd704
+---
+ libc/sysdeps/linux/mips/bits/stat.h    | 4 ++--
+ libc/sysdeps/linux/sparc/bits/stat.h   | 4 ++--
+ libc/sysdeps/linux/sparc64/bits/stat.h | 4 ++--
+ libc/sysdeps/linux/x86_64/bits/stat.h  | 4 ++--
+ libc/sysdeps/linux/xtensa/bits/stat.h  | 4 ++--
+ 5 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/libc/sysdeps/linux/mips/bits/stat.h b/libc/sysdeps/linux/mips/bits/stat.h
+index bad2a0244..81d2e4687 100644
+--- a/libc/sysdeps/linux/mips/bits/stat.h
++++ b/libc/sysdeps/linux/mips/bits/stat.h
+@@ -145,7 +145,7 @@ struct stat64
+     __dev_t st_rdev;	/* Device number, if device.  */
+     long int st_pad2[2];
+     __off64_t st_size;		/* Size of file, in bytes.  */
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+@@ -184,7 +184,7 @@ struct stat64 {
+     unsigned int st_rdev;	/* Device number, if device.  */
+     int st_pad2[3];
+     __off_t st_size;		/* Size of file, in bytes.  */
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+diff --git a/libc/sysdeps/linux/sparc/bits/stat.h b/libc/sysdeps/linux/sparc/bits/stat.h
+index b88885fe2..0fbef8b3f 100644
+--- a/libc/sysdeps/linux/sparc/bits/stat.h
++++ b/libc/sysdeps/linux/sparc/bits/stat.h
+@@ -53,7 +53,7 @@ struct stat
+ #else
+     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
+ #endif
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+@@ -93,7 +93,7 @@ struct stat64
+     __blksize_t st_blksize;		/* Optimal block size for I/O.  */
+ 
+     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+diff --git a/libc/sysdeps/linux/sparc64/bits/stat.h b/libc/sysdeps/linux/sparc64/bits/stat.h
+index 8516b159c..62b48b745 100644
+--- a/libc/sysdeps/linux/sparc64/bits/stat.h
++++ b/libc/sysdeps/linux/sparc64/bits/stat.h
+@@ -58,7 +58,7 @@ struct stat
+ #else
+     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
+ #endif
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+@@ -101,7 +101,7 @@ struct stat64
+     __blksize_t st_blksize;		/* Optimal block size for I/O.  */
+ 
+     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+diff --git a/libc/sysdeps/linux/x86_64/bits/stat.h b/libc/sysdeps/linux/x86_64/bits/stat.h
+index a7412c8f9..a8c75feaa 100644
+--- a/libc/sysdeps/linux/x86_64/bits/stat.h
++++ b/libc/sysdeps/linux/x86_64/bits/stat.h
+@@ -77,7 +77,7 @@ struct stat
+ #else
+     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
+ #endif
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+@@ -138,7 +138,7 @@ struct stat64
+ #endif
+     __blksize_t st_blksize;	/* Optimal block size for I/O.  */
+     __blkcnt64_t st_blocks;	/* Nr. 512-byte blocks allocated.  */
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+diff --git a/libc/sysdeps/linux/xtensa/bits/stat.h b/libc/sysdeps/linux/xtensa/bits/stat.h
+index 045a017fd..43af825ec 100644
+--- a/libc/sysdeps/linux/xtensa/bits/stat.h
++++ b/libc/sysdeps/linux/xtensa/bits/stat.h
+@@ -54,7 +54,7 @@ struct stat
+     unsigned long __pad2;
+     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
+ #endif
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+@@ -94,7 +94,7 @@ struct stat64
+ 
+     unsigned long __pad2;
+     __blkcnt64_t st_blocks;		/* Number 512-byte blocks allocated. */
+-#ifdef __USE_MISC
++#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
+     /* Nanosecond resolution timestamps are stored in a format
+        equivalent to 'struct timespec'.  This is the type used
+        whenever possible but the Unix namespace rules do not allow the
+-- 
+2.30.2
+

--===============5249303045289637955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5249303045289637955==--
