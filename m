Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBECC54E49
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 07:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF9B2407E3;
	Mon,  4 Mar 2024 07:33:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jSMg4QMS3A-y; Mon,  4 Mar 2024 07:33:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16B9A407D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16B9A407D4;
	Mon,  4 Mar 2024 07:33:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 689C81BF280
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 07:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6150A60B54
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 07:33:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UZQX-3_1QwyE for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 07:33:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E935E60B53
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E935E60B53
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 07:33:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C85D688037; Mon,  4 Mar 2024 07:33:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Mar 2024 08:25:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1fa9bc2f7a4e5481edf4fce5c03dd45862fe72c
X-Git-Newrev: 077741623fcd5372a43dd78719f859c479815901
X-Patchwork-Hint: ignore
Message-Id: <20240304073307.C85D688037@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/efivar: bump to version 39 to fix
 build failures
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

commit: https://git.buildroot.net/buildroot/commit/?id=077741623fcd5372a43dd78719f859c479815901
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note since version 38, see [1].

This commit introduces changes in package patches:

- 0001: Patch dropped. An similar change is included in this release.
  See [2].
- 0002: Patch no longer needed since the package build recipe sets
  CFLAGS without -Werror, and the package makefile sets -Werror only
  by default. See [3], included since version 38.
- 0003: Rebased on version 39 and renamed to 0001. The patch is also
  flagged as "Upstream: Not applicable".
- 0004: Patch dropped. Included in this release. See [4].

This commit also removes all patch entries in ".checkpackageignore"
(since the remaining patch has its "Upstream:" tag).

This version 39 also fixes few build failures. Those can be seen by
running the command "utils/test-pkg -a -p efivar". The first group
of build failures is:

                br-arm-basic [28/45]: FAILED
       br-i386-pentium4-full [31/45]: FAILED
          br-mips64-n64-full [33/45]: FAILED
     br-mips64r6-el-hf-glibc [34/45]: FAILED
              linaro-aarch64 [38/45]: FAILED
                  linaro-arm [39/45]: FAILED

Fixes:

    /buildroot/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/7.3.1/../../../../aarch64-linux-gnu/bin/ld: .data not found for insert
    collect2: error: ld returned 1 exit status

efivar 38 was using linker scripts, which was not working in all
cases. Those issues are fixed by the upstream commit [5] which
removes the use of this linker script (included in this release).

The "test-pkg -a -p efivar" also caught another kind of build
failures:

    br-i386-pentium-mmx-musl [32/45]: FAILED

Fixes:

    In file included from efivar.h:18,
                     from efisec.h:24,
                     from secdb-dump.c:7:
    list.h: In function 'list_sort':
    list.h:152:2: warning: implicit declaration of function 'qsort_r'; did you mean 'qsort'? [-Wimplicit-function-declaration]
      152 |  qsort_r(array, nmemb, sizeof(*array), cmp, state);
          |  ^~~~~~~
          |  qsort

Those failures were introduced in commit f24029b561 "package/efivar:
bump to version 38". This is because efivar introduced a usage of the
qsort_r() libc function, in upstream commit [6], first included in
version 38.

Musl libc added the qsort_r() function in upstream commit [7], included in
version v1.2.3 (2022-04-07).  So external toolchains including a Musl older
than this version will fail.  But given how old this issue is (musql 1.2.3
is included in Buildroot since 2022.05), this issue is ignored.

uClibc-ng external toolchains are also not affected, since it added
the qsort_r() function in commit [8] included since its first version
v1.0.0 (2015-02-02). So there is no need to exclude external uclibc
toolchains.

[1] https://github.com/rhboot/efivar/releases/tag/39
[2] https://github.com/rhboot/efivar/commit/4f3da3dc351d7743d91327e74fcaaa13299eeb39
[3] https://github.com/rhboot/efivar/commit/998f617cec92d526e1fadb745673ceef63fa1483
[4] https://github.com/rhboot/efivar/commit/cece3ffd5be2f8641eb694513f2b73e5eb97ffd3
[5] https://github.com/rhboot/efivar/commit/cfd686de51494d3e34be896a91835657ccab37d4
[6] https://github.com/rhboot/efivar/commit/62afa2aa588fb0a6ff56acdd268b9f3c557028b8
[7] https://git.musl-libc.org/cgit/musl/commit/?id=b76f37fd5625d038141b52184956fb4b7838e9a5
[8] https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/515d54433138596e81267237542bd9168b8cc787

Signed-off-by: Julien Olivain <ju.o@free.fr>
[Peter: drop dependency on !external musl]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |   4 -
 package/efivar/0001-Allow-build-with-uClibc.patch  |  39 -----
 ...efivar-isolate-makeguids-host-tool-build.patch} |  19 ++-
 package/efivar/0002-gcc.specs-drop-Werror.patch    |  46 -----
 .../0004-efisecdb-fix-build-with-musl-libc.patch   | 185 ---------------------
 package/efivar/efivar.hash                         |   2 +-
 package/efivar/efivar.mk                           |   2 +-
 7 files changed, 13 insertions(+), 284 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index c18cc4d417..1303db52c6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -338,10 +338,6 @@ package/ebtables/0003-configure.ac-add-option-enable-kernel-64-userland-32.patch
 package/ecryptfs-utils/0001-musl.patch Upstream
 package/ecryptfs-utils/0002-openssl110.patch Upstream
 package/ecryptfs-utils/0003-fix-parallel-build-issue.patch Upstream
-package/efivar/0001-Allow-build-with-uClibc.patch Upstream
-package/efivar/0002-gcc.specs-drop-Werror.patch Upstream
-package/efivar/0003-efivar-isolate-makeguids-host-tool-build.patch Upstream
-package/efivar/0004-efisecdb-fix-build-with-musl-libc.patch Upstream
 package/efl/0001-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch Upstream
 package/efl/0002-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch Upstream
 package/efl/0003-ecore_fb-fix-build-with-tslib.patch Upstream
diff --git a/package/efivar/0001-Allow-build-with-uClibc.patch b/package/efivar/0001-Allow-build-with-uClibc.patch
deleted file mode 100644
index 0da80f26d2..0000000000
--- a/package/efivar/0001-Allow-build-with-uClibc.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From bfd9cd9e603ef0d0e593d4432048bffc2acfeb7c Mon Sep 17 00:00:00 2001
-From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
-Date: Fri, 25 Nov 2016 19:42:27 +0200
-Subject: [PATCH] Allow build with uClibc
-
-Basically this replaces type definitions in <uchar.h>.
-
-Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
-[Erico: rebase to 38]
-Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
----
- src/export.c | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/src/export.c b/src/export.c
-index db5e637..21c5617 100644
---- a/src/export.c
-+++ b/src/export.c
-@@ -9,10 +9,16 @@
- #include <inttypes.h>
- #include <stdint.h>
- #include <stdlib.h>
--#include <uchar.h>
- 
- #include "efivar.h"
- 
-+#ifdef __UCLIBC__
-+typedef int_least16_t char16_t;
-+typedef int_least32_t char32_t;
-+#else
-+#include <uchar.h>
-+#endif
-+
- #define EFIVAR_MAGIC 0xf3df1597u
- 
- #define ATTRS_UNSET 0xa5a5a5a5a5a5a5a5
--- 
-2.37.3
-
diff --git a/package/efivar/0003-efivar-isolate-makeguids-host-tool-build.patch b/package/efivar/0001-efivar-isolate-makeguids-host-tool-build.patch
similarity index 70%
rename from package/efivar/0003-efivar-isolate-makeguids-host-tool-build.patch
rename to package/efivar/0001-efivar-isolate-makeguids-host-tool-build.patch
index f136bf2cd3..aad207d834 100644
--- a/package/efivar/0003-efivar-isolate-makeguids-host-tool-build.patch
+++ b/package/efivar/0001-efivar-isolate-makeguids-host-tool-build.patch
@@ -1,4 +1,4 @@
-From b069a48abd62a669851b9c3b501d579748dab0fd Mon Sep 17 00:00:00 2001
+From e1c3734bab27fd850b4ac6681d219ceaf0637616 Mon Sep 17 00:00:00 2001
 From: Erico Nunes <nunes.erico@gmail.com>
 Date: Mon, 3 Oct 2022 18:16:55 +0200
 Subject: [PATCH] efivar: isolate makeguids host tool build
@@ -14,16 +14,19 @@ target and remove target build dependencies from it.
 This way, Buildroot can build the tool separately in a host build step
 and the target build step can then be straightforward.
 
+Upstream: Not applicable (does not support cross compilation)
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+[Julien: rebased patch to version 39]
 Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
 ---
  src/Makefile | 5 ++---
  1 file changed, 2 insertions(+), 3 deletions(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index 0e423c4..82c59c2 100644
+index 6fc2a62..7fa63c6 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -68,7 +68,6 @@ makeguids : LDFLAGS=$(HOST_LDFLAGS)
+@@ -70,7 +70,6 @@ makeguids : LDFLAGS=$(HOST_LDFLAGS)
  makeguids : CCLDFLAGS=$(HOST_CCLDFLAGS)
  makeguids : $(MAKEGUIDS_OBJECTS)
  
@@ -31,18 +34,18 @@ index 0e423c4..82c59c2 100644
  $(MAKEGUIDS_OUTPUT) : guids.txt
  	@set -e ; \
  	missing=no ; \
-@@ -81,9 +80,9 @@ $(MAKEGUIDS_OUTPUT) : guids.txt
+@@ -83,9 +82,9 @@ $(MAKEGUIDS_OUTPUT) : guids.txt
  	if [ "$${missing}" != "no" ]; then \
  		exit 1 ; \
  	fi
--	./makeguids $(LD_DASH_T) guids.txt guid-symbols.c include/efivar/efivar-guids.h guids.lds
-+	makeguids $(LD_DASH_T) guids.txt guid-symbols.c include/efivar/efivar-guids.h guids.lds
+-	./makeguids guids.txt guid-symbols.c include/efivar/efivar-guids.h
++	makeguids guids.txt guid-symbols.c include/efivar/efivar-guids.h
  
 -prep : makeguids $(GENERATED_SOURCES)
 +prep : $(GENERATED_SOURCES)
  
- $(LIBEFIVAR_OBJECTS) $(LIBEFIBOOT_OBJECTS) : prep
+ $(LIBEFIVAR_OBJECTS) $(LIBEFIBOOT_OBJECTS) : include/efivar/efivar-guids.h
  
 -- 
-2.37.3
+2.44.0
 
diff --git a/package/efivar/0002-gcc.specs-drop-Werror.patch b/package/efivar/0002-gcc.specs-drop-Werror.patch
deleted file mode 100644
index a25b844906..0000000000
--- a/package/efivar/0002-gcc.specs-drop-Werror.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From a1d469753528a98aec971377a526619da5054b20 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 22 Mar 2021 07:52:34 +0100
-Subject: [PATCH] gcc.specs: drop -Werror
-
-Build with -Werror raises the following build failure with gcc 10:
-
-/home/buildroot/autobuild/run/instance-1/output-1/host/bin/aarch64-none-linux-gnu-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2   -I/home/buildroot/autobuild/run/instance-1/output-1/build/efivar-37/src/include/   -specs=/home/buildroot/autobuild/run/instance-1/output-1/build/efivar-37/gcc.specs  -L.  -fPIC -Wl,-z,muldefs     -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -o efivar efivar.c -lefivar -ldl
-In file included from efivar.h:28,
-                 from efivar.c:40:
-In function 'text_to_guid',
-    inlined from 'parse_name.constprop' at efivar.c:157:8:
-guid.h:106:2: error: 'strncpy' output may be truncated copying 8 bytes from a string of length 38 [-Werror=stringop-truncation]
-  106 |  strncpy(eightbytes, text, 8);
-      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
-cc1: all warnings being treated as errors
-
-Fixes:
- - http://autobuild.buildroot.org/results/fcba72d359f4128515560e9105384cd4deff5043
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not upstreamable as Makefiles were reworked and a new
-ERRORS parameter was added:
-https://github.com/rhboot/efivar/commit/998f617cec92d526e1fadb745673ceef63fa1483]
-[Erico: rebase to 38]
-Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
----
- src/include/defaults.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/include/defaults.mk b/src/include/defaults.mk
-index 632b155..2a9537a 100644
---- a/src/include/defaults.mk
-+++ b/src/include/defaults.mk
-@@ -29,7 +29,7 @@ WARNINGS_GCC ?=
- WARNINGS_CCC_ANALYZER ?= $(WARNINGS_GCC)
- WARNINGS ?= -Wall -Wextra $(call family,WARNINGS)
- ERRORS_GCC ?=
--ERRORS ?= -Werror $(call family,ERRORS)
-+ERRORS ?= $(call family,ERRORS)
- CPPFLAGS ?=
- override _CPPFLAGS := $(CPPFLAGS)
- override CPPFLAGS = $(_CPPFLAGS) -DLIBEFIVAR_VERSION=$(VERSION) \
--- 
-2.37.3
-
diff --git a/package/efivar/0004-efisecdb-fix-build-with-musl-libc.patch b/package/efivar/0004-efisecdb-fix-build-with-musl-libc.patch
deleted file mode 100644
index 9815a9d0cf..0000000000
--- a/package/efivar/0004-efisecdb-fix-build-with-musl-libc.patch
+++ /dev/null
@@ -1,185 +0,0 @@
-From cece3ffd5be2f8641eb694513f2b73e5eb97ffd3 Mon Sep 17 00:00:00 2001
-From: Natanael Copa <ncopa@alpinelinux.org>
-Date: Fri, 28 Jan 2022 12:13:30 +0100
-Subject: [PATCH] efisecdb: fix build with musl libc
-
-Refactor code to use POSIX atexit(3) instead of the GNU specific
-on_exit(3).
-
-Resolves: #197
-Resolves: #202
-Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
-[Erico: backport from upstream commit
-cece3ffd5be2f8641eb694513f2b73e5eb97ffd3]
-Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
----
- src/compiler.h |  2 --
- src/efisecdb.c | 68 +++++++++++++++++++-------------------------------
- 2 files changed, 26 insertions(+), 44 deletions(-)
-
-diff --git a/src/compiler.h b/src/compiler.h
-index e2f18f0..d95fb01 100644
---- a/src/compiler.h
-+++ b/src/compiler.h
-@@ -7,8 +7,6 @@
- #ifndef COMPILER_H_
- #define COMPILER_H_
- 
--#include <sys/cdefs.h>
--
- /* GCC version checking borrowed from glibc. */
- #if defined(__GNUC__) && defined(__GNUC_MINOR__)
- #  define GNUC_PREREQ(maj,min) \
-diff --git a/src/efisecdb.c b/src/efisecdb.c
-index f882373..6bd5ad9 100644
---- a/src/efisecdb.c
-+++ b/src/efisecdb.c
-@@ -25,6 +25,10 @@
- extern char *optarg;
- extern int optind, opterr, optopt;
- 
-+static efi_secdb_t *secdb = NULL;
-+static list_t infiles;
-+static list_t actions;
-+
- struct hash_param {
- 	char *name;
- 	efi_secdb_type_t algorithm;
-@@ -187,12 +191,11 @@ add_action(list_t *list, action_type_t action_type, const efi_guid_t *owner,
- }
- 
- static void
--free_actions(int status UNUSED, void *actionsp)
-+free_actions(void)
- {
--	list_t *actions = (list_t *)actionsp;
- 	list_t *pos, *tmp;
- 
--	for_each_action_safe(pos, tmp, actions) {
-+	for_each_action_safe(pos, tmp, &actions) {
- 		action_t *action = list_entry(pos, action_t, list);
- 
- 		list_del(&action->list);
-@@ -202,12 +205,11 @@ free_actions(int status UNUSED, void *actionsp)
- }
- 
- static void
--free_infiles(int status UNUSED, void *infilesp)
-+free_infiles(void)
- {
--	list_t *infiles = (list_t *)infilesp;
- 	list_t *pos, *tmp;
- 
--	for_each_ptr_safe(pos, tmp, infiles) {
-+	for_each_ptr_safe(pos, tmp, &infiles) {
- 		ptrlist_t *entry = list_entry(pos, ptrlist_t, list);
- 
- 		list_del(&entry->list);
-@@ -216,27 +218,12 @@ free_infiles(int status UNUSED, void *infilesp)
- }
- 
- static void
--maybe_free_secdb(int status UNUSED, void *voidp)
-+maybe_free_secdb(void)
- {
--	efi_secdb_t **secdbp = (efi_secdb_t **)voidp;
--
--	if (secdbp == NULL || *secdbp == NULL)
-+	if (secdb == NULL)
- 		return;
- 
--	efi_secdb_free(*secdbp);
--}
--
--static void
--maybe_do_unlink(int status, void *filep)
--{
--	char **file = (char **)filep;
--
--	if (status == 0)
--		return;
--	if (file == NULL || *file == NULL)
--		return;
--
--	unlink(*file);
-+	efi_secdb_free(secdb);
- }
- 
- static void
-@@ -323,15 +310,6 @@ parse_input_files(list_t *infiles, char **outfile, efi_secdb_t **secdb,
- 	return status;
- }
- 
--/*
-- * These need to be static globals so that they're not on main's stack when
-- * on_exit() fires.
-- */
--static efi_secdb_t *secdb = NULL;
--static list_t infiles;
--static list_t actions;
--static char *outfile = NULL;
--
- int
- main(int argc, char *argv[])
- {
-@@ -351,6 +329,7 @@ main(int argc, char *argv[])
- 	bool do_sort_data = false;
- 	bool sort_descending = false;
- 	int status = 0;
-+	char *outfile = NULL;
- 
- 	const char sopts[] = ":aAc:dfg:h:i:Lo:rs:t:v?";
- 	const struct option lopts[] = {
-@@ -376,10 +355,9 @@ main(int argc, char *argv[])
- 	INIT_LIST_HEAD(&infiles);
- 	INIT_LIST_HEAD(&actions);
- 
--	on_exit(free_actions, &actions);
--	on_exit(free_infiles, &infiles);
--	on_exit(maybe_free_secdb, &secdb);
--	on_exit(maybe_do_unlink, &outfile);
-+	atexit(free_actions);
-+	atexit(free_infiles);
-+	atexit(maybe_free_secdb);
- 
- 	/*
- 	 * parse the command line.
-@@ -587,24 +565,30 @@ sort_err:
- 	outfd = open(outfile, flags, 0600);
- 	if (outfd < 0) {
- 		char *tmpoutfile = outfile;
--		if (errno == EEXIST)
--			outfile = NULL;
-+		if (errno != EEXIST)
-+			unlink(outfile);
- 		err(1, "could not open \"%s\"", tmpoutfile);
- 	}
- 
- 	rc = ftruncate(outfd, 0);
--	if (rc < 0)
-+	if (rc < 0) {
-+		unlink(outfile);
- 		err(1, "could not truncate output file \"%s\"", outfile);
-+	}
- 
- 	void *output;
- 	size_t size = 0;
- 	rc = efi_secdb_realize(secdb, &output, &size);
--	if (rc < 0)
-+	if (rc < 0) {
-+		unlink(outfile);
- 		secdb_err(1, "could not realize signature list");
-+	}
- 
- 	rc = write(outfd, output, size);
--	if (rc < 0)
-+	if (rc < 0) {
-+		unlink(outfile);
- 		err(1, "could not write signature list");
-+	}
- 
- 	close(outfd);
- 	xfree(output);
--- 
-2.37.3
-
diff --git a/package/efivar/efivar.hash b/package/efivar/efivar.hash
index 827b46baa4..bef096bda6 100644
--- a/package/efivar/efivar.hash
+++ b/package/efivar/efivar.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  e3bbde37238bd47af1fcf270dc0ef1f4be030d86364c917b93669222ec52bbea  efivar-38.tar.gz
+sha256  c9edd15f2eeeea63232f3e669a48e992c7be9aff57ee22672ac31f5eca1609a6  efivar-39.tar.gz
 sha256  91df770634adc2755e78cae33a0d01e702ce2f69046408ae93d0d934ff29691b  COPYING
diff --git a/package/efivar/efivar.mk b/package/efivar/efivar.mk
index ee6d7302df..6c3b57837a 100644
--- a/package/efivar/efivar.mk
+++ b/package/efivar/efivar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFIVAR_VERSION = 38
+EFIVAR_VERSION = 39
 EFIVAR_SITE = $(call github,rhboot,efivar,$(EFIVAR_VERSION))
 EFIVAR_LICENSE = LGPL-2.1
 EFIVAR_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
