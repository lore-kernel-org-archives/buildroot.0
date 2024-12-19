Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1BDE77188
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 00:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 654FB81A27;
	Thu, 19 Dec 2024 00:38:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lct3-Rwn81vP; Thu, 19 Dec 2024 00:38:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9204881A2B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9204881A2B;
	Thu, 19 Dec 2024 00:38:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F753E9
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 00:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D13D44050D
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 00:37:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oLZ6logqfSy9 for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 00:37:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9BFB34052A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BFB34052A
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9BFB34052A
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 00:37:56 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BJ0buuG110421;
 Wed, 18 Dec 2024 18:37:56 -0600
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJ0buLq011456
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 18 Dec 2024 18:37:56 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 18
 Dec 2024 18:37:55 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 18 Dec 2024 18:37:55 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJ0btB9004060;
 Wed, 18 Dec 2024 18:37:55 -0600
Date: Wed, 18 Dec 2024 18:37:55 -0600
MIME-Version: 1.0
Message-ID: <20241218-uboot-bump-v2-1-0692ca1c4dcd@ti.com>
X-B4-Tracking: v=1; b=H4sIAOJqY2cC/23MQQ6CMBCF4auQWTumrVqDK+9hWLQ4I7OAkrYQD
 endraxd/i953waJolCCW7NBpFWShKmGOTTQD256EcqzNhhlztpohYsPIaNfxhkNuxOxulrbMtT
 DHInlvWOPrvYgKYf42e1V/9a/zKpRo3fkLy0TsdX3LMc+jNCVUr4trlOkoQAAAA==
To: <buildroot@buildroot.org>
CC: Anand Gadiyar <gadiyar@ti.com>, Xuanhao Shi <X15000177@gmail.com>, Bryan
 Brattlof <bb@ti.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1192; i=bb@ti.com;
 h=from:subject:message-id; bh=txXmHcyjMVCgRTcdAloo/osHxa5v4uOUenUV1wKjr5g=;
 b=owNCWmg5MUFZJlNZ4ZK8DgAAZv///v/L///72P/n+3jT/dWXYO27/i5P+dtX7//57/1/9P4wA
 RrQxyaAANNANMgDRoADQA0AAaAAZHqGTRoaDID1A00GQNAGgaGJoaaNNHoj1NkRAaGgaZAaDQND
 INGQDIaBpkGmIANBoyaGgYjTAgMjTQAaZA0NAyNGTJkDEAdqGj1NAyNNAADTIDQBkNA0A0NAxNG
 TEAAZAyYmQNNGIyA0AGmgaZBkwgAChWT1O2T2cecCMBf0YcTNws+LByMGH3HyDEBAZjXXgZOG1d
 fmUj9UsLR+IFTKiJWZ9DpxuoDA/yLWNX2kgHFX42pBFkBbZ12N0xRMEFyabr58rOatfazuUhZqn
 7CN69BEKWUUch/Hxdh8P9axOnFljthUfFsJw+CcipMcpLOMbBrtZEsQzUkahl/T7MkCxNnb4xYD
 85hSuqAtgrwjF+KKPR0Kj74jwN4RgGF1C60YLrd1SSF/F1In3lUsJypyrM/d+phcqYr0uT/HV6s
 eCrUspAcXAXg+H6kUHpgahMwL8bThrsYQHB6gydTCSR5EZQl2j6AQiVOGt5nr0XGnxQz8yFytQM
 TnEtZBsvpga+KcacHDcsRJHTPYAyZhOX0GHGFaNG07xrwM+6Uyba3QUnXx8c8Ej+zFB8AjSQSik
 zQtUI1agDQn9a2k5ef4u5IpwoSHDJXgcA==
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1734568676;
 bh=JbkobwifhY9mcx42J1IyT8O+FOIZUgAV7/h2sV32OT0=;
 h=From:Date:Subject:To:CC;
 b=LOI6UAMA88qmaSt2b2k3nSfrnUfAXqnuvWh6trOd0uVxmce2vhAcE1DPTsPN7F/n/
 pdAspo89U4VmZfT/k8NgpJjvI0lDj6rI7Yd4XlxdvcWYmOP6wWNtgWS279Heo4kiu2
 q0J/4vV/P+FG1FCOnMYHV5/wAWZWmt0Syq5TgQ6c=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=LOI6UAMA
Subject: [Buildroot] [PATCH v2] boot/ti-k3-r5-loader: add host-gnutls to
 dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Newer versions of U-Boot will require the GnuTLS library to be installed
on the host machine to build the mkeficapsule tool for U-Boot's image
packaging phase to generate the final capsule for all the boot images
including the tiboot3.bin image.

Add host-gnutls to the list of dependencies.

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Changes in v2:
- elaborated on commit why host-gnutls is required
- Link to v1: https://lore.kernel.org/r/20241210-uboot-bump-v1-1-baeb59feef61@ti.com
---
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index e426f039e021d..db5c3cdaf8b65 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -46,6 +46,7 @@ TI_K3_R5_LOADER_DEPENDENCIES = \
 	host-pkgconf \
 	$(BR2_MAKE_HOST_DEPENDENCY) \
 	host-arm-gnu-toolchain \
+	host-gnutls \
 	host-openssl \
 	host-python3 \
 	host-python-jsonschema \

---
base-commit: 3645e3b781be5cedbb0e667caa70455444ce4552
change-id: 20241210-uboot-bump-2fa3ef07669f

Best regards,
-- 
Bryan Brattlof <bb@ti.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
