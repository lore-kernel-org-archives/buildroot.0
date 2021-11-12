Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 222E7C433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:40:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF69C60F45
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF69C60F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83FAE401F7;
	Fri, 12 Nov 2021 22:40:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bcNcaYiXyvLs; Fri, 12 Nov 2021 22:40:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D23940253;
	Fri, 12 Nov 2021 22:40:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C87E1BF3A3
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A18681B84
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:40:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OOtaXxrRLE9p for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 22:40:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF57181B83
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 22:40:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3DADF8C966; Fri, 12 Nov 2021 22:36:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 23:23:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f7761b6f99c7c5d27f6f385cad48a05bdae1bba
X-Git-Newrev: 4427b298396b8bf1190b3b1ea4ceacb37b05aaa2
X-Patchwork-Hint: ignore
Message-Id: <20211112223605.3DADF8C966@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luvi: don't use LUAJIT_VERSION for
 the luajit installation path
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
Content-Type: multipart/mixed; boundary="===============8072411976612879408=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8072411976612879408==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4427b298396b8bf1190b3b1ea4ceacb37b05aaa2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Luajit package has been recently updated to the latest commit in the
master branch [1]. Since then LUAJIT_VERSION doesn't contain the luajit
version anymore but a commit hash:

LUAJIT_VERSION = 05f1984e1a862e4b3d3c3b370c773492e2edf84a

Use pkg-config --variable=version luajit in luvi package to set
LUA_PATH correctly.

Fixes:
luajit: unknown luaJIT command or jit.* modules not installed

https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552605

[1] 9450b53c8e06f1b5a75840b82c0f4663a5d75c45

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Jörg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/luvi/luvi.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index 386daafc31..5daa3c1793 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -9,7 +9,7 @@ LUVI_SOURCE = luvi-src-v$(LUVI_VERSION).tar.gz
 LUVI_SITE = https://github.com/luvit/luvi/releases/download/v$(LUVI_VERSION)
 LUVI_LICENSE = Apache-2.0
 LUVI_LICENSE_FILES = LICENSE.txt
-LUVI_DEPENDENCIES = libuv luajit luv host-luajit
+LUVI_DEPENDENCIES = libuv luajit luv host-luajit host-pkgconf
 
 # Dispatch all architectures of LuaJIT
 ifeq ($(BR2_i386),y)
@@ -30,12 +30,16 @@ else
 LUVI_TARGET_ARCH = $(BR2_ARCH)
 endif
 
+# LUAJIT_VERSION and the luajit installation path may not use the
+# same value. Use the value from luajit.pc file.
+LUVI_LUAJIT_VERSION = `$(PKG_CONFIG_HOST_BINARY) --variable=version luajit`
+
 # Bundled lua bindings have to be linked statically into the luvi executable
 LUVI_CONF_OPTS = \
 	-DBUILD_SHARED_LIBS=OFF \
 	-DWithSharedLibluv=ON \
 	-DTARGET_ARCH=$(LUVI_TARGET_ARCH) \
-	-DLUA_PATH=$(HOST_DIR)/share/luajit-$(LUAJIT_VERSION)/?.lua
+	-DLUA_PATH=$(HOST_DIR)/share/luajit-$(LUVI_LUAJIT_VERSION)/?.lua
 
 # Add "rex" module (PCRE via bundled lrexlib)
 ifeq ($(BR2_PACKAGE_PCRE),y)

--===============8072411976612879408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8072411976612879408==--
