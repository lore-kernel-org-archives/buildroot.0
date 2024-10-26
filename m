Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B992D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 21:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D748605C6;
	Sat, 26 Oct 2024 21:03:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 88oUf35OAb2t; Sat, 26 Oct 2024 21:03:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B8A3605DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B8A3605DC;
	Sat, 26 Oct 2024 21:03:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 36B535C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 246AA402E9
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KaQeMkEmtQWh for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 21:02:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D79D402CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D79D402CA
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:02:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9E138426F; Sat, 26 Oct 2024 21:02:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 22:59:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06958532f9ea2c4c87f4affec1bb296da024418d
X-Git-Newrev: 868d30c654b78ba74c8627244ebee079a04c0245
X-Patchwork-Hint: ignore
Message-Id: <20241026210258.E9E138426F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-uuid: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=868d30c654b78ba74c8627244ebee079a04c0245
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in              |  1 +
 package/lua-uuid/Config.in     |  6 ++++++
 package/lua-uuid/lua-uuid.hash |  3 +++
 package/lua-uuid/lua-uuid.mk   | 13 +++++++++++++
 4 files changed, 23 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index b03bc2ffcf..0e311ad55c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -776,6 +776,7 @@ menu "Lua libraries/modules"
 	source "package/lua-testmore/Config.in"
 	source "package/lua-ubjson/Config.in"
 	source "package/lua-utf8/Config.in"
+	source "package/lua-uuid/Config.in"
 	source "package/lua-valua/Config.in"
 	source "package/lua-zlib/Config.in"
 	source "package/luabitop/Config.in"
diff --git a/package/lua-uuid/Config.in b/package/lua-uuid/Config.in
new file mode 100644
index 0000000000..b2f259f2fd
--- /dev/null
+++ b/package/lua-uuid/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LUA_UUID
+	bool "lua-uuid"
+	help
+	  Generates uuids in pure Lua.
+
+	  https://github.com/Tieske/uuid
diff --git a/package/lua-uuid/lua-uuid.hash b/package/lua-uuid/lua-uuid.hash
new file mode 100644
index 0000000000..d5942078e0
--- /dev/null
+++ b/package/lua-uuid/lua-uuid.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256  e615c1fb1c22e50af5860e45794c027b1a5524cb8e7e6206ad3fed8e78b1f59e  uuid-1.0.0-1.src.rock
+sha256  27e7bf0219274247f4014cfb5070abfb2bb27e66c17a2dbd61427cf7fed81199  uuid/LICENSE.md
diff --git a/package/lua-uuid/lua-uuid.mk b/package/lua-uuid/lua-uuid.mk
new file mode 100644
index 0000000000..5d763071f8
--- /dev/null
+++ b/package/lua-uuid/lua-uuid.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# lua-uuid
+#
+################################################################################
+
+LUA_UUID_VERSION = 1.0.0-1
+LUA_UUID_NAME_UPSTREAM = uuid
+LUA_UUID_SUBDIR = uuid
+LUA_UUID_LICENSE = Apache-2.0
+LUA_UUID_LICENSE_FILES = $(LUA_UUID_SUBDIR)/LICENSE.md
+
+$(eval $(luarocks-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
