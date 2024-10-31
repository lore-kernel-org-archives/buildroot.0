Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD046D767F6
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 18:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08CE360B30;
	Thu, 31 Oct 2024 18:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JKM0hh3MW0Sr; Thu, 31 Oct 2024 18:26:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8692C60B1D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8692C60B1D;
	Thu, 31 Oct 2024 18:26:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 57CA15E53
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C5D84013D
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ObXNDSZFq2kp for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 18:26:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26DD240126
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26DD240126
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:26:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D8DF8527C; Thu, 31 Oct 2024 18:26:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 31 Oct 2024 19:22:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ec14080cd20cfd4e265c37c85446f24a70b5db6
X-Git-Newrev: 378110eb597de6fdab09df8f9da2233cb04dc820
X-Patchwork-Hint: ignore
Message-Id: <20241031182644.0D8DF8527C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-livr: bump to version 0.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=378110eb597de6fdab09df8f9da2233cb04dc820
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-livr/Config.in     | 1 +
 package/lua-livr/lua-livr.hash | 4 ++--
 package/lua-livr/lua-livr.mk   | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/lua-livr/Config.in b/package/lua-livr/Config.in
index 76fd1c7543..ac749025a7 100644
--- a/package/lua-livr/Config.in
+++ b/package/lua-livr/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LUA_LIVR
 	bool "lua-livr"
+	select BR2_PACKAGE_LUA_COMPAT53 if BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1 # runtime
 	help
 	  Lightweight validator supporting Language Independent
 	  Validation Rules Specification (LIVR).
diff --git a/package/lua-livr/lua-livr.hash b/package/lua-livr/lua-livr.hash
index 50e4d3c6a7..1df1273065 100644
--- a/package/lua-livr/lua-livr.hash
+++ b/package/lua-livr/lua-livr.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  7f00fc561c5913bb53a21ec21f060118d9795c65a0d7a37903e311bdedcfff2a  lua-livr-0.4.0-1.src.rock
-sha256  6840bae0e48c559cc6aa765d7744d920f8a05f608c4d1223fde8e6b8e7c48c5d  lua-LIVR-0.4.0/COPYRIGHT
+sha256  4e0f5fd78c05893d8d6312bd067e9e6d6492ff363719f2da574ab0726fd76e86  lua-livr-0.5.0-1.src.rock
+sha256  6840bae0e48c559cc6aa765d7744d920f8a05f608c4d1223fde8e6b8e7c48c5d  lua-LIVR-0.5.0/COPYRIGHT
diff --git a/package/lua-livr/lua-livr.mk b/package/lua-livr/lua-livr.mk
index 56600c80b2..28a9d418c0 100644
--- a/package/lua-livr/lua-livr.mk
+++ b/package/lua-livr/lua-livr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LIVR_VERSION = 0.4.0-1
+LUA_LIVR_VERSION = 0.5.0-1
 LUA_LIVR_NAME_UPSTREAM = lua-LIVR
 LUA_LIVR_LICENSE = MIT
 LUA_LIVR_LICENSE_FILES = $(LUA_LIVR_SUBDIR)/COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
