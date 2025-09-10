Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5684BCA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 22:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 289776128C;
	Wed, 10 Sep 2025 22:12:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eezXDnRzoi9u; Wed, 10 Sep 2025 22:12:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4120A6129C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4120A6129C;
	Wed, 10 Sep 2025 22:12:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4408A234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 22:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E78724154C
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 22:12:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0JIemSHgUduI for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 22:12:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 147664154D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 147664154D
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 22:12:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B2C983CFB; Wed, 10 Sep 2025 22:12:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 00:11:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72c95d947f46eaffc1ff33ef1b59017ba9b316cc
X-Git-Newrev: f92bf750fe58d4030558c3b4f1f62ae743e3dee9
X-Patchwork-Hint: ignore
Message-Id: <20250910221216.0B2C983CFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdbm: drop patch
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f92bf750fe58d4030558c3b4f1f62ae743e3dee9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch 0001-C23-compatibility-fix.patch was added by commit
bbec805717167714ee6b22b8c8b2ddddcce47ea4, then removed by commit
2dd20212f2edb3a763d9251dce157956245bec09 that bumped to version 1.26,
but for some reason 25918f455c61b487cc29e3cfb8ece0e35db96aa1 re-added
it, probably due to some issues in the next -> master merge.

Let's drop the patch to fix build issues.

Fixes:

  https://autobuild.buildroot.net/results/0341d8284d9a069533b55103c1666b90467306d4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/gdbm/0001-C23-compatibility-fix.patch | 158 --------------------------
 1 file changed, 158 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
