Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E816CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 08:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D165642DF2;
	Sat, 30 May 2026 08:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DBpgUxfO6wvv; Sat, 30 May 2026 08:45:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8288C42DFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780130756;
	bh=x9jdnCOHa65ViafGJu2WLRr4m6oSwX6HR6fON4Qx12I=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xtgw5xiLzVft0nGbwoLjODOrlCBxlYmPVMwwkRV9FQ2lnKnJ6UCMyuCpIc/7OcoAa
	 mWRGeoOy2oQ/FSXI1uJNKALtkOvKXECFCm/toARit1PCMnTzO2TMD1JB0M2Yp12Hc4
	 4LsboMpcJQJ9wAkjin1gg2sQnHIZA45NtpAAxq2gePKt5cHqjYYpAkArIcSgV+eGn3
	 CmJCNwsTvVS02bL90xLAtG/cbnQYb2HZqcOl7oKn0JZmqzT41tPsQwFdbX5+2affDq
	 s5hQen5KZPS24GEc+UDjOb9U1SdD3vPZ2+fXFKg7krCiaMJRSGPi8myM7QXor5pp1U
	 AhWrc0PkB/WGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8288C42DFB;
	Sat, 30 May 2026 08:45:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BE088F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC80E850C5
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:45:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 93CfCdtqYAJt for <buildroot@buildroot.org>;
 Sat, 30 May 2026 08:45:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A64AF85093
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A64AF85093
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:45:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA98686441; Sat, 30 May 2026 08:45:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 10:45:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9b9ae8b4eb34c9da11f51b8f20c67b578c2442e
X-Git-Newrev: 5a27004cffb6bb034ff80cfac42a87bbd208755d
X-Patchwork-Hint: ignore
Message-Id: <20260530084540.BA98686441@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/busybox: security bump version to
 1.38.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============7013077143996848370=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7013077143996848370==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5a27004cffb6bb034ff80cfac42a87bbd208755d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.busybox.net/news.html

Removed patches which are included in this release, renumbered remaining
patches.

Patch 0006 was removed because its fix is included in upstream commit
https://github.com/vda-linux/busybox_mirror/commit/9a8796436b9b0641e13480811902ea2ac57881d3

which also adds a new Kconfig option, disabled by default, to fix
CVE-2023-39810. To improve security we enable this option by default.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...g-GCC-failing-saying-ncurses-is-not-found.patch | 38 --------------
 ...6-tc-Fix-compilation-with-Linux-v6.8-rc1.patch} |  0
 ... 0007-awk.c-fix-CVE-2023-42366-bug-15874.patch} |  0
 ...k-for-SYS_settimeofday-before-calling-sy.patch} |  0
 ...gd-fix-wrong-OPT_locallog-flag-detection.patch} |  0
 .../0010-libbb-sha-add-missing-sha-NI-guard.patch  | 54 --------------------
 ...-tar-tests-fix-test-after-cve-2025-46394.patch} |  0
 ...-control-characters-or-spaces-in-the-URL.patch} |  0
 ...l-libarchive-sanitize-filenames-on-output.patch | 58 ----------------------
 package/busybox/busybox-minimal.config             |  1 +
 package/busybox/busybox.config                     |  1 +
 package/busybox/busybox.hash                       |  4 +-
 package/busybox/busybox.mk                         |  7 ++-
 13 files changed, 7 insertions(+), 156 deletions(-)

diff --git a/package/busybox/0006-menuconfig-GCC-failing-saying-ncurses-is-not-found.patch b/package/busybox/0006-menuconfig-GCC-failing-saying-ncurses-is-not-found.patch
deleted file mode 100644
index 594874471d..0000000000
--- a/package/busybox/0006-menuconfig-GCC-failing-saying-ncurses-is-not-found.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 7f0bb7f69f38298971aa8153d3fbe9b1fdda8ae7 Mon Sep 17 00:00:00 2001
-From: ctxnop <ctxnop@gmail.com>
-Date: Sun, 26 Jan 2025 20:59:20 +0100
-Subject: [PATCH] menuconfig: GCC failing saying ncurses is not found
-
-Newer GCC increased diagnostics levels resulting in considering the
-test code to be invalid. The resulting message was misleading, saying
-that ncurses was not found, while the check failed for an unrelated
-reason which was hidden because GCC stderr was redirected to
-/dev/null.
-
-Signed-off-by: ctxnop <ctxnop@gmail.com>
-Upstream: http://lists.busybox.net/pipermail/busybox/2024-July/090840.html
-[Fiona: rephrased commit message for clarity]
-Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
----
- scripts/kconfig/lxdialog/check-lxdialog.sh | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
-index 5075ebf2d..08e4da3de 100755
---- a/scripts/kconfig/lxdialog/check-lxdialog.sh
-+++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
-@@ -45,9 +45,9 @@ trap "rm -f $tmp" 0 1 2 3 15
- 
- # Check if we can link to ncurses
- check() {
--        $cc -x c - -o $tmp 2>/dev/null <<'EOF'
-+	$cc -x c - -o $tmp <<'EOF'
- #include CURSES_LOC
--main() {}
-+int main() { return 0; }
- EOF
- 	if [ $? != 0 ]; then
- 	    echo " *** Unable to find the ncurses libraries or the"       1>&2
--- 
-2.48.1
-
diff --git a/package/busybox/0007-tc-Fix-compilation-with-Linux-v6.8-rc1.patch b/package/busybox/0006-tc-Fix-compilation-with-Linux-v6.8-rc1.patch
similarity index 100%
rename from package/busybox/0007-tc-Fix-compilation-with-Linux-v6.8-rc1.patch
rename to package/busybox/0006-tc-Fix-compilation-with-Linux-v6.8-rc1.patch
diff --git a/package/busybox/0008-awk.c-fix-CVE-2023-42366-bug-15874.patch b/package/busybox/0007-awk.c-fix-CVE-2023-42366-bug-15874.patch
similarity index 100%
rename from package/busybox/0008-awk.c-fix-CVE-2023-42366-bug-15874.patch
rename to package/busybox/0007-awk.c-fix-CVE-2023-42366-bug-15874.patch
diff --git a/package/busybox/0009-hwclock-Check-for-SYS_settimeofday-before-calling-sy.patch b/package/busybox/0008-hwclock-Check-for-SYS_settimeofday-before-calling-sy.patch
similarity index 100%
rename from package/busybox/0009-hwclock-Check-for-SYS_settimeofday-before-calling-sy.patch
rename to package/busybox/0008-hwclock-Check-for-SYS_settimeofday-before-calling-sy.patch
diff --git a/package/busybox/0011-syslogd-fix-wrong-OPT_locallog-flag-detection.patch b/package/busybox/0009-syslogd-fix-wrong-OPT_locallog-flag-detection.patch
similarity index 100%
rename from package/busybox/0011-syslogd-fix-wrong-OPT_locallog-flag-detection.patch
rename to package/busybox/0009-syslogd-fix-wrong-OPT_locallog-flag-detection.patch
diff --git a/package/busybox/0010-libbb-sha-add-missing-sha-NI-guard.patch b/package/busybox/0010-libbb-sha-add-missing-sha-NI-guard.patch
deleted file mode 100644
index 0fd7014b50..0000000000
--- a/package/busybox/0010-libbb-sha-add-missing-sha-NI-guard.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From bba9e99026a3dafe75f608459533e0b6d8cf3874 Mon Sep 17 00:00:00 2001
-From: Andre Przywara <andre.przywara@arm.com>
-Date: Tue, 10 Sep 2024 14:32:46 +0100
-Subject: [PATCH] libbb/sha: add missing sha-NI guard
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The ENABLE_SHA1_HWACCEL Kconfig symbol is meant to be archicture
-agnostic, so can be enabled regardless of whether your build
-architecture provides hardware acceleration or not. At the moment only
-x86 implements this, so every piece of optimised code should be guarded
-by both ENABLE_SHA1_HWACCEL and (__x86_64__ || __i386__). This is missing
-at one place, so compiling for arm64 breaks when ENABLE_SHA1_HWACCEL is
-enabled:
-================================
-libbb/hash_md5_sha.c: In function ‘sha1_end’:
-libbb/hash_md5_sha.c:1316:28: error: ‘sha1_process_block64_shaNI’ undeclared (first use in this function); did you mean ‘sha1_process_block64’?
- 1316 |   || ctx->process_block == sha1_process_block64_shaNI
-      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
-      |                            sha1_process_block64
-libbb/hash_md5_sha.c:1316:28: note: each undeclared identifier is reported only once for each function it appears in
-make[1]: *** [scripts/Makefile.build:197: libbb/hash_md5_sha.o] Error 1
-make: *** [Makefile:744: libbb] Error 2
-================================
-
-Add the missing guards around the call to sha1_process_block64_shaNI to
-fix the build on other architectures with ENABLE_SHA1_HWACCEL enabled.
-
-Change-Id: I40bba388422625f4230abf15a5de23e1fdc654fc
-Signed-off-by: Andre Przywara <andre.przywara@arm.com>
-Upstream: https://lists.busybox.net/pipermail/busybox/2024-September/090899.html
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- libbb/hash_md5_sha.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/libbb/hash_md5_sha.c b/libbb/hash_md5_sha.c
-index 57a801459..75a61c32c 100644
---- a/libbb/hash_md5_sha.c
-+++ b/libbb/hash_md5_sha.c
-@@ -1313,7 +1313,9 @@ unsigned FAST_FUNC sha1_end(sha1_ctx_t *ctx, void *resbuf)
- 	hash_size = 8;
- 	if (ctx->process_block == sha1_process_block64
- #if ENABLE_SHA1_HWACCEL
-+# if defined(__GNUC__) && (defined(__i386__) || defined(__x86_64__))
- 	 || ctx->process_block == sha1_process_block64_shaNI
-+# endif
- #endif
- 	) {
- 		hash_size = 5;
--- 
-2.48.1
-
diff --git a/package/busybox/0013-testsuite-tar-tests-fix-test-after-cve-2025-46394.patch b/package/busybox/0010-testsuite-tar-tests-fix-test-after-cve-2025-46394.patch
similarity index 100%
rename from package/busybox/0013-testsuite-tar-tests-fix-test-after-cve-2025-46394.patch
rename to package/busybox/0010-testsuite-tar-tests-fix-test-after-cve-2025-46394.patch
diff --git a/package/busybox/0014-wget-dont-allow-control-characters-or-spaces-in-the-URL.patch b/package/busybox/0011-wget-dont-allow-control-characters-or-spaces-in-the-URL.patch
similarity index 100%
rename from package/busybox/0014-wget-dont-allow-control-characters-or-spaces-in-the-URL.patch
rename to package/busybox/0011-wget-dont-allow-control-characters-or-spaces-in-the-URL.patch
diff --git a/package/busybox/0012-archival-libarchive-sanitize-filenames-on-output.patch b/package/busybox/0012-archival-libarchive-sanitize-filenames-on-output.patch
deleted file mode 100644
index 6af55c38c8..0000000000
--- a/package/busybox/0012-archival-libarchive-sanitize-filenames-on-output.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From f5e1bf966b19ea1821f00a8c9ecd7774598689b4 Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Wed, 24 Sep 2025 03:28:47 +0200
-Subject: archival/libarchive: sanitize filenames on output (prevent control
- sequence attacks
-
-This fixes CVE-2025-46394 (terminal escape sequence injection)
-
-Original credit: Ian.Norton at entrust.com
-
-function                                             old     new   delta
-header_list                                            9      15      +6
-header_verbose_list                                  239     244      +5
-------------------------------------------------------------------------------
-(add/remove: 0/0 grow/shrink: 2/0 up/down: 11/0)               Total: 11 bytes
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-CVE: CVE-2025-46394
-Upstream: https://git.busybox.net/busybox/patch/?id=f5e1bf966b19ea1821f00a8c9ecd7774598689b4
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- archival/libarchive/header_list.c         | 2 +-
- archival/libarchive/header_verbose_list.c | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/archival/libarchive/header_list.c b/archival/libarchive/header_list.c
-index 0621aa406..9490b3635 100644
---- a/archival/libarchive/header_list.c
-+++ b/archival/libarchive/header_list.c
-@@ -8,5 +8,5 @@
- void FAST_FUNC header_list(const file_header_t *file_header)
- {
- //TODO: cpio -vp DIR should output "DIR/NAME", not just "NAME" */
--	puts(file_header->name);
-+	puts(printable_string(file_header->name));
- }
-diff --git a/archival/libarchive/header_verbose_list.c b/archival/libarchive/header_verbose_list.c
-index a575a08a0..e7a09430d 100644
---- a/archival/libarchive/header_verbose_list.c
-+++ b/archival/libarchive/header_verbose_list.c
-@@ -57,13 +57,13 @@ void FAST_FUNC header_verbose_list(const file_header_t *file_header)
- 		ptm->tm_hour,
- 		ptm->tm_min,
- 		ptm->tm_sec,
--		file_header->name);
-+		printable_string(file_header->name));
- 
- #endif /* FEATURE_TAR_UNAME_GNAME */
- 
- 	/* NB: GNU tar shows "->" for symlinks and "link to" for hardlinks */
- 	if (file_header->link_target) {
--		printf(" -> %s", file_header->link_target);
-+		printf(" -> %s", printable_string(file_header->link_target));
- 	}
- 	bb_putchar('\n');
- }
--- 
-cgit v1.2.3
diff --git a/package/busybox/busybox-minimal.config b/package/busybox/busybox-minimal.config
index 1e4b404479..c571081374 100644
--- a/package/busybox/busybox-minimal.config
+++ b/package/busybox/busybox-minimal.config
@@ -190,6 +190,7 @@ CONFIG_LZOPCAT=y
 # CONFIG_FEATURE_UNZIP_LZMA is not set
 # CONFIG_FEATURE_UNZIP_XZ is not set
 # CONFIG_FEATURE_LZMA_FAST is not set
+CONFIG_FEATURE_PATH_TRAVERSAL_PROTECTION=y
 
 #
 # Coreutils
diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 823fcd2b46..4b532d6fe4 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -196,6 +196,7 @@ CONFIG_FEATURE_UNZIP_BZIP2=y
 CONFIG_FEATURE_UNZIP_LZMA=y
 CONFIG_FEATURE_UNZIP_XZ=y
 # CONFIG_FEATURE_LZMA_FAST is not set
+CONFIG_FEATURE_PATH_TRAVERSAL_PROTECTION=y
 
 #
 # Coreutils
diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index 39ca8915f3..73e88e49da 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,5 +1,5 @@
-# From https://busybox.net/downloads/busybox-1.37.0.tar.bz2.sha256
-sha256  3311dff32e746499f4df0d5df04d7eb396382d7e108bb9250e7b519b837043a4  busybox-1.37.0.tar.bz2
+# From https://www.busybox.net/downloads/busybox-1.38.0.tar.bz2.sha256
+sha256  34f9ea6ff8636f2c9241153b9114eefa9e65674a45318ae1ef95bb5f31c53bb2  busybox-1.38.0.tar.bz2
 # Locally computed
 sha256  bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548  LICENSE
 sha256  b5a136ed67798e51fe2e0ca0b2a21cb01b904ff0c9f7d563a6292e276607e58f  archival/libarchive/bz/LICENSE
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index ebe169cdb9..5b461c3a34 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.37.0
+BUSYBOX_VERSION = 1.38.0
 BUSYBOX_SITE = https://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPL-2.0, bzip2-1.0.4
@@ -15,11 +15,10 @@ BUSYBOX_CPE_ID_VENDOR = busybox
 # 0004-nslookup-sanitize-all-printed-strings-with-printable.patch
 BUSYBOX_IGNORE_CVES += CVE-2022-28391
 
-# 0012-archival-libarchive-sanitize-filenames-on-output.patch
-# 0013-testsuite-tar-tests-fix-test-after-cve-2025-46394.patch
+# 0010-testsuite-tar-tests-fix-test-after-cve-2025-46394.patch
 BUSYBOX_IGNORE_CVES += CVE-2025-46394
 
-# 0014-wget-dont-allow-control-characters-or-spaces-in-the-URL.patch
+# 0011-wget-dont-allow-control-characters-or-spaces-in-the-URL.patch
 BUSYBOX_IGNORE_CVES += CVE-2025-60876
 
 BUSYBOX_CFLAGS = \

--===============7013077143996848370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7013077143996848370==--
