Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FF7CFB440
	for <buildroot@archiver.kernel.org>; Mon,  7 Oct 2024 06:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DE8F80A92;
	Mon,  7 Oct 2024 06:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gJqtzDB6-DgX; Mon,  7 Oct 2024 06:06:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A1F880BFC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A1F880BFC;
	Mon,  7 Oct 2024 06:06:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C929C1BF471
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 06:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C390C605DB
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 06:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Z6O1QaPl2mX for <buildroot@lists.busybox.net>;
 Mon,  7 Oct 2024 06:06:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6320605E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6320605E6
 for <buildroot@buildroot.org>; Mon,  7 Oct 2024 06:06:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A17EB85730; Mon,  7 Oct 2024 06:06:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Oct 2024 08:02:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31b3600d7860ba30769f796f2bfdaa28c233b69f
X-Git-Newrev: b5f337e891c79046f01022fd2b8eadbe7293ba02
X-Patchwork-Hint: ignore
Message-Id: <20241007060625.A17EB85730@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/numactl: bump to version 2.0.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5f337e891c79046f01022fd2b8eadbe7293ba02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change logs since 2.0.16, see:
https://github.com/numactl/numactl/releases/tag/v2.0.18
https://github.com/numactl/numactl/releases/tag/v2.0.17

This commit also removes the package patch, which was included in
numactl v2.0.17. Since this patch was modifying configure.ac, the
"NUMACTL_AUTORECONF = YES" directive is also removed. Finally, the
patch entry in the ".checkpackageignore" file is also removed.

This commit also adds an upstream patch, not yet in this release, which
fixes builds with Kernel header not providing the
set_mempolicy_home_node() system call.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  1 -
 ...build-when-set_mempolicy_home_node-syscal.patch | 46 ++++++++++++++++++++++
 .../0001-link-with-latomic-if-needed-again.patch   | 41 -------------------
 package/numactl/numactl.hash                       |  2 +-
 package/numactl/numactl.mk                         |  4 +-
 5 files changed, 48 insertions(+), 46 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index c213baf258..ce638a7c39 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -947,7 +947,6 @@ package/nss-pam-ldapd/S45nslcd Shellcheck lib_sysv.EmptyLastLine lib_sysv.Indent
 package/ntp/0001-ntp-syscalls-fallback.patch lib_patch.Upstream
 package/ntp/S49ntp.in lib_sysv.Variables
 package/ntpsec/0001-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch lib_patch.Upstream
-package/numactl/0001-link-with-latomic-if-needed-again.patch lib_patch.Upstream
 package/nuttcp/0001-susv3-legacy.patch lib_patch.Upstream
 package/nvidia-driver/0001-use-LDFLAGS.patch lib_patch.Upstream
 package/octave/0001-Fix-BLAS-library-integer-size-detection.patch lib_patch.Upstream
diff --git a/package/numactl/0001-Don-t-fail-build-when-set_mempolicy_home_node-syscal.patch b/package/numactl/0001-Don-t-fail-build-when-set_mempolicy_home_node-syscal.patch
new file mode 100644
index 0000000000..ac532e1fb5
--- /dev/null
+++ b/package/numactl/0001-Don-t-fail-build-when-set_mempolicy_home_node-syscal.patch
@@ -0,0 +1,46 @@
+From c265971648f82464a76f797c4c20a09def078be9 Mon Sep 17 00:00:00 2001
+From: Andi Kleen <ak@linux.intel.com>
+Date: Thu, 16 May 2024 09:03:24 -0700
+Subject: [PATCH] Don't fail build when set_mempolicy_home_node syscall is
+ unknown
+
+Instead just warn at build and return ENOSYS. This fixes build
+on architectures like arm without kernel headers installed.
+
+Fixes #219
+
+Upstream: https://github.com/numactl/numactl/commit/87342c3b9a42aadbe1398ca8233d13ab524aa64f
+Signed-off-by: Andi Kleen <ak@linux.intel.com>
+---
+ syscall.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/syscall.c b/syscall.c
+index 63b3e53..392f736 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -144,7 +144,7 @@
+ #if defined(__x86_64__) || defined(__aarch64__)
+ #define __NR_set_mempolicy_home_node 450
+ #else
+-#error "Add syscalls for your architecture or update kernel headers"
++#warning "Add syscalls for your architecture or update kernel headers"
+ #endif
+ 
+ #endif
+@@ -261,7 +261,12 @@ long WEAK move_pages(int pid, unsigned long count,
+ 
+ int WEAK set_mempolicy_home_node(void *start, unsigned long len, int home_node, int flags)
+ {
++#ifndef __NR_set_mempolicy_home_node
++   errno = ENOSYS;
++   return -1;
++#else
+    return syscall(__NR_set_mempolicy_home_node, start, len, home_node, flags);
++#endif
+ }
+ 
+ /* SLES8 glibc doesn't define those */
+-- 
+2.46.2
+
diff --git a/package/numactl/0001-link-with-latomic-if-needed-again.patch b/package/numactl/0001-link-with-latomic-if-needed-again.patch
deleted file mode 100644
index 54d55656ec..0000000000
--- a/package/numactl/0001-link-with-latomic-if-needed-again.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 692abb6d751a41c7f0206771ecd454933750256e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 2 Nov 2022 13:28:02 +0100
-Subject: [PATCH] link with -latomic if needed (again ...)
-
-numactl unconditionally uses __atomic_fetch_and but some architectures
-(e.g. sparc) needs to link with -latomic to be able to use it. So check
-if -latomic is needed and update numa.pc accordingly.
-
-This linking was made by e0de0d9e981ddb53bdeb4a4b9dc43046c9ff4ff9 but
-wrongly reverted by 10c277c20768be9a563f75265bcd7e73954763ad resulting
-in the following build failure on sparc or microblaze:
-
-/nvmedata/autobuild/instance-7/output-1/per-package/numactl/host/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: ./.libs/libnuma.a(libnuma.o): in function `numa_police_memory':
-libnuma.c:(.text+0xe28): undefined reference to `__atomic_fetch_and_1'
-
-Fixes:
- - http://autobuild.buildroot.org/results/54b7567d804d9abff56f47cd26bae774c1e38669
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/numactl/numactl/pull/144]
----
- configure.ac | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 8510fc5..ebf9917 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -27,6 +27,8 @@ AM_CONDITIONAL([RISCV64], [test x"${target_cpu}" = x"riscv64"])
- 
- AC_CONFIG_FILES([Makefile])
- 
-+AC_SEARCH_LIBS([__atomic_fetch_and_1], [atomic])
-+
- # GCC tries to be "helpful" and only issue a warning for unrecognized
- # attributes.  So we compile the test with Werror, so that if the
- # attribute is not recognized the compilation fails
--- 
-2.35.1
-
diff --git a/package/numactl/numactl.hash b/package/numactl/numactl.hash
index 757001b750..c48df0ac69 100644
--- a/package/numactl/numactl.hash
+++ b/package/numactl/numactl.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  1b242f893af977a1d31af6ce9d6b8dafdd2d8ec3dc9207f7c2dc0d3446e7c7c8  numactl-2.0.16.tar.gz
+sha256  b4fc0956317680579992d7815bc43d0538960dc73aa1dd8ca7e3806e30bc1274  numactl-2.0.18.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index 157f953c51..512a5eb96a 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-NUMACTL_VERSION = 2.0.16
+NUMACTL_VERSION = 2.0.18
 NUMACTL_SITE = \
 	https://github.com/numactl/numactl/releases/download/v$(NUMACTL_VERSION)
 NUMACTL_LICENSE = LGPL-2.1 (libnuma), GPL-2.0 (programs)
 NUMACTL_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
 NUMACTL_INSTALL_STAGING = YES
-# We're patching configure.ac
-NUMACTL_AUTORECONF = YES
 NUMACTL_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -fPIC"
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
