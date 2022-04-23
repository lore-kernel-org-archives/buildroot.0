Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AE5C433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 16:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6428D82A2D;
	Sat, 23 Apr 2022 16:33:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cF1G_02bgn1B; Sat, 23 Apr 2022 16:33:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6361F8272C;
	Sat, 23 Apr 2022 16:33:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8302F1BF95C
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DA2D83E0B
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2bUai3RJ-fWp for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 16:32:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BABA68272C
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 16:32:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7442B822ED; Sat, 23 Apr 2022 16:22:49 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 18:15:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f1a494f471d00bf60e2ad1cec4478a8a642b826
X-Git-Newrev: 9c6e771475eb9b7a0dec1cb587ae39f807d36c87
X-Patchwork-Hint: ignore
Message-Id: <20220423162249.7442B822ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstd: fix init file installation
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c6e771475eb9b7a0dec1cb587ae39f807d36c87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix a bug where the init subdir was accidentially removed from meson.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0004-meson.build-add-missing-init-subdir.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/gstreamer1/gstd/0004-meson.build-add-missing-init-subdir.patch b/package/gstreamer1/gstd/0004-meson.build-add-missing-init-subdir.patch
new file mode 100644
index 0000000000..ed3738e3d4
--- /dev/null
+++ b/package/gstreamer1/gstd/0004-meson.build-add-missing-init-subdir.patch
@@ -0,0 +1,28 @@
+From 689265cd522c770ad3e0391cae80ee884a8c475c Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Thu, 21 Apr 2022 01:14:52 -0500
+Subject: [PATCH] meson.build: add missing init subdir
+
+Seems this got accidentially removed in:
+9f4490138c8892b1c86008134438b2ab405c9b0f
+
+Restore it so that init files are properly installed.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[upstreeam: https://github.com/RidgeRun/gstd-1.x/pull/291]
+---
+ meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/meson.build b/meson.build
+index a30f776..7a8690a 100644
+--- a/meson.build
++++ b/meson.build
+@@ -300,3 +300,4 @@ subdir('gst_client')
+ subdir('tests')
+ subdir('examples')
+ subdir('docs')
++subdir('init')
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
