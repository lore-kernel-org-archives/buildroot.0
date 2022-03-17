Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03531C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 22:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B573842CA;
	Thu, 17 Mar 2022 22:01:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wKbz9HHhCq2l; Thu, 17 Mar 2022 22:01:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF52E842A6;
	Thu, 17 Mar 2022 22:01:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 333E51BF315
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 22:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FDED842A6
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 22:01:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eWJg3bB4eucd for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 22:01:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtpfb1-g21.free.fr (smtpfb1-g21.free.fr [212.27.42.9])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E8C084276
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 22:01:38 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtpfb1-g21.free.fr (Postfix) with ESMTP id 8C386DF9F0A
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 23:01:36 +0100 (CET)
Received: from b52572-12.ea.freescale.net.net (unknown [37.164.154.81])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 0D1915FF9D;
 Thu, 17 Mar 2022 23:01:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647554491;
 bh=EuRbfXMbu57JplQ3NEK3gp3EVlK1dcsg7sj0SPv0Evk=;
 h=From:To:Cc:Subject:Date:From;
 b=Buc3EAWh51B0rbLXUwQp8uYXI7n9uJ+9slBVMtKpI5eRNHR/6lxfUEox8p6IrP6Ew
 y406E7tgssHSpVgN1NZr5OBSNAEf4gMtwKasD/EzhF4bZ7Ls5Ccrs6lFJbn4c2EKCc
 OzEWkVXGlEAHPuKCEXE23HkOoe1JDczkgdRoD5bn8whMMd6tfvoVq3Y/jkrmSjBqkD
 f5jJdfemIkT5OMTRJhv58f35E/njRXJcSFNnzvrCtkS599RXe3UPJWS6DjtPd1zC4j
 pDhej+SeUOkBEn+pMd1tfrT2GGtWkGRy4bz5GCahaTI0feaAENy27ZsqESCTejYwSk
 kciqon6QfDWEw==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 17 Mar 2022 23:01:21 +0100
Message-Id: <20220317220121.21498-1-ju.o@free.fr>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/openblas: add OPENBLAS_CPE_ID_VENDOR
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

cpe:2.3:a:openblas_project:openblas is a valid CPE identifier for this
package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopenblas_project%3Aopenblas

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openblas/openblas.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index 608c2f24ea..085d32acc3 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -9,6 +9,7 @@ OPENBLAS_SITE = https://github.com/xianyi/OpenBLAS/releases/download/v$(OPENBLAS
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
 OPENBLAS_INSTALL_STAGING = YES
+OPENBLAS_CPE_ID_VENDOR = openblas_project
 
 # Initialise OpenBLAS make options to $(TARGET_CONFIGURE_OPTS)
 OPENBLAS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
