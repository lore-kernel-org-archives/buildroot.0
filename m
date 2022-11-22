Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393DCC4332F
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 21:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D59A4012F;
	Tue, 22 Nov 2022 21:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D59A4012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6BroFgOPjYWf; Tue, 22 Nov 2022 21:20:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F6DE40147;
	Tue, 22 Nov 2022 21:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F6DE40147
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7AFCC1BF38C
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 21:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5459B41907
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 21:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5459B41907
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NGQ0M5Py3ARD for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 21:20:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B238641906
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 21:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B238641906
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9DB9F84170; Tue, 22 Nov 2022 21:20:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Nov 2022 21:51:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e803752a7f2e55fae6cf7de86d46f4c699b5767b
X-Git-Newrev: ea76443a4bca1bcfa0390383870bc21327def6e5
X-Patchwork-Hint: ignore
Message-Id: <20221122212025.9DB9F84170@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/polkit: bump to
 version 122
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea76443a4bca1bcfa0390383870bc21327def6e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As stated in [1] this and future release will only be hosted on
freedesktop's gitlab.
Archives hosted on gitlab are missing the gpg signature.

1: https://gitlab.freedesktop.org/polkit/polkit/-/commit/49bb905131537dde062d477612456328a9655e30

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-make-netgroup-support-optional-meson.patch | 260 ---------------------
 package/polkit/polkit.hash                         |   4 +-
 package/polkit/polkit.mk                           |   4 +-
 3 files changed, 3 insertions(+), 265 deletions(-)

diff --git a/package/polkit/0001-make-netgroup-support-optional-meson.patch b/package/polkit/0001-make-netgroup-support-optional-meson.patch
deleted file mode 100644
index bddeb339bd..0000000000
--- a/package/polkit/0001-make-netgroup-support-optional-meson.patch
+++ /dev/null
@@ -1,260 +0,0 @@
-From b57deee8178190a7ecc75290fa13cf7daabc2c66 Mon Sep 17 00:00:00 2001
-From: "A. Wilcox" <AWilcox@Wilcox-Tech.com>
-Date: Sun, 15 May 2022 05:04:10 +0000
-Subject: [PATCH] Make netgroup support optional
-
-On at least Linux/musl and Linux/uclibc, netgroup support is not
-available.  PolKit fails to compile on these systems for that reason.
-
-This change makes netgroup support conditional on the presence of the
-setnetgrent(3) function which is required for the support to work.  If
-that function is not available on the system, an error will be returned
-to the administrator if unix-netgroup: is specified in configuration.
-
-(sam: rebased for Meson and Duktape.)
-
-Closes: https://gitlab.freedesktop.org/polkit/polkit/-/issues/14
-Closes: https://gitlab.freedesktop.org/polkit/polkit/-/issues/163
-Closes: https://gitlab.freedesktop.org/polkit/polkit/-/merge_requests/52
-Signed-off-by: A. Wilcox <AWilcox@Wilcox-Tech.com>
-Signed-off-by: Daniel Lang <d.lang@abatec.at>
-
----
- meson.build                                     |  1 +
- src/polkit/polkitidentity.c                     | 17 +++++++++++++++++
- src/polkit/polkitunixnetgroup.c                 |  3 +++
- .../polkitbackendduktapeauthority.c             |  4 ++--
- .../polkitbackendinteractiveauthority.c         | 14 ++++++++------
- src/polkitbackend/polkitbackendjsauthority.cpp  |  2 ++
- test/polkit/polkitidentitytest.c                |  8 +++++++-
- test/polkit/polkitunixnetgrouptest.c            |  2 ++
- .../test-polkitbackendjsauthority.c             |  2 ++
- 9 files changed, 44 insertions(+), 9 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 908f0aa..66c4e9b 100644
---- a/meson.build
-+++ b/meson.build
-@@ -89,6 +89,7 @@ config_h.set('_GNU_SOURCE', true)
- check_functions = [
-   'clearenv',
-   'fdatasync',
-+  'setnetgrent',
- ]
- 
- foreach func: check_functions
-diff --git a/src/polkit/polkitidentity.c b/src/polkit/polkitidentity.c
-index 3aa1f7f..793f17d 100644
---- a/src/polkit/polkitidentity.c
-+++ b/src/polkit/polkitidentity.c
-@@ -182,7 +182,15 @@ polkit_identity_from_string  (const gchar   *str,
-     }
-   else if (g_str_has_prefix (str, "unix-netgroup:"))
-     {
-+#ifndef HAVE_SETNETGRENT
-+      g_set_error (error,
-+                   POLKIT_ERROR,
-+                   POLKIT_ERROR_FAILED,
-+                   "Netgroups are not available on this machine ('%s')",
-+                   str);
-+#else
-       identity = polkit_unix_netgroup_new (str + sizeof "unix-netgroup:" - 1);
-+#endif
-     }
- 
-   if (identity == NULL && (error != NULL && *error == NULL))
-@@ -344,6 +352,14 @@ polkit_identity_new_for_gvariant (GVariant  *variant,
-       GVariant *v;
-       const char *name;
- 
-+#ifndef HAVE_SETNETGRENT
-+      g_set_error (error,
-+                   POLKIT_ERROR,
-+                   POLKIT_ERROR_FAILED,
-+                   "Netgroups are not available on this machine");
-+      goto out;
-+#else
-+
-       v = lookup_asv (details_gvariant, "name", G_VARIANT_TYPE_STRING, error);
-       if (v == NULL)
-         {
-@@ -353,6 +369,7 @@ polkit_identity_new_for_gvariant (GVariant  *variant,
-       name = g_variant_get_string (v, NULL);
-       ret = polkit_unix_netgroup_new (name);
-       g_variant_unref (v);
-+#endif
-     }
-   else
-     {
-diff --git a/src/polkit/polkitunixnetgroup.c b/src/polkit/polkitunixnetgroup.c
-index 8a2b369..83f8d4a 100644
---- a/src/polkit/polkitunixnetgroup.c
-+++ b/src/polkit/polkitunixnetgroup.c
-@@ -194,6 +194,9 @@ polkit_unix_netgroup_set_name (PolkitUnixNetgroup *group,
- PolkitIdentity *
- polkit_unix_netgroup_new (const gchar *name)
- {
-+#ifndef HAVE_SETNETGRENT
-+  g_assert_not_reached();
-+#endif
-   g_return_val_if_fail (name != NULL, NULL);
-   return POLKIT_IDENTITY (g_object_new (POLKIT_TYPE_UNIX_NETGROUP,
-                                        "name", name,
-diff --git a/src/polkitbackend/polkitbackendduktapeauthority.c b/src/polkitbackend/polkitbackendduktapeauthority.c
-index c89dbcf..f4b4304 100644
---- a/src/polkitbackend/polkitbackendduktapeauthority.c
-+++ b/src/polkitbackend/polkitbackendduktapeauthority.c
-@@ -1035,7 +1035,7 @@ js_polkit_user_is_in_netgroup (duk_context *cx)
- 
-   user = duk_require_string (cx, 0);
-   netgroup = duk_require_string (cx, 1);
--
-+#ifdef HAVE_SETNETGRENT
-   if (innetgr (netgroup,
-                NULL,  /* host */
-                user,
-@@ -1043,7 +1043,7 @@ js_polkit_user_is_in_netgroup (duk_context *cx)
-     {
-       is_in_netgroup = TRUE;
-     }
--
-+#endif
-   duk_push_boolean (cx, is_in_netgroup);
-   return 1;
- }
-diff --git a/src/polkitbackend/polkitbackendinteractiveauthority.c b/src/polkitbackend/polkitbackendinteractiveauthority.c
-index d935a7a..1cfc88e 100644
---- a/src/polkitbackend/polkitbackendinteractiveauthority.c
-+++ b/src/polkitbackend/polkitbackendinteractiveauthority.c
-@@ -2248,25 +2248,26 @@ get_users_in_net_group (PolkitIdentity                    *group,
-   GList *ret;
- 
-   ret = NULL;
-+#ifdef HAVE_SETNETGRENT
-   name = polkit_unix_netgroup_get_name (POLKIT_UNIX_NETGROUP (group));
- 
--#ifdef HAVE_SETNETGRENT_RETURN
-+# ifdef HAVE_SETNETGRENT_RETURN
-   if (setnetgrent (name) == 0)
-     {
-       g_warning ("Error looking up net group with name %s: %s", name, g_strerror (errno));
-       goto out;
-     }
--#else
-+# else
-   setnetgrent (name);
--#endif
-+# endif /* HAVE_SETNETGRENT_RETURN */
- 
-   for (;;)
-     {
--#if defined(HAVE_NETBSD) || defined(HAVE_OPENBSD)
-+# if defined(HAVE_NETBSD) || defined(HAVE_OPENBSD)
-       const char *hostname, *username, *domainname;
--#else
-+# else
-       char *hostname, *username, *domainname;
--#endif
-+# endif /* defined(HAVE_NETBSD) || defined(HAVE_OPENBSD) */
-       PolkitIdentity *user;
-       GError *error = NULL;
- 
-@@ -2297,6 +2298,7 @@ get_users_in_net_group (PolkitIdentity                    *group,
- 
-  out:
-   endnetgrent ();
-+#endif /* HAVE_SETNETGRENT */
-   return ret;
- }
- 
-diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp b/src/polkitbackend/polkitbackendjsauthority.cpp
-index 2568e8e..999269b 100644
---- a/src/polkitbackend/polkitbackendjsauthority.cpp
-+++ b/src/polkitbackend/polkitbackendjsauthority.cpp
-@@ -1271,6 +1271,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
- 
-   JS::CallArgs args = JS::CallArgsFromVp (argc, vp);
- 
-+#ifdef HAVE_SETNETGRENT
-   JS::RootedString usrstr (authority->priv->cx);
-   usrstr = args[0].toString();
-   user = JS_EncodeStringToUTF8 (cx, usrstr);
-@@ -1285,6 +1286,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
-     {
-       is_in_netgroup =  true;
-     }
-+#endif
- 
-   ret = true;
- 
-diff --git a/test/polkit/polkitidentitytest.c b/test/polkit/polkitidentitytest.c
-index e91967b..2635c4c 100644
---- a/test/polkit/polkitidentitytest.c
-+++ b/test/polkit/polkitidentitytest.c
-@@ -145,11 +145,15 @@ struct ComparisonTestData comparison_test_data [] = {
-   {"unix-group:root", "unix-group:jane", FALSE},
-   {"unix-group:jane", "unix-group:jane", TRUE},
- 
-+#ifdef HAVE_SETNETGRENT
-   {"unix-netgroup:foo", "unix-netgroup:foo", TRUE},
-   {"unix-netgroup:foo", "unix-netgroup:bar", FALSE},
-+#endif
- 
-   {"unix-user:root", "unix-group:root", FALSE},
-+#ifdef HAVE_SETNETGRENT
-   {"unix-user:jane", "unix-netgroup:foo", FALSE},
-+#endif
- 
-   {NULL},
- };
-@@ -181,11 +185,13 @@ main (int argc, char *argv[])
-   g_test_add_data_func ("/PolkitIdentity/group_string_2", "unix-group:jane", test_string);
-   g_test_add_data_func ("/PolkitIdentity/group_string_3", "unix-group:users", test_string);
- 
-+#ifdef HAVE_SETNETGRENT
-   g_test_add_data_func ("/PolkitIdentity/netgroup_string", "unix-netgroup:foo", test_string);
-+  g_test_add_data_func ("/PolkitIdentity/netgroup_gvariant", "unix-netgroup:foo", test_gvariant);
-+#endif
- 
-   g_test_add_data_func ("/PolkitIdentity/user_gvariant", "unix-user:root", test_gvariant);
-   g_test_add_data_func ("/PolkitIdentity/group_gvariant", "unix-group:root", test_gvariant);
--  g_test_add_data_func ("/PolkitIdentity/netgroup_gvariant", "unix-netgroup:foo", test_gvariant);
- 
-   add_comparison_tests ();
- 
-diff --git a/test/polkit/polkitunixnetgrouptest.c b/test/polkit/polkitunixnetgrouptest.c
-index 3701ba1..e1d211e 100644
---- a/test/polkit/polkitunixnetgrouptest.c
-+++ b/test/polkit/polkitunixnetgrouptest.c
-@@ -69,7 +69,9 @@ int
- main (int argc, char *argv[])
- {
-   g_test_init (&argc, &argv, NULL);
-+#ifdef HAVE_SETNETGRENT
-   g_test_add_func ("/PolkitUnixNetgroup/new", test_new);
-   g_test_add_func ("/PolkitUnixNetgroup/set_name", test_set_name);
-+#endif
-   return g_test_run ();
- }
-diff --git a/test/polkitbackend/test-polkitbackendjsauthority.c b/test/polkitbackend/test-polkitbackendjsauthority.c
-index 2103b17..b187a2f 100644
---- a/test/polkitbackend/test-polkitbackendjsauthority.c
-+++ b/test/polkitbackend/test-polkitbackendjsauthority.c
-@@ -137,12 +137,14 @@ test_get_admin_identities (void)
-         "unix-group:users"
-       }
-     },
-+#ifdef HAVE_SETNETGRENT
-     {
-       "net.company.action3",
-       {
-         "unix-netgroup:foo"
-       }
-     },
-+#endif
-   };
-   guint n;
- 
--- 
-GitLab
-
diff --git a/package/polkit/polkit.hash b/package/polkit/polkit.hash
index 398f924275..ffdc2a7568 100644
--- a/package/polkit/polkit.hash
+++ b/package/polkit/polkit.hash
@@ -1,5 +1,3 @@
-# Locally calculated after checking pgp signature
-sha256  9dc7ae341a797c994a5a36da21963f0c5c8e3e5a1780ccc2a5f52e7be01affaa  polkit-121.tar.gz
-
 # Locally calculated
+sha256  0d69656d60800835c3d7d1f0a8362b32e1ae3ace2875a35bb624296fc52d5dc4  polkit-122.tar.gz
 sha256  d2e2aa973e29c75e1b492e67ea7b7da9de2d501d49a934657971fd74f9a0b0a8  COPYING
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 39048a988d..205d6aff4c 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-POLKIT_VERSION = 121
-POLKIT_SITE = https://www.freedesktop.org/software/polkit/releases
+POLKIT_VERSION = 122
+POLKIT_SITE = https://gitlab.freedesktop.org/polkit/polkit/-/archive/$(POLKIT_VERSION)
 POLKIT_LICENSE = GPL-2.0
 POLKIT_LICENSE_FILES = COPYING
 POLKIT_CPE_ID_VENDOR = polkit_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
