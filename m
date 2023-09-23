Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CC6CE7A89
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 18:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FD41402C3;
	Sat, 23 Sep 2023 18:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FD41402C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CtnauvqopfTb; Sat, 23 Sep 2023 18:34:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64EB3405F8;
	Sat, 23 Sep 2023 18:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64EB3405F8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D6B4B1BF59A
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 18:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD5C861142
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 18:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD5C861142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XEDU7kjyrAzO for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 18:34:34 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1364F60A9F
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 18:34:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1364F60A9F
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B058E13F8B3;
 Sat, 23 Sep 2023 20:34:29 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Sep 2023 20:34:24 +0200
Message-ID: <20230923183424.907966-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695494071;
 bh=2JnVc/mF8zuDY7nNe2Kl0tfRdONk1mlfkQICOBxPKG0=;
 h=From:To:Cc:Subject:Date:From;
 b=vTvCvYfzJD6jOos9OmeuTzgE7ZtFUILq3ATNPMxCRaZitRlxDhbs921J7arDZ68c1
 GuABCzNc8JjJy7hQjwYbfmZU1EY74D/DhKu73ICoKPJrKxHZMlF9Wbv1HfCtZD+A84
 sjm2a8nbrEb80WyIUrXqwddnLS/3Q+IsFHvJPhSJQxPCeUnhL9/3X194MA9EDcP6MC
 ndGCMawEk3t7Jo95GDUwrBDFpY7Atq1kkcjKpDSluGd+jmMzAwBLwtuZdt7zuc0lYv
 y7fS0SIceZEE4fiAzofquqIU07SnYvrX5Mm6rDshCAsxEZGmq73slcIGI/1XcS5qjp
 vgNXQmmrGBihg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vTvCvYfz
Subject: [Buildroot] [PATCH 1/1] package/kexec: bump to version 2.0.27
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release announce, see:
https://lists.infradead.org/pipermail/kexec/2023-August/027830.html

This new version introduced a usage of memfd_create() in [1]. This
function was introduced in Kernel 3.17. Therefore, this commit adds
this new dependency. This direct use of memfd_create() requires a
glibc >= 2.27. As is, this version would no longer work with uclibc-ng
or musl libc. This commit also adds a patch to allow compilation with
glibc < 2.27, and also uclibc and musl. See the patch commit log for
more details.

[1] https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=714fa11590febc9cf6fd3c6309374a040a05ebb0

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 20c023a with commands:

    utils/docker-run make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_kexec
    ...
    OK

    utils/test-pkg -a -p kexec
    ...
    45 builds, 15 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 ...memfd_create-wrapper-if-not-present-.patch | 113 ++++++++++++++++++
 package/kexec/Config.in                       |   4 +
 package/kexec/kexec.hash                      |   2 +-
 package/kexec/kexec.mk                        |   4 +-
 4 files changed, 121 insertions(+), 2 deletions(-)
 create mode 100644 package/kexec/0002-kexec-provide-a-memfd_create-wrapper-if-not-present-.patch

diff --git a/package/kexec/0002-kexec-provide-a-memfd_create-wrapper-if-not-present-.patch b/package/kexec/0002-kexec-provide-a-memfd_create-wrapper-if-not-present-.patch
new file mode 100644
index 0000000000..649ec56042
--- /dev/null
+++ b/package/kexec/0002-kexec-provide-a-memfd_create-wrapper-if-not-present-.patch
@@ -0,0 +1,113 @@
+From 417382aecd6964f97a0a0774a5cccd29c1b9edb3 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Sat, 23 Sep 2023 13:09:23 +0200
+Subject: [PATCH] kexec: provide a memfd_create() wrapper if not present in
+ libc
+
+Commit 714fa115 "kexec/arm64: Simplify the code for zImage" introduced
+a use of the memfd_create() system call, included in version
+kexec-tools v2.0.27.
+
+This system call was introduced in kernel commit [1], first included
+in kernel v3.17 (released on 2014-10-05).
+
+The memfd_create() glibc wrapper function was added much later in
+commit [2], first included in glibc version 2.27 (released on
+2018-02-01).
+
+This direct use memfd_create() introduced a requirement on
+Kernel >= 3.17 and glibc >= 2.27.
+
+There is old toolchains like [3] for example (which ships gcc 7.3.1,
+glibc 2.25 and includes kernel v4.10 headers), that can still be used
+to build newer kernels. Even if such toolchains can be seen as
+outdated, they are is still claimed as supported by recent kernel.
+For example, Kernel v6.5.5 has a requirement on gcc version 5.1 and
+greater. See [4].
+
+Moreover, kexec-tools <= 2.0.26 could be compiled using recent
+toolchains with alternative libc (e.g. uclibc-ng, musl) which are not
+providing the memfd_create() wrapper.
+
+When compiling kexec-tools v2.0.27 with a toolchain not providing the
+memfd_create() syscall wrapper, the compilation fail with message:
+
+    kexec/kexec.c: In function 'copybuf_memfd':
+    kexec/kexec.c:645:7: warning: implicit declaration of function 'memfd_create'; did you mean 'SYS_memfd_create'? [-Wimplicit-function-declaration]
+      fd = memfd_create("kernel", MFD_ALLOW_SEALING);
+           ^~~~~~~~~~~~
+           SYS_memfd_create
+    kexec/kexec.c:645:30: error: 'MFD_ALLOW_SEALING' undeclared (first use in this function); did you mean '_PC_ALLOC_SIZE_MIN'?
+      fd = memfd_create("kernel", MFD_ALLOW_SEALING);
+                                  ^~~~~~~~~~~~~~~~~
+                                  _PC_ALLOC_SIZE_MIN
+
+In order to let kexec-tools compile in a wider range of configurations,
+this commit adds a memfd_create() function check in autoconf configure
+script, and adds a system call wrapper which will be used if the
+function is not available. With this commit, the environment
+requirement is relaxed to only kernel >= v3.17.
+
+Note: this issue was found in kexec-tools integration in Buildroot [5]
+using the command "utils/test-pkg -a -p kexec", which tests many
+toolchain/arch combinations.
+
+[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=9183df25fe7b194563db3fec6dc3202a5855839c
+[2] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=59d2cbb1fe4b8601d5cbd359c3806973eab6c62d
+[3] https://releases.linaro.org/components/toolchain/binaries/7.3-2018.05/aarch64-linux-gnu/gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu.tar.xz
+[4] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/process/changes.rst?h=v6.5.5#n32
+[5] https://buildroot.org/
+
+Upstream: https://lists.infradead.org/pipermail/kexec/2023-September/028168.html
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ configure.ac  |  3 +++
+ kexec/kexec.c | 11 +++++++++++
+ 2 files changed, 14 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 192976c..212ef2c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -208,6 +208,9 @@ if test "$ac_cv_lib_xenctrl_xc_kexec_load" = yes ; then
+ 		AC_MSG_NOTICE([The kexec_status call is not available]))
+ fi
+ 
++dnl Check if libc has the memfd_create() syscall wrapper
++AC_CHECK_FUNCS([memfd_create])
++
+ dnl ---Sanity checks
+ if test "$CC"      = "no"; then AC_MSG_ERROR([cc not found]); fi
+ if test "$CPP"     = "no"; then AC_MSG_ERROR([cpp not found]); fi
+diff --git a/kexec/kexec.c b/kexec/kexec.c
+index c3b182e..c44c4b7 100644
+--- a/kexec/kexec.c
++++ b/kexec/kexec.c
+@@ -31,6 +31,10 @@
+ #include <sys/mount.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
++#ifndef HAVE_MEMFD_CREATE
++#include <linux/memfd.h>
++#include <sys/syscall.h>
++#endif
+ #include <sys/reboot.h>
+ #include <sys/mman.h>
+ #include <unistd.h>
+@@ -638,6 +642,13 @@ char *slurp_decompress_file(const char *filename, off_t *r_size)
+ 	return kernel_buf;
+ }
+ 
++#ifndef HAVE_MEMFD_CREATE
++static int memfd_create(const char *name, unsigned int flags)
++{
++	return syscall(SYS_memfd_create, name, flags);
++}
++#endif
++
+ static int copybuf_memfd(const char *kernel_buf, size_t size)
+ {
+ 	int fd, count;
+-- 
+2.41.0
+
diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index 836d740788..3308d56b8d 100644
--- a/package/kexec/Config.in
+++ b/package/kexec/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_KEXEC_ARCH_SUPPORTS
 config BR2_PACKAGE_KEXEC
 	bool "kexec"
 	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd_create()
 	help
 	  Kexec is a user space utility for loading another kernel
 	  and asking the currently running kernel to do something with
@@ -25,3 +26,6 @@ config BR2_PACKAGE_KEXEC_ZLIB
 	  Support for compressed kernel images
 
 endif
+
+comment "kexec needs a toolchain w/ headers >= 3.17"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
index 4e16a53a35..650f0992de 100644
--- a/package/kexec/kexec.hash
+++ b/package/kexec/kexec.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
-sha256  7fe36a064101cd5c515e41b2be393dce3ca88adce59d6ee668e0af7c0c4570cd  kexec-tools-2.0.26.tar.xz
+sha256  38d78bcfa33a88928324b57dc81f50c1dfc279eede45e80957ca18f4e84b8187  kexec-tools-2.0.27.tar.xz
 # locally calculated
 sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  COPYING
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 562b09012b..5d30f4884b 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.26
+KEXEC_VERSION = 2.0.27
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPL-2.0
 KEXEC_LICENSE_FILES = COPYING
+# 0002-kexec-provide-a-memfd_create-wrapper-if-not-present-.patch
+KEXEC_AUTORECONF = YES
 KEXEC_CPE_ID_PRODUCT = kexec-tools
 KEXEC_CPE_ID_VENDOR = kexec-tools_project
 KEXEC_SELINUX_MODULES = kdump
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
