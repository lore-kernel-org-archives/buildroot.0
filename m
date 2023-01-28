Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBB8C38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 21:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49D4660E41;
	Sat, 28 Jan 2023 21:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49D4660E41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6AiTLvo3iBZV; Sat, 28 Jan 2023 21:23:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F2DF60D55;
	Sat, 28 Jan 2023 21:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F2DF60D55
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 07F491BF3C0
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D63A560D55
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D63A560D55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F1QkoUB7x32H for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 21:23:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BF6C60C15
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 21:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BF6C60C15
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B97287E5E; Sat, 28 Jan 2023 21:23:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 22:23:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e84d84886daab3208dc209f362aabb4436ba00a6
X-Git-Newrev: 0a8b4185c286fc842ba74d660ab7bfae0a1d648c
X-Patchwork-Hint: ignore
Message-Id: <20230128212352.0B97287E5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: add
 rtl8761b/rtl8761bu firmware
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a8b4185c286fc842ba74d660ab7bfae0a1d648c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Deploy rtl8761b/rtl8761bu firmwares as well.

Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/linux-firmware.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 6990ef38ad..9d9d12bd5f 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -71,7 +71,9 @@ LINUX_FIRMWARE_FILES += \
 	rtl_bt/rtl8723a_fw.bin rtl_bt/rtl8723b_fw.bin \
 	rtl_bt/rtl8723bs_config-OBDA8723.bin \
 	rtl_bt/rtl8723bs_fw.bin rtl_bt/rtl8723d_config.bin \
-	rtl_bt/rtl8723d_fw.bin rtl_bt/rtl8761a_fw.bin
+	rtl_bt/rtl8723d_fw.bin rtl_bt/rtl8761a_fw.bin \
+	rtl_bt/rtl8761b_fw.bin rtl_bt/rtl8761b_config.bin \
+	rtl_bt/rtl8761bu_fw.bin rtl_bt/rtl8761bu_config.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
