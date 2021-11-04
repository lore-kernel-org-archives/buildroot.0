Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FBFC433F5
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 12:38:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6A6C61139
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 12:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A6A6C61139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79B8E80C29;
	Thu,  4 Nov 2021 12:38:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mge3BtDm63Q1; Thu,  4 Nov 2021 12:38:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F02B480C3F;
	Thu,  4 Nov 2021 12:38:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24F161BF9D1
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 12:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8618817C0
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 12:38:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3jrVEdAWdHDE for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 12:38:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CCC980F94
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 12:38:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DE0868A584; Thu,  4 Nov 2021 12:34:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 4 Nov 2021 13:36:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b518033e2ee0cb38430374c5b3781459d3c61d6
X-Git-Newrev: 585fd6b6d94d0c6479741a471da7b91dfd9bda8f
X-Patchwork-Hint: ignore
Message-Id: <20211104123429.DE0868A584@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dhcpcd: bump to version 9.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=585fd6b6d94d0c6479741a471da7b91dfd9bda8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop all patches (already in version)
- Update hash of LICENSE file (update in year:
  https://github.com/NetworkConfiguration/dhcpcd/commit/5ab0a4e2abc49448f1a7b10de86c6f4acb51d53d)

https://roy.marples.name/projects/posts/dhcpcd-9-4-1_released

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-privsep-linux.c-add-support-for-nds32-21.patch | 45 ----------------
 ...privsep-linux.c-add-support-for-xtensa-22.patch | 42 ---------------
 ...003-Linux-Add-support-for-NDS32BE-SECCOMP.patch | 31 -----------
 package/dhcpcd/0004-Typo-with-prior.patch          | 27 ----------
 ...-privsep-linux.c-add-support-for-nios2-23.patch | 42 ---------------
 ...sep-linux.c-add-support-for-microblaze-24.patch | 42 ---------------
 ...src-privsep-linux.c-add-support-for-sh-25.patch | 54 -------------------
 ...8-src-privsep-linux-fix-build-on-sparc-26.patch | 45 ----------------
 ...c-privsep-linux.c-add-support-for-or1k-27.patch | 41 --------------
 ...rc-privsep-linux.c-add-support-for-arc-28.patch | 62 ----------------------
 ...-src-privsep-linux.c-add-support-for-m68k.patch | 37 -------------
 package/dhcpcd/dhcpcd.hash                         |  6 +--
 package/dhcpcd/dhcpcd.mk                           |  2 +-
 13 files changed, 4 insertions(+), 472 deletions(-)

diff --git a/package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32-21.patch b/package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32-21.patch
deleted file mode 100644
index 5d28fca516..0000000000
--- a/package/dhcpcd/0001-src-privsep-linux.c-add-support-for-nds32-21.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 92dc3bd959681cf65d4a3466c89233cf0411b693 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 30 Jan 2021 12:10:08 +0100
-Subject: [PATCH] src/privsep-linux.c: add support for nds32 (#21)
-
-Fix the following build failure:
-
-privsep-linux.c:206:4: error: #error "Platform does not support seccomp filter yet"
- #  error "Platform does not support seccomp filter yet"
-    ^~~~~
-In file included from privsep-linux.c:36:
-privsep-linux.c:213:38: error: 'SECCOMP_AUDIT_ARCH' undeclared here (not in a function); did you mean 'SECCOMP_ALLOW_ARG'?
-  BPF_JUMP(BPF_JMP + BPF_JEQ + BPF_K, SECCOMP_AUDIT_ARCH, 1, 0),
-                                      ^~~~~~~~~~~~~~~~~~
-
-It should be noted that AUDIT_ARCH_NDS32 is only defined since kernel
-5.2 and
-https://github.com/torvalds/linux/commit/fa562447e154334523daa44c0b60625d71a345f5
-
-Fixes:
- - http://autobuild.buildroot.org/results/af8ba07ea0c12ab8cd24d528ef98db05521f3d36
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-(cherry picked from commit 3848e7204f23bb78eb42dcde4898c70aca67d58d)
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- src/privsep-linux.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/privsep-linux.c b/src/privsep-linux.c
-index d31d720d..8716032c 100644
---- a/src/privsep-linux.c
-+++ b/src/privsep-linux.c
-@@ -182,6 +182,8 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
- #  else
- #    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_MIPS
- #  endif
-+#elif defined(__nds32__)
-+#  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_NDS32
- #elif defined(__powerpc64__)
- #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC64
- #elif defined(__powerpc__)
--- 
-2.29.2
-
diff --git a/package/dhcpcd/0002-src-privsep-linux.c-add-support-for-xtensa-22.patch b/package/dhcpcd/0002-src-privsep-linux.c-add-support-for-xtensa-22.patch
deleted file mode 100644
index f1789b13f1..0000000000
--- a/package/dhcpcd/0002-src-privsep-linux.c-add-support-for-xtensa-22.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 1a77d82b0020ff4c71ffe55262676c3403978bd5 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 31 Jan 2021 03:35:10 +0100
-Subject: [PATCH]  src/privsep-linux.c: add support for xtensa (#22)
-
-Fix the following build failure:
-
-privsep-linux.c:206:4: error: #error "Platform does not support seccomp filter yet"
- #  error "Platform does not support seccomp filter yet"
-    ^~~~~
-In file included from privsep-linux.c:36:
-privsep-linux.c:213:38: error: 'SECCOMP_AUDIT_ARCH' undeclared here (not in a function); did you mean 'SECCOMP_ALLOW_ARG'?
-  BPF_JUMP(BPF_JMP + BPF_JEQ + BPF_K, SECCOMP_AUDIT_ARCH, 1, 0),
-                                      ^~~~~~~~~~~~~~~~~~
-
-It should be noted that AUDIT_ARCH_XTENSA is only defined since kernel
-5.0 and
-https://github.com/torvalds/linux/commit/98c3115a4ec56f03056efd9295e0fcb4c5c57a85
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-(cherry picked from commit 19c3d9209a834e02918a17e011afd9da3e5be38d)
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- src/privsep-linux.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/privsep-linux.c b/src/privsep-linux.c
-index 8716032c..f1b33f91 100644
---- a/src/privsep-linux.c
-+++ b/src/privsep-linux.c
-@@ -204,6 +204,8 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
- #  else
- #    define AUDIT_ARCH_SPARC
- #  endif
-+#elif defined(__xtensa__)
-+#  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_XTENSA
- #else
- #  error "Platform does not support seccomp filter yet"
- #endif
--- 
-2.29.2
-
diff --git a/package/dhcpcd/0003-Linux-Add-support-for-NDS32BE-SECCOMP.patch b/package/dhcpcd/0003-Linux-Add-support-for-NDS32BE-SECCOMP.patch
deleted file mode 100644
index de95268849..0000000000
--- a/package/dhcpcd/0003-Linux-Add-support-for-NDS32BE-SECCOMP.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 4d2ef61b8b4abcb446699b9d3c29b422f2cf9826 Mon Sep 17 00:00:00 2001
-From: Roy Marples <roy@marples.name>
-Date: Sun, 31 Jan 2021 07:37:03 +0000
-Subject: [PATCH] Linux: Add support for NDS32BE SECCOMP
-
-(cherry picked from commit 8253ef16e11db8b52af1ed8021cd2517046165d6)
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- src/privsep-linux.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/privsep-linux.c b/src/privsep-linux.c
-index f1b33f91..04950ed2 100644
---- a/src/privsep-linux.c
-+++ b/src/privsep-linux.c
-@@ -183,7 +183,11 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
- #    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_MIPS
- #  endif
- #elif defined(__nds32__)
--#  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_NDS32
-+#  if (BYTE_ORDER == LITTLE_ENDIAN)
-+#    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_NDS32
-+#ele
-+#    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_NDS32BE
-+#endif
- #elif defined(__powerpc64__)
- #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC64
- #elif defined(__powerpc__)
--- 
-2.29.2
-
diff --git a/package/dhcpcd/0004-Typo-with-prior.patch b/package/dhcpcd/0004-Typo-with-prior.patch
deleted file mode 100644
index 9c98895713..0000000000
--- a/package/dhcpcd/0004-Typo-with-prior.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 59f67be640881eaf56cc30c304362af00523ff5d Mon Sep 17 00:00:00 2001
-From: Roy Marples <roy@marples.name>
-Date: Sun, 31 Jan 2021 10:08:11 +0000
-Subject: [PATCH] Typo with prior
-
-(cherry picked from commit d8d7f68001db3f084dfbb6e5b8ea4491088b55ba)
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- src/privsep-linux.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/privsep-linux.c b/src/privsep-linux.c
-index 04950ed2..1660447c 100644
---- a/src/privsep-linux.c
-+++ b/src/privsep-linux.c
-@@ -185,7 +185,7 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
- #elif defined(__nds32__)
- #  if (BYTE_ORDER == LITTLE_ENDIAN)
- #    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_NDS32
--#ele
-+#else
- #    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_NDS32BE
- #endif
- #elif defined(__powerpc64__)
--- 
-2.29.2
-
diff --git a/package/dhcpcd/0005-src-privsep-linux.c-add-support-for-nios2-23.patch b/package/dhcpcd/0005-src-privsep-linux.c-add-support-for-nios2-23.patch
deleted file mode 100644
index ac1ef071a1..0000000000
--- a/package/dhcpcd/0005-src-privsep-linux.c-add-support-for-nios2-23.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 24ca5bdd409dd811a088bc702a2b6f99ea05ad19 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 31 Jan 2021 11:12:21 +0100
-Subject: [PATCH]  src/privsep-linux.c: add support for nios2 (#23)
-
-Fix the following build failure:
-
-privsep-linux.c:206:4: error: #error "Platform does not support seccomp filter yet"
- #  error "Platform does not support seccomp filter yet"
-    ^~~~~
-In file included from privsep-linux.c:36:
-privsep-linux.c:213:38: error: 'SECCOMP_AUDIT_ARCH' undeclared here (not in a function); did you mean 'SECCOMP_ALLOW_ARG'?
-  BPF_JUMP(BPF_JMP + BPF_JEQ + BPF_K, SECCOMP_AUDIT_ARCH, 1, 0),
-                                      ^~~~~~~~~~~~~~~~~~
-
-It should be noted that AUDIT_ARCH_NIOS2 is only defined since kernel
-5.2 and
-https://github.com/torvalds/linux/commit/1660aac45e5b49a5ace29fb5b73254617533fcbd
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-(cherry picked from commit d670866ce008c21cbf6d5b20c4d4af6460ec35d2)
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- src/privsep-linux.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/privsep-linux.c b/src/privsep-linux.c
-index 1660447c..e374c068 100644
---- a/src/privsep-linux.c
-+++ b/src/privsep-linux.c
-@@ -188,6 +188,8 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
- #else
- #    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_NDS32BE
- #endif
-+#elif defined(__nios2__)
-+#  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_NIOS2
- #elif defined(__powerpc64__)
- #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC64
- #elif defined(__powerpc__)
--- 
-2.29.2
-
diff --git a/package/dhcpcd/0006-src-privsep-linux.c-add-support-for-microblaze-24.patch b/package/dhcpcd/0006-src-privsep-linux.c-add-support-for-microblaze-24.patch
deleted file mode 100644
index 245faed476..0000000000
--- a/package/dhcpcd/0006-src-privsep-linux.c-add-support-for-microblaze-24.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 89a2f250ed978950aecf4854d1cee16f57946759 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 31 Jan 2021 21:57:40 +0100
-Subject: [PATCH]  src/privsep-linux.c: add support for microblaze (#24)
-
-Fix the following build failure:
-
-privsep-linux.c:206:4: error: #error "Platform does not support seccomp filter yet"
- #  error "Platform does not support seccomp filter yet"
-    ^~~~~
-In file included from privsep-linux.c:36:
-privsep-linux.c:213:38: error: 'SECCOMP_AUDIT_ARCH' undeclared here (not in a function); did you mean 'SECCOMP_ALLOW_ARG'?
-  BPF_JUMP(BPF_JMP + BPF_JEQ + BPF_K, SECCOMP_AUDIT_ARCH, 1, 0),
-                                      ^~~~~~~~~~~~~~~~~~
-
-It should be noted that AUDIT_ARCH_MICROBLAZE is only defined since
-kernel 3.18 and
-https://github.com/torvalds/linux/commit/ce5d112827e5c2e9864323d0efd7ec2a62c6dce0
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-(cherry picked from commit e3a40586dbb584774d0a17bc277e69cb500cfa38)
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- src/privsep-linux.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/privsep-linux.c b/src/privsep-linux.c
-index e374c068..a861a836 100644
---- a/src/privsep-linux.c
-+++ b/src/privsep-linux.c
-@@ -170,6 +170,8 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
- #  endif
- #elif defined(__ia64__)
- #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_IA64
-+#elif defined(__microblaze__)
-+#  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_MICROBLAZE
- #elif defined(__mips__)
- #  if defined(__MIPSEL__)
- #    if defined(__LP64__)
--- 
-2.29.2
-
diff --git a/package/dhcpcd/0007-src-privsep-linux.c-add-support-for-sh-25.patch b/package/dhcpcd/0007-src-privsep-linux.c-add-support-for-sh-25.patch
deleted file mode 100644
index b9c023805e..0000000000
--- a/package/dhcpcd/0007-src-privsep-linux.c-add-support-for-sh-25.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 10acecc0583b7301cb539ba6875618956fa3d13b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 5 Feb 2021 09:05:54 +0100
-Subject: [PATCH] src/privsep-linux.c: add support for sh (#25)
-
-Fix the following build failure:
-
-privsep-linux.c:206:4: error: #error "Platform does not support seccomp filter yet"
- #  error "Platform does not support seccomp filter yet"
-    ^~~~~
-In file included from privsep-linux.c:36:
-privsep-linux.c:213:38: error: 'SECCOMP_AUDIT_ARCH' undeclared here (not in a function); did you mean 'SECCOMP_ALLOW_ARG'?
-  BPF_JUMP(BPF_JMP + BPF_JEQ + BPF_K, SECCOMP_AUDIT_ARCH, 1, 0),
-                                      ^~~~~~~~~~~~~~~~~~
-
-It should be noted that AUDIT_ARCH_{SH,SHEL,SH64,SHEL64} are defined at
-least since kernel 3.7 and
-https://github.com/torvalds/linux/commit/607ca46e97a1b6594b29647d98a32d545c24bdff
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-(cherry picked from commit 166491c2953546a677073694036f43a65fc25063)
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- src/privsep-linux.c | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-diff --git a/src/privsep-linux.c b/src/privsep-linux.c
-index a861a836..428ea4b0 100644
---- a/src/privsep-linux.c
-+++ b/src/privsep-linux.c
-@@ -206,6 +206,20 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
- #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_S390X
- #elif defined(__s390__)
- #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_S390
-+#elif defined(__sh__)
-+#  if defined(__LP64__)
-+#    if (BYTE_ORDER == LITTLE_ENDIAN)
-+#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_SHEL64
-+#    else
-+#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_SH64
-+#    endif
-+#  else
-+#    if (BYTE_ORDER == LITTLE_ENDIAN)
-+#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_SHEL
-+#    else
-+#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_SH
-+#    endif
-+#  endif
- #elif defined(__sparc__)
- #  if defined(__arch64__)
- #    define AUDIT_ARCH_SPARC64
--- 
-2.29.2
-
diff --git a/package/dhcpcd/0008-src-privsep-linux-fix-build-on-sparc-26.patch b/package/dhcpcd/0008-src-privsep-linux-fix-build-on-sparc-26.patch
deleted file mode 100644
index 06199228ce..0000000000
--- a/package/dhcpcd/0008-src-privsep-linux-fix-build-on-sparc-26.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From be36eccb1ae53422f2aa9b42f257baeb21bd8be7 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 5 Feb 2021 09:25:12 +0100
-Subject: [PATCH] src/privsep-linux: fix build on sparc (#26)
-
-Fix the following build failure:
-
-privsep-linux.c:203: warning: "AUDIT_ARCH_SPARC64" redefined
-  203 | #    define AUDIT_ARCH_SPARC64
-      |
-In file included from privsep-linux.c:35:
-/srv/storage/autobuild/run/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/linux/audit.h:392: note: this is the location of the previous definition
-  392 | #define AUDIT_ARCH_SPARC64 (EM_SPARCV9|__AUDIT_ARCH_64BIT)
-      |
-In file included from privsep-linux.c:36:
-privsep-linux.c:215:38: error: 'SECCOMP_AUDIT_ARCH' undeclared here (not in a function); did you mean 'SECCOMP_ALLOW_ARG'?
-  215 |  BPF_JUMP(BPF_JMP + BPF_JEQ + BPF_K, SECCOMP_AUDIT_ARCH, 1, 0),
-      |                                      ^~~~~~~~~~~~~~~~~~
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-(cherry picked from commit dcfd7a23f002793a855156255e81662ef84064d3)
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- src/privsep-linux.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/privsep-linux.c b/src/privsep-linux.c
-index 428ea4b0..8093740a 100644
---- a/src/privsep-linux.c
-+++ b/src/privsep-linux.c
-@@ -222,9 +222,9 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
- #  endif
- #elif defined(__sparc__)
- #  if defined(__arch64__)
--#    define AUDIT_ARCH_SPARC64
-+#    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_SPARC64
- #  else
--#    define AUDIT_ARCH_SPARC
-+#    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_SPARC
- #  endif
- #elif defined(__xtensa__)
- #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_XTENSA
--- 
-2.29.2
-
diff --git a/package/dhcpcd/0009-src-privsep-linux.c-add-support-for-or1k-27.patch b/package/dhcpcd/0009-src-privsep-linux.c-add-support-for-or1k-27.patch
deleted file mode 100644
index 3756cac7e9..0000000000
--- a/package/dhcpcd/0009-src-privsep-linux.c-add-support-for-or1k-27.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 617e3a44137cbba55afae24f6754580916bb770b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 7 Feb 2021 09:43:14 +0100
-Subject: [PATCH] src/privsep-linux.c: add support for or1k (#27)
-
-Fix the following build failure:
-
-privsep-linux.c:206:4: error: #error "Platform does not support seccomp filter yet"
- #  error "Platform does not support seccomp filter yet"
-    ^~~~~
-In file included from privsep-linux.c:36:
-privsep-linux.c:213:38: error: 'SECCOMP_AUDIT_ARCH' undeclared here (not in a function); did you mean 'SECCOMP_ALLOW_ARG'?
-  BPF_JUMP(BPF_JMP + BPF_JEQ + BPF_K, SECCOMP_AUDIT_ARCH, 1, 0),
-                                      ^~~~~~~~~~~~~~~~~~
-
-It should be noted that AUDIT_ARCH_OPENRISC is defined since kernel 3.7:
-https://github.com/torvalds/linux/commit/e2bebb4ae6d9ac4ffc524db67f7ecb205a173f77
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-(cherry picked from commit f3f7332001d5d5722239f6b7279f32923e4eedd0)
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- src/privsep-linux.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/privsep-linux.c b/src/privsep-linux.c
-index 8093740a..58df5c30 100644
---- a/src/privsep-linux.c
-+++ b/src/privsep-linux.c
-@@ -192,6 +192,8 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
- #endif
- #elif defined(__nios2__)
- #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_NIOS2
-+#elif defined(__or1k__)
-+#  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_OPENRISC
- #elif defined(__powerpc64__)
- #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC64
- #elif defined(__powerpc__)
--- 
-2.29.2
-
diff --git a/package/dhcpcd/0010-src-privsep-linux.c-add-support-for-arc-28.patch b/package/dhcpcd/0010-src-privsep-linux.c-add-support-for-arc-28.patch
deleted file mode 100644
index b7b3e153eb..0000000000
--- a/package/dhcpcd/0010-src-privsep-linux.c-add-support-for-arc-28.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 1b6b6329daf70e29221f341ef1946717f158ec8a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 8 Feb 2021 07:23:54 +0100
-Subject: [PATCH] src/privsep-linux.c: add support for arc (#28)
-
-Fix the following build failure:
-
-privsep-linux.c:206:4: error: #error "Platform does not support seccomp filter yet"
- #  error "Platform does not support seccomp filter yet"
-    ^~~~~
-In file included from privsep-linux.c:36:
-privsep-linux.c:213:38: error: 'SECCOMP_AUDIT_ARCH' undeclared here (not in a function); did you mean 'SECCOMP_ALLOW_ARG'?
-  BPF_JUMP(BPF_JMP + BPF_JEQ + BPF_K, SECCOMP_AUDIT_ARCH, 1, 0),
-                                      ^~~~~~~~~~~~~~~~~~
-
-It should be noted that AUDIT_ARCH_{ARCOMPACT,ARCV2} is only defined
-since kernel 5.2 and
-https://github.com/torvalds/linux/commit/67f2a8a29311841ba6ab9b0e2d1b8f1e9978cd84
-
-Detection of arc compact and arc v2 have been "copy/pasted" from
-https://github.com/wbx-github/uclibc-ng/commit/afab56958f1cbb47b831ee3ebff231dfbae74af2
-
-Fixes:
- - http://autobuild.buildroot.org/results/d29083700a80dd647621eed06faeeae03f0587d3
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-(cherry picked from commit 82386110e67cf75c224e9817fce55e6b0f143266)
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- src/privsep-linux.c | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
-
-diff --git a/src/privsep-linux.c b/src/privsep-linux.c
-index 58df5c30..fc269a5c 100644
---- a/src/privsep-linux.c
-+++ b/src/privsep-linux.c
-@@ -149,6 +149,22 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
- #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_I386
- #elif defined(__x86_64__)
- #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_X86_64
-+#elif defined(__arc__)
-+#  if defined(__A7__)
-+#    if (BYTE_ORDER == LITTLE_ENDIAN)
-+#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCOMPACT
-+#    else
-+#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCOMPACTBE
-+#    endif
-+#  elif defined(__HS__)
-+#    if (BYTE_ORDER == LITTLE_ENDIAN)
-+#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCV2
-+#    else
-+#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCV2BE
-+#    endif
-+#  else
-+#    error "Platform does not support seccomp filter yet"
-+#  endif
- #elif defined(__arm__)
- #  ifndef EM_ARM
- #    define EM_ARM 40
--- 
-2.29.2
-
diff --git a/package/dhcpcd/0011-src-privsep-linux.c-add-support-for-m68k.patch b/package/dhcpcd/0011-src-privsep-linux.c-add-support-for-m68k.patch
deleted file mode 100644
index 8fe80d4266..0000000000
--- a/package/dhcpcd/0011-src-privsep-linux.c-add-support-for-m68k.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From f7721a6728bfd786604474df051f463a12dd0335 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 5 Mar 2021 12:22:13 +0100
-Subject: [PATCH] src/privsep-linux.c: add support for m68k
-
-Fix the following build failure:
-
-privsep-linux.c:206:4: error: #error "Platform does not support seccomp filter yet"
- #  error "Platform does not support seccomp filter yet"
-    ^~~~~
-In file included from privsep-linux.c:36:
-privsep-linux.c:213:38: error: 'SECCOMP_AUDIT_ARCH' undeclared here (not in a function); did you mean 'SECCOMP_ALLOW_ARG'?
-  BPF_JUMP(BPF_JMP + BPF_JEQ + BPF_K, SECCOMP_AUDIT_ARCH, 1, 0),
-                                      ^~~~~~~~~~~~~~~~~~
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/rsmarples/dhcpcd/pull/29]
----
- src/privsep-linux.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/privsep-linux.c b/src/privsep-linux.c
-index 21d41a9a..7dc92083 100644
---- a/src/privsep-linux.c
-+++ b/src/privsep-linux.c
-@@ -188,6 +188,8 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
- #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_IA64
- #elif defined(__microblaze__)
- #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_MICROBLAZE
-+#elif defined(__m68k__)
-+#  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_M68K
- #elif defined(__mips__)
- #  if defined(__MIPSEL__)
- #    if defined(__LP64__)
--- 
-2.30.0
-
diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index 413f5c842b..532fbd467e 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,4 +1,4 @@
-# sha256 from ftp://roy.marples.name/pub/dhcpcd/dhcpcd-9.4.0.tar.xz.distinfo
-sha256  41a69297f380bf15ee8f94f73154f8c2bca7157a087c0d5aca8de000ba1d4513  dhcpcd-9.4.0.tar.xz
+# sha256 from ftp://roy.marples.name/pub/dhcpcd/dhcpcd-9.4.1.tar.xz.distinfo
+sha256  819357634efed1ea5cf44ec01b24d3d3f8852fec8b4249925dcc5667c54e376c  dhcpcd-9.4.1.tar.xz
 # Locally calculated
-sha256  9cce1077bad23544349788ec750ec6e5aee106fc437fd6b5d73c0d8510426578  LICENSE
+sha256  4f21ce186859516dcab9b3197f3e9533a9bd1b87932015c87f539af4a48cd592  LICENSE
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 1af019fd9e..ebe6941646 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 9.4.0
+DHCPCD_VERSION = 9.4.1
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 DHCPCD_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
