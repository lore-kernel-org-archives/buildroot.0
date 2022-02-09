Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C484C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAC27415EB;
	Wed,  9 Feb 2022 21:52:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S0YanlrzUPYf; Wed,  9 Feb 2022 21:52:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3605F415EE;
	Wed,  9 Feb 2022 21:52:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D8061BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 621EE60E5B
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rgJLXGOvh73y for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1FCA60B98
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D587181335; Wed,  9 Feb 2022 21:26:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:10:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5fbafe603554c741d54792f87e60f2aa943b5a6c
X-Git-Newrev: 15c47b462e0065a96c7b0436ec70f9be08d623c4
X-Patchwork-Hint: ignore
Message-Id: <20220209212601.D587181335@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: drop references to python2
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

commit: https://git.buildroot.net/buildroot/commit/?id=15c47b462e0065a96c7b0436ec70f9be08d623c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python3/Config.in  | 1 -
 package/python3/python3.mk | 2 --
 2 files changed, 3 deletions(-)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 7714518edc..61470c2944 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -4,7 +4,6 @@ comment "python3 needs a toolchain w/ wchar, threads, dynamic library"
 
 config BR2_PACKAGE_PYTHON3
 	bool "python3"
-	depends on !BR2_PACKAGE_PYTHON
 	depends on BR2_USE_WCHAR
 	# uses fork()
 	depends on BR2_USE_MMU
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index f9afcd5097..6af7488ddd 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -260,9 +260,7 @@ define PYTHON3_INSTALL_SYMLINK
 	ln -fs python3 $(TARGET_DIR)/usr/bin/python
 endef
 
-ifneq ($(BR2_PACKAGE_PYTHON),y)
 PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_INSTALL_SYMLINK
-endif
 
 # Some packages may have build scripts requiring python3, whatever is the
 # python version chosen for the target.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
