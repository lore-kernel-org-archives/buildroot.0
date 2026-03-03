Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9047EDA6B2
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 17:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77969607BC;
	Tue,  3 Mar 2026 17:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id clIhAsSfUDKi; Tue,  3 Mar 2026 17:21:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F87160B96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772558504;
	bh=hZheOuaOCKfadVR5ub6WR+2iDiQWEyWvjdQVzbvBZUk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=M+2EM9SRFWhrSgNxCLL2m0eyUwoFoEuvxjkCE5aoNPztA6zSh3gLqu8p46NHUDSTM
	 XUPaoJBdILH4vJvOs4/GFCz/hkAx0Dv2rsTkSS8wKO5mpt+aoS7R83Odwy5mYDR63Z
	 GA7jXtiis/HIXwCGcwJgyRwZr4DKqkjjrIgktqta4eGAEINt3DHCwwY3osY7Kzc+B1
	 BOIXLMWaq1a+7gXpOCGOL4wETNuP8Gfk3S9WC3BjHnOLL7QXlbQDQsmX8tY6sJc93S
	 wR1inRk+YbUDaN0OmY0olD+7c9DsPAoIGFdkgxtuN6ppeU3tYdzQlkjFl2PH3sllLU
	 zON0XW3nqOqFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F87160B96;
	Tue,  3 Mar 2026 17:21:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C3A551EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A991A4189A
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:21:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJdZEKbfG2Ln for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 17:21:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8B1E417DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8B1E417DD
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:21:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C1F4585F00; Tue,  3 Mar 2026 17:21:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Mar 2026 18:19:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8195c73ca33f47767b4e14f5d706acaebe0ee1f4
X-Git-Newrev: 95dad8f85c4ce2f6956492b868bc9eba6452a9bc
X-Patchwork-Hint: ignore
Message-Id: <20260303172142.C1F4585F00@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vim: security bump to v9.1.2148
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/95dad8f85c4ce2f6956492b868bc9eba6452a9bc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For changes, see:

  - https://github.com/vim/vim/compare/v9.1.2017...v9.1.2148

Fixes the following vulnerabilities:

- CVE-2026-25749:
    Vim is an open source, command line text editor. Prior to version
    9.1.2132, a heap buffer overflow vulnerability exists in Vim's tag
    file resolution logic when processing the 'helpfile' option. The
    vulnerability is located in the get_tagfname() function in src/tag.c.
    When processing help file tags, Vim copies the user-controlled
    'helpfile' option value into a fixed-size heap buffer of MAXPATHL + 1
    bytes (typically 4097 bytes) using an unsafe STRCPY() operation
    without any bounds checking. This issue has been patched in version
    9.1.2132.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-25749
  - https://github.com/vim/vim/commit/0714b15940b245108e6e9d7aa2260dd849a26fa9

- CVE-2026-26269:
    Vim is an open source, command line text editor. Prior to 9.1.2148, a
    stack buffer overflow vulnerability exists in Vim's NetBeans
    integration when processing the specialKeys command, affecting Vim
    builds that enable and use the NetBeans feature. The Stack buffer
    overflow exists in special_keys() (in src/netbeans.c). The while
    (*tok) loop writes two bytes per iteration into a 64-byte stack buffer
    (keybuf) with no bounds check. A malicious NetBeans server can
    overflow keybuf with a single specialKeys command. The issue has been
    fixed as of Vim patch v9.1.2148.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-26269
  - https://github.com/vim/vim/commit/c5f312aad8e4179e437f81ad39a860cd0ef11970

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...0001-src-Makefile-create-links-with-ln-sf.patch | 78 ----------------------
 package/vim/vim.hash                               |  2 +-
 package/vim/vim.mk                                 |  2 +-
 3 files changed, 2 insertions(+), 80 deletions(-)

diff --git a/package/vim/0001-src-Makefile-create-links-with-ln-sf.patch b/package/vim/0001-src-Makefile-create-links-with-ln-sf.patch
deleted file mode 100644
index 54d423aacf..0000000000
--- a/package/vim/0001-src-Makefile-create-links-with-ln-sf.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 5686ef63f81fcac2ca6ec6e7160829b295ad4e79 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sun, 28 Dec 2025 15:01:38 +0100
-Subject: [PATCH] src/Makefile: create links with ln -sf
-
-Running "make installlinks" twice towards the same destination
-directory will fail, as symlink will already exist. This is not really
-expected as "make install" is normally expected to work again and
-again towards the same destination directory.
-
-Fix this by using ln -sf.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: https://github.com/vim/vim/commit/6df5360691266b5eca49380e94f3e21fa48e5e0b
----
- src/Makefile | 24 ++++++++++++------------
- 1 file changed, 12 insertions(+), 12 deletions(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index 6fb1eb95e..39f798260 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -2746,40 +2746,40 @@ installvimdiff: $(DEST_BIN)/$(VIMDIFFTARGET)
- installgvimdiff: $(DEST_BIN)/$(GVIMDIFFTARGET)
- 
- $(DEST_BIN)/$(EXTARGET): $(DEST_BIN)
--	cd $(DEST_BIN); ln -s $(VIMTARGET) $(EXTARGET)
-+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(EXTARGET)
- 
- $(DEST_BIN)/$(VIEWTARGET): $(DEST_BIN)
--	cd $(DEST_BIN); ln -s $(VIMTARGET) $(VIEWTARGET)
-+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(VIEWTARGET)
- 
- $(DEST_BIN)/$(GVIMTARGET): $(DEST_BIN)
--	cd $(DEST_BIN); ln -s $(VIMTARGET) $(GVIMTARGET)
-+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(GVIMTARGET)
- 
- $(DEST_BIN)/$(GVIEWTARGET): $(DEST_BIN)
--	cd $(DEST_BIN); ln -s $(VIMTARGET) $(GVIEWTARGET)
-+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(GVIEWTARGET)
- 
- $(DEST_BIN)/$(RVIMTARGET): $(DEST_BIN)
--	cd $(DEST_BIN); ln -s $(VIMTARGET) $(RVIMTARGET)
-+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(RVIMTARGET)
- 
- $(DEST_BIN)/$(RVIEWTARGET): $(DEST_BIN)
--	cd $(DEST_BIN); ln -s $(VIMTARGET) $(RVIEWTARGET)
-+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(RVIEWTARGET)
- 
- $(DEST_BIN)/$(RGVIMTARGET): $(DEST_BIN)
--	cd $(DEST_BIN); ln -s $(VIMTARGET) $(RGVIMTARGET)
-+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(RGVIMTARGET)
- 
- $(DEST_BIN)/$(RGVIEWTARGET): $(DEST_BIN)
--	cd $(DEST_BIN); ln -s $(VIMTARGET) $(RGVIEWTARGET)
-+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(RGVIEWTARGET)
- 
- $(DEST_BIN)/$(VIMDIFFTARGET): $(DEST_BIN)
--	cd $(DEST_BIN); ln -s $(VIMTARGET) $(VIMDIFFTARGET)
-+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(VIMDIFFTARGET)
- 
- $(DEST_BIN)/$(GVIMDIFFTARGET): $(DEST_BIN)
--	cd $(DEST_BIN); ln -s $(VIMTARGET) $(GVIMDIFFTARGET)
-+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(GVIMDIFFTARGET)
- 
- $(DEST_BIN)/$(EVIMTARGET): $(DEST_BIN)
--	cd $(DEST_BIN); ln -s $(VIMTARGET) $(EVIMTARGET)
-+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(EVIMTARGET)
- 
- $(DEST_BIN)/$(EVIEWTARGET): $(DEST_BIN)
--	cd $(DEST_BIN); ln -s $(VIMTARGET) $(EVIEWTARGET)
-+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(EVIEWTARGET)
- 
- # Create links for the manual pages with various names to vim.	This is only
- # done when the links (or manpages with the same name) don't exist yet.
--- 
-2.52.0
-
diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index f7c883b929..ecc41be702 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  be1d60091d27bbdbc090e0bb19798baeea378aa29645fd47dc4c222dc14efcaf  vim-9.1.2017.tar.gz
+sha256  f9ec31df8f1a78e130dd06c395e6626c2a8a8ec2705d8e7b7667bd3ecd499c6b  vim-9.1.2148.tar.gz
 sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
 sha256  ee1d0885bbc4a95a24e49873a075391bdf26b69d13758e30f3d9271f8f42bd2d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index fa7d47d67d..9201587a8a 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.1.2017
+VIM_VERSION = 9.1.2148
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
