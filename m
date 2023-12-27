Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEFCC46CD2
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 21:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 433BF83A51;
	Wed, 27 Dec 2023 21:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 433BF83A51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wpHIymaCMcnb; Wed, 27 Dec 2023 21:25:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 927DA83A47;
	Wed, 27 Dec 2023 21:25:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 927DA83A47
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 920121BF3E3
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 21:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70A4241BC4
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 21:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70A4241BC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U2Ydkv12GtZz for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 21:25:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D29C41BBF
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 21:25:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D29C41BBF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 858FC836E4; Wed, 27 Dec 2023 21:25:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 22:22:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5729d3008e4f958324fbbd9ea742badb3f41de4
X-Git-Newrev: 7b93aade5d48ead736a9ccc01e9ff0d59e32151a
X-Patchwork-Hint: ignore
Message-Id: <20231227212553.858FC836E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Config.in.legacy: recent removals are for
 the future release
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b93aade5d48ead736a9ccc01e9ff0d59e32151a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A few package or config removals have been introduced after the 2023.11
release, but there entries were still added to the list of options
removed in 2023.11.

The affected commits are:
    64a5831679 package/libmpd: remove package
    f93380ab1a package/gmpc: remove package
    6d8c7aecbb package/flickcurl: remove package
    f6acde11ab package/onevpl: rename package to libvpl
    fffb245f66 package/linux-headers: drop 6.5.x option

Introduce the 2024.02 section and move the 2023.11 one to where it
belongs.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 1881d43f90..b9089250c8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,7 +144,7 @@ endif
 
 ###############################################################################
 
-comment "Legacy options removed in 2023.11"
+comment "Legacy options removed in 2024.02"
 
 config BR2_PACKAGE_LIBMPD
 	bool "libmpd package was removed"
@@ -179,6 +179,8 @@ config BR2_KERNEL_HEADERS_6_5
 	  Version 6.5.x of the Linux kernel headers are no longer
 	  maintained upstream and are now removed.
 
+comment "Legacy options removed in 2023.11"
+
 config BR2_PACKAGE_PYTHON_PYXB
 	bool "python-pyxb removed"
 	select BR2_LEGACY
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
