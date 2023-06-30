Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5BBEB64DA
	for <buildroot@archiver.kernel.org>; Fri, 30 Jun 2023 21:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE01141821;
	Fri, 30 Jun 2023 21:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE01141821
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hSH1FniABoXV; Fri, 30 Jun 2023 21:27:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0E6A41F48;
	Fri, 30 Jun 2023 21:27:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0E6A41F48
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E23F81BF844
 for <buildroot@lists.busybox.net>; Fri, 30 Jun 2023 21:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6437400C8
 for <buildroot@lists.busybox.net>; Fri, 30 Jun 2023 21:27:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6437400C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GVreSu50uY-4 for <buildroot@lists.busybox.net>;
 Fri, 30 Jun 2023 21:27:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7E6D4049D
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7E6D4049D
 for <buildroot@buildroot.org>; Fri, 30 Jun 2023 21:27:04 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id A1F80A2D70
 for <buildroot@buildroot.org>; Fri, 30 Jun 2023 23:27:02 +0200 (CEST)
Received: from smtp04.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix01.mail.de (Postfix) with ESMTP id 892FD8010F;
 Fri, 30 Jun 2023 23:27:02 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp04.mail.de (Postfix) with ESMTPSA id 42CA9C002F;
 Fri, 30 Jun 2023 23:27:02 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 30 Jun 2023 23:26:52 +0200
Message-Id: <20230630212654.699657-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2578
X-purgate-ID: 154282::1688160422-FFFFBC09-D97848C4/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1688160422;
 bh=U7dJoFf68aFLjSz2/dOUorHBU6Jkbzxn4hsic0O8D0w=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=m/MVL7ByLFXyqUs0xyfV40SkirS9XtmVP+fMsL60Aaq4lUwZn4tf/I7/08YQxk9Qv
 tIcQ9fr4RtjultA4cIa79e2uo0jMwM/KuVDo0ICeD10SdcQhulYoQG5Gk+1eQETtuT
 PrVKrtgNQ1h9bbq8LghMiwon4nw2aSiQPjImoKfkAIfJiStZKkZ0gMj9K6oZY1zCIv
 HOnMECNbpX9f2GuQpcBLKcvZwm/FCAsNqJJs0v5crpbzMt8lLclrx35Qnpxf+Domji
 OpV8GZeL9TlIXjfS8URknAz1lFeD12XcBkYRNTKEktnkksFQUfoICEXmYI/7UxyI46
 VC763qLrdgwtg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=m/MVL7By
Subject: [Buildroot] [PATCH 1/3] package: add rockchip-rkbin package
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adds a package to fetch Rockchip specifig ATF binary blobs, which
are needed to build u-boot for the Rockchip RK3588 SoC.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
---
 package/Config.in                        |  1 +
 package/rockchip-rkbin/Config.in         | 19 +++++++++++++++++++
 package/rockchip-rkbin/rockchip-rkbin.mk | 19 +++++++++++++++++++
 3 files changed, 39 insertions(+)
 create mode 100644 package/rockchip-rkbin/Config.in
 create mode 100644 package/rockchip-rkbin/rockchip-rkbin.mk

diff --git a/package/Config.in b/package/Config.in
index bff090a661..80221d0406 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -581,6 +581,7 @@ endmenu
 	source "package/read-edid/Config.in"
 	source "package/rng-tools/Config.in"
 	source "package/rockchip-mali/Config.in"
+	source "package/rockchip-rkbin/Config.in"
 	source "package/rpi-userland/Config.in"
 	source "package/rs485conf/Config.in"
 	source "package/rtc-tools/Config.in"
diff --git a/package/rockchip-rkbin/Config.in b/package/rockchip-rkbin/Config.in
new file mode 100644
index 0000000000..a877d4f1cf
--- /dev/null
+++ b/package/rockchip-rkbin/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_ROCKCHIP_RKBIN
+	bool "Rockchip RKBIN binary blobs"
+	depends on BR2_arm || BR2_aarch64
+	help
+	  Those packages provide binary blobs for the Rockchip RK
+          SoCs.
+
+if BR2_PACKAGE_ROCKCHIP_RKBIN
+choice
+	prompt "Rockchip RK platform"
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_PLATFORM_RK3588
+	bool "rk3588"
+endchoice
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_PLATFORM
+	string
+	default "RK3588" if BR2_PACKAGE_ROCKCHIP_RKBIN_PLATFORM_RK3588
+endif
diff --git a/package/rockchip-rkbin/rockchip-rkbin.mk b/package/rockchip-rkbin/rockchip-rkbin.mk
new file mode 100644
index 0000000000..51421769b4
--- /dev/null
+++ b/package/rockchip-rkbin/rockchip-rkbin.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# rockchip-rkbin
+#
+################################################################################
+
+
+ROCKCHIP_RKBIN_VERSION = d6ccfe401ca84a98ca3b85c12b9554a1a43a166c
+ROCKCHIP_RKBIN_SITE = https://github.com/rockchip-linux/rkbin.git
+ROCKCHIP_RKBIN_SITE_METHOD = git
+
+ROCKCHIP_RKBIN_INSTALL_STAGING = YES
+
+define ROCKCHIP_RKBIN_INSTALL_STAGING_CMDS
+	cp $(@D)/bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.11.bin $(BINARIES_DIR)/
+	cp $(@D)/bin/rk35/rk3588_bl31_v1.38.elf $(BINARIES_DIR)/
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
