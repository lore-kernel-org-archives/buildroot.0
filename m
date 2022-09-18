Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADD1ECAAD8
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 21:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24FFF83EDD;
	Sun, 18 Sep 2022 21:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24FFF83EDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IA-JZs1hKmEv; Sun, 18 Sep 2022 21:21:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E77F82A83;
	Sun, 18 Sep 2022 21:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E77F82A83
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 254381BF97F
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 21:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F19F240150
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 21:20:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F19F240150
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 949B6DtOMxdG for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 21:20:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EA2240A42
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 21:20:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EA2240A42
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88D3B856F1; Sun, 18 Sep 2022 21:20:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 23:16:46 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 3e9c048a737f7733fab4ae14d49f80c897a3d7b0
X-Git-Newrev: edd03f7edc05cf833339018be762785cdf2e187f
X-Patchwork-Hint: ignore
Message-Id: <20220918212044.88D3B856F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/vim: security
 bump to version 9.0.0453
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

commit: https://git.buildroot.net/buildroot/commit/?id=edd03f7edc05cf833339018be762785cdf2e187f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fix CVE-2022-3037, CVE-2022-3099, CVE-2022-3134

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 24261a1762a0017cba8128935a37280c7b876468)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index f06d084cb3..0c6b720dd1 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  7c97f8e8cc56157cad7d461633beb347472e134e96b5545d24d1fe451dfaecc2  vim-9.0.0292.tar.gz
+sha256  b90063706a2a9ee234275e0dd4b71a11e24867c33203c432fd6e9799fdc3bff9  vim-9.0.0453.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  4afae7c984ab1a4ccd0b474a695f316e7435ab6ed46537648af925c18835d853  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 5e7c34abbb..3f1985f036 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.0.0292
+VIM_VERSION = 9.0.0453
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
