Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B160C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 07:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12D12814B6;
	Mon,  7 Feb 2022 07:37:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HkoKbSh25Dc3; Mon,  7 Feb 2022 07:37:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5360D8151E;
	Mon,  7 Feb 2022 07:37:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 30FC01BF309
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 07:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A5B8400D8
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 07:35:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bmm2GI3H8-cO for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 07:35:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF689401AF
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 07:35:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8BF4882BC8; Mon,  7 Feb 2022 07:28:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Feb 2022 08:35:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a181757f96bc83bb7ddaafcfb1df9f8f18d4bc0d
X-Git-Newrev: c33cecfac4d48346611b56e6f1a553a1fe86d704
X-Patchwork-Hint: ignore
Message-Id: <20220207072828.8BF4882BC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-cffi: fix spaces
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

commit: https://git.buildroot.net/buildroot/commit/?id=c33cecfac4d48346611b56e6f1a553a1fe86d704
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 13114d0f9352531e5d7ebed45cd3f679407c61d9 forgot to add spaces
before and after '=' and added a spurious space in Config.in

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua-cffi/Config.in   | 2 +-
 package/lua-cffi/lua-cffi.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-cffi/Config.in b/package/lua-cffi/Config.in
index 64a36e1de4..f4a760ce0d 100644
--- a/package/lua-cffi/Config.in
+++ b/package/lua-cffi/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LUA_CFFI
 	bool "lua-cffi"
 	depends on !BR2_PACKAGE_LUAJIT
-	depends on BR2_TOOLCHAIN_HAS_THREADS  # libffi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBFFI
diff --git a/package/lua-cffi/lua-cffi.mk b/package/lua-cffi/lua-cffi.mk
index 07d84ad5fa..964f49f030 100644
--- a/package/lua-cffi/lua-cffi.mk
+++ b/package/lua-cffi/lua-cffi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_CFFI_VERSION=0.2.1
+LUA_CFFI_VERSION = 0.2.1
 LUA_CFFI_SITE = $(call github,q66,cffi-lua,v$(LUA_CFFI_VERSION))
 LUA_CFFI_LICENSE = MIT
 LUA_CFFI_LICENSE_FILES = COPYING.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
