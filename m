Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FABC8303C
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 21:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01412612C7;
	Wed,  2 Jul 2025 21:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aqEleZPetZfs; Wed,  2 Jul 2025 21:40:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ABBD612AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ABBD612AB;
	Wed,  2 Jul 2025 21:40:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7136C128
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 21:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62697612AB
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 21:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NuPYW5zhsDPn for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 21:40:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9543760F77
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9543760F77
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 21:40:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DEA185B77; Wed,  2 Jul 2025 21:40:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Jul 2025 21:27:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 247873955758144f8780f9408534f04e6992ee68
X-Git-Newrev: 3138c577f438f36cb310dc75d8f1a4bc63b9ae7c
X-Patchwork-Hint: ignore
Message-Id: <20250702214042.7DEA185B77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cog: bump to version 0.18.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=3138c577f438f36cb310dc75d8f1a4bc63b9ae7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a small bugfix release, mainly containing event handling fixes
for Wayland, and the possibility to explicitly configure the gamepad
support at build time.

Release notes:

  https://wpewebkit.org/release/cog-0.18.5.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cog/cog.hash | 8 ++++----
 package/cog/cog.mk   | 5 ++++-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index b59b5f4795..d513ae72ba 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.18.4.tar.xz.sums
-md5  0566ab6676b499ebcff372fbe39e24fc  cog-0.18.4.tar.xz
-sha1  2d6f88cfb07eaac1be2bf9954832f19f8a856631  cog-0.18.4.tar.xz
-sha256  31d7079db2eeed790899d2f1f824dd6a54bf30d072d196d737be572f105d99b1  cog-0.18.4.tar.xz
+# From https://wpewebkit.org/releases/cog-0.18.5.tar.xz.sums
+md5  3df784f9930353ac4cb2d95fdd56e21d  cog-0.18.5.tar.xz
+sha1  49a79797fa4d0aa41680095161df7cdb155f8fe9  cog-0.18.5.tar.xz
+sha256  0ede9d09ab635ac519beec0543378e3fc51b56561a5fb7aa9c0cbca54c31b97c  cog-0.18.5.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 7f680bb700..418ed19d86 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.18.4
+COG_VERSION = 0.18.5
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
@@ -45,7 +45,10 @@ COG_CONF_OPTS += -Dcog_dbus_control=user
 endif
 
 ifeq ($(BR2_PACKAGE_LIBMANETTE),y)
+COG_CONF_OPTS += -Dlibmanette=enabled
 COG_DEPENDENCIES += libmanette
+else
+COG_CONF_OPTS += -Dlibmanette=disabled
 endif
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
