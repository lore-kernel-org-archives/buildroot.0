Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2A4C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E44C605E2;
	Wed,  1 May 2024 19:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OkQzlHN1h874; Wed,  1 May 2024 19:00:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EE5060BE9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EE5060BE9;
	Wed,  1 May 2024 19:00:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CED6B1BF418
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8999401EB
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o1gsqsH4pYmt for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:00:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBB934011C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBB934011C
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:00:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B03F1863C9; Wed,  1 May 2024 19:00:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 20:56:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35635cdc5b59a146928b82812d1c3c6db40b09f1
X-Git-Newrev: 119cfd836ed11c2fcdf9d7de32ad5803402b79b1
X-Patchwork-Hint: ignore
Message-Id: <20240501190033.B03F1863C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-lsdbus: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=119cfd836ed11c2fcdf9d7de32ad5803402b79b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                  |  1 +
 package/lua-lsdbus/Config.in       | 12 ++++++++++++
 package/lua-lsdbus/lua-lsdbus.hash |  3 +++
 package/lua-lsdbus/lua-lsdbus.mk   | 17 +++++++++++++++++
 4 files changed, 33 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 1935077f0f..38e9c94198 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -751,6 +751,7 @@ menu "Lua libraries/modules"
 	source "package/lua-livr/Config.in"
 	source "package/lua-livr-extra/Config.in"
 	source "package/lua-lpeg-patterns/Config.in"
+	source "package/lua-lsdbus/Config.in"
 	source "package/lua-lunitx/Config.in"
 	source "package/lua-lunix/Config.in"
 	source "package/lua-lyaml/Config.in"
diff --git a/package/lua-lsdbus/Config.in b/package/lua-lsdbus/Config.in
new file mode 100644
index 0000000000..f4eda20d6e
--- /dev/null
+++ b/package/lua-lsdbus/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LUA_LSDBUS
+	bool "lua-lsdbus"
+	depends on BR2_PACKAGE_SYSTEMD
+	select BR2_PACKAGE_MXML
+	select BR2_PACKAGE_LUA_COMPAT53 if BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
+	help
+	  Lua D-Bus bindings based on sd-bus and sd-event
+
+	  https://github.com/kmarkus/lsdbus
+
+comment "lua-lsdbus needs systemd"
+	depends on !BR2_PACKAGE_SYSTEMD
diff --git a/package/lua-lsdbus/lua-lsdbus.hash b/package/lua-lsdbus/lua-lsdbus.hash
new file mode 100644
index 0000000000..369370d63a
--- /dev/null
+++ b/package/lua-lsdbus/lua-lsdbus.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  b515cd00c844abc80993e9552d884c71a80a680e47b90a628f1f7bd18b9b821a  lua-lsdbus-d132f8b2bd390d0b1c7d17b300190279f92bd494.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/lua-lsdbus/lua-lsdbus.mk b/package/lua-lsdbus/lua-lsdbus.mk
new file mode 100644
index 0000000000..cbd7ee9d4b
--- /dev/null
+++ b/package/lua-lsdbus/lua-lsdbus.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# lua-lsdbus
+#
+################################################################################
+
+LUA_LSDBUS_VERSION = d132f8b2bd390d0b1c7d17b300190279f92bd494
+LUA_LSDBUS_SITE = $(call github,kmarkus,lsdbus,$(LUA_LSDBUS_VERSION))
+LUA_LSDBUS_DEPENDENCIES = luainterpreter mxml systemd
+LUA_LSDBUS_LICENSE = LGPL-2.1
+LUA_LSDBUS_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_LUA_COMPAT53),y)
+LUA_LSDBUS_DEPENDENCIES += lua-compat53
+endif
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
