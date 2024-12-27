Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E451C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71C6784821;
	Fri, 28 Feb 2025 16:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3yHdEDZ0xzZw; Fri, 28 Feb 2025 16:43:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 505A784822
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 505A784822;
	Fri, 28 Feb 2025 16:43:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25A4968
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D53E42CF6
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r_BPVl2upHdp for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F88342528
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F88342528
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6900C83D30; Fri, 28 Feb 2025 16:29:46 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 27 Dec 2024 11:34:10 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f78d8b50fea526a9cadd8480cb058536202cb4bc
X-Git-Newrev: 653e62918fb4fffe981e2212ae5597280d2ae091
X-Patchwork-Hint: ignore
Message-Id: <20250228162946.6900C83D30@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/kmod: bump to version
 33
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=653e62918fb4fffe981e2212ae5597280d2ae091
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For announces since v31, see:
https://lore.kernel.org/linux-modules/lsycc6ghy3vniv5c72c2jwms2yclyy7hkvez7twqk3sh6j2ufu@uhvvggs27tcj/
https://lore.kernel.org/linux-modules/vi25zbzu3pteuevfnbfldyt23euinlrjqsfju5jdkgdbnluz7j@yyr3qmladzpj/

Remove an upstreamed patch.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Julien: add links to release announces]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-portable-implementation-for-basename-API.patch | 134 ---------------------
 package/kmod/kmod.hash                             |   2 +-
 package/kmod/kmod.mk                               |   2 +-
 3 files changed, 2 insertions(+), 136 deletions(-)

diff --git a/package/kmod/0002-Use-portable-implementation-for-basename-API.patch b/package/kmod/0002-Use-portable-implementation-for-basename-API.patch
deleted file mode 100644
index 26f108d66e..0000000000
--- a/package/kmod/0002-Use-portable-implementation-for-basename-API.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-From 721ed6040c7aa47070faf6378c433089e178bd43 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 9 Dec 2023 17:35:59 -0800
-Subject: [PATCH] Use portable implementation for basename API
-
-musl has removed the non-prototype declaration of basename from
-string.h [1] which now results in build errors with clang-17+ compiler
-
-Implement GNU basename behavior using strchr which is portable across libcs
-
-Fixes
-../git/tools/kmod.c:71:19: error: call to undeclared function 'basename'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-71 | "Commands:\n", basename(argv[0]));
-| ^
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
-
-Suggested-by: Rich Felker
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream: https://github.com/kmod-project/kmod/pull/32
-Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
----
- libkmod/libkmod-config.c | 2 +-
- shared/util.c            | 4 ++--
- shared/util.h            | 7 +++++++
- testsuite/testsuite.c    | 2 +-
- tools/depmod.c           | 2 +-
- tools/kmod.c             | 4 ++--
- 6 files changed, 14 insertions(+), 7 deletions(-)
-
-diff --git a/libkmod/libkmod-config.c b/libkmod/libkmod-config.c
-index e83621b3..8aa555a4 100644
---- a/libkmod/libkmod-config.c
-+++ b/libkmod/libkmod-config.c
-@@ -794,7 +794,7 @@ static int conf_files_insert_sorted(struct kmod_ctx *ctx,
- 	bool is_single = false;
-
- 	if (name == NULL) {
--		name = basename(path);
-+		name = gnu_basename(path);
- 		is_single = true;
- 	}
-
-diff --git a/shared/util.c b/shared/util.c
-index e2bab83a..0e16670e 100644
---- a/shared/util.c
-+++ b/shared/util.c
-@@ -172,9 +172,9 @@ char *modname_normalize(const char *modname, char buf[static PATH_MAX], size_t *
-
- char *path_to_modname(const char *path, char buf[static PATH_MAX], size_t *len)
- {
--	char *modname;
-+	const char *modname;
-
--	modname = basename(path);
-+	modname = gnu_basename(path);
- 	if (modname == NULL || modname[0] == '\0')
- 		return NULL;
-
-diff --git a/shared/util.h b/shared/util.h
-index c4a3916b..073dc5a7 100644
---- a/shared/util.h
-+++ b/shared/util.h
-@@ -5,6 +5,7 @@
- #include <stdbool.h>
- #include <stdlib.h>
- #include <stdio.h>
-+#include <string.h>
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <time.h>
-@@ -76,6 +77,12 @@ do {						\
- 	__p->__v = (val);			\
- } while(0)
-
-+static _always_inline_ const char *gnu_basename(const char *s)
-+{
-+  const char *p = strrchr(s, '/');
-+  return p ? p+1 : s;
-+}
-+
- static _always_inline_ unsigned int ALIGN_POWER2(unsigned int u)
- {
- 	return 1 << ((sizeof(u) * 8) - __builtin_clz(u - 1));
-diff --git a/testsuite/testsuite.c b/testsuite/testsuite.c
-index 318343ac..aafc9873 100644
---- a/testsuite/testsuite.c
-+++ b/testsuite/testsuite.c
-@@ -70,7 +70,7 @@ static void help(void)
-
- 	printf("Usage:\n"
- 	       "\t%s [options] <test>\n"
--	       "Options:\n", basename(progname));
-+	       "Options:\n", gnu_basename(progname));
-
- 	for (itr = options, itr_short = options_short;
- 				itr->name != NULL; itr++, itr_short++)
-diff --git a/tools/depmod.c b/tools/depmod.c
-index 43fc354a..cfb15b11 100644
---- a/tools/depmod.c
-+++ b/tools/depmod.c
-@@ -762,7 +762,7 @@ static int cfg_files_insert_sorted(struct cfg_file ***p_files, size_t *p_n_files
- 	if (name != NULL)
- 		namelen = strlen(name);
- 	else {
--		name = basename(dir);
-+		name = gnu_basename(dir);
- 		namelen = strlen(name);
- 		dirlen -= namelen + 1;
- 	}
-diff --git a/tools/kmod.c b/tools/kmod.c
-index 55689c07..df91e5c6 100644
---- a/tools/kmod.c
-+++ b/tools/kmod.c
-@@ -68,7 +68,7 @@ static int kmod_help(int argc, char *argv[])
- 			"Options:\n"
- 			"\t-V, --version     show version\n"
- 			"\t-h, --help        show this help\n\n"
--			"Commands:\n", basename(argv[0]));
-+			"Commands:\n", gnu_basename(argv[0]));
-
- 	for (i = 0; i < ARRAY_SIZE(kmod_cmds); i++) {
- 		if (kmod_cmds[i]->help != NULL) {
-@@ -156,7 +156,7 @@ static int handle_kmod_compat_commands(int argc, char *argv[])
- 	const char *cmd;
- 	size_t i;
-
--	cmd = basename(argv[0]);
-+	cmd = gnu_basename(argv[0]);
-
- 	for (i = 0; i < ARRAY_SIZE(kmod_compat_cmds); i++) {
- 		if (streq(kmod_compat_cmds[i]->name, cmd))
diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
index f4b01b20a2..46a2d538ad 100644
--- a/package/kmod/kmod.hash
+++ b/package/kmod/kmod.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kmod/sha256sums.asc
-sha256  f5a6949043cc72c001b728d8c218609c5a15f3c33d75614b78c79418fcf00d80  kmod-31.tar.xz
+sha256  dc768b3155172091f56dc69430b5481f2d76ecd9ccb54ead8c2540dbcf5ea9bc  kmod-33.tar.xz
 
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  libkmod/COPYING
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index d83fb85a3e..dfdd17b955 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMOD_VERSION = 31
+KMOD_VERSION = 33
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
