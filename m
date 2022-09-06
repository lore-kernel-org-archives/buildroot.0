Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C230ECAAA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 16:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 993A581D7D;
	Tue,  6 Sep 2022 16:20:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 993A581D7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K6_oL8iugmOX; Tue,  6 Sep 2022 16:20:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C80ED8143C;
	Tue,  6 Sep 2022 16:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C80ED8143C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 38C0D1BF2C5
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 16:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1310A60A9F
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 16:20:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1310A60A9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7MtaG42HURNR for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 16:20:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 569516072A
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 569516072A
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 16:20:10 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id BF1B8CE238
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 16:16:10 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5B3AB24000B;
 Tue,  6 Sep 2022 16:16:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1oVbF3-00B6IY-1J; Tue, 06 Sep 2022 18:16:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue,  6 Sep 2022 18:15:57 +0200
Message-Id: <20220906161557.2645766-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220906161557.2645766-1-peter@korsgaard.com>
References: <20220906161557.2645766-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-next 2/2] nezha_defconfig: configure eth0 using
 DHCP
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With the move to 5.19-rc1, the ethernet interface is now supported.
Configure it using DHCP at startup.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/nezha_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/nezha_defconfig b/configs/nezha_defconfig
index 7a7e86ceab..2e2df3c09d 100644
--- a/configs/nezha_defconfig
+++ b/configs/nezha_defconfig
@@ -1,6 +1,7 @@
 BR2_riscv=y
 BR2_GLOBAL_PATCH_DIR="board/nezha/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
+BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/nezha/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/nezha/genimage.cfg"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
