Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC414D24460
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 23:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 999D080CF2;
	Thu, 10 Oct 2024 23:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jgMrr8TeT_6V; Thu, 10 Oct 2024 23:39:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0809A80C32
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0809A80C32;
	Thu, 10 Oct 2024 23:39:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C211F1BF98E
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 23:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B230280553
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 23:39:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fCjD3GbZXvtC for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 23:39:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9592280551
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9592280551
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9592280551
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 23:39:30 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49ANdTCX060097;
 Thu, 10 Oct 2024 18:39:29 -0500
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49ANdTdW000323
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Oct 2024 18:39:29 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Oct 2024 18:39:29 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Oct 2024 18:39:29 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49ANdTuQ048077;
 Thu, 10 Oct 2024 18:39:29 -0500
Date: Thu, 10 Oct 2024 18:39:22 -0500
MIME-Version: 1.0
Message-ID: <20241010-uboot-bump-v1-1-287ffa07e49e@ti.com>
References: <20241010-uboot-bump-v1-0-287ffa07e49e@ti.com>
In-Reply-To: <20241010-uboot-bump-v1-0-287ffa07e49e@ti.com>
To: <buildroot@buildroot.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=642; i=bb@ti.com;
 h=from:subject:message-id; bh=bidF26+FxEpYnjDRQAemVeYdhbIYhLCB0jeCwBnzcT0=;
 b=owNCWmg5MUFZJlNZItducgAAa3////dPq/97Pf3i/w7r//v37Pvn/V12fPLP7P/6x/fx93cwA
 RmYHagADQAMmmgNAbUAA0AA0AA0AGmgBo0NAA0AAAGQA9JoYjTyTyTymyiDTQxGRoaaMmjQaDQ9
 INBkNAAADI0GQG1MQNAMj0Q0AGjRppkB6hiADQGRoAZJp6QHqMJ6QD1ADQAB6mRkAA0MgNNGR6g
 AAAGmmgMIADTQYjIAGQZNBoAMqQShG26+xgSQXWUjfY6MvQwzk46CdaZFMh14AgdcIQATfXUBDt
 mZMJ/NdEsByDtFSR6URD3hsE0FuekuthbjH/hgWXZYjccCkpGRfI8XSL1CRgLOXj0a46UZIVgPP
 1x+gcoUeFdfoV5Mn9ZWmNzCnI9fuJCaFlk4iygQlWnpWC6DarmnpIPTlXH1qatDTgNy2LJ7DqVx
 M9WAQEIyoDznVTPoXhvAbM818z3HwLWPlg4wL+k5UWkKXq3H6B8VWKhX5QgzARjSC+4SRPP9FPv
 dQRqFg1CK0Mnwn8U3uAEqiyk74Amn3aUwSDQL/abbSryyMdWhwdNA7sagPMngzEAGsWLjo7myyd
 M132qrfExInkk5gAVoBDBaZtTi7O/Bk90fS8LkbAbSr39v4wYec5JEjLIKR/OyoMZ/XrEfxz1AJ
 JqnsopF/i7kinChIEWu3OQ=
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1728603569;
 bh=ixFgBwxEL7XSVbRgZUeNNwlMlGCuvEbuPqT12G2FOus=;
 h=From:Date:Subject:References:In-Reply-To:To:CC;
 b=g5/UOREpSGFzCIiQe58l39eNjPVhuTt9uY4+iKTlDt1HKUUqRLWHh7PTLlOCySX2J
 +kThzppFWHpZbqDeF3SAitvdU6NNPltLT6BBfepUk+crQosvvdCEgiVPiL48AzVNT3
 rqgaTxt0RoCnq/W2Z2yHTPHgDTZhfXyXqXhVHJ5Y=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=g5/UOREp
Subject: [Buildroot] [PATCH 1/3] boot/uboot: update link to the U-Boot docs
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>, Bryan Brattlof <bb@ti.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The denx.de/wiki/U-Boot link now redirects to docs.u-boot.org/en/latest
Replace the link to the new location for the U-Boot documentation

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 boot/uboot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index bfe61cd167d6b..8648d6eb7e908 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -3,7 +3,7 @@ config BR2_TARGET_UBOOT
 	help
 	  Build "Das U-Boot" Boot Monitor
 
-	  https://www.denx.de/wiki/U-Boot
+	  https://docs.u-boot.org/en/latest/
 
 if BR2_TARGET_UBOOT
 choice

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
