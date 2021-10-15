Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27500C433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 10:59:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6E8561040
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 10:59:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6E8561040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=robotize.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1267C82430;
	Fri, 15 Oct 2021 10:59:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QhufD6gHzIZQ; Fri, 15 Oct 2021 10:59:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D61D81D24;
	Fri, 15 Oct 2021 10:59:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 912F91BF20D
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 10:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C7EF40164
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 10:59:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qwiPtrwogGh6 for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 10:59:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from brm-build.rbt (xb9b5dd62.cust.hiper.dk [185.181.221.98])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6A62400B9
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 10:59:18 +0000 (UTC)
Received: from brm-build.rbt (localhost [127.0.0.1])
 by brm-build.rbt (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 19FAxFcl009474; Fri, 15 Oct 2021 12:59:15 +0200
Received: (from brm@localhost)
 by brm-build.rbt (8.15.2/8.15.2/Submit) id 19FAxFeF009473;
 Fri, 15 Oct 2021 12:59:15 +0200
From: Brian Murphy <brm@robotize.com>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 12:59:14 +0200
Message-Id: <20211015105914.9428-1-brm@robotize.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] boot/grub2: fix dependency on host-gawk
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
Cc: Brian Murphy <brm@robotize.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Brian Murphy <brm@robotize.com>
---
 boot/grub2/grub2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index e01ebb2edb..77bf26b739 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -10,7 +10,7 @@ GRUB2_SOURCE = grub-$(GRUB2_VERSION).tar.xz
 GRUB2_LICENSE = GPL-3.0+
 GRUB2_LICENSE_FILES = COPYING
 GRUB2_DEPENDENCIES = host-bison host-flex host-grub2
-HOST_GRUB2_DEPENDENCIES = host-bison host-flex
+HOST_GRUB2_DEPENDENCIES = host-bison host-flex host-gawk
 GRUB2_INSTALL_IMAGES = YES
 
 # 0001-build-Fix-GRUB-i386-pc-build-with-Ubuntu-gcc.patch and 2021/03/02
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
