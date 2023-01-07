Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82702C54EBE
	for <buildroot@archiver.kernel.org>; Sat,  7 Jan 2023 08:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE78E8226F;
	Sat,  7 Jan 2023 08:27:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE78E8226F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TRVVJOcrXb0N; Sat,  7 Jan 2023 08:27:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F83A8226D;
	Sat,  7 Jan 2023 08:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F83A8226D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E860F1BF489
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 08:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0D4F8226D
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 08:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0D4F8226D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z121hWv1miIJ for <buildroot@lists.busybox.net>;
 Sat,  7 Jan 2023 08:27:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA0A78226C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA0A78226C
 for <buildroot@buildroot.org>; Sat,  7 Jan 2023 08:27:28 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E25F6FF806;
 Sat,  7 Jan 2023 08:27:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1pE4Y0-00AwwP-7D; Sat, 07 Jan 2023 09:27:24 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat,  7 Jan 2023 09:27:08 +0100
Message-Id: <20230107082710.2609784-3-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230107082710.2609784-1-peter@korsgaard.com>
References: <20230107082710.2609784-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] configs/spike_riscv64_defconfig: use
 OpenSBI 1.2
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/spike_riscv64_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/spike_riscv64_defconfig b/configs/spike_riscv64_defconfig
index 26103682f9..e23f1ce32c 100644
--- a/configs/spike_riscv64_defconfig
+++ b/configs/spike_riscv64_defconfig
@@ -9,7 +9,7 @@ BR2_TARGET_ROOTFS_CPIO=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.1"
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
 BR2_TARGET_OPENSBI_PLAT="generic"
 BR2_TARGET_OPENSBI_LINUX_PAYLOAD=y
 BR2_PACKAGE_HOST_RISCV_ISA_SIM=y
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
