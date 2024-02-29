Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4971DC48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 16:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35462417F2;
	Thu, 29 Feb 2024 16:04:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jDp__o3wsZYm; Thu, 29 Feb 2024 16:04:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B73C4193C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B73C4193C;
	Thu, 29 Feb 2024 16:04:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C59E1BF25B
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B8E741822
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:50:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UqLrWeT8akmf for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:50:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EA284184D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EA284184D
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:50:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2ABC787DCE; Thu, 29 Feb 2024 15:50:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 16:42:37 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 62279f8592cfc4d67771e3df2b5e0c8e1a5b37f9
X-Git-Newrev: 98b4832b4417dd3eb3e2d20625c19fba0b34ccf9
X-Patchwork-Hint: ignore
Message-Id: <20240229155011.2ABC787DCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/containerd: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=98b4832b4417dd3eb3e2d20625c19fba0b34ccf9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Commit 35af2bb8011ea57642777acf5613afa244d325d7 set
CONTAINERD_CPE_ID_PRODUCT to containerd but this is not needed as
CONTAINERD_CPE_ID_PRODUCT will be set to the package name
(i.e. containerd) by default

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Reviewed-by: Antoine Coutant <antoine.coutant@smile.fr>
(cherry picked from commit 6ed73df9ee774e007432fbf9b6c19b22233f2bfd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/containerd/containerd.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index c4a6d854c3..68213c60be 100644
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
