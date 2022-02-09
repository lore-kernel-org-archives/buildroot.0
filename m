Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3165AC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 20:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D59AE827AA;
	Wed,  9 Feb 2022 20:34:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cQGCJZGNsgKx; Wed,  9 Feb 2022 20:34:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE52181B35;
	Wed,  9 Feb 2022 20:33:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C0031BF42C
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 20:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07F1360AAC
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 20:33:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2GOFBuaj-Ea7 for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 20:33:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4686160009
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 20:33:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6067482B8F; Wed,  9 Feb 2022 20:26:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 21:31:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b28ee9267f790792eb8335ee2ceba268ea6152e
X-Git-Newrev: 6e9ecaa0c9d9aea41212566a58ffab5e25e52bda
X-Patchwork-Hint: ignore
Message-Id: <20220209202625.6067482B8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyzmq: drop python2
 dependency for comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e9ecaa0c9d9aea41212566a58ffab5e25e52bda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package was updated to support python3 in commit 4a8bedc51d9
(python-pyzmq: enable PyZMQ for Python 3), but the comment dependency was
missed.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pyzmq/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-pyzmq/Config.in b/package/python-pyzmq/Config.in
index 8f33a635c8..f8ce52f844 100644
--- a/package/python-pyzmq/Config.in
+++ b/package/python-pyzmq/Config.in
@@ -9,5 +9,4 @@ config BR2_PACKAGE_PYTHON_PYZMQ
 	  http://zeromq.org/bindings:python
 
 comment "python-pyzmq needs a toolchain w/ C++, threads"
-	depends on BR2_PACKAGE_PYTHON
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
