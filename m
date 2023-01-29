Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5583C61D97
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 17:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4684760D4C;
	Sun, 29 Jan 2023 17:18:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4684760D4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wHUGoGKq6C-s; Sun, 29 Jan 2023 17:18:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C5E460C1C;
	Sun, 29 Jan 2023 17:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C5E460C1C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40BEE1BF35F
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 17:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 193CB60C1C
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 17:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 193CB60C1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id edsvlcrvExVx for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 17:18:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D8B060B79
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 17:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D8B060B79
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C1B788165; Sun, 29 Jan 2023 17:18:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 18:17:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 121a9d3649498c5f6f3a5ae8a37d6befe2cc8ef8
X-Git-Newrev: 98f8ddbc74962ab33df5ada2ccb53a27c49e60f1
X-Patchwork-Hint: ignore
Message-Id: <20230129171816.3C1B788165@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vim: security bump to version
 9.0.1260
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

commit: https://git.buildroot.net/buildroot/commit/?id=98f8ddbc74962ab33df5ada2ccb53a27c49e60f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix CVE-2023-0049, CVE-2023-0051, CVE-2023-0054 and CVE-2023-0288
- Update hash of README.txt: typo fixed by
  https://github.com/vim/vim/commit/f1dcd14fc5d4370476cd82895a4479ca2d252e54

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/vim/vim.hash | 4 ++--
 package/vim/vim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 03ee908db4..4000beedc1 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  c95c9abcf024bd6293ad199e4efa1c09452a9c6456c9cbaf53d896cf7b9f4d08  vim-9.0.0951.tar.gz
+sha256  bcaf9b21ab00ab49de4f3bdfda1bcda82533ec16c412824226544a3fce6506ff  vim-9.0.1260.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
-sha256  de04910387a62ad4f9b36b91457c8d5ef32733ac5d768a128071b93f4821fcd1  README.txt
+sha256  d187aff219161f37138479257f82d687ea10b2cdd17d58b53a3ec9b79d6dc870  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index d814c68630..e3648bfab9 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.0.0951
+VIM_VERSION = 9.0.1260
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
