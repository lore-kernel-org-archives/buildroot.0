Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6726EE4999
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 18:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E771A60BBA;
	Tue, 30 Dec 2025 18:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id biSJW9uTzCDN; Tue, 30 Dec 2025 18:12:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F6F960BBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767118362;
	bh=s0clZ4gQ293PugjPvN3dUGEkArl98ZRqMDvEM9nORvI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fQEO9VSFkngqeoMlnewIrel/2g7yfgC8875iPHHvkpQjQje5dcR9RWmpO15IDW7/r
	 mXQaS1WWmMdipzjyfAUfnfUl5oUDhOUrdOBDirs2Gu5ZQP4GmwvCC7aU0kLUEIaWj/
	 TV5p7AvRI7Kl8/JM0DTeMT0eaIF4lk/BL3DTVb5r1yxXTbVX3A1NYL3iS9s9vdCUxw
	 RoUjIVe8a0oQcXMG7L3WujJ2Eu/1w2EuuDRDFGgGZ6oVWWCsMuZGonR9n+30sKHe7Z
	 jqZHS89SuI9tphnPL0iFaqeA+yNRpfrwDpOcsxrV/s51r9HlWU2X3m7z0SJfr7NNLn
	 5S12hHElW6qtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F6F960BBF;
	Tue, 30 Dec 2025 18:12:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6121F177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47CE660B44
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vvpr_uWdbUnU for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7949260B9F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7949260B9F
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77E9D87C40; Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 19:12:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c9ae47194d1fa69b804793ba0921ff24eee7a20
X-Git-Newrev: 3a8754fd7cd4a53ab457a53afc4e90ce6d96c9c0
X-Patchwork-Hint: ignore
Message-Id: <20251230181235.77E9D87C40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ogre: remove dependency to
 libfreeimage
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a8754fd7cd4a53ab457a53afc4e90ce6d96c9c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libfreeimage is not a mandatory dependency of ogre.

Due to the upcoming removal of libfreeimage due to security reasons from
buildroot we do not transform libfreeimage into an optional dependency:
https://github.com/OGRECave/ogre/issues/3069

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ogre/Config.in | 2 --
 package/ogre/ogre.mk   | 1 -
 2 files changed, 3 deletions(-)

diff --git a/package/ogre/Config.in b/package/ogre/Config.in
index e00d76d93d..3a3f2426a3 100644
--- a/package/ogre/Config.in
+++ b/package/ogre/Config.in
@@ -8,9 +8,7 @@ config BR2_PACKAGE_OGRE
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 	depends on BR2_USE_WCHAR # use wchar_t
-	depends on !BR2_arc # libfreeimage
 	select BR2_PACKAGE_FREETYPE
-	select BR2_PACKAGE_LIBFREEIMAGE
 	select BR2_PACKAGE_PUGIXML
 	select BR2_PACKAGE_SDL2
 	select BR2_PACKAGE_SDL2_OPENGL
diff --git a/package/ogre/ogre.mk b/package/ogre/ogre.mk
index 4e5d5f6d72..f3e3fc1d8e 100644
--- a/package/ogre/ogre.mk
+++ b/package/ogre/ogre.mk
@@ -16,7 +16,6 @@ OGRE_GIT_SUBMODULES = YES
 
 OGRE_DEPENDENCIES = host-pkgconf \
 	freetype \
-	libfreeimage \
 	libgl \
 	pugixml \
 	sdl2 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
