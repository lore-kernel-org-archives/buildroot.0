Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CA9C5AD4E
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 10:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1133F40396;
	Sun,  9 Aug 2026 10:19:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sMCKIXe-VE9a; Sun,  9 Aug 2026 10:19:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E047F40540
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786270768;
	bh=1RDYs0QnIux6qrVtFodFY+cETyDFhUvUaPoT8XqC2HM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HqX7BgMqEcXSGjINU7QnUxayXSGCUMuqcLsiGUvmNgLGZkHRkiOI/QY4zJlvI8Vjz
	 2640DccTj9F1OFTTcrj5dH7eL2628yr3byNG3YD9t6E5Fv4fiZZnAiX+BiLw0n3Zi5
	 bNFPxDPjbGK9vtOBYHiNovQ9nIwtKeIq0L/cDDkxYn63lziOEKu23xoga79h8bX8Jr
	 MVMtck6xC8Qd9jap5MjBWdbJeZ+SCCzQBdxd0++E2BeO0hu4tVEvyIhcGsXgYqbwIt
	 brB4Is73dSCdudzcoZ80KYJ2YpaUoM9wWCp52/RcMgF9/+fGK2KXULem3ifCKtUKtc
	 1H99VnChH3NfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E047F40540;
	Sun,  9 Aug 2026 10:19:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2206210E
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 10:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0863C40396
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 10:19:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mPyVds5rWkoW for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 10:19:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B37340387
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B37340387
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 10:19:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D61EF8D206; Sun,  9 Aug 2026 10:18:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Aug 2026 11:17:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53c29cf0466a1cb73739af2acdce61024df9650c
X-Git-Newrev: d90bbf81f86acef07037ad59ed78e2809222e1d3
X-Patchwork-Hint: ignore
Message-Id: <20260809101837.D61EF8D206@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/easydbus: bump to version 0.2.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d90bbf81f86acef07037ad59ed78e2809222e1d3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

0.2.1 builds against Lua 5.4 (previously excluded), so drop the
!BR2_PACKAGE_LUA_5_4 dependency and the corresponding wording in
the comment.

Changelog:
https://github.com/mniestroj/easydbus/blob/master/CHANGELOG.md#021---2026-06-05

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/easydbus/Config.in     | 5 ++---
 package/easydbus/easydbus.hash | 2 +-
 package/easydbus/easydbus.mk   | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/easydbus/Config.in b/package/easydbus/Config.in
index 5f2f3a22be..1fe8689ccd 100644
--- a/package/easydbus/Config.in
+++ b/package/easydbus/Config.in
@@ -3,13 +3,12 @@ config BR2_PACKAGE_EASYDBUS
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
-	depends on !BR2_PACKAGE_LUA_5_4
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Easy to use DBus library for Lua.
 
 	  https://github.com/mniestroj/easydbus
 
-comment "easydbus needs a toolchain w/ wchar, threads, Lua <= 5.3"
+comment "easydbus needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PACKAGE_LUA_5_4
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/easydbus/easydbus.hash b/package/easydbus/easydbus.hash
index 08a4f038d7..f83e1eb253 100644
--- a/package/easydbus/easydbus.hash
+++ b/package/easydbus/easydbus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8cec24bff40f056d4874ed9d6fb73c9f1efbc5eff14528e1b49f1a162b197f26  easydbus-0.1.0.tar.gz
+sha256  d0f018f45b682e85108c10b5d1fa7bdcd1a81188bea43aa6c9c725c779f66aec  easydbus-0.2.1.tar.gz
 sha256  dec3b3103cd6889045da86fc7da22bd25545966e5bd7c214791b922dec19588b  LICENSE
diff --git a/package/easydbus/easydbus.mk b/package/easydbus/easydbus.mk
index 57d0c22392..d35da45580 100644
--- a/package/easydbus/easydbus.mk
+++ b/package/easydbus/easydbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EASYDBUS_VERSION = 0.1.0
+EASYDBUS_VERSION = 0.2.1
 EASYDBUS_SITE = $(call github,mniestroj,easydbus,v$(EASYDBUS_VERSION))
 EASYDBUS_DEPENDENCIES = luainterpreter libglib2
 EASYDBUS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
