Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A5FE7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 21:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 071BE811B0;
	Sun, 29 Dec 2024 21:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z-cgsPiL7HS6; Sun, 29 Dec 2024 21:09:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C79B811B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C79B811B4;
	Sun, 29 Dec 2024 21:09:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B918E72
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D80060A92
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:09:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HlFhCWUoqAez for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 21:09:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B863D60A88
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B863D60A88
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:09:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACFCD80FCA; Sun, 29 Dec 2024 21:09:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 22:05:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a12a9a8e5c0664dd8e37d1e673b8e4ca4bde61b9
X-Git-Newrev: a649794913214c27960f704d62f2f3577fef7cb7
X-Patchwork-Hint: ignore
Message-Id: <20241229210936.ACFCD80FCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-iconv: bump to version 7.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a649794913214c27960f704d62f2f3577fef7cb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-iconv/Config.in      | 2 +-
 package/lua-iconv/lua-iconv.hash | 4 ++--
 package/lua-iconv/lua-iconv.mk   | 3 ++-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/lua-iconv/Config.in b/package/lua-iconv/Config.in
index e76019d676..73c2af9bfb 100644
--- a/package/lua-iconv/Config.in
+++ b/package/lua-iconv/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LUA_ICONV
 	help
 	  Lua binding to the POSIX 'iconv' library
 
-	  http://ittner.github.io/lua-iconv/
+	  https://github.com/lunarmodules/lua-iconv
diff --git a/package/lua-iconv/lua-iconv.hash b/package/lua-iconv/lua-iconv.hash
index b28ce0b31c..d534295258 100644
--- a/package/lua-iconv/lua-iconv.hash
+++ b/package/lua-iconv/lua-iconv.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  fb66e785e15376c2d2817f1f1b27d10272b877eacc998c727a10f081a7d768fa  lua-iconv-7-1.src.rock
-sha256  30227b9571827f3dfcdeb3830594fc415459d64ad7271e9954178d3ef58a9bd4  lua-iconv-7/COPYING
+sha256  fdcb6b3fdae53967451054a87b1c977d87aeaa88f2d9518c0e316efb777d65f4  lua-iconv-7.1.0-1.src.rock
+sha256  30227b9571827f3dfcdeb3830594fc415459d64ad7271e9954178d3ef58a9bd4  lua-iconv/COPYING
diff --git a/package/lua-iconv/lua-iconv.mk b/package/lua-iconv/lua-iconv.mk
index ea8e0dd8b6..23f4b31b4c 100644
--- a/package/lua-iconv/lua-iconv.mk
+++ b/package/lua-iconv/lua-iconv.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-LUA_ICONV_VERSION = 7-1
+LUA_ICONV_VERSION = 7.1.0-1
+LUA_ICONV_SUBDIR = lua-iconv
 LUA_ICONV_LICENSE = MIT
 LUA_ICONV_LICENSE_FILES = $(LUA_ICONV_SUBDIR)/COPYING
 LUA_ICONV_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
