Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B348CC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 07:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F9EB81B84;
	Mon,  4 Apr 2022 07:28:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LqEIUAQpHOr3; Mon,  4 Apr 2022 07:28:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72BAD81934;
	Mon,  4 Apr 2022 07:28:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D4E061BF306
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 07:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5011A40186
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 07:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HF1kkqCfnIEB for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 07:27:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA4A540359
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 07:27:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4CD3786151; Mon,  4 Apr 2022 07:18:21 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 09:27:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2490cc30525f2249f319b73176d13305be152b86
X-Git-Newrev: 3852f88c9a895051b66177b32074c2f2aaafef04
X-Patchwork-Hint: ignore
Message-Id: <20220404071821.4CD3786151@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luaexpat: bump to version 1.4.0
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
Content-Type: multipart/mixed; boundary="===============6022479347427129614=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6022479347427129614==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3852f88c9a895051b66177b32074c2f2aaafef04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

moved under the hat of https://github.com/lunarmodules

remove upstream patch

diff LICENSE:
-The MIT License (MIT)
-Copyright (c) 2013 Tomás Guisasola
+Copyright (C) 2003-2007 The Kepler Project, 2013-2022 Matthew Wild

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-restore-getcurrentbytecount.patch         | 40 ----------------------
 package/luaexpat/Config.in                         |  2 +-
 package/luaexpat/luaexpat.hash                     |  4 +--
 package/luaexpat/luaexpat.mk                       |  3 +-
 4 files changed, 5 insertions(+), 44 deletions(-)

diff --git a/package/luaexpat/0001-restore-getcurrentbytecount.patch b/package/luaexpat/0001-restore-getcurrentbytecount.patch
deleted file mode 100644
index 6cf2192678..0000000000
--- a/package/luaexpat/0001-restore-getcurrentbytecount.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 77cb691f781918908dfe34785f00a5ff75d5cc20 Mon Sep 17 00:00:00 2001
-From: Francois Perrad <francois.perrad@gadz.org>
-Date: Sat, 16 Feb 2019 15:56:00 +0100
-Subject: [PATCH] restore getcurrentbytecount
-
-see https://github.com/tomasguisasola/luaexpat/issues/3
-
-Fetch from: https://github.com/tomasguisasola/luaexpat/commit/0926f2d705109b7d35b721344264b39c1169e0de
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
----
- src/lxplib.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/luaexpat-1.3.3/src/lxplib.c b/luaexpat-1.3.3/src/lxplib.c
-index 7726913..35bec3c 100644
---- a/luaexpat-1.3.3/src/lxplib.c
-+++ b/luaexpat-1.3.3/src/lxplib.c
-@@ -538,11 +538,18 @@ static int lxp_stop (lua_State *L) {
-   return 1;
- }
- 
-+static int lxp_getcurrentbytecount (lua_State* L) {
-+  lxp_userdata *xpu = checkparser(L, 1);
-+  lua_pushinteger(L, XML_GetCurrentByteCount(xpu->parser));
-+  return 1;
-+}
-+
- static const luaL_Reg lxp_meths[] = {
-   {"parse", lxp_parse},
-   {"close", lxp_close},
-   {"__gc", parser_gc},
-   {"pos", lxp_pos},
-+  {"getcurrentbytecount", lxp_getcurrentbytecount},
-   {"setencoding", lxp_setencoding},
-   {"getcallbacks", getcallbacks},
-   {"getbase", getbase},
--- 
-2.17.1
-
diff --git a/package/luaexpat/Config.in b/package/luaexpat/Config.in
index 2322dc430c..25b067460a 100644
--- a/package/luaexpat/Config.in
+++ b/package/luaexpat/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LUAEXPAT
 	help
 	  LuaExpat is a SAX XML parser based on the Expat library.
 
-	  http://www.keplerproject.org/luaexpat/
+	  https://lunarmodules.github.io/luaexpat
diff --git a/package/luaexpat/luaexpat.hash b/package/luaexpat/luaexpat.hash
index dd1cf40e5f..fbfb623fcc 100644
--- a/package/luaexpat/luaexpat.hash
+++ b/package/luaexpat/luaexpat.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 b55908fcd7df490a59aab25284460add8283f1c6b94ab584900fe3e49775172a  luaexpat-1.3.3-1.src.rock
-sha256 7f5cb0c1750babcbb09637b7f0ff34972d51cf23b7f413bef902b47aa65febcd  luaexpat-1.3.3/LICENSE
+sha256  bee88ddc1063f49c5685b75b6696e8df0607a388432cbcb189cd0b8291d956aa  luaexpat-1.4.0-1.src.rock
+sha256  7e6a727e5b57cca713a2f2633f05d7e0cc1e261cc6a7613bbe266e625b2f14da  luaexpat/LICENSE
diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
index 8c86b24f26..c176fb8c17 100644
--- a/package/luaexpat/luaexpat.mk
+++ b/package/luaexpat/luaexpat.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-LUAEXPAT_VERSION = 1.3.3-1
+LUAEXPAT_VERSION = 1.4.0-1
+LUAEXPAT_SUBDIR = luaexpat
 LUAEXPAT_LICENSE = MIT
 LUAEXPAT_LICENSE_FILES = $(LUAEXPAT_SUBDIR)/LICENSE
 LUAEXPAT_DEPENDENCIES = expat

--===============6022479347427129614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6022479347427129614==--
