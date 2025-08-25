Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7320ECA0FE7
	for <buildroot@archiver.kernel.org>; Mon, 25 Aug 2025 19:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC3D1611F7;
	Mon, 25 Aug 2025 19:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1d2ImiRVLFei; Mon, 25 Aug 2025 19:19:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE2F16123A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE2F16123A;
	Mon, 25 Aug 2025 19:19:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B90F1CD
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 19:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA661427F9
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 19:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SUP9SiujKtd8 for <buildroot@buildroot.org>;
 Mon, 25 Aug 2025 19:19:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFC2E4133C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFC2E4133C
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 19:19:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE85987AFA; Mon, 25 Aug 2025 19:19:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Aug 2025 20:47:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd397daf1ca29738ab782fc24b9b5612ccffca2e
X-Git-Newrev: 089731c8ea4e90cb84a25cbae3e9cb5fc871a6aa
X-Patchwork-Hint: ignore
Message-Id: <20250825191948.BE85987AFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vim: security bump to version
 9.1.1684
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

commit: https://git.buildroot.net/buildroot/commit/?id=089731c8ea4e90cb84a25cbae3e9cb5fc871a6aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
