Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3159AC3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 17:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E12FE4170F;
	Sat, 23 Dec 2023 17:34:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E12FE4170F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gvnFsPXWGbnu; Sat, 23 Dec 2023 17:34:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1638741836;
	Sat, 23 Dec 2023 17:34:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1638741836
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 273D11BF2E3
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3F5041607
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3F5041607
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n7IL2me-mQgr for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 17:34:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F7AE41604
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 17:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F7AE41604
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0BD9B87D9C; Sat, 23 Dec 2023 17:34:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 18:13:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef851d6d93d120648d62572c8f8f570ab8c34fa2
X-Git-Newrev: 85882c69a9d4ed1e821634e1535157ed16c46ac6
X-Patchwork-Hint: ignore
Message-Id: <20231223173408.0BD9B87D9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-conciseserialization: new
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=85882c69a9d4ed1e821634e1535157ed16c46ac6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                      |  1 +
 package/lua-conciseserialization/Config.in             |  6 ++++++
 .../lua-conciseserialization.hash                      |  4 ++++
 .../lua-conciseserialization.mk                        | 18 ++++++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 73d286a861..ae7c3e261a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -728,6 +728,7 @@ menu "Lua libraries/modules"
 	source "package/lua-coatpersistent/Config.in"
 	source "package/lua-codegen/Config.in"
 	source "package/lua-compat53/Config.in"
+	source "package/lua-conciseserialization/Config.in"
 	source "package/lua-cqueues/Config.in"
 	source "package/lua-csnappy/Config.in"
 	source "package/lua-curl/Config.in"
diff --git a/package/lua-conciseserialization/Config.in b/package/lua-conciseserialization/Config.in
new file mode 100644
index 0000000000..b660147008
--- /dev/null
+++ b/package/lua-conciseserialization/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LUA_CONCISESERIALIZATION
+	bool "lua-conciseserialization"
+	help
+	  a pure Lua implementation of CBOR / RFC8949.
+
+	  https://fperrad.frama.io/lua-ConciseSerialization/
diff --git a/package/lua-conciseserialization/lua-conciseserialization.hash b/package/lua-conciseserialization/lua-conciseserialization.hash
new file mode 100644
index 0000000000..30ae4536f6
--- /dev/null
+++ b/package/lua-conciseserialization/lua-conciseserialization.hash
@@ -0,0 +1,4 @@
+# computed by luarocks/buildroot
+sha256  1dd7a5bd17349ad78e93b36f05739e4323a8fda8cd66dee423bdd5a21a0c4453  lua-conciseserialization-0.2.4-1.src.rock
+sha256  7988a3ab9ea3d8c536387c4e7931b1703fa02f7011771569ed56641fa1a0c78c  lua-conciseserialization-lua53-0.2.4-1.src.rock
+sha256  23ddf0d4a4dbc0667eeb919ceb7cc0a5b527af6cb51b286b78fa42f350de2130  lua-ConciseSerialization-0.2.4/COPYRIGHT
diff --git a/package/lua-conciseserialization/lua-conciseserialization.mk b/package/lua-conciseserialization/lua-conciseserialization.mk
new file mode 100644
index 0000000000..a777a4baea
--- /dev/null
+++ b/package/lua-conciseserialization/lua-conciseserialization.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# lua-conciseserialization
+#
+################################################################################
+
+LUA_CONCISESERIALIZATION_VERSION_UPSTREAM = 0.2.4
+LUA_CONCISESERIALIZATION_VERSION = $(LUA_CONCISESERIALIZATION_VERSION_UPSTREAM)-1
+ifeq ($(BR2_PACKAGE_LUA_5_3)$(BR2_PACKAGE_LUA_5_4),y)
+LUA_CONCISESERIALIZATION_NAME_UPSTREAM = lua-ConciseSerialization-lua53
+else
+LUA_CONCISESERIALIZATION_NAME_UPSTREAM = lua-ConciseSerialization
+endif
+LUA_CONCISESERIALIZATION_SUBDIR = lua-ConciseSerialization-$(LUA_CONCISESERIALIZATION_VERSION_UPSTREAM)
+LUA_CONCISESERIALIZATION_LICENSE = MIT
+LUA_CONCISESERIALIZATION_LICENSE_FILES = $(LUA_CONCISESERIALIZATION_SUBDIR)/COPYRIGHT
+
+$(eval $(luarocks-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
