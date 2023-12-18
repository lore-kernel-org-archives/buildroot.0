Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAE3C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 08:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BFE84057B;
	Mon, 18 Dec 2023 08:14:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BFE84057B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XjAhBb3NJ_Om; Mon, 18 Dec 2023 08:14:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD9A140582;
	Mon, 18 Dec 2023 08:14:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD9A140582
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A2FD21BF3BC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77D9A41805
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:14:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77D9A41805
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oMK2eHnv9cin for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 08:14:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B774408D1
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 08:14:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B774408D1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 160DB87BA1; Mon, 18 Dec 2023 08:14:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 09:09:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: faec3ca30e358575f70a036879029f63f7da9b29
X-Git-Newrev: 973b1eba5a4ee72f040bd471b147267e36be73ad
X-Patchwork-Hint: ignore
Message-Id: <20231218081430.160DB87BA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: bump version to 3.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=973b1eba5a4ee72f040bd471b147267e36be73ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://www.openssl.org/blog/blog/2023/11/23/OpenSSL32/

Removed patch 0001 and added no-docs configure option due to
https://github.com/openssl/openssl/commit/956b4c75dc3f8710bf7b4e1cf01b4ef6d5ca2b45

Removed patch 0003 due to
https://github.com/openssl/openssl/commit/78634e8ac253a8edf338d329965724dfa8e033ab

Removed patch 0006 which is included in this release
https://github.com/openssl/openssl/commit/e1b6ecbab41514f45e9c355d01400691f74041c4

Renumbered remaining patches.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  5 ++--
 ...time-building-manpages-if-we-re-not-going.patch | 33 ----------------------
 ...oducible-build-do-not-leak-compiler-path.patch} |  0
 ...e-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch} |  0
 ...he-OPENSSL_NO_MADVISE-to-disable-call-to-.patch | 27 ------------------
 ...s.patch => 0003-Revert-Fix-static-builds.patch} |  0
 .../0006-Add-linux-x86-latomic-target.patch        | 30 --------------------
 package/libopenssl/libopenssl.hash                 |  4 +--
 package/libopenssl/libopenssl.mk                   |  4 ++-
 9 files changed, 7 insertions(+), 96 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 12a4c35c09..962fa705ad 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -700,9 +700,8 @@ package/libnss/0001-Bug-1801182-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch U
 package/liboauth/0001-Fixes-build-issue-with-OpenSSL-1.1.0.patch Upstream
 package/libodb-mysql/0001-fix-syntax-issue-while-checking-ldflags.patch Upstream
 package/libodb-mysql/0002-mariadb-FTBFS-fix.patch Upstream
-package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch Upstream
-package/libopenssl/0002-Reproducible-build-do-not-leak-compiler-path.patch Upstream
-package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch Upstream
+package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch Upstream
+package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch Upstream
 package/liboping/0001-fix-utf8-support.patch Upstream
 package/liboping/0002-Open-raw-sockets-when-adding-hosts-not-when-doing-th.patch Upstream
 package/liboping/0003-Fix-compile-break-with-GCC-7-buffer-overflow-with-snprintf.patch Upstream
diff --git a/package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch b/package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
deleted file mode 100644
index ed4590dd55..0000000000
--- a/package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From d8f104bffb0c4acb8c5fcdf49628f7d02ed48f7f Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier@gentoo.org>
-Date: Sat, 16 May 2015 18:53:51 +0200
-Subject: [PATCH] Dont waste time building manpages if we're not going to use
- em.
-
-Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
-[Gustavo: update for parallel-build]
-
-[rebased on openssl-1.1.0h]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-[rebased on openssl-1.1.1i]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- Configurations/unix-Makefile.tmpl | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
-index 40cf2c3..777d9ca 100644
---- a/Configurations/unix-Makefile.tmpl
-+++ b/Configurations/unix-Makefile.tmpl
-@@ -546,7 +546,7 @@ list-tests:
- 	@echo "Tests are not supported with your chosen Configure options"
- 	@ : {- output_on() if !$disabled{tests}; "" -}
- 
--install: install_sw install_ssldirs install_docs {- $disabled{fips} ? "" : "install_fips" -}
-+install: install_sw install_ssldirs {- $disabled{fips} ? "" : "install_fips" -}
- 
- uninstall: uninstall_docs uninstall_sw {- $disabled{fips} ? "" : "uninstall_fips" -}
- 
--- 
-2.16.3
-
diff --git a/package/libopenssl/0002-Reproducible-build-do-not-leak-compiler-path.patch b/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch
similarity index 100%
rename from package/libopenssl/0002-Reproducible-build-do-not-leak-compiler-path.patch
rename to package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch
diff --git a/package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
similarity index 100%
rename from package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
rename to package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
diff --git a/package/libopenssl/0003-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch b/package/libopenssl/0003-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch
deleted file mode 100644
index 425adea5d8..0000000000
--- a/package/libopenssl/0003-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 1281ffc7959bd2070563e17a52ee4424196d885c Mon Sep 17 00:00:00 2001
-From: Patrick Havelange <patrick.havelange@essensium.com>
-Date: Wed, 23 Jan 2019 12:21:21 +0100
-Subject: [PATCH] Introduce the OPENSSL_NO_MADVISE to disable call to madvise()
-
-Upstream: https://github.com/openssl/openssl/pull/8089
-Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
----
- crypto/mem_sec.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/crypto/mem_sec.c b/crypto/mem_sec.c
-index 9e0f670..32c7282 100644
---- a/crypto/mem_sec.c
-+++ b/crypto/mem_sec.c
-@@ -557,7 +557,7 @@ static int sh_init(size_t size, int minsize)
-     if (mlock(sh.arena, sh.arena_size) < 0)
-         ret = 2;
- #endif
--#ifdef MADV_DONTDUMP
-+#if defined(MADV_DONTDUMP) && !defined(OPENSSL_NO_MADVISE)
-     if (madvise(sh.arena, sh.arena_size, MADV_DONTDUMP) < 0)
-         ret = 2;
- #endif
--- 
-2.17.1
-
diff --git a/package/libopenssl/0005-Revert-Fix-static-builds.patch b/package/libopenssl/0003-Revert-Fix-static-builds.patch
similarity index 100%
rename from package/libopenssl/0005-Revert-Fix-static-builds.patch
rename to package/libopenssl/0003-Revert-Fix-static-builds.patch
diff --git a/package/libopenssl/0006-Add-linux-x86-latomic-target.patch b/package/libopenssl/0006-Add-linux-x86-latomic-target.patch
deleted file mode 100644
index 9ecc50b1ae..0000000000
--- a/package/libopenssl/0006-Add-linux-x86-latomic-target.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c80a60dca209813c33ab3d2794bc32d84c12d033 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Fri, 28 Jul 2023 17:11:25 +0200
-Subject: [PATCH] Add linux-x86-latomic target
-
-Upstream: https://github.com/openssl/openssl/pull/21590
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- Configurations/10-main.conf | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/Configurations/10-main.conf b/Configurations/10-main.conf
-index 2200a85b16..bcf54a2a53 100644
---- a/Configurations/10-main.conf
-+++ b/Configurations/10-main.conf
-@@ -868,6 +868,10 @@ my %targets = (
-         asm_arch         => 'x86',
-         perlasm_scheme   => "elf",
-     },
-+    "linux-x86-latomic" => {
-+        inherit_from     => [ "linux-x86" ],
-+        ex_libs          => add(threads("-latomic")),
-+    },
-     "linux-x86-clang" => {
-         inherit_from     => [ "linux-x86" ],
-         CC               => "clang",
--- 
-2.39.2
-
diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 29ced7cddd..9e09e12461 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-3.1.4.tar.gz.sha256
-sha256  840af5366ab9b522bde525826be3ef0fb0af81c6a9ebd84caa600fea1731eee3  openssl-3.1.4.tar.gz
+# From https://www.openssl.org/source/openssl-3.2.0.tar.gz.sha256
+sha256  14c826f07c7e433706fb5c69fa9e25dab95684844b4c962a2cf1bf183eb4690e  openssl-3.2.0.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index b8b6ec6bff..928f3379f8 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.1.4
+LIBOPENSSL_VERSION = 3.2.0
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
@@ -57,6 +57,7 @@ define HOST_LIBOPENSSL_CONFIGURE_CMDS
 		./config \
 		--prefix=$(HOST_DIR) \
 		--openssldir=$(HOST_DIR)/etc/ssl \
+		no-docs \
 		no-tests \
 		no-fuzz-libfuzzer \
 		no-fuzz-afl \
@@ -78,6 +79,7 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			$(if $(BR2_PACKAGE_CRYPTODEV_LINUX),enable-devcryptoeng) \
 			no-rc5 \
 			enable-camellia \
+			no-docs \
 			no-tests \
 			no-fuzz-libfuzzer \
 			no-fuzz-afl \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
