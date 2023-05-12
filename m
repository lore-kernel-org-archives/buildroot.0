Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527E4C77B7C
	for <buildroot@archiver.kernel.org>; Fri, 12 May 2023 11:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A446342B66;
	Fri, 12 May 2023 11:05:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A446342B66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ho6rgf4S6S9b; Fri, 12 May 2023 11:05:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 787334168C;
	Fri, 12 May 2023 11:05:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 787334168C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE42B1BF2C3
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 11:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 843AB4005C
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 11:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 843AB4005C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pn95I_8fcU6u for <buildroot@lists.busybox.net>;
 Fri, 12 May 2023 11:05:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0089940098
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0089940098
 for <buildroot@buildroot.org>; Fri, 12 May 2023 11:05:12 +0000 (UTC)
Received: from iago.. (unknown [151.57.74.53])
 by serv15.avernis.de (Postfix) with ESMTPSA id 8F9C6BDEA480;
 Fri, 12 May 2023 13:05:09 +0200 (CEST)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Date: Fri, 12 May 2023 13:04:38 +0200
Message-Id: <20230512110438.233473-1-br015@umbiko.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1683889509; bh=d5gk97jKsVt67RaTAOH/TqHKz161RsA2yu4ECvwX7v4=;
 h=From:To:Cc:Subject:Date;
 b=XrYPKP3WW4hCw/LdiDBbr3WwnmR5Dq7b154MecIFE5FkY7xn2O/wPx/KO/XOtyn9v
 1vhgvVuRQYpSzH0ch7MCdH1OJg6m2QTIRhC/yCMWC3Ag14iSYwP6y46r0sSq0NeapN
 6VgtQyyXaFLHqXlnTQ5iMmwFxw1OscDRBCMFPOLM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=umbiko.net header.i=@umbiko.net
 header.a=rsa-sha256 header.s=mail header.b=XrYPKP3W
Subject: [Buildroot] [PATCH] linux/linux.mk: fix commit
 d06dca38bb0373a13736a349f7795713458a2188 - remove extra bracket
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
Cc: Andreas Ziegler <br015@umbiko.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit d06dca38bb0373a13736a349f7795713458a2188 (linux: cleanup 
kconfig fixup processing) moved the initramfs setup out of an 
enclosing statement but kept the closing bracket. 

Remove the extra bracket to fix a syntax error in sed processing.

Fixes:
  >>> linux 6.4-rc1 Updating kernel config with fixups
  /bin/bash: -c: line 1: syntax error near unexpected token `)'
  /bin/bash: -c: line 1: `/usr/bin/sed -i -e '/^\(# \)\?CONFIG_INITRAMFS_ROOT_GID\>/d' /home/data/buildroot.experimental/build/linux-6.4-rc1//.config && echo 'CONFIG_INITRAMFS_ROOT_GID=0' >> /home/data/buildroot.experimental/build/linux-6.4-rc1//.config)'

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7c941fa339..cc36b5251d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -376,7 +376,7 @@ define LINUX_KCONFIG_FIXUP_CMDS_ROOTFS_CPIO
 	$(Q)touch $(BINARIES_DIR)/rootfs.cpio
 	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,"$${BR_BINARIES_DIR}/rootfs.cpio")
 	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0)
-	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0))
+	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0)
 endef
 endif
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
