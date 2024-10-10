Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B6FD2444F
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 23:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3CEB81A27;
	Thu, 10 Oct 2024 23:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H9CGW9cXJVVd; Thu, 10 Oct 2024 23:39:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC3B981B52
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC3B981B52;
	Thu, 10 Oct 2024 23:39:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE9231BF5B5
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 23:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAB4741E0B
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 23:39:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nlnlFqWVuxP4 for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 23:39:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C9F2741E03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9F2741E03
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9F2741E03
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 23:39:30 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49ANdT8A117738;
 Thu, 10 Oct 2024 18:39:29 -0500
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49ANdTvA121395;
 Thu, 10 Oct 2024 18:39:29 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Oct 2024 18:39:29 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Oct 2024 18:39:29 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49ANdT2w048080;
 Thu, 10 Oct 2024 18:39:29 -0500
Date: Thu, 10 Oct 2024 18:39:24 -0500
MIME-Version: 1.0
Message-ID: <20241010-uboot-bump-v1-3-287ffa07e49e@ti.com>
References: <20241010-uboot-bump-v1-0-287ffa07e49e@ti.com>
In-Reply-To: <20241010-uboot-bump-v1-0-287ffa07e49e@ti.com>
To: <buildroot@buildroot.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1756; i=bb@ti.com;
 h=from:subject:message-id; bh=vn2dOP23TMBUdLqIReNYKFCMOyjtGGjsNjz0kwkVlVI=;
 b=owNCWmg5MUFZJlNZhjY31gAAZn////fftyNuXbX/6/nuv+j7zmZn1eX9//91eb+v8tZBzsewA
 RtWUgNNGgZNAMho00aPRAGhp6jRoBoAAyAABoANNDEMmg0P1QZGJgQ0PRBo0z1Q7UANAAAPUaDT
 I00BoDI0AGgyZAD0TQ0aMhoGhiND1AANDQMmjR6QGnqep+ihyGmIzSaADQMTQPSAHqNDQBiaBkD
 JpkGTTQZMI0BoBpoMIxBkaDJoMg0aPUFCt4cOO44Y1OLIgLaGRB9c4sNQzR3WQCAqwjZyxKTEPR
 Pjtx6xkHDPkwwJcT2ql7qmRHDIqN/oo4+hDp4puXVshOdbeXRVyG7NNhj2/kxiHUwVVZ47p1uKa
 TxRTzWhMIHzlvEX3hg7U/doKlgpTlOyqwm0b6bNQTgUWBVkgf0DX5SyzSf0zHnC8OUnP4/haWML
 DNK022q7Rq9xrAKdYa2DXstnYWALHCRXaWcE6WBhEP3roltRq2n7cCUqVI51yuUyyMbgZYQAhJN
 6P3FI6I6Fb1/lZvWCZ9gSzYSOfyG9ibbP088mhgQnedoj9nCUTtVvBmwOl8AzpGuNPyfwB+tgnR
 hmqb5vHBIrHxRkI/4eF57KUAHCziByDZQwSNm5ZpwD2RH7pHwiXAdJCcQFIlaBQwOlK7jIvgtWS
 AKKEOcaXf4u5IpwoSEMbG+s
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1728603569;
 bh=etZ9irqZRx7vjp5uVVNBd4w/0NeRy4gNSgRXTCCs0lU=;
 h=From:Date:Subject:References:In-Reply-To:To:CC;
 b=fVl3reiQnVBqEf3Z09y/JglhZyjNboQ6t5hm5gg5+m31HO2LaoQGj3SiTWpWPC2FO
 ec5Ll+NFxi9VG9FHA378RxqurA43qBrfOt/HrVjwo5LwF6Akd8p3zkKXApfWq22ONM
 3AuH/uIKbU86NKfTTRycB+xQnLPdVIVOgUzXqUYU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=fVl3reiQ
Subject: [Buildroot] [PATCH 3/3] boot/ti-k3-r5-loader: bump to v2024.10
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

A new version of U-Boot has been released. Update to this latest version
to pull in the latest features and bug fixes

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 boot/ti-k3-r5-loader/Config.in            | 4 ++--
 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index 4d1661dfeda77..ac6fcad91abcd 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -17,7 +17,7 @@ choice
 	  here as it is used to build the main U-Boot package.
 
 config BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION
-	bool "2024.04"
+	bool "2024.10"
 
 config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION
 	bool "Custom version"
@@ -61,7 +61,7 @@ endif
 
 config BR2_TARGET_TI_K3_R5_LOADER_VERSION
 	string
-	default "2024.04"	if BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION
+	default "2024.10"	if BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION
 	default BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
index a8021fb696b1a..af025a583e44c 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
