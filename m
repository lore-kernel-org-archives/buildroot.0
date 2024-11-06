Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5179D59F73
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 21:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1660E80C73;
	Wed,  6 Nov 2024 21:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YcWmhyTj4z4h; Wed,  6 Nov 2024 21:21:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 911FB8146A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 911FB8146A;
	Wed,  6 Nov 2024 21:21:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 22C234C3B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5612460A6B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJ202n1j5t28 for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 21:21:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 163A560A54
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 163A560A54
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:21:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01AE485E9A; Wed,  6 Nov 2024 21:21:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Nov 2024 22:19:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1ce2522b4e469ee738b1a141299ff99db70ef13
X-Git-Newrev: a3b2bc8e16d58e6009b2c628e170dc480fe00035
X-Patchwork-Hint: ignore
Message-Id: <20241106212113.01AE485E9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkgconf: bump to version 2.3.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a3b2bc8e16d58e6009b2c628e170dc480fe00035
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebase only prefix subset of variables patch.

Drop revert main assume modversion patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...ix-with-the-sysroot-a-subset-of-variables.patch | 78 +++++++++++-----------
 ...-assume-modversion-insted-of-version-if-o.patch | 45 -------------
 package/pkgconf/pkgconf.hash                       |  2 +-
 package/pkgconf/pkgconf.mk                         |  2 +-
 5 files changed, 42 insertions(+), 86 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index eceea28f0c..48c406270c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1023,7 +1023,6 @@ package/pistache/0001-src-common-transport.cc-fallback-value-for-RUSAGE_TH.patch
 package/pistache/0002-src-server-listener.cc-fix-libressl-build.patch lib_patch.Upstream
 package/pixman/0001-Disable-tests.patch lib_patch.Upstream
 package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch lib_patch.Upstream
-package/pkgconf/0002-Revert-main-assume-modversion-insted-of-version-if-o.patch lib_patch.Upstream
 package/pkgconf/pkg-config.in Shellcheck
 package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch lib_patch.Upstream
 package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch lib_patch.Upstream
diff --git a/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch b/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch
index a039d0c1bc..d25039ade2 100644
--- a/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch
+++ b/package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch
@@ -1,4 +1,4 @@
-From 267a57022699453e8d8f517519df25ac6bf6ac4e Mon Sep 17 00:00:00 2001
+From c1f9e60f46f2207f9dd07dd290ad5a2da05ad41d Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sun, 16 Dec 2018 11:52:18 +0100
 Subject: [PATCH] Only prefix with the sysroot a subset of variables
@@ -23,19 +23,19 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 [Updated to include gobject-introspection paths]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
- libpkgconf/tuple.c | 60 ++++++++++++++++++++++++++++++++--------------
- 1 file changed, 42 insertions(+), 18 deletions(-)
+ libpkgconf/tuple.c | 65 ++++++++++++++++++++++++++++++++--------------
+ 1 file changed, 46 insertions(+), 19 deletions(-)
 
 diff --git a/libpkgconf/tuple.c b/libpkgconf/tuple.c
-index 8523709..7cd2fff 100644
+index 83f6a47..a2aa427 100644
 --- a/libpkgconf/tuple.c
 +++ b/libpkgconf/tuple.c
-@@ -161,6 +161,21 @@ dequote(const char *value)
+@@ -178,6 +178,21 @@ dequote(const char *value)
  	return buf;
  }
  
 +static char *
-+pkgconf_tuple_parse_sysroot(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value, bool add_sysroot);
++pkgconf_tuple_parse_sysroot(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value, unsigned int flags, bool add_sysroot);
 +
 +const char *sysrooted_keys[] = {
 +	"g_ir_scanner",
@@ -49,21 +49,19 @@ index 8523709..7cd2fff 100644
 +	NULL,
 +};
 +
- /*
-  * !doc
-  *
-@@ -181,6 +193,8 @@ pkgconf_tuple_add(const pkgconf_client_t *client, pkgconf_list_t *list, const ch
+ static const char *
+ find_sysroot(const pkgconf_client_t *client, pkgconf_list_t *vars)
+ {
+@@ -237,14 +252,20 @@ pkgconf_tuple_add(const pkgconf_client_t *client, pkgconf_list_t *list, const ch
  {
  	char *dequote_value;
- 	pkgconf_tuple_t *tuple = calloc(sizeof(pkgconf_tuple_t), 1);
+ 	pkgconf_tuple_t *tuple = calloc(1, sizeof(pkgconf_tuple_t));
 +	bool add_sysroot = false;
 +	int i;
  
  	pkgconf_tuple_find_delete(list, key);
  
-@@ -188,9 +202,13 @@ pkgconf_tuple_add(const pkgconf_client_t *client, pkgconf_list_t *list, const ch
- 
- 	PKGCONF_TRACE(client, "adding tuple to @%p: %s => %s (parsed? %d)", list, key, dequote_value, parse);
+ 	dequote_value = dequote(value);
  
 +	for (i = 0; sysrooted_keys[i] != NULL; i++)
 +		if (!strcmp(key, sysrooted_keys[i]))
@@ -71,77 +69,81 @@ index 8523709..7cd2fff 100644
 +
  	tuple->key = strdup(key);
  	if (parse)
--		tuple->value = pkgconf_tuple_parse(client, list, dequote_value);
-+		tuple->value = pkgconf_tuple_parse_sysroot(client, list, dequote_value, add_sysroot);
+-		tuple->value = pkgconf_tuple_parse(client, list, dequote_value, flags);
++		tuple->value = pkgconf_tuple_parse_sysroot(client, list, dequote_value, flags, add_sysroot);
  	else
  		tuple->value = strdup(dequote_value);
  
-@@ -234,27 +252,14 @@ pkgconf_tuple_find(const pkgconf_client_t *client, pkgconf_list_t *list, const c
+@@ -294,22 +315,8 @@ pkgconf_tuple_find(const pkgconf_client_t *client, pkgconf_list_t *list, const c
  	return NULL;
  }
  
 -/*
 - * !doc
 - *
-- * .. c:function:: char *pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value)
+- * .. c:function:: char *pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value, unsigned int flags)
 - *
 - *    Parse an expression for variable substitution.
 - *
 - *    :param pkgconf_client_t* client: The pkgconf client object to access.
 - *    :param pkgconf_list_t* list: The variable list to search for variables (along side the global variable list).
 - *    :param char* value: The ``key=value`` string to parse.
+- *    :param uint flags: Any flags to consider while parsing.
 - *    :return: the variable data with any variables substituted
 - *    :rtype: char *
 - */
 -char *
--pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value)
+-pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value, unsigned int flags)
 +static char *
-+pkgconf_tuple_parse_sysroot(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value, bool add_sysroot)
++pkgconf_tuple_parse_sysroot(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value, unsigned int flags, bool add_sysroot)
  {
  	char buf[PKGCONF_BUFSIZE];
  	const char *ptr;
- 	char *bptr = buf;
- 
--	if (*value == '/' && client->sysroot_dir != NULL && strncmp(value, client->sysroot_dir, strlen(client->sysroot_dir)))
-+	if (add_sysroot && *value == '/' && client->sysroot_dir != NULL && strncmp(value, client->sysroot_dir, strlen(client->sysroot_dir)))
- 		bptr += pkgconf_strlcpy(buf, client->sysroot_dir, sizeof buf);
+@@ -318,7 +325,7 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
+ 	if (!(client->flags & PKGCONF_PKG_PKGF_FDO_SYSROOT_RULES) &&
+ 		(!(flags & PKGCONF_PKG_PROPF_UNINSTALLED) || (client->flags & PKGCONF_PKG_PKGF_PKGCONF1_SYSROOT_RULES)))
+ 	{
+-		if (*value == '/' && client->sysroot_dir != NULL && strncmp(value, client->sysroot_dir, strlen(client->sysroot_dir)))
++		if (add_sysroot && *value == '/' && client->sysroot_dir != NULL && strncmp(value, client->sysroot_dir, strlen(client->sysroot_dir)))
+ 			bptr += pkgconf_strlcpy(buf, client->sysroot_dir, sizeof buf);
+ 	}
  
- 	for (ptr = value; *ptr != '\0' && bptr - buf < PKGCONF_BUFSIZE; ptr++)
-@@ -294,7 +299,7 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
- 
- 				if (kv != NULL)
+@@ -381,7 +388,7 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
  				{
--					parsekv = pkgconf_tuple_parse(client, vars, kv);
-+					parsekv = pkgconf_tuple_parse_sysroot(client, vars, kv, add_sysroot);
+ 					size_t nlen;
+ 
+-					parsekv = pkgconf_tuple_parse(client, vars, kv, flags);
++					parsekv = pkgconf_tuple_parse_sysroot(client, vars, kv, flags, add_sysroot);
+ 					nlen = pkgconf_strlcpy(bptr, parsekv, remain);
+ 					free(parsekv);
  
- 					strncpy(bptr, parsekv, PKGCONF_BUFSIZE - (bptr - buf));
- 					bptr += strlen(parsekv);
-@@ -339,6 +344,25 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
+@@ -432,6 +439,26 @@ pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const
  	return strdup(buf);
  }
  
 +/*
 + * !doc
 + *
-+ * .. c:function:: char *pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value)
++ * .. c:function:: char *pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value, unsigned int flags)
 + *
 + *    Parse an expression for variable substitution.
 + *
 + *    :param pkgconf_client_t* client: The pkgconf client object to access.
 + *    :param pkgconf_list_t* list: The variable list to search for variables (along side the global variable list).
 + *    :param char* value: The ``key=value`` string to parse.
++ *    :param uint flags: Any flags to consider while parsing.
 + *    :return: the variable data with any variables substituted
 + *    :rtype: char *
 + */
 +char *
-+pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value)
++pkgconf_tuple_parse(const pkgconf_client_t *client, pkgconf_list_t *vars, const char *value, unsigned int flags)
 +{
-+	return pkgconf_tuple_parse_sysroot(client, vars, value, true);
++	return pkgconf_tuple_parse_sysroot(client, vars, value, flags, true);
 +}
 +
  /*
   * !doc
   *
 -- 
-2.19.2
+2.34.1
 
diff --git a/package/pkgconf/0002-Revert-main-assume-modversion-insted-of-version-if-o.patch b/package/pkgconf/0002-Revert-main-assume-modversion-insted-of-version-if-o.patch
deleted file mode 100644
index f659a3b07f..0000000000
--- a/package/pkgconf/0002-Revert-main-assume-modversion-insted-of-version-if-o.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 4ccef40918a539905a2951bfb81cf8dba4a245c6 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Wed, 2 Jan 2019 18:15:50 +0100
-Subject: [PATCH] Revert "main: assume --modversion insted of --version if
- other flags or module names are provided"
-
-This reverts commit 12a0eb124cea85586e57f33c91a1e4c73459eef6, as it
-causes pkg-config to assume --modversion is used when something as
-simple as 'pkg-config --static --version' is used, leading to a
-failure instead of the expected behavior: the one of "pkg-config
---version".
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- cli/main.c | 14 ++------------
- 1 file changed, 2 insertions(+), 12 deletions(-)
-
-diff --git a/cli/main.c b/cli/main.c
-index b52cc85..c5acc10 100644
---- a/cli/main.c
-+++ b/cli/main.c
-@@ -1002,18 +1002,8 @@ main(int argc, char *argv[])
- 
- 	if ((want_flags & PKG_VERSION) == PKG_VERSION)
- 	{
--		if (argc > 2)
--		{
--			fprintf(stderr, "%s: --version specified with other options or module names, assuming --modversion.\n", argv[0]);
--
--			want_flags &= ~PKG_VERSION;
--			want_flags |= PKG_MODVERSION;
--		}
--		else
--		{
--			version();
--			return EXIT_SUCCESS;
--		}
-+		version();
-+		return EXIT_SUCCESS;
- 	}
- 
- 	if ((want_flags & PKG_HELP) == PKG_HELP)
--- 
-2.20.1
-
diff --git a/package/pkgconf/pkgconf.hash b/package/pkgconf/pkgconf.hash
index f210869c03..6d4b7972d6 100644
--- a/package/pkgconf/pkgconf.hash
+++ b/package/pkgconf/pkgconf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  61f0b31b0d5ea0e862b454a80c170f57bad47879c0c42bd8de89200ff62ea210  pkgconf-1.6.3.tar.xz
+sha256  3a9080ac51d03615e7c1910a0a2a8df08424892b5f13b0628a204d3fcce0ea8b  pkgconf-2.3.0.tar.xz
 sha256  07ee94b50a41ee3fc4e13a9b9c60b26fc28488494c465639f7e5f07a3952ec04  COPYING
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index a8c7b48287..057f43bb98 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PKGCONF_VERSION = 1.6.3
+PKGCONF_VERSION = 2.3.0
 PKGCONF_SITE = https://distfiles.ariadne.space/pkgconf
 PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.xz
 PKGCONF_LICENSE = pkgconf license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
