Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D657E73156
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 10:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D5CB83276;
	Mon,  2 Feb 2026 10:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WnqlwoWd2bbp; Mon,  2 Feb 2026 10:31:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39F3983279
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770028300;
	bh=cMIyFYVVdRLrZ8GMwtx+dz/dslG0YGMXOS7Ju/IKrIg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OLscgSY+8CB7wpOv3A+T9xQBcH8U2AVsThJr1FxInsPll6Jc5KaHlD3feHq4bYr0c
	 5uWq/rYG1pOfxoWfevEd6N/dWFlIE0jGoAKLFlcXiMcqLHIXrrJc/MrRcAVUGWymvc
	 h+QW9fROBXX8IZZS0o3j3C1bGGg2YNlOMx85ZO9qhG78m+SzriS/qiUQq4RXF39Vgz
	 GhxLN6muGqmgVq+Cx/VaI8QUDmawDHKVjsD0U1IYNtCLpyR6UkIBRJIM7nywjxjua5
	 /TH8MaZNtOco7WvsNBrjj9IqpNj+braeqssaeD+q7tEIy7gGO3F5plqVcLsmVi77xS
	 l2R9EwdW7zzYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39F3983279;
	Mon,  2 Feb 2026 10:31:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D9421149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8FFE83279
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9OxeHNCNIZX6 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 10:31:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7903183276
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7903183276
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:31:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5CDD986306; Mon,  2 Feb 2026 10:31:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 11:31:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b4381dda28ea335ff278efda0d629ec70546b74
X-Git-Newrev: b9a8f187e029ffeb040327d082dacf1fa373cc7d
X-Patchwork-Hint: ignore
Message-Id: <20260202103137.5CDD986306@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lzlib: switch to another fork
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9a8f187e029ffeb040327d082dacf1fa373cc7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LuaDist and their subprojects are dead

LuaDist was based on CMake, so back to luarocks infrastructure

different tag scheme, but same source (ie. lzlib.c)

this obviously fixes CMake 4 compatibility.

Fixes:

  https://autobuild.buildroot.net/results/c86c19a4b8fc4304244e33d4f132fea8e0043e06/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lzlib/Config.in  |  3 +--
 package/lzlib/lzlib.hash |  6 ++++--
 package/lzlib/lzlib.mk   | 12 +++++-------
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/package/lzlib/Config.in b/package/lzlib/Config.in
index 59a2e6d5c9..16dd2c3144 100644
--- a/package/lzlib/Config.in
+++ b/package/lzlib/Config.in
@@ -1,10 +1,9 @@
 config BR2_PACKAGE_LZLIB
 	bool "lzlib"
-	depends on BR2_PACKAGE_LUA
 	select BR2_PACKAGE_ZLIB
 	help
 	  This package provides a library to access zlib library
 	  functions and also to read/write gzip files using an
 	  interface similar to the base io package.
 
-	  https://github.com/LuaDist/lzlib
+	  https://github.com/hishamhm/lzlib
diff --git a/package/lzlib/lzlib.hash b/package/lzlib/lzlib.hash
index 4bb4c52c8c..61b094f100 100644
--- a/package/lzlib/lzlib.hash
+++ b/package/lzlib/lzlib.hash
@@ -1,3 +1,5 @@
+# computed by luarocks/buildroot
+sha256  860c893fc53d0a7830a54fa64f22a2b89260ca39c9a7dcb0890f6d3029f00ca5  lzlib-0.4.1.53-4.src.rock
+
 # Locally calculated
-sha256  cbb0cac5825e940b4ea2f31a336d2aaf6db39847d456920afd8e443804420dbb  lzlib-0.4.3.tar.gz
-sha256  f817d4a37077e94e9adf379f46ba5cc0b68775d7add2bbd5b2ca68ba140ad5bb  lzlib.c
+sha256  f817d4a37077e94e9adf379f46ba5cc0b68775d7add2bbd5b2ca68ba140ad5bb  lzlib/lzlib.c
diff --git a/package/lzlib/lzlib.mk b/package/lzlib/lzlib.mk
index 74624d5019..4b869872b2 100644
--- a/package/lzlib/lzlib.mk
+++ b/package/lzlib/lzlib.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-LZLIB_VERSION = 0.4.3
-LZLIB_SITE = $(call github,LuaDist,lzlib,$(LZLIB_VERSION))
-LZLIB_DEPENDENCIES = lua zlib
+LZLIB_VERSION = 0.4.1.53-4
+LZLIB_SUBDIR = lzlib
 LZLIB_LICENSE = MIT
-LZLIB_LICENSE_FILES = lzlib.c
-LZLIB_CONF_OPTS = -DINSTALL_CMOD="/usr/lib/lua/$(LUAINTERPRETER_ABIVER)" \
-	-DINSTALL_LMOD="/usr/share/lua/$(LUAINTERPRETER_ABIVER)"
+LZLIB_LICENSE_FILES = $(LZLIB_SUBDIR)/lzlib.c
+LZLIB_DEPENDENCIES = zlib
 
-$(eval $(cmake-package))
+$(eval $(luarocks-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
