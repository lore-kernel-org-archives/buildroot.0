Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAABC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 21:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 180CD400BA;
	Mon,  4 Dec 2023 21:11:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 180CD400BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9e6DsfxQPX3F; Mon,  4 Dec 2023 21:11:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AD264011A;
	Mon,  4 Dec 2023 21:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AD264011A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA60B1BF30E
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90D094011A
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90D094011A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TpcGOH93GDxx for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 21:11:24 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACC50400BA
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 21:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACC50400BA
Received: from fli4l.lan.fli4l (p4fd6c4a5.dip0.t-ipconnect.de [79.214.196.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CD748A4C0C51
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 22:11:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33420)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rAGDq-0006FQ-1O
 for buildroot@buildroot.org; Mon, 04 Dec 2023 22:11:22 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  4 Dec 2023 22:11:22 +0100
Message-Id: <20231204211122.12486-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1701724282;
 bh=Jrp/MXKRlcXiSw5weQXQ16N5MZ680pWwiwP7QWx6gL8=;
 h=From:To:Subject:Date:From;
 b=SdpABI7CjfeP4Wtb5KTvI+0pW/VBY3O95oiSljXaRJ088BQ74ZBemLwIlB1UIzbpq
 WEGwAWBuZ77sXFYav23HVmNCkVk9vjEjgTtnYjTcQFpO36joNEAEOb6JAG/vRA+Xfx
 7xmTsPFwEjQe1fgPkpsR1y+B4PNv8cu8L0TblsWjNzMfyXLoF/AmJpy0k1kpxfj4MD
 pFiC3q6TuKNBuhtFbf/TNb84x2Nt6aboNQkgCpXpF2uHNp3jrO3cVwz93/ebodiN6U
 fRNtMo8rXkf5yyaUVxtEE/v9tH8ewsB/uMdiG+qCeii8MXDpLRNu6+d1zIqz28TDz9
 4bKcwJNxG6yMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=SdpABI7C
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: bump version to 3.2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 .checkpackageignore                           |  5 ++-
 ...building-manpages-if-we-re-not-going.patch | 33 -------------------
 ...ble-build-do-not-leak-compiler-path.patch} |  0
 ...v2-ABI-on-some-ppc64-big-endian-sys.patch} |  0
 ...ENSSL_NO_MADVISE-to-disable-call-to-.patch | 27 ---------------
 ...ch => 0003-Revert-Fix-static-builds.patch} |  0
 .../0006-Add-linux-x86-latomic-target.patch   | 30 -----------------
 package/libopenssl/libopenssl.hash            |  4 +--
 package/libopenssl/libopenssl.mk              |  4 ++-
 9 files changed, 7 insertions(+), 96 deletions(-)
 delete mode 100644 package/libopenssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
 rename package/libopenssl/{0002-Reproducible-build-do-not-leak-compiler-path.patch => 0001-Reproducible-build-do-not-leak-compiler-path.patch} (100%)
 rename package/libopenssl/{0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch => 0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch} (100%)
 delete mode 100644 package/libopenssl/0003-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch
 rename package/libopenssl/{0005-Revert-Fix-static-builds.patch => 0003-Revert-Fix-static-builds.patch} (100%)
 delete mode 100644 package/libopenssl/0006-Add-linux-x86-latomic-target.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 6c959335ed..000d3e7db9 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -701,9 +701,8 @@ package/libnss/0001-Bug-1801182-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch U
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
