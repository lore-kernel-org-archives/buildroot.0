Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CFECE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 21:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9346741719;
	Sun, 24 Sep 2023 21:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9346741719
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bzaty86yoeul; Sun, 24 Sep 2023 21:23:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 685D0417D2;
	Sun, 24 Sep 2023 21:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 685D0417D2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0EA4B1BF2CC
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5898381CAF
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5898381CAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MexDOqM_oTT0 for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 21:21:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E55781CEF
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 21:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E55781CEF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E67D87645; Sun, 24 Sep 2023 21:21:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 23:19:08 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: a845cb5f1bbb7ed7139f91bd9fc7516c559c18b3
X-Git-Newrev: 46a015194d6826f28851578145aae98e68f31b7b
X-Patchwork-Hint: ignore
Message-Id: <20230924212149.5E67D87645@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/vim: security
 bump to version 9.0.1903
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

commit: https://git.buildroot.net/buildroot/commit/?id=46a015194d6826f28851578145aae98e68f31b7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

- Fix CVE-2023-2426, CVE-2023-2609, CVE-2023-2610, CVE-2023-4733,
  CVE-2023-4734, CVE-2023-4735, CVE-2023-4736, CVE-2023-4738,
  CVE-2023-4750, CVE-2023-4752 and CVE-2023-4781
- Update hash of license file and readme (maintainers updated with
  https://github.com/vim/vim/commit/e978b4534a5e10471108259118c0ef791106fd92
  https://github.com/vim/vim/commit/1688938dd5ac78ab67e54299b9d5b93499dba762)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9165262aa0486d9cf9bb1b8a2065e2616439c513)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vim/vim.hash | 6 +++---
 package/vim/vim.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 26bc913b8a..024c014bc9 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  c2bddf283a19c8714d7b21716e0a6a3214f9edb60b080f233cce4143fe228ff3  vim-9.0.1414.tar.gz
-sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
-sha256  d187aff219161f37138479257f82d687ea10b2cdd17d58b53a3ec9b79d6dc870  README.txt
+sha256  ba769f8513f2f75d71518f817f945809a5cb1310fd58cd86daca96e658cccf7d  vim-9.0.1903.tar.gz
+sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
+sha256  b475d5d3f8c855dc1a84813bbe45c44054d7f7aee20c800950bf89d5958873de  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index bb6d4a8d27..b8b50cb91a 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.0.1414
+VIM_VERSION = 9.0.1903
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
