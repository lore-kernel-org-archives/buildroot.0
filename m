Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32520C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D38BE40579;
	Thu, 29 Dec 2022 09:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D38BE40579
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 80QpLW2NYi97; Thu, 29 Dec 2022 09:08:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D3D940498;
	Thu, 29 Dec 2022 09:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D3D940498
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D09551BF962
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB19C402B8
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:08:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB19C402B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uiIJEPpaNJx8 for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:08:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C791A40201
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C791A40201
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B38B887000; Thu, 29 Dec 2022 09:08:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:06:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08ca8ff727c87fce2c6edcb9fc2df0885c22543b
X-Git-Newrev: 909e10a422df33cd67e6f0fc6ad628ee2c1fb933
X-Patchwork-Hint: ignore
Message-Id: <20221229090833.B38B887000@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: add RTL8125B NIC
 firmware
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

commit: https://git.buildroot.net/buildroot/commit/?id=909e10a422df33cd67e6f0fc6ad628ee2c1fb933
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed due to kernel commit:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=0439297be95111cf9ef5ece2091af16d140ce2ef

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/linux-firmware.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 200b4ca564..526e8c1c44 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -584,6 +584,7 @@ LINUX_FIRMWARE_FILES += \
 	rtl_nic/rtl8107e-1.fw \
 	rtl_nic/rtl8107e-2.fw \
 	rtl_nic/rtl8125a-3.fw \
+	rtl_nic/rtl8125b-2.fw \
 	rtl_nic/rtl8168d-1.fw \
 	rtl_nic/rtl8168d-2.fw \
 	rtl_nic/rtl8168e-1.fw \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
