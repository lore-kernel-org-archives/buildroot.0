Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DC7C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 15:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F2A660797;
	Sat, 13 Jul 2024 15:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 718twYu1mSZi; Sat, 13 Jul 2024 15:57:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD4CA60769
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD4CA60769;
	Sat, 13 Jul 2024 15:57:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5AD1B1BF406
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 15:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54E27820CD
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 15:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WqEATBwEUBkb for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 15:57:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 931D0820CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 931D0820CA
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 15:57:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CB61863B4; Sat, 13 Jul 2024 15:57:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 17:57:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 551b922d7149e5f7f1ec9ab9a2ca9a09d33e2735
X-Git-Newrev: bc4e4a93db658a561a93c72239aa63b61e6048c2
X-Patchwork-Hint: ignore
Message-Id: <20240713155752.7CB61863B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: add missing hash
 for LICENSE.mali_cssfw
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc4e4a93db658a561a93c72239aa63b61e6048c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit
94d4ab11fea1b964991ba64e3b2964de467ec9fc ("package/linux-firmware: add
option to install ARM Mali CSF firmwares") added support for
installing the Mali CSF firmware files, but forgot to add the hash of
the license file used by those firmware files. This commit fixes this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/linux-firmware.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index a94f368b1f..c1d168100d 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -18,6 +18,7 @@ sha256  8c45a83562a69f7ac4207e4cb5c0063af2e545791b3947bc81dc82305481c15c  LICENS
 sha256  0e0c11073ba3c832097da38e0905da36b8a3526f219407977b13b71c6675be7d  LICENCE.it913x
 sha256  646957007887aed50d56c1f4fd9c6ef760d5b96d0a03577bda3492206dba1d05  LICENSE.ivsc
 sha256  16d5040c7cf851fc693b7542e20870935b99802533ea1bfd231c377a2305e5c5  LICENCE.iwlwifi_firmware
+sha256  ebedc86d1767186a66dcb59ce8dcb97c5fd9ac10de2adaacad226714e4712f6d  LICENCE.mali_csffw
 sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENCE.Marvell
 sha256  a90d3f66704d85889945fec5525ea77622549da83aced1aac99828383f8f1805  LICENCE.mediatek
 sha256  0fc67bd715b3395f3f2af464781910e9e69c4ba23da304352229b42dc9e986c3  LICENCE.microchip
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
