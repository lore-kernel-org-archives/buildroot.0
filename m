Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35520CAC5B0
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB611616E2;
	Thu, 25 Sep 2025 20:31:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9bMN_Z8YrtQU; Thu, 25 Sep 2025 20:31:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B50B616E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B50B616E6;
	Thu, 25 Sep 2025 20:31:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1199112D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82D2441612
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id liWriUR2VMJ3 for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:30:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 865F641620
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 865F641620
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 846F783B7E; Thu, 25 Sep 2025 20:30:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 16:40:36 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: ede4af8c584b2a23e7bdef477eec8186641cdc4d
X-Git-Newrev: 6726e0347163c7682cbb4bc83ebf0f356357ab4d
X-Patchwork-Hint: ignore
Message-Id: <20250925203022.846F783B7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/lua/5.1.5: add
 patch for CVE-2014-5461
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6726e0347163c7682cbb4bc83ebf0f356357ab4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

This CVE is specific for the version 5.1.5 still present in Buildroot.
It has been fixed in 5.2.3 and thereby doesn't affects the other
versions available in Buildroot.

- CVE-2014-5461

Buffer overflow in the vararg functions in ldo.c in Lua 5.1 through
5.2.x before 5.2.3 allows context-dependent attackers to cause a denial
of service (crash) via a small number of arguments to a function with a
large number of fixed arguments.

For more information see:
  - https://security-tracker.debian.org/tracker/CVE-2014-5461
  - https://udd.debian.org/patches.cgi?src=lua5.1&version=5.1.5-11

A patch present in Debian is used to address this vulnerability.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a2c906ee3b6b9057ea2c83987ddac9b7971cebd2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...03-Fix-stack-overflow-in-vararg-functions.patch | 24 ++++++++++++++++++++++
 package/lua/lua.mk                                 |  6 ++++++
 2 files changed, 30 insertions(+)

diff --git a/package/lua/5.1.5/0003-Fix-stack-overflow-in-vararg-functions.patch b/package/lua/5.1.5/0003-Fix-stack-overflow-in-vararg-functions.patch
new file mode 100644
index 0000000000..00142d2338
--- /dev/null
+++ b/package/lua/5.1.5/0003-Fix-stack-overflow-in-vararg-functions.patch
@@ -0,0 +1,24 @@
+From: Enrico Tassi <gareuselesinge@debian.org>
+Date: Tue, 26 Aug 2014 16:20:55 +0200
+Subject: Fix stack overflow in vararg functions
+
+CVE: CVE-2014-5461
+Upstream: https://sources.debian.org/data/main/l/lua5.1/5.1.5-11/debian/patches/0004-Fix-stack-overflow-in-vararg-functions.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/ldo.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/ldo.c b/src/ldo.c
+index d1bf786..30333bf 100644
+--- a/src/ldo.c
++++ b/src/ldo.c
+@@ -274,7 +274,7 @@ int luaD_precall (lua_State *L, StkId func, int nresults) {
+     CallInfo *ci;
+     StkId st, base;
+     Proto *p = cl->p;
+-    luaD_checkstack(L, p->maxstacksize);
++    luaD_checkstack(L, p->maxstacksize + p->numparams);
+     func = restorestack(L, funcr);
+     if (!p->is_vararg) {  /* no varargs? */
+       base = func + 1;
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 455b7e58b2..269eafe4bb 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -21,6 +21,12 @@ LUA_LICENSE_FILES = COPYRIGHT
 endif
 LUA_CPE_ID_VENDOR = lua
 
+ifeq ($(BR2_PACKAGE_LUA_5_1),y)
+# Only affect lua version 5.1.5
+# 5.1.5/0003-Fix-stack-overflow-in-vararg-functions.patch
+LUA_IGNORE_CVES += CVE-2014-5461
+endif
+
 LUA_PROVIDES = luainterpreter
 
 LUA_CFLAGS = -Wall -fPIC -DLUA_USE_POSIX
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
