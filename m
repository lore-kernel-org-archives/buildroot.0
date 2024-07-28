Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70517C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 11:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F84C4065D;
	Sun, 28 Jul 2024 11:09:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFa1jFtBMQt2; Sun, 28 Jul 2024 11:09:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D739F403CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D739F403CD;
	Sun, 28 Jul 2024 11:09:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 334D31BF471
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 11:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECD57401F3
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 11:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CEnMLVfrwybk for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 11:08:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B963F400B5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B963F400B5
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 11:08:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4DE18049B; Sun, 28 Jul 2024 11:08:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 12:39:28 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 3432be2df104c3948f06451fa1b8f373bf3cc33b
X-Git-Newrev: c96b51be73397f5ccd05f7adfd1b432db1ed25e3
X-Patchwork-Hint: ignore
Message-Id: <20240728110845.B4DE18049B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] boards/chromebook-elm:
 force checking hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=c96b51be73397f5ccd05f7adfd1b432db1ed25e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Bilal Wasim <bilalwasim676@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 3988f2d9238bc027b5d16219867e8d3c701c0c06)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/chromebook/elm/patches/linux-headers/linux-headers.hash | 1 +
 board/chromebook/elm/patches/linux/linux.hash                 | 2 ++
 configs/chromebook_elm_defconfig                              | 4 ++++
 3 files changed, 7 insertions(+)

diff --git a/board/chromebook/elm/patches/linux-headers/linux-headers.hash b/board/chromebook/elm/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/chromebook/elm/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/chromebook/elm/patches/linux/linux.hash b/board/chromebook/elm/patches/linux/linux.hash
new file mode 100644
index 0000000000..88aa603ac5
--- /dev/null
+++ b/board/chromebook/elm/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  dcdf99e43e98330d925016985bfbc7b83c66d367b714b2de0cbbfcbf83d8ca43  linux-5.10.tar.xz
diff --git a/configs/chromebook_elm_defconfig b/configs/chromebook_elm_defconfig
index 827d929631..0e8b6287c3 100644
--- a/configs/chromebook_elm_defconfig
+++ b/configs/chromebook_elm_defconfig
@@ -35,3 +35,7 @@ BR2_PACKAGE_HOST_PARTED=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
 BR2_PACKAGE_HOST_VBOOT_UTILS=y
+
+# Misc
+BR2_GLOBAL_PATCH_DIR="board/chromebook/elm/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
