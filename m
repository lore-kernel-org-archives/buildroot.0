Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59555C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BAAD60F62;
	Wed,  9 Feb 2022 21:46:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rca9FEq77ey2; Wed,  9 Feb 2022 21:46:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4525660E5F;
	Wed,  9 Feb 2022 21:46:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10BCF1BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C37B48333E
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VUt_XzUb06Lh for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E76DD83342
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E9C298323C; Wed,  9 Feb 2022 21:26:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:10:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f26bd4e9196a1d242a0a98207e2911c50c4f878f
X-Git-Newrev: 96cda325b1c9873bec520752507841318fd1f78c
X-Patchwork-Hint: ignore
Message-Id: <20220209212601.E9C298323C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/selinux-python: drop reference to
 python2
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

commit: https://git.buildroot.net/buildroot/commit/?id=96cda325b1c9873bec520752507841318fd1f78c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/selinux-python/Config.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/selinux-python/Config.in b/package/selinux-python/Config.in
index 6a518f97d4..ad50cc0735 100644
--- a/package/selinux-python/Config.in
+++ b/package/selinux-python/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_SELINUX_PYTHON
 	bool "selinux-python"
-	depends on !BR2_PACKAGE_PYTHON
 	depends on BR2_USE_MMU
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -46,10 +45,6 @@ comment "sepolgen needs a toolchain w/ gcc 5"
 
 endif
 
-comment "selinux-python needs python3"
-	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_PYTHON
-
 comment "selinux-python packages needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
