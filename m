Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7240ECAAD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Sep 2022 04:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C4384105B;
	Thu,  1 Sep 2022 04:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C4384105B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id APaRzQHuoDco; Thu,  1 Sep 2022 04:46:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 615CC4105D;
	Thu,  1 Sep 2022 04:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 615CC4105D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C6431BF5A4
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 04:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56646825E6
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 04:46:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56646825E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IrFLvqyPJi92 for <buildroot@lists.busybox.net>;
 Thu,  1 Sep 2022 04:46:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F705826B4
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F705826B4
 for <buildroot@busybox.net>; Thu,  1 Sep 2022 04:46:06 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 4D1BF440516;
 Thu,  1 Sep 2022 07:44:50 +0300 (IDT)
To: buildroot@busybox.net
Date: Thu,  1 Sep 2022 07:45:54 +0300
Message-Id: <a8ea0d5fc6b7f447cbfab2426e1fe3687ee7e0d1.1662007555.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1662007490;
 bh=GaYxIYgFShjdBNQDThNkqSaZqMqZOCXNQy2nF1vTCl8=;
 h=From:To:Cc:Subject:Date:From;
 b=DhEEcVcyE3MZPeph8FnnOA6oNqZqDrAf4v4hvzhndgnlU6GKuez9ahjfnCGxmqnu8
 /yJ0dcGVYo5yotwFd7kPKtQuxPK9lf5Ah1ozNLySmDDiTqISV6mS9rmWm6/ljGztJT
 DHl+yXS6+sx7jt8TSCoXHaEDK3owzW5R/OB38nrlDjw7dh2lnwcpFe+ds80r6dQPXb
 eyhQfqddtIVZaRxze+K+MYaREzDEuE3XTjBui5ZoyNwAw6YIjKHwiuhIFVzOyszeR/
 Cu+BsX5wLLSm1QdHmET2dAohgDIoPiaS0poH55v7zqBoB2lDjjsSfq/EBvL/comtsi
 JBwB5aDq/dncw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=DhEEcVcy
Subject: [Buildroot] [PATCH 1/2] boot/mv-ddr-marvell: bump to latest commit
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This update fixes build with gcc 11.

Update license file hash for unrelated code changes.

Tested on Macchiatobin.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2931841699
https://gitlab.com/buildroot.org/buildroot/-/jobs/2931841700

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 boot/mv-ddr-marvell/mv-ddr-marvell.hash | 4 ++--
 boot/mv-ddr-marvell/mv-ddr-marvell.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/mv-ddr-marvell/mv-ddr-marvell.hash b/boot/mv-ddr-marvell/mv-ddr-marvell.hash
index 5bfae8af4576..75e87d833df3 100644
--- a/boot/mv-ddr-marvell/mv-ddr-marvell.hash
+++ b/boot/mv-ddr-marvell/mv-ddr-marvell.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bfab74a625d65238c569b9df282b55c0fc9a1e2d3decedcf194d44774df2ede4  mv-ddr-marvell-305d923e6bc4236cd3b902f6679b0aef9e5fa52d.tar.gz
-sha256  48bb930b6fbc3f5db72e29c849b096df3868e4a6d2bdc0e2dd3365c768241cd5  ddr3_init.c
+sha256  16f02232e21a15979b3d9971e28f7e59562484a5c1f99c2b28c248a3b76a63fa  mv-ddr-marvell-d5acc10c287e40cc2feeb28710b92e45c93c702c.tar.gz
+sha256  907a03943ca940790e97620aca8d46b5b04c653dcf2ab6c66a25238b60cf5635  ddr3_init.c
diff --git a/boot/mv-ddr-marvell/mv-ddr-marvell.mk b/boot/mv-ddr-marvell/mv-ddr-marvell.mk
index 442b6aed5351..e05192fe9b8f 100644
--- a/boot/mv-ddr-marvell/mv-ddr-marvell.mk
+++ b/boot/mv-ddr-marvell/mv-ddr-marvell.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-# This is the latest commit on mv-ddr-devel as of 20201207
-MV_DDR_MARVELL_VERSION = 305d923e6bc4236cd3b902f6679b0aef9e5fa52d
+# This is the latest commit on mv-ddr-devel as of 20220529
+MV_DDR_MARVELL_VERSION = d5acc10c287e40cc2feeb28710b92e45c93c702c
 MV_DDR_MARVELL_SITE = $(call github,MarvellEmbeddedProcessors,mv-ddr-marvell,$(MV_DDR_MARVELL_VERSION))
 MV_DDR_MARVELL_LICENSE = GPL-2.0+ or LGPL-2.1 with freertos-exception-2.0, BSD-3-Clause, Marvell Commercial
 MV_DDR_MARVELL_LICENSE_FILES = ddr3_init.c
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
