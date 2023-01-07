Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B457EC54EBE
	for <buildroot@archiver.kernel.org>; Sat,  7 Jan 2023 08:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 466BB40391;
	Sat,  7 Jan 2023 08:34:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 466BB40391
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nYhQJEdzDGYq; Sat,  7 Jan 2023 08:34:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AC9F40112;
	Sat,  7 Jan 2023 08:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AC9F40112
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 25F4C1BF255
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 08:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F37AF40112
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 08:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F37AF40112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lUoh_KdJg46M for <buildroot@lists.busybox.net>;
 Sat,  7 Jan 2023 08:34:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F29D400D6
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F29D400D6
 for <buildroot@buildroot.org>; Sat,  7 Jan 2023 08:34:49 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::224])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id AAC70C6F33
 for <buildroot@buildroot.org>; Sat,  7 Jan 2023 08:27:31 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9B5E5E0003;
 Sat,  7 Jan 2023 08:27:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1pE4Xz-00AwwF-Cc; Sat, 07 Jan 2023 09:27:23 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat,  7 Jan 2023 09:27:06 +0100
Message-Id: <20230107082710.2609784-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] configs/qemu_riscv32_virt_defconfig: use
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
Cc: Mark Corbin <mark@dibsco.co.uk>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rather than the default (currently 0.9).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/qemu_riscv32_virt_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index faf4e1e312..f354e303e5 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -25,6 +25,8 @@ BR2_LINUX_KERNEL_IMAGE=y
 
 # Bootloader
 BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
 BR2_TARGET_OPENSBI_PLAT="generic"
 
 # host-qemu for gitlab testing
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
