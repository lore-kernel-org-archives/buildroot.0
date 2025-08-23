Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9317CA0EFA
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 21:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92DE061484;
	Sat, 23 Aug 2025 21:30:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RrcXCZ3xg6HH; Sat, 23 Aug 2025 21:30:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BA606146D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BA606146D;
	Sat, 23 Aug 2025 21:30:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7328AEC7
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 21:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65412417DD
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 21:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R0W1UveSunPV for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 21:29:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8576B417C9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8576B417C9
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 21:29:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8189F878EE; Sat, 23 Aug 2025 21:29:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Aug 2025 23:25:41 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bbec805717167714ee6b22b8c8b2ddddcce47ea4
X-Git-Newrev: 2dd20212f2edb3a763d9251dce157956245bec09
X-Patchwork-Hint: ignore
Message-Id: <20250823212957.8189F878EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gdbm: bump to version
 1.26
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

commit: https://git.buildroot.net/buildroot/commit/?id=2dd20212f2edb3a763d9251dce157956245bec09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

1.24 -> 1.25 changes:

  https://puszcza.gnu.org.ua/forum/forum.php?forum_id=1362

1.25 -> 1.26 changes:

  https://puszcza.gnu.org.ua/forum/forum.php?forum_id=1367

We can drop 0001-C23-compatibility-fix.patch as it is upstream.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gdbm/0001-C23-compatibility-fix.patch | 158 --------------------------
 package/gdbm/gdbm.hash                        |   6 +-
 package/gdbm/gdbm.mk                          |   2 +-
 3 files changed, 4 insertions(+), 162 deletions(-)

diff --git a/package/gdbm/0001-C23-compatibility-fix.patch b/package/gdbm/0001-C23-compatibility-fix.patch
deleted file mode 100644
index 87fd94e196..0000000000
--- a/package/gdbm/0001-C23-compatibility-fix.patch
+++ /dev/null
@@ -1,158 +0,0 @@
-From 238315e9f4f547dff4f5b9dff2f903385a8048cb Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Sun, 17 Nov 2024 22:58:54 +0200
-Subject: [PATCH] C23 compatibility fix
-
-This fixes https://puszcza.gnu.org.ua/bugs/?642
-
-* tools/var.c (union value): Rename bool to b.
-
-Upstream: 734f69451392ffb6280d8a3aef51e2673c9b8554
-[Thomas: needed a few backporting adjustements]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- tools/var.c | 32 ++++++++++++++++----------------
- 1 file changed, 16 insertions(+), 16 deletions(-)
-
-diff --git a/tools/var.c b/tools/var.c
-index 0f285f1..c553ae5 100644
---- a/tools/var.c
-+++ b/tools/var.c
-@@ -27,7 +27,7 @@
- union value
- {
-   char *string;
--  int bool;
-+  int b;
-   int num;
- };
- 
-@@ -90,7 +90,7 @@ static struct variable vartab[] = {
-     .name = "confirm",
-     .type = VART_BOOL,
-     .flags = VARF_INIT,
--    .init = { .bool = 1 }
-+    .init = { .b = 1 }
-   },
-   {
-     .name = "cachesize",
-@@ -114,32 +114,32 @@ static struct variable vartab[] = {
-     .name = "lock",
-     .type = VART_BOOL,
-     .flags = VARF_INIT,
--    .init = { .bool = 1 }
-+    .init = { .b = 1 }
-   },
-   {
-     .name = "mmap",
-     .type = VART_BOOL,
-     .flags = VARF_INIT,
--    .init = { .bool = 1 }
-+    .init = { .b = 1 }
-   },
-   {
-     .name = "sync",
-     .type = VART_BOOL,
-     .flags = VARF_INIT,
--    .init = { .bool = 0 }
-+    .init = { .b = 0 }
-   },
-   {
-     .name = "coalesce",
-     .type = VART_BOOL,
-     .flags = VARF_INIT,
--    .init = { .bool = 0 },
-+    .init = { .b = 0 },
-     .sethook = coalesce_sethook
-   },
-   {
-     .name = "centfree",
-     .type = VART_BOOL,
-     .flags = VARF_INIT,
--    .init = { .bool = 0 },
-+    .init = { .b = 0 },
-     .sethook = centfree_sethook
-   },
-   {
-@@ -252,21 +252,21 @@ s2b (union value *vp, void *val, int flags)
-   for (i = 0; trueval[i]; i++)
-     if (strcasecmp (trueval[i], val) == 0)
-       {
--	vp->bool = 1;
-+	vp->b = 1;
- 	return VAR_OK;
-       }
-   
-   for (i = 0; falseval[i]; i++)
-     if (strcasecmp (falseval[i], val) == 0)
-       {
--	vp->bool = 0;
-+	vp->b = 0;
- 	return VAR_OK;
-       }
-   
-   n = strtoul (val, &p, 0);
-   if (*p)
-     return VAR_ERR_BADTYPE;
--  vp->bool = !!n;
-+  vp->b = !!n;
-   return VAR_OK;
- }
-   
-@@ -286,7 +286,7 @@ s2i (union value *vp, void *val, int flags)
- static int
- b2b (union value *vp, void *val, int flags)
- {
--  vp->bool = !!*(int*)val;
-+  vp->b = !!*(int*)val;
-   return VAR_OK;
- }
- 
-@@ -307,7 +307,7 @@ i2i (union value *vp, void *val, int flags)
- static int
- i2b (union value *vp, void *val, int flags)
- {
--  vp->bool = *(int*)val;
-+  vp->b = *(int*)val;
-   return VAR_OK;
- }
- 
-@@ -414,7 +414,7 @@ variable_get (const char *name, int type, void **val)
-       break;
- 
-     case VART_BOOL:
--      *(int*)val = vp->v.bool;
-+      *(int*)val = vp->v.b;
-       break;
-       
-     case VART_INT:
-@@ -461,7 +461,7 @@ variable_print_all (FILE *fp)
- 	      break;
- 	      
- 	    case VART_BOOL:
--	      fprintf (fp, "%s%s", vp->v.bool ? "" : "no", vp->name);
-+	      fprintf (fp, "%s%s", vp->v.b ? "" : "no", vp->name);
- 	      break;
- 	      
- 	    case VART_STRING:
-@@ -647,7 +647,7 @@ centfree_sethook (struct variable *var, union value *v)
- {
-   if (!v)
-     return VAR_OK;
--  return gdbmshell_setopt ("GDBM_SETCENTFREE", GDBM_SETCENTFREE, v->bool) == 0
-+  return gdbmshell_setopt ("GDBM_SETCENTFREE", GDBM_SETCENTFREE, v->b) == 0
-          ? VAR_OK : VAR_ERR_GDBM;
- }
- 
-@@ -656,7 +656,7 @@ coalesce_sethook (struct variable *var, union value *v)
- {
-   if (!v)
-     return VAR_OK;
--  return gdbmshell_setopt ("GDBM_SETCOALESCEBLKS", GDBM_SETCOALESCEBLKS, v->bool) == 0
-+  return gdbmshell_setopt ("GDBM_SETCOALESCEBLKS", GDBM_SETCOALESCEBLKS, v->b) == 0
-          ? VAR_OK : VAR_ERR_GDBM;
- }
- 
--- 
-2.50.1
-
diff --git a/package/gdbm/gdbm.hash b/package/gdbm/gdbm.hash
index a9df48908f..7b4a3ce1b3 100644
--- a/package/gdbm/gdbm.hash
+++ b/package/gdbm/gdbm.hash
@@ -1,6 +1,6 @@
 # From https://www.gnu.org.ua/software/gdbm/download.html
-md5  c780815649e52317be48331c1773e987  gdbm-1.24.tar.gz
-sha1  7bd455f28c9e4afacc042e0c712aac1b2391fef2  gdbm-1.24.tar.gz
+md5  aaa600665bc89e2febb3c7bd90679115  gdbm-1.26.tar.gz
+sha1  6cee3657de948e691e8df26509157be950cef4d4  gdbm-1.26.tar.gz
 # Locally computed
-sha256  695e9827fdf763513f133910bc7e6cfdb9187943a4fec943e57449723d2b8dbf  gdbm-1.24.tar.gz
+sha256  6a24504a14de4a744103dcb936be976df6fbe88ccff26065e54c1c47946f4a5e  gdbm-1.26.tar.gz
 sha256  690d762f2e8e149ab1e2d6a409a3853b6151a2533b2382fae549a176d6bedecf  COPYING
diff --git a/package/gdbm/gdbm.mk b/package/gdbm/gdbm.mk
index 1a2c352d71..8c739af662 100644
--- a/package/gdbm/gdbm.mk
+++ b/package/gdbm/gdbm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GDBM_VERSION = 1.24
+GDBM_VERSION = 1.26
 GDBM_SITE = $(BR2_GNU_MIRROR)/gdbm
 GDBM_LICENSE = GPL-3.0+
 GDBM_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
