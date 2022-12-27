Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEEAC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B933B83E10;
	Mon, 20 Feb 2023 23:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B933B83E10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DEG6hp5H5rQU; Mon, 20 Feb 2023 23:29:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9318838F0;
	Mon, 20 Feb 2023 23:29:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9318838F0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8BF4F1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FE1F61791
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FE1F61791
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vfaYQdCTiq0E for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E1456137C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E1456137C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 795978648F; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 21:52:12 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 92a4f080b2721cc84248ebc98d41229469787688
X-Git-Newrev: a8807ddbe269ef9aeee7b72f6d0a64719f8e6782
X-Patchwork-Hint: ignore
Message-Id: <20230220205216.795978648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/jitterentropy-library:
 bump to version 3.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8807ddbe269ef9aeee7b72f6d0a64719f8e6782
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Drop patch (already in version)
- Update hash of LICENSE file (year updated with
  https://github.com/smuellerDD/jitterentropy-library/commit/2e5019cfe63038faaa405ce53715effe4ea580e4)

https://github.com/smuellerDD/jitterentropy-library/blob/v3.4.1/CHANGES.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Makefile-add-ENABLE_STACK_PROTECTOR.patch | 52 ----------------------
 .../jitterentropy-library.hash                     |  4 +-
 .../jitterentropy-library/jitterentropy-library.mk |  2 +-
 3 files changed, 3 insertions(+), 55 deletions(-)

diff --git a/package/jitterentropy-library/0001-Makefile-add-ENABLE_STACK_PROTECTOR.patch b/package/jitterentropy-library/0001-Makefile-add-ENABLE_STACK_PROTECTOR.patch
deleted file mode 100644
index c4388663b0..0000000000
--- a/package/jitterentropy-library/0001-Makefile-add-ENABLE_STACK_PROTECTOR.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 272ee47892563e849f6b1bf59b0173f8aa33b631 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 19 Dec 2021 11:36:13 +0100
-Subject: [PATCH] Makefile: add ENABLE_STACK_PROTECTOR
-
-Add ENABLE_STACK_PROTECTOR as build on embedded toolchains without
-stack-protector is again broken since
-https://github.com/smuellerDD/jitterentropy-library/commit/5b3cb7f35e41ba2f34a75d004cf095c965a1a0c4:
-
-/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: src/jitterentropy-base.o: in function `jent_fips_enabled':
-jitterentropy-base.c:(.text+0x131): undefined reference to `__stack_chk_fail_local'
-
-Fixes:
- - http://autobuild.buildroot.org/results/8dee462d16d934dd173d58f17933c6911e4336bf
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Signed-off-by: Stephan Mueller <smueller@chronox.de>
-[Retrieved from:
-https://github.com/smuellerDD/jitterentropy-library/commit/272ee47892563e849f6b1bf59b0173f8aa33b631]
----
- Makefile | 11 +++++++----
- 1 file changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index dfb96a8..c999ef5 100644
---- a/Makefile
-+++ b/Makefile
-@@ -2,6 +2,7 @@
- 
- CC ?= gcc
- #Hardening
-+ENABLE_STACK_PROTECTOR ?= 1
- CFLAGS ?= -fwrapv --param ssp-buffer-size=4 -fvisibility=hidden -fPIE -Wcast-align -Wmissing-field-initializers -Wshadow -Wswitch-enum
- CFLAGS +=-Wextra -Wall -pedantic -fPIC -O0 -fwrapv -Wconversion
- LDFLAGS +=-Wl,-z,relro,-z,now -lpthread
-@@ -13,10 +14,12 @@ else
-   GCC_GTEQ_490 := $(shell expr `$(CC) -dumpfullversion | sed -e 's/\.\([0-9][0-9]\)/\1/g' -e 's/\.\([0-9]\)/0\1/g' -e 's/^[0-9]\{3,4\}$$/&00/'` \>= 40900)
- endif
- 
--ifeq "$(GCC_GTEQ_490)" "1"
--  CFLAGS += -fstack-protector-strong
--else
--  CFLAGS += -fstack-protector-all
-+ifeq "$(ENABLE_STACK_PROTECTOR)" "1"
-+  ifeq "$(GCC_GTEQ_490)" "1"
-+    CFLAGS += -fstack-protector-strong
-+  else
-+    CFLAGS += -fstack-protector-all
-+  endif
- endif
- 
- # Change as necessary
diff --git a/package/jitterentropy-library/jitterentropy-library.hash b/package/jitterentropy-library/jitterentropy-library.hash
index 760befab53..c7833f1428 100644
--- a/package/jitterentropy-library/jitterentropy-library.hash
+++ b/package/jitterentropy-library/jitterentropy-library.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  9fcc954763a1dd4afe614a1b360f53b600d3376bbcc4b19177f27abf191ebad5  jitterentropy-library-3.3.1.tar.xz
-sha256  7e06574ff822594269083a796d06fa4e5e78c40efe5ca01a72d2a4662e8206df  LICENSE
+sha256  802f025f766c38abf663fd5a21482b8313b6d6e2c68c36a4ffd6bc105fe975ab  jitterentropy-library-3.4.1.tar.xz
+sha256  7a89069066f6c0b8767d3256e5ec5d765b2c7f3354a5a06fc8d5bd7b8103d8a3  LICENSE
 sha256  13aa749a5b0a454917a944ed8fffc530b784f5ead522b1aacaf4ec8aa55a6239  LICENSE.bsd
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  LICENSE.gplv2
diff --git a/package/jitterentropy-library/jitterentropy-library.mk b/package/jitterentropy-library/jitterentropy-library.mk
index 4cdebf46a3..f405082d08 100644
--- a/package/jitterentropy-library/jitterentropy-library.mk
+++ b/package/jitterentropy-library/jitterentropy-library.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JITTERENTROPY_LIBRARY_VERSION = 3.3.1
+JITTERENTROPY_LIBRARY_VERSION = 3.4.1
 JITTERENTROPY_LIBRARY_SOURCE = \
 	jitterentropy-library-$(JITTERENTROPY_LIBRARY_VERSION).tar.xz
 JITTERENTROPY_LIBRARY_SITE = http://www.chronox.de/jent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
