Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A68C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 17:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43B5A41751;
	Sat, 23 Dec 2023 17:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43B5A41751
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qdmozCwkguir; Sat, 23 Dec 2023 17:09:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99DE94090C;
	Sat, 23 Dec 2023 17:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99DE94090C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F1F951BF2C2
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB0E741741
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB0E741741
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N_d3uK0CGHGh for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 17:09:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED9EF408ED
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 17:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED9EF408ED
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D575B87D69; Sat, 23 Dec 2023 17:09:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 18:04:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf4ebfafaa2d8bc2c646029013f02c2cf048c8b9
X-Git-Newrev: fbf939b03a5d21144eb84e488ed9db8baad54c23
X-Patchwork-Hint: ignore
Message-Id: <20231223170912.D575B87D69@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-ansicolors: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=fbf939b03a5d21144eb84e488ed9db8baad54c23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                          |  1 +
 package/lua-ansicolors/Config.in           |  6 ++++++
 package/lua-ansicolors/lua-ansicolors.hash |  3 +++
 package/lua-ansicolors/lua-ansicolors.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 7d4d624253..083372131c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -715,6 +715,7 @@ menu "Lua libraries/modules"
 	source "package/lpty/Config.in"
 	source "package/lrandom/Config.in"
 	source "package/lsqlite3/Config.in"
+	source "package/lua-ansicolors/Config.in"
 	source "package/lua-argon2/Config.in"
 	source "package/lua-augeas/Config.in"
 	source "package/lua-basexx/Config.in"
diff --git a/package/lua-ansicolors/Config.in b/package/lua-ansicolors/Config.in
new file mode 100644
index 0000000000..33ffdde723
--- /dev/null
+++ b/package/lua-ansicolors/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LUA_ANSICOLORS
+	bool "lua-ansicolors"
+	help
+	  Library for color Manipulation.
+
+	  https://github.com/kikito/ansicolors.lua
diff --git a/package/lua-ansicolors/lua-ansicolors.hash b/package/lua-ansicolors/lua-ansicolors.hash
new file mode 100644
index 0000000000..53208afaed
--- /dev/null
+++ b/package/lua-ansicolors/lua-ansicolors.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256  df6126501af3b9b944019164a08aed91377d82e6845c24432769140f12c815d6  ansicolors-1.0.2-3.src.rock
+sha256  cf2980c520ea89935bbe8a5415c5e0ff2606ffc7a89d6854796d856fa066c48e  ansicolors.lua-1.0.2/COPYING
diff --git a/package/lua-ansicolors/lua-ansicolors.mk b/package/lua-ansicolors/lua-ansicolors.mk
new file mode 100644
index 0000000000..5879b66e63
--- /dev/null
+++ b/package/lua-ansicolors/lua-ansicolors.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lua-ansicolors
+#
+################################################################################
+
+LUA_ANSICOLORS_VERSION_UPSTREAM = 1.0.2
+LUA_ANSICOLORS_VERSION = $(LUA_ANSICOLORS_VERSION_UPSTREAM)-3
+LUA_ANSICOLORS_NAME_UPSTREAM = ansicolors
+LUA_ANSICOLORS_SUBDIR = ansicolors.lua-$(LUA_ANSICOLORS_VERSION_UPSTREAM)
+LUA_ANSICOLORS_LICENSE = MIT
+LUA_ANSICOLORS_LICENSE_FILES = $(LUA_ANSICOLORS_SUBDIR)/COPYING
+
+$(eval $(luarocks-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
