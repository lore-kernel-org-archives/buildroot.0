Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538B3C2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 20:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 146F760733;
	Wed,  3 Jul 2024 20:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4YOHAhGpldwF; Wed,  3 Jul 2024 20:16:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F11C860909
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F11C860909;
	Wed,  3 Jul 2024 20:16:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 220471BF36E
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 20:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EF20418BE
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 20:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ucWn21Pzxt80 for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 20:16:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4C78415E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4C78415E3
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 20:16:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CAB0683BBB; Wed,  3 Jul 2024 20:16:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Jul 2024 22:14:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ac1b91806cbafa4819adb249305557352452884
X-Git-Newrev: 145adee2445835c76d59b7c8b8ac2f3ae54fddba
X-Patchwork-Hint: ignore
Message-Id: <20240703201650.CAB0683BBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lxc: update the patches to be
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=145adee2445835c76d59b7c8b8ac2f3ae54fddba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, lxc fails to build with output:

    Applying 0001-src-lxc-syscall_numbers.h-drop-define-1.patch using patch:
    patching file src/lxc/syscall_numbers.h
    Hunk #1 FAILED at 53.
    Hunk #2 FAILED at 92.
    Hunk #3 FAILED at 129.
    Hunk #4 FAILED at 166.
    Hunk #5 FAILED at 203.
    Hunk #6 FAILED at 272.
    Hunk #7 FAILED at 309.
    Hunk #8 FAILED at 346.
    Hunk #9 FAILED at 383.
    Hunk #10 FAILED at 440.
    Hunk #11 FAILED at 477.
    Hunk #12 FAILED at 518.
    Hunk #13 FAILED at 759.
    13 out of 13 hunks FAILED -- saving rejects to file src/lxc/syscall_numbers.h.rej

This commit refreshes the package patch on the current package version.

As you can see from [1], the patch was created for version v6.0.0 but
has been backported in Buildroot without being rebased on lxc v5.0.0,
where loongarch64 support was not yet merged. This is further evidence
of the importance of applying patches with fuzz 0.

[1] https://github.com/lxc/lxc/commit/82fe01821cd5cb8548598d7d93b07d6ef3f6b604
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...1-src-lxc-syscall_numbers.h-drop-define-1.patch | 87 ++++++++++++----------
 1 file changed, 46 insertions(+), 41 deletions(-)

diff --git a/package/lxc/0001-src-lxc-syscall_numbers.h-drop-define-1.patch b/package/lxc/0001-src-lxc-syscall_numbers.h-drop-define-1.patch
index 4a944e35b1..d6eb7476dc 100644
--- a/package/lxc/0001-src-lxc-syscall_numbers.h-drop-define-1.patch
+++ b/package/lxc/0001-src-lxc-syscall_numbers.h-drop-define-1.patch
@@ -1,4 +1,4 @@
-From 82fe01821cd5cb8548598d7d93b07d6ef3f6b604 Mon Sep 17 00:00:00 2001
+From 964740d28c9a0da52a75d579d7fdfa53df67e925 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Sat, 30 Mar 2024 16:50:46 +0100
 Subject: [PATCH] src/lxc/syscall_numbers.h: drop define -1
@@ -19,115 +19,120 @@ Fixes:
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Upstream: https://github.com/lxc/lxc/commit/82fe01821cd5cb8548598d7d93b07d6ef3f6b604
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  src/lxc/syscall_numbers.h | 13 -------------
  1 file changed, 13 deletions(-)
 
 diff --git a/src/lxc/syscall_numbers.h b/src/lxc/syscall_numbers.h
-index 58840a5981..5e659d1b81 100644
+index ae5fdd0641c6..5dc1259fef1c 100644
 --- a/src/lxc/syscall_numbers.h
 +++ b/src/lxc/syscall_numbers.h
-@@ -53,7 +53,6 @@
- 	#elif defined __loongarch64
- 		#define __NR_keyctl 219
+@@ -51,7 +51,6 @@
+ 			#define __NR_keyctl 5241
+ 		#endif
  	#else
 -		#define -1
  		#warning "__NR_keyctl not defined for your architecture"
  	#endif
  #endif
-@@ -92,7 +91,6 @@
- 	#elif defined __loongarch64
- 		#define __NR_memfd_create 279
+@@ -88,7 +87,6 @@
+ 			#define __NR_memfd_create 5314
+ 		#endif
  	#else
 -		#define -1
  		#warning "__NR_memfd_create not defined for your architecture"
  	#endif
  #endif
-@@ -129,7 +127,6 @@
- 	#elif defined __loongarch64
- 		#define __NR_pivot_root 41
+@@ -123,7 +121,6 @@
+ 			#define __NR_pivot_root 5151
+ 		#endif
  	#else
 -		#define -1
  		#warning "__NR_pivot_root not defined for your architecture"
  	#endif
  #endif
-@@ -166,7 +163,6 @@
- 	#elif defined __loongarch64
- 		#define __NR_setns 268
+@@ -158,7 +155,6 @@
+ 			#define __NR_setns 5303
+ 		#endif
  	#else
 -		#define -1
  		#warning "__NR_setns not defined for your architecture"
  	#endif
  #endif
-@@ -203,7 +199,6 @@
- 	#elif defined __loongarch64
- 		#define __NR_sethostname 161
+@@ -193,7 +189,6 @@
+ 			#define __NR_sethostname 5165
+ 		#endif
  	#else
 -		#define -1
  		#warning "__NR_sethostname not defined for your architecture"
  	#endif
  #endif
-@@ -272,7 +267,6 @@
- 	#elif defined __loongarch64
- 		#define __NR_signalfd4 74
+@@ -260,7 +255,6 @@
+ 			#define __NR_signalfd4 5283
+ 		#endif
  	#else
 -		#define -1
  		#warning "__NR_signalfd4 not defined for your architecture"
  	#endif
  #endif
-@@ -309,7 +303,6 @@
- 	#elif defined __loongarch64
- 		#define __NR_unshare 97
+@@ -295,7 +289,6 @@
+ 			#define __NR_unshare 5262
+ 		#endif
  	#else
 -		#define -1
  		#warning "__NR_unshare not defined for your architecture"
  	#endif
  #endif
-@@ -346,7 +339,6 @@
- 	#elif defined __loongarch64
- 		#define __NR_bpf 280
+@@ -330,7 +323,6 @@
+ 			#define __NR_bpf 5315
+ 		#endif
  	#else
 -		#define -1
  		#warning "__NR_bpf not defined for your architecture"
  	#endif
  #endif
-@@ -383,7 +375,6 @@
- 	#elif defined __loongarch64
- 		#define __NR_faccessat 48
+@@ -365,7 +357,6 @@
+ 			#define __NR_faccessat 5259
+ 		#endif
  	#else
 -		#define -1
  		#warning "__NR_faccessat not defined for your architecture"
  	#endif
  #endif
-@@ -440,7 +431,6 @@
- 	#elif defined __loongarch64
- 		#define __NR_seccomp 277
+@@ -420,7 +411,6 @@
+ 			#define __NR_seccomp 5312
+ 		#endif
  	#else
 -		#define -1
  		#warning "__NR_seccomp not defined for your architecture"
  	#endif
  #endif
-@@ -477,7 +467,6 @@
- 	#elif defined __loongarch64
- 		#define __NR_gettid 178
+@@ -455,7 +445,6 @@
+ 			#define __NR_gettid 5178
+ 		#endif
  	#else
 -		#define -1
  		#warning "__NR_gettid not defined for your architecture"
  	#endif
  #endif
-@@ -518,7 +507,6 @@
- 	#elif defined __loongarch64
- 		#define __NR_execveat 281
+@@ -494,7 +483,6 @@
+ 			#define __NR_execveat 5316
+ 		#endif
  	#else
 -		#define -1
  		#warning "__NR_execveat not defined for your architecture"
  	#endif
  #endif
-@@ -759,7 +747,6 @@
- 	#elif defined __loongarch64
- 		#define __NR_personality 92
+@@ -733,7 +721,6 @@
+ 			#define __NR_personality (132 + 5000)
+ 		#endif
  	#else
 -		#define -1
  		#warning "__NR_personality not defined for your architecture"
  	#endif
  #endif
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
