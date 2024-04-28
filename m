Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973B6C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 19:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6775D60647;
	Sun, 28 Apr 2024 19:46:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WO38Nf5WqZVt; Sun, 28 Apr 2024 19:46:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E2E460665
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E2E460665;
	Sun, 28 Apr 2024 19:46:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F8211BF870
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 19:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7828740433
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 19:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yDjnuhCgHToH for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 19:46:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C77A4016F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C77A4016F
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 19:46:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7565186230; Sun, 28 Apr 2024 19:46:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Apr 2024 21:33:25 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: e14d5578d603cfbc776c94fbbf8f318d307c52ac
X-Git-Newrev: 00da8187cd21a5526ae521d537b69a7cbe984e5e
X-Patchwork-Hint: ignore
Message-Id: <20240428194630.7565186230@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/lxc: fix m68k
 build with gcc 12
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

commit: https://git.buildroot.net/buildroot/commit/?id=00da8187cd21a5526ae521d537b69a7cbe984e5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fix the following m68k build failure with gcc 12:

In file included from ../src/lxc/syscall_wrappers.h:19,
                 from ../src/lxc/mount_utils.h:15,
                 from ../src/lxc/conf.h:24,
                 from ../src/lxc/log.h:19,
                 from ../src/lxc/storage/btrfs.c:20:
../src/lxc/syscall_numbers.h:423:25: error: macro names must be identifiers
  423 |                 #define -1
      |                         ^

Fixes:
 - http://autobuild.buildroot.org/results/f40a517eba86838b11b4b1d6a8a05b8233a3394d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f6453835d69f6a5bc9c2794464c3e4599f6c9fa0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-src-lxc-syscall_numbers.h-drop-define-1.patch | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/package/lxc/0001-src-lxc-syscall_numbers.h-drop-define-1.patch b/package/lxc/0001-src-lxc-syscall_numbers.h-drop-define-1.patch
new file mode 100644
index 0000000000..4a944e35b1
--- /dev/null
+++ b/package/lxc/0001-src-lxc-syscall_numbers.h-drop-define-1.patch
@@ -0,0 +1,133 @@
+From 82fe01821cd5cb8548598d7d93b07d6ef3f6b604 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 30 Mar 2024 16:50:46 +0100
+Subject: [PATCH] src/lxc/syscall_numbers.h: drop define -1
+
+Drop "#define -1" to avoid the following m68k build failure with gcc 12:
+
+In file included from ../src/lxc/syscall_wrappers.h:19,
+                 from ../src/lxc/mount_utils.h:15,
+                 from ../src/lxc/conf.h:24,
+                 from ../src/lxc/log.h:19,
+                 from ../src/lxc/storage/btrfs.c:20:
+../src/lxc/syscall_numbers.h:423:25: error: macro names must be identifiers
+  423 |                 #define -1
+      |                         ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/f40a517eba86838b11b4b1d6a8a05b8233a3394d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/lxc/lxc/commit/82fe01821cd5cb8548598d7d93b07d6ef3f6b604
+---
+ src/lxc/syscall_numbers.h | 13 -------------
+ 1 file changed, 13 deletions(-)
+
+diff --git a/src/lxc/syscall_numbers.h b/src/lxc/syscall_numbers.h
+index 58840a5981..5e659d1b81 100644
+--- a/src/lxc/syscall_numbers.h
++++ b/src/lxc/syscall_numbers.h
+@@ -53,7 +53,6 @@
+ 	#elif defined __loongarch64
+ 		#define __NR_keyctl 219
+ 	#else
+-		#define -1
+ 		#warning "__NR_keyctl not defined for your architecture"
+ 	#endif
+ #endif
+@@ -92,7 +91,6 @@
+ 	#elif defined __loongarch64
+ 		#define __NR_memfd_create 279
+ 	#else
+-		#define -1
+ 		#warning "__NR_memfd_create not defined for your architecture"
+ 	#endif
+ #endif
+@@ -129,7 +127,6 @@
+ 	#elif defined __loongarch64
+ 		#define __NR_pivot_root 41
+ 	#else
+-		#define -1
+ 		#warning "__NR_pivot_root not defined for your architecture"
+ 	#endif
+ #endif
+@@ -166,7 +163,6 @@
+ 	#elif defined __loongarch64
+ 		#define __NR_setns 268
+ 	#else
+-		#define -1
+ 		#warning "__NR_setns not defined for your architecture"
+ 	#endif
+ #endif
+@@ -203,7 +199,6 @@
+ 	#elif defined __loongarch64
+ 		#define __NR_sethostname 161
+ 	#else
+-		#define -1
+ 		#warning "__NR_sethostname not defined for your architecture"
+ 	#endif
+ #endif
+@@ -272,7 +267,6 @@
+ 	#elif defined __loongarch64
+ 		#define __NR_signalfd4 74
+ 	#else
+-		#define -1
+ 		#warning "__NR_signalfd4 not defined for your architecture"
+ 	#endif
+ #endif
+@@ -309,7 +303,6 @@
+ 	#elif defined __loongarch64
+ 		#define __NR_unshare 97
+ 	#else
+-		#define -1
+ 		#warning "__NR_unshare not defined for your architecture"
+ 	#endif
+ #endif
+@@ -346,7 +339,6 @@
+ 	#elif defined __loongarch64
+ 		#define __NR_bpf 280
+ 	#else
+-		#define -1
+ 		#warning "__NR_bpf not defined for your architecture"
+ 	#endif
+ #endif
+@@ -383,7 +375,6 @@
+ 	#elif defined __loongarch64
+ 		#define __NR_faccessat 48
+ 	#else
+-		#define -1
+ 		#warning "__NR_faccessat not defined for your architecture"
+ 	#endif
+ #endif
+@@ -440,7 +431,6 @@
+ 	#elif defined __loongarch64
+ 		#define __NR_seccomp 277
+ 	#else
+-		#define -1
+ 		#warning "__NR_seccomp not defined for your architecture"
+ 	#endif
+ #endif
+@@ -477,7 +467,6 @@
+ 	#elif defined __loongarch64
+ 		#define __NR_gettid 178
+ 	#else
+-		#define -1
+ 		#warning "__NR_gettid not defined for your architecture"
+ 	#endif
+ #endif
+@@ -518,7 +507,6 @@
+ 	#elif defined __loongarch64
+ 		#define __NR_execveat 281
+ 	#else
+-		#define -1
+ 		#warning "__NR_execveat not defined for your architecture"
+ 	#endif
+ #endif
+@@ -759,7 +747,6 @@
+ 	#elif defined __loongarch64
+ 		#define __NR_personality 92
+ 	#else
+-		#define -1
+ 		#warning "__NR_personality not defined for your architecture"
+ 	#endif
+ #endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
