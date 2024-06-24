Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87573C2BD05
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 06:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CEE4813ED;
	Mon, 24 Jun 2024 06:55:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4PJbJ3cpSYKv; Mon, 24 Jun 2024 06:55:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D1E081314
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D1E081314;
	Mon, 24 Jun 2024 06:55:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 408951BF4DB
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 06:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C758812DD
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 06:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cdUPrRJLn4ev for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 06:55:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DB33C812D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB33C812D3
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB33C812D3
 for <buildroot@busybox.net>; Mon, 24 Jun 2024 06:55:15 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.90]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6sn7-1sPR3G26jH-016VPk; Mon, 24
 Jun 2024 08:55:13 +0200
To: buildroot@busybox.net
Date: Mon, 24 Jun 2024 08:55:13 +0200
Message-ID: <20240624065513.16503-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:PNl+/3zUTzLtMGOY65gfKRNeEB1Ir7RUHLlV5qdyaPYJ8vikNyU
 hqN0u/S43dJ+4ajfFOLXx9pc4Lra/cKNiz9aDDcD3lylAugZxpvdQilNj2D8sJV24qv2/l5
 8TKev5HkKXbUjX7Mxhgtca4CXork8HJNQ5LQNkBJ3wonhApISpKy3Xlr2NjWnr9ZKZDOu2W
 Jb7D9peEXNxSTXvLXlJRw==
UI-OutboundReport: notjunk:1;M01:P0:fJtISp0mNgw=;F/9cWb4iDQ4/6P0dggpJqpnN8a5
 63WMpS5RfSfhBuyKDi2eC5xnhdIiqa8jyGjAtRseFAgrNe3TwxmKI7XlHf/HQ94zeipHzxB5D
 K7TD4q7B4awuhw0Hq85Mtu/XLivMaMBqq8u5ZZk3njjdvwyp7hne3w/npNEe1b40K/p7UCxeu
 QQbQFliVRjAyZLC7JMSxZ98qfiBI08G0EY/5J6HgtFoVofJ0VxkJ+YA+dr8/O6Rn41Kofmgbn
 /ae3je+NF7D7mqm7l7Kk8tlAlKjEWxcv0t1miJkVpO8PDP0EOEnThifV2FCE9Sl1fYn0M9Itq
 83l4aGl4H8nbhZd+Nz+B7Noy2G4qs4rv+Y0urioQC7zMobqS5AWqcLsJOeajC73ti5aDFgYyW
 yszq1BnciMYUgypZ/V3qvaVsAT2DYDUtJBgSdvTvSFCeJw8yhReM7f/GglvmhjJ5D0IGHGDO0
 b8VkKrq2mjeJ5LhsbIuUrLACFh28nzgg/cOpfStx5AEHXji074fRN7kPXozTSQVjSlvBkYNhD
 KwQTiAa7rNsch9FduVAh3i/EF2lSPBkIS8K+CUTogl0QLMX6Ey+m/SvSo7EnrQ/2WE05N10Fi
 YEp7WIqo1iBY57+DgkMtrUc15VpgNSw6Kz9yBTpKqvZR5eIkxITz6Occd7TYMZq5msUh0HV5h
 jMoeSLXjra0lrXRfIPdNE5uxLbCvwcn06y0gLZcw+lqibM4AtKHpyey+uHF9Ny7GS3eWAuzoO
 zsI4EVo78A0Fyw8B03ENlKRDX7cPcVXfbfyO3ma2yUSEvVX8jks/2yQRE+NqmkwiZwtK3zmI6
 NulYr4Q6g+FnwVRpEkcmdL9xJEheRnl+PePZDCsAs4tqY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1719212113; x=1719816913; i=ps.report@gmx.net;
 bh=tMVjE0PiNkO/fmv0cpZWaR3XmA6HASLTWRw9p0CgrnA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Tv0ENdpZt9q408UZDYT97ynX9gmW+TAUunlyxSoMWcNPWtlapgqF68Ra0K9s0Dqt
 WrSslONhYU90st28zJXnySQvuUHtkcW2BentvGwmCUUKQulDtxzF1ezy5njSA0SpY
 Jj4rfPPXVMi9b1m/JdzYCSGUSRujmlXIQ1hxNPP1tnAMGIOblwDalnm0PpWrYgRcP
 AHva/vtoahsynRX2jjhDZxNblcC/nsJYVu+SUDhpN1CA7qlmvZUVn1l1wUD1srC8Z
 srjqGg56/Gz9SWbTAGfD0N3OtwlKv5dQxBFOKhjzIM3vDTXXUMgpxcUfxodRX2w2P
 BFWOrafj/bobE+rd0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Tv0ENdpZ
Subject: [Buildroot] [PATCH v1] package/kmod: bump version to 32
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://github.com/kmod-project/kmod/blob/master/NEWS

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/kmod/kmod.hash | 2 +-
 package/kmod/kmod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
index f4b01b20a2..5943562a49 100644
--- a/package/kmod/kmod.hash
+++ b/package/kmod/kmod.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kmod/sha256sums.asc
-sha256  f5a6949043cc72c001b728d8c218609c5a15f3c33d75614b78c79418fcf00d80  kmod-31.tar.xz
+sha256  630ed0d92275a88cb9a7bf68f5700e911fdadaf02e051cf2e4680ff8480bd492  kmod-32.tar.xz
 
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  libkmod/COPYING
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index d83fb85a3e..68472b2e9d 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMOD_VERSION = 31
+KMOD_VERSION = 32
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
