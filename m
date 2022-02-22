Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFBFC433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 16:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DC4260F07;
	Tue, 22 Feb 2022 16:51:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y0EqBbonqvfm; Tue, 22 Feb 2022 16:51:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92B7F60EC4;
	Tue, 22 Feb 2022 16:51:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 008811BF3CB
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 16:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFC42405DD
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 16:51:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LnLLikcG1ulx for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 16:51:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 153D2405D6
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 16:51:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2593083486; Tue, 22 Feb 2022 16:43:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 17:47:04 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: d0b10e44733bae48dcb35c388ea324750c5df8a3
X-Git-Newrev: 16a75a76af63147a94c7df1c38e5568eb0ab8609
X-Patchwork-Hint: ignore
Message-Id: <20220222164312.2593083486@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/python-pyzmq:
 drop python2 dependency for comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=16a75a76af63147a94c7df1c38e5568eb0ab8609
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

The package was updated to support python3 in commit 4a8bedc51d9
(python-pyzmq: enable PyZMQ for Python 3), but the comment dependency was
missed.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6e9ecaa0c9d9aea41212566a58ffab5e25e52bda)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
