Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61053C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 17:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0102241923;
	Sat, 23 Dec 2023 17:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0102241923
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NP8ysq5D5MKv; Sat, 23 Dec 2023 17:34:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4361418C9;
	Sat, 23 Dec 2023 17:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4361418C9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 459361BF2C2
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BDC582125
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:34:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BDC582125
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qponoZ8Z1J5q for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 17:34:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D3A58214B
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 17:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D3A58214B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B62087D9E; Sat, 23 Dec 2023 17:34:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 18:18:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85882c69a9d4ed1e821634e1535157ed16c46ac6
X-Git-Newrev: 601fef4ab55319ef8f2f28bf0c1fb8f06f502b0a
X-Patchwork-Hint: ignore
Message-Id: <20231223173408.1B62087D9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-ubjson: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=601fef4ab55319ef8f2f28bf0c1fb8f06f502b0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                  |  1 +
 package/lua-ubjson/Config.in       |  7 +++++++
 package/lua-ubjson/lua-ubjson.hash |  3 +++
 package/lua-ubjson/lua-ubjson.mk   | 11 +++++++++++
 4 files changed, 22 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index ae7c3e261a..bc723fe018 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -761,6 +761,7 @@ menu "Lua libraries/modules"
 	source "package/lua-std-normalize/Config.in"
 	source "package/lua-stdlib/Config.in"
 	source "package/lua-testmore/Config.in"
+	source "package/lua-ubjson/Config.in"
 	source "package/lua-utf8/Config.in"
 	source "package/lua-valua/Config.in"
 	source "package/lua-zlib/Config.in"
diff --git a/package/lua-ubjson/Config.in b/package/lua-ubjson/Config.in
new file mode 100644
index 0000000000..88ed2c7c79
--- /dev/null
+++ b/package/lua-ubjson/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LUA_UBJSON
+	bool "lua-ubjson"
+	select BR2_PACKAGE_LUA_COMPAT53 if BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1 # runtime
+	help
+	  a pure Lua implementation of UBJSON.
+
+	  https://fperrad.frama.io/lua-ubjson/
diff --git a/package/lua-ubjson/lua-ubjson.hash b/package/lua-ubjson/lua-ubjson.hash
new file mode 100644
index 0000000000..6db046ec2f
--- /dev/null
+++ b/package/lua-ubjson/lua-ubjson.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256  6605a6a0ca5f6cb8ec1aac14840adcdc6b359f5d8666fb3d224510e8d73c43b9  lua-ubjson-0.1.0-1.src.rock
+sha256  c85f6b3d47bcde28fd15bc7e361cdc5ec6b580819f4a891e29cf89513abbadd2  lua-ubjson-0.1.0/COPYRIGHT
diff --git a/package/lua-ubjson/lua-ubjson.mk b/package/lua-ubjson/lua-ubjson.mk
new file mode 100644
index 0000000000..93e6631962
--- /dev/null
+++ b/package/lua-ubjson/lua-ubjson.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# lua-ubjson
+#
+################################################################################
+
+LUA_UBJSON_VERSION = 0.1.0-1
+LUA_UBJSON_LICENSE = MIT
+LUA_UBJSON_LICENSE_FILES = $(LUA_UBJSON_SUBDIR)/COPYRIGHT
+
+$(eval $(luarocks-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
