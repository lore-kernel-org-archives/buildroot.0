Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37709C25B78
	for <buildroot@archiver.kernel.org>; Sat, 25 May 2024 06:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DAC782FCE;
	Sat, 25 May 2024 06:18:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8Utb5W-BauA; Sat, 25 May 2024 06:18:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5935B82798
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5935B82798;
	Sat, 25 May 2024 06:18:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D62311D0236
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 06:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF1DA400C1
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 06:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tz2cdzWYWnns for <buildroot@lists.busybox.net>;
 Sat, 25 May 2024 06:18:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F17E1400BA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F17E1400BA
 for <buildroot@buildroot.org>; Sat, 25 May 2024 06:18:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D80BF8759F; Sat, 25 May 2024 06:18:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 25 May 2024 08:17:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b07b4bf6d6091ad13cbfcec77b73994f4682e3c
X-Git-Newrev: 1652d9b6f80ba7fb08cb82ff0701f4f528e178dc
X-Patchwork-Hint: ignore
Message-Id: <20240525061835.D80BF8759F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-cffi: add luajit support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1652d9b6f80ba7fb08cb82ff0701f4f528e178dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

luajit is supported since the addition of the package in commit
13114d0f9352531e5d7ebed45cd3f679407c61d9 and
https://github.com/q66/cffi-lua/commit/cb92c44e781d81e31eb7fe21911b01e54a2c3893

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: append to LUA_CFFI_CONF_OPTS]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua-cffi/Config.in   |  2 --
 package/lua-cffi/lua-cffi.mk | 10 +++++++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/lua-cffi/Config.in b/package/lua-cffi/Config.in
index f4a760ce0d..ceef16ee6f 100644
--- a/package/lua-cffi/Config.in
+++ b/package/lua-cffi/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LUA_CFFI
 	bool "lua-cffi"
-	depends on !BR2_PACKAGE_LUAJIT
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -13,7 +12,6 @@ config BR2_PACKAGE_LUA_CFFI
 	  https://github.com/q66/cffi-lua
 
 comment "lua-cffi needs a toolchain w/ C++, gcc >= 4.8, threads"
-	depends on !BR2_PACKAGE_LUAJIT
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lua-cffi/lua-cffi.mk b/package/lua-cffi/lua-cffi.mk
index 30427ac34c..f0127b335a 100644
--- a/package/lua-cffi/lua-cffi.mk
+++ b/package/lua-cffi/lua-cffi.mk
@@ -9,6 +9,14 @@ LUA_CFFI_SITE = $(call github,q66,cffi-lua,v$(LUA_CFFI_VERSION))
 LUA_CFFI_LICENSE = MIT
 LUA_CFFI_LICENSE_FILES = COPYING.md
 
-LUA_CFFI_DEPENDENCIES = libffi lua
+LUA_CFFI_DEPENDENCIES = libffi
+
+ifeq ($(BR2_PACKAGE_LUA),y)
+LUA_CFFI_DEPENDENCIES += lua
+LUA_CFFI_CONF_OPTS += -Dlua_version=$(LUAINTERPRETER_ABIVER)
+else ifeq ($(BR2_PACKAGE_LUAJIT),y)
+LUA_CFFI_DEPENDENCIES += luajit
+LUA_CFFI_CONF_OPTS += -Dlua_version=luajit
+endif
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
