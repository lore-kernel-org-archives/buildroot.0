Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B1EC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BBAB418B9;
	Mon,  5 Feb 2024 21:53:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BBAB418B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tjHZ6qtb_N31; Mon,  5 Feb 2024 21:53:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57C3C41A5F;
	Mon,  5 Feb 2024 21:53:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57C3C41A5F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D8061BF954
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA331403A2
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA331403A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CXPBZryK26ya for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:53:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3A544012F
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3A544012F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C1ED386E3C; Mon,  5 Feb 2024 21:53:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 22:52:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc2ff8a38e72487f3fd6c7a2700ca664f7828545
X-Git-Newrev: 6ed73df9ee774e007432fbf9b6c19b22233f2bfd
X-Patchwork-Hint: ignore
Message-Id: <20240205215302.C1ED386E3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/containerd: drop
 CONTAINERD_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ed73df9ee774e007432fbf9b6c19b22233f2bfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 35af2bb8011ea57642777acf5613afa244d325d7 set
CONTAINERD_CPE_ID_PRODUCT to containerd but this is not needed as
CONTAINERD_CPE_ID_PRODUCT will be set to the package name
(i.e. containerd) by default

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Reviewed-by: Antoine Coutant <antoine.coutant@smile.fr>
---
 package/containerd/containerd.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 61a8472ddd..d3ca102797 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -9,7 +9,6 @@ CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
 CONTAINERD_CPE_ID_VENDOR = linuxfoundation
-CONTAINERD_CPE_ID_PRODUCT = containerd
 
 CONTAINERD_GOMOD = github.com/containerd/containerd
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
