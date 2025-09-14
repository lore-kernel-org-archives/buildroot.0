Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0C6CA0EE8
	for <buildroot@archiver.kernel.org>; Sun, 14 Sep 2025 22:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A69A941F84;
	Sun, 14 Sep 2025 22:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g733yTKz-TBf; Sun, 14 Sep 2025 22:21:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F27141F88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F27141F88;
	Sun, 14 Sep 2025 22:21:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F038F1F7
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 22:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4C59848DA
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 22:21:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oHSfGtz0Uf_8 for <buildroot@buildroot.org>;
 Sun, 14 Sep 2025 22:21:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA34E848DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA34E848DC
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 22:21:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C765846EA; Sun, 14 Sep 2025 22:21:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Sep 2025 23:46:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca143cd857f2901393fffa013cc6bb1853144275
X-Git-Newrev: d2262b0af78c66fca5ed1feac8729c0d8446e214
X-Patchwork-Hint: ignore
Message-Id: <20250914222137.8C765846EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsemanage: bump to version 3.9
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d2262b0af78c66fca5ed1feac8729c0d8446e214
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes:
https://github.com/SELinuxProject/selinux/releases/download/3.9/RELEASE-3.9.txt

Related to libsemanage: nothing relevant.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-create-semanage_basename-to-ensure-posix.patch | 172 ---------------------
 package/libsemanage/libsemanage.hash               |   2 +-
 package/libsemanage/libsemanage.mk                 |   2 +-
 3 files changed, 2 insertions(+), 174 deletions(-)

diff --git a/package/libsemanage/0001-libsemanage-create-semanage_basename-to-ensure-posix.patch b/package/libsemanage/0001-libsemanage-create-semanage_basename-to-ensure-posix.patch
deleted file mode 100644
index 10a81241a1..0000000000
--- a/package/libsemanage/0001-libsemanage-create-semanage_basename-to-ensure-posix.patch
+++ /dev/null
@@ -1,172 +0,0 @@
-From 795f8381fd64abf692b26d01369561fc68be230c Mon Sep 17 00:00:00 2001
-From: Rahul Sandhu <nvraxn@gmail.com>
-Date: Fri, 21 Feb 2025 09:39:10 +0000
-Subject: [PATCH] libsemanage: create semanage_basename to ensure posix
- compliance
-
-Passing a const char * to basename(3) is a glibc-specific extension, so
-create our own basename implementation. As it's a trivial 2 LOC, always
-use our implementation of basename even if glibc is available to avoid
-the complications of attaining the non-posix glibc implementation of
-basename(3) as _GNU_SOURCE needs to be defined, but libgen.h also needs
-to have not been included.
-
-Also fix a missing check for selinux_policy_root(3). From the man page:
-On failure, selinux_policy_root returns NULL.
-
-As the glibc basename(3) (unlike posix basename(3)) does not support
-having a nullptr passed to it, only pass the policy_root to basename(3)
-if it is non-null.
-
-Signed-off-by: Rahul Sandhu <nvraxn@gmail.com>
-Acked-by: James Carter <jwcart2@gmail.com>
-Upstream: a339594da6f027aed5d66ec6798a3d732df235e4
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/conf-parse.y       | 13 ++++++++++---
- src/direct_api.c       |  1 +
- src/utilities.c        |  9 +++++++++
- src/utilities.h        | 13 +++++++++++++
- tests/test_utilities.c | 26 ++++++++++++++++++++++++++
- 5 files changed, 59 insertions(+), 3 deletions(-)
-
-diff --git a/src/conf-parse.y b/src/conf-parse.y
-index 6cb8a598..d3ca5f1f 100644
---- a/src/conf-parse.y
-+++ b/src/conf-parse.y
-@@ -21,6 +21,7 @@
- %{
- 
- #include "semanage_conf.h"
-+#include "utilities.h"
- 
- #include <sepol/policydb.h>
- #include <selinux/selinux.h>
-@@ -382,7 +383,10 @@ external_opt:   PROG_PATH '=' ARG  { PASSIGN(new_external->path, $3); }
- static int semanage_conf_init(semanage_conf_t * conf)
- {
- 	conf->store_type = SEMANAGE_CON_DIRECT;
--	conf->store_path = strdup(basename(selinux_policy_root()));
-+	const char *policy_root = selinux_policy_root();
-+	if (policy_root != NULL) {
-+		conf->store_path = strdup(semanage_basename(policy_root));
-+	}
- 	conf->ignoredirs = NULL;
- 	conf->store_root_path = strdup("/var/lib/selinux");
- 	conf->compiler_directory_path = strdup("/usr/libexec/selinux/hll");
-@@ -544,8 +548,11 @@ static int parse_module_store(char *arg)
- 	free(current_conf->store_path);
- 	if (strcmp(arg, "direct") == 0) {
- 		current_conf->store_type = SEMANAGE_CON_DIRECT;
--		current_conf->store_path =
--		    strdup(basename(selinux_policy_root()));
-+		const char *policy_root = selinux_policy_root();
-+		if (policy_root != NULL) {
-+			current_conf->store_path =
-+			    strdup(semanage_basename(policy_root));
-+		}
- 		current_conf->server_port = -1;
- 	} else if (*arg == '/') {
- 		current_conf->store_type = SEMANAGE_CON_POLSERV_LOCAL;
-diff --git a/src/direct_api.c b/src/direct_api.c
-index 99cba7f7..ce12ccaf 100644
---- a/src/direct_api.c
-+++ b/src/direct_api.c
-@@ -26,6 +26,7 @@
- 
- #include <assert.h>
- #include <fcntl.h>
-+#include <libgen.h>
- #include <stdio.h>
- #include <stdio_ext.h>
- #include <stdlib.h>
-diff --git a/src/utilities.c b/src/utilities.c
-index 70b5b677..004ffb62 100644
---- a/src/utilities.c
-+++ b/src/utilities.c
-@@ -349,3 +349,12 @@ int write_full(int fd, const void *buf, size_t len)
- 
- 	return 0;
- }
-+
-+#ifdef __GNUC__
-+__attribute__((nonnull))
-+#endif
-+char *semanage_basename(const char *filename)
-+{
-+	char *p = strrchr(filename, '/');
-+	return p ? p + 1 : (char *)filename;
-+}
-diff --git a/src/utilities.h b/src/utilities.h
-index c2d484a7..7481077a 100644
---- a/src/utilities.h
-+++ b/src/utilities.h
-@@ -156,4 +156,17 @@ semanage_list_t *semanage_slurp_file_filter(FILE * file,
- 
- int write_full(int fd, const void *buf, size_t len) WARN_UNUSED;
- 
-+/**
-+ * Portable implementation of the glibc version of basename(3).
-+ *
-+ * @param filename  path to find basename of
-+ *
-+ * @return          basename of filename
-+ */
-+
-+#ifdef __GNUC__
-+__attribute__((nonnull))
-+#endif
-+char *semanage_basename(const char *filename);
-+
- #endif
-diff --git a/tests/test_utilities.c b/tests/test_utilities.c
-index bbd5af30..70a76fe7 100644
---- a/tests/test_utilities.c
-+++ b/tests/test_utilities.c
-@@ -46,6 +46,7 @@ static void test_semanage_rtrim(void);
- static void test_semanage_str_replace(void);
- static void test_semanage_findval(void);
- static void test_slurp_file_filter(void);
-+static void test_semanage_basename(void);
- 
- static char fname[] = {
- 	'T', 'E', 'S', 'T', '_', 'T', 'E', 'M', 'P', '_', 'X', 'X', 'X', 'X',
-@@ -117,6 +118,10 @@ int semanage_utilities_add_tests(CU_pSuite suite)
- 				test_slurp_file_filter)) {
- 		goto err;
- 	}
-+	if (NULL == CU_add_test(suite, "semanage_basename",
-+				test_semanage_basename)) {
-+		goto err;
-+	}
- 	return 0;
-       err:
- 	CU_cleanup_registry();
-@@ -346,3 +351,24 @@ static void test_slurp_file_filter(void)
- 
- 	semanage_list_destroy(&data);
- }
-+
-+static void test_semanage_basename(void)
-+{
-+	char *basename1 = semanage_basename("/foo/bar");
-+	CU_ASSERT_STRING_EQUAL(basename1, "bar");
-+
-+	char *basename2 = semanage_basename("/foo/bar/");
-+	CU_ASSERT_STRING_EQUAL(basename2, "");
-+
-+	char *basename3 = semanage_basename("/foo.bar");
-+	CU_ASSERT_STRING_EQUAL(basename3, "foo.bar");
-+
-+	char *basename5 = semanage_basename(".");
-+	CU_ASSERT_STRING_EQUAL(basename5, ".");
-+
-+	char *basename6 = semanage_basename("");
-+	CU_ASSERT_STRING_EQUAL(basename6, "");
-+
-+	char *basename7 = semanage_basename("/");
-+	CU_ASSERT_STRING_EQUAL(basename7, "");
-+}
--- 
-2.51.0
-
diff --git a/package/libsemanage/libsemanage.hash b/package/libsemanage/libsemanage.hash
index 78067b3ede..1fd5a8019b 100644
--- a/package/libsemanage/libsemanage.hash
+++ b/package/libsemanage/libsemanage.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  7b39127b219cc70bfd935a4af6b0f2ba83d4b35c916f253c7e942c23ab490f07  libsemanage-3.8.1.tar.gz
+sha256  ec05850aef48bfb8e02135a7f4f3f7edba3670f63d5e67f2708d4bd80b9a4634  libsemanage-3.9.tar.gz
 
 # Hash for license file
 sha256  e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  LICENSE
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 21ca9fd3f9..289954f700 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSEMANAGE_VERSION = 3.8.1
+LIBSEMANAGE_VERSION = 3.9
 LIBSEMANAGE_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSEMANAGE_VERSION)
 LIBSEMANAGE_LICENSE = LGPL-2.1+
 LIBSEMANAGE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
