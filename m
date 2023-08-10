Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2B7EC8738
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED56783BB9;
	Thu,  7 Sep 2023 15:21:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED56783BB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ND46Slb1NeMj; Thu,  7 Sep 2023 15:21:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3010683BB4;
	Thu,  7 Sep 2023 15:21:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3010683BB4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C3861BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9240941E44
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9240941E44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FBfLYnnzA4VS for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4E2941DBD
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4E2941DBD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD11586A1E; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Aug 2023 23:01:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60cf00d3f4679069c1f1c0c8943e50626bbfb12a
X-Git-Newrev: 5a75e7dbbc302f2d631b83d0d1ea45be9f617724
X-Patchwork-Hint: ignore
Message-Id: <20230907145128.DD11586A1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/intel/galileo: enable Linux kernel
 root file system on NFS
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5a75e7dbbc302f2d631b83d0d1ea45be9f617724
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update linux-3.14.config for Galileo to enable Linux kernel root
file system on NFS.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/intel/galileo/linux-3.14.config | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/board/intel/galileo/linux-3.14.config b/board/intel/galileo/linux-3.14.config
index e7aa9cf232..c658afb88e 100644
--- a/board/intel/galileo/linux-3.14.config
+++ b/board/intel/galileo/linux-3.14.config
@@ -154,9 +154,9 @@ CONFIG_TUN=y
 # CONFIG_NET_VENDOR_SILAN is not set
 # CONFIG_NET_VENDOR_SIS is not set
 # CONFIG_NET_VENDOR_SMSC is not set
-CONFIG_STMMAC_ETH=m
+CONFIG_STMMAC_ETH=y
 # CONFIG_STMMAC_PLATFORM is not set
-CONFIG_STMMAC_PCI=m
+CONFIG_STMMAC_PCI=y
 # CONFIG_NET_VENDOR_SUN is not set
 # CONFIG_NET_VENDOR_TEHUTI is not set
 # CONFIG_NET_VENDOR_TI is not set
@@ -306,3 +306,6 @@ CONFIG_SECURITY=y
 CONFIG_SECURITY_NETWORK=y
 # CONFIG_VIRTUALIZATION is not set
 CONFIG_CRC_T10DIF=y
+CONFIG_NFS_FS=y
+CONFIG_ROOT_NFS=y
+CONFIG_IP_PNP=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
