Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F105C77B73
	for <buildroot@archiver.kernel.org>; Sun,  4 Jun 2023 10:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C33B64050F;
	Sun,  4 Jun 2023 10:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C33B64050F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DaVow6bqdGVw; Sun,  4 Jun 2023 10:54:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38EAD4035C;
	Sun,  4 Jun 2023 10:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38EAD4035C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5CD0E1BF95C
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 10:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43E9A8141C
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 10:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43E9A8141C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C-A-Br9V2H6s for <buildroot@lists.busybox.net>;
 Sun,  4 Jun 2023 10:53:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 439AA8140D
 for <buildroot@buildroot.org>; Sun,  4 Jun 2023 10:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 439AA8140D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FE708676D; Sun,  4 Jun 2023 10:53:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 4 Jun 2023 12:52:33 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2e511e791daab76b1da42cb3a69a4d7c2baeb85d
X-Git-Newrev: 6b26999abca4e9fb4c2050123af028b80fa0c990
X-Patchwork-Hint: ignore
Message-Id: <20230604105336.2FE708676D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lightning: bump
 version to 2.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b26999abca4e9fb4c2050123af028b80fa0c990
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

And restore support for MIPS64, which is supported by Lightning.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  1 -
 .../0001-lib-jit_disasm.c-fix-build.patch          | 42 ----------------------
 package/lightning/Config.in                        |  6 ++--
 package/lightning/lightning.hash                   |  2 +-
 package/lightning/lightning.mk                     |  2 +-
 5 files changed, 6 insertions(+), 47 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 81cf1afe6b..963efac992 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -893,7 +893,6 @@ package/libwebsock/0002-fix-ssl.patch Upstream
 package/libwebsock/0003-fix-incorrect-inline.patch Upstream
 package/libwebsockets/0001-lib-tls-CMakeLists.txt-fix-build-without-threads.patch Upstream
 package/libyuv/0001-i386-sse2.patch Upstream
-package/lightning/0001-lib-jit_disasm.c-fix-build.patch Upstream
 package/lighttpd/0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch Upstream
 package/lighttpd/S50lighttpd EmptyLastLine Indent Shellcheck Variables
 package/linknx/0001-configure-ac-tweak-CPPUNIT-conditional.patch Upstream
diff --git a/package/lightning/0001-lib-jit_disasm.c-fix-build.patch b/package/lightning/0001-lib-jit_disasm.c-fix-build.patch
deleted file mode 100644
index 9e79be91a0..0000000000
--- a/package/lightning/0001-lib-jit_disasm.c-fix-build.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 0d828c96c373c34b201ca7ea37b61c1e3b0485cd Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 19 Dec 2022 23:55:31 +0100
-Subject: [PATCH] lib/jit_disasm.c: fix build
-
-Fix the following build failure raised since
-http://git.savannah.gnu.org/cgit/lightning.git/commit/?id=837c7a1e8d08fb9294578dc84694077f4d6106f9:
-
-jit_disasm.c: In function 'fprintf_styled':
-jit_disasm.c:57:27: error: parameter name omitted
-   57 | static int fprintf_styled(void *, enum disassembler_style, const char* fmt, ...)
-      |                           ^~~~~~
-jit_disasm.c:57:35: error: parameter name omitted
-   57 | static int fprintf_styled(void *, enum disassembler_style, const char* fmt, ...)
-      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/e15e01e98e0d8c873efd3f512b671d98e4daf6c0
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[yann.morin.1998@free.fr: make it a backport now it's applied upstream]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- lib/jit_disasm.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/jit_disasm.c b/lib/jit_disasm.c
-index 58a269b..68c966d 100644
---- a/lib/jit_disasm.c
-+++ b/lib/jit_disasm.c
-@@ -54,7 +54,7 @@ static FILE			 *disasm_stream;
- #endif
- 
- #if BINUTILS_2_38
--static int fprintf_styled(void *, enum disassembler_style, const char* fmt, ...)
-+static int fprintf_styled(void * stream, enum disassembler_style style, const char* fmt, ...)
- {
-   va_list args;
-   int r;
--- 
-2.25.1
-
diff --git a/package/lightning/Config.in b/package/lightning/Config.in
index 3cf7c28ae2..e42730addb 100644
--- a/package/lightning/Config.in
+++ b/package/lightning/Config.in
@@ -1,12 +1,14 @@
 comment "lightning needs a toolchain w/ dynamic library, threads"
 	depends on BR2_sparc || BR2_i386 || BR2_x86_64 || BR2_mips || \
-		BR2_mipsel || BR2_arm || BR2_powerpc || BR2_RISCV_64
+		BR2_mipsel || BR2_arm || BR2_powerpc || BR2_RISCV_64 || \
+		BR2_mips64 || BR2_mips64el
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_LIGHTNING
 	bool "lightning"
 	depends on BR2_sparc || BR2_i386 || BR2_x86_64 || BR2_mips || \
-		BR2_mipsel || BR2_arm || BR2_powerpc || BR2_RISCV_64
+		BR2_mipsel || BR2_arm || BR2_powerpc || BR2_RISCV_64 || \
+		BR2_mips64 || BR2_mips64el
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
diff --git a/package/lightning/lightning.hash b/package/lightning/lightning.hash
index 998ae3743b..97b391674c 100644
--- a/package/lightning/lightning.hash
+++ b/package/lightning/lightning.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4e3984ff1ccf0ba30a985211d40fc5c06b25f014ebdf3d80d0fe3d0c80dd7c0e  lightning-2.2.0.tar.gz
+sha256  98671681d5684770ccb06a07fa3b8f032a454bdb56eafc18e6fab04459ea3caa  lightning-2.2.1.tar.gz
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSER
diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
index 8ab2ca1f9d..4a8c7e5efd 100644
--- a/package/lightning/lightning.mk
+++ b/package/lightning/lightning.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIGHTNING_VERSION = 2.2.0
+LIGHTNING_VERSION = 2.2.1
 LIGHTNING_SITE = $(BR2_GNU_MIRROR)/lightning
 LIGHTNING_LICENSE = LGPL-3.0+
 LIGHTNING_LICENSE_FILES = COPYING.LESSER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
