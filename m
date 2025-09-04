Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D8CCA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0906607BA;
	Thu,  4 Sep 2025 16:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gq1FmFSnRVmO; Thu,  4 Sep 2025 16:34:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CE4260796
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CE4260796;
	Thu,  4 Sep 2025 16:34:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 11039106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE2F460646
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X23WolVTXZis for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:33:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 595E560632
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 595E560632
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5505787EEF; Thu,  4 Sep 2025 16:33:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 13:59:56 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 07bbf4bc5321a771920d907234513fa6a7e17a55
X-Git-Newrev: 5e2d0aef74d601b2f5811530c1cbcba96904ffa1
X-Patchwork-Hint: ignore
Message-Id: <20250904163334.5505787EEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/vim: security
 bump to version 9.1.1684
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5e2d0aef74d601b2f5811530c1cbcba96904ffa1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Fixes the following CVEs:
- CVE-2024-41957
- CVE-2024-41965
- CVE-2024-45306
- CVE-2024-47814
- CVE-2025-1215
- CVE-2025-22134
- CVE-2025-24014
- CVE-2025-26603
- CVE-2025-29768
- CVE-2025-53905
- CVE-2025-53906

README.txt got updated three times since the last bump:
- [0] updated some wording regarding who the developers are.
- [1] updated the link to the release archives
- [2] updated the goals of the project

netrw (the builtin file explorer of vim) changed maintainer and was
subsequently restructured [3]. Therefore we need to run installpack,
otherwise we run into this on startup (reported by Julien, thanks!):

Error detected while processing
/usr/share/vim/vim91/plugin/netrwPlugin.vim:
line    7:
E919: Directory not found in 'packpath': "pack/*/opt/netrw"
Press ENTER or type command to continue

[0]: https://github.com/vim/vim/commit/b75825f749cf87feb9ae8e7e5327bd2efe707c86
[1]: https://github.com/vim/vim/commit/4225f28855c5d3023662b3a90a70b22caf9b6ade
[2]: https://github.com/vim/vim/commit/2bfd1ee161e26ece8e5a72cdca4fff22d11728a2
[3]: https://github.com/vim/vim/commit/9cfdabb074feefc9848e9f7a4538f201e28c7f06

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 089731c8ea4e90cb84a25cbae3e9cb5fc871a6aa)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/vim/vim.hash | 4 ++--
 package/vim/vim.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 194bcb4378..ae909aaeac 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  0056537cb57190aa41c12ba6c2ad04ce10e7f714cde4c1fe7193a37e1c44db46  vim-9.1.0145.tar.gz
+sha256  4fe4cb284007e26255267338dde1ceac6f8326f78123ae8c96a36ee15a1ea7ba  vim-9.1.1684.tar.gz
 sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
-sha256  7a2f621c8496396dae5eecdcc4dccff9d534dff4627193d3ebf7fa6d2cb27042  README.txt
+sha256  ee1d0885bbc4a95a24e49873a075391bdf26b69d13758e30f3d9271f8f42bd2d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 7d51a6ddab..4297bdd198 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.1.0145
+VIM_VERSION = 9.1.1684
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
@@ -49,6 +49,7 @@ endif
 define VIM_INSTALL_TARGET_CMDS
 	cd $(@D)/src; \
 		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installvimbin; \
+		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installpack; \
 		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installtools; \
 		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) installlinks
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
