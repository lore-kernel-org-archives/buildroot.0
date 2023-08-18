Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A590C05052
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 10:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E280F83F65;
	Fri, 18 Aug 2023 10:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E280F83F65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cEefsoL-QrbB; Fri, 18 Aug 2023 10:25:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35A8383F4C;
	Fri, 18 Aug 2023 10:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35A8383F4C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F1C51BF364
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 10:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38CF083F4C
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 10:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38CF083F4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xrae7AO9U5gy for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 10:25:06 +0000 (UTC)
X-Greylist: delayed 418 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 18 Aug 2023 10:25:06 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0551C83CE0
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0551C83CE0
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 10:25:05 +0000 (UTC)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id 4178B12000F;
 Fri, 18 Aug 2023 13:18:03 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 4178B12000F
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS;
 Fri, 18 Aug 2023 13:18:02 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 18 Aug 2023 13:17:57 +0300
To: <patrickdepinguin@gmail.com>, <yann.morin.1998@free.fr>,
 <thomas.petazzoni@bootlin.com>
Date: Fri, 18 Aug 2023 13:17:54 +0300
Message-ID: <20230818101754.73199-1-avromanov@sberdevices.ru>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 179319 [Aug 18 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 526 526
 7a6a9b19f6b9b3921b5701490f189af0e0cd5310, {Tracking_smtp_not_equal_from},
 {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;
 p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; 127.0.0.199:7.1.2;
 sberdevices.ru:5.0.1,7.1.1;
 100.64.160.123:7.1.2, FromAlignment: n, {Tracking_smtp_domain_mismatch},
 {Tracking_smtp_domain_2level_mismatch}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2023/08/18 08:42:00 #21645046
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sberdevices.ru; s=mail; t=1692353883;
 bh=oC1em5cHAo28dwU+vrg9RFRUXkaAZqVhlU15hEb0BLo=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=DgM1rC01OU6gjyxVcXAFOLs87bN19tJFxc9JbpBWbLNrFwK5uFL6GxEZhs6uLfFFb
 dU+dv6GO9nGYAYRJ2uFFag/IwHvtumyzIgDa+bCg5PUCTVxh9UlvdXaJZssRWEJ4d4
 hiXFIa8VeG3JoKpWKbLf/feqb7W86oHwmApH1ibG1jpERUHnSTCGm3ttl9ZmSQN9AS
 wuly6qTDeOQu+KtJFgVKoB0e36oUqMyay8sqAnUNpcy8uJz5x8Eb7kb1fayGtkiWQK
 uYGWcCJon3eSq8eVa7S8X7T7lXW1HLsSBvvykpTr+FhhIMxAX8NR92uviatEmugWuG
 k7zQa7zq1FdTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=DgM1rC01
Subject: [Buildroot] [PATCH v1] pkg-config.mk: introduce savefragment
 subcommand
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
From: Alexey Romanov via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Romanov <avromanov@sberdevices.ru>
Cc: kernel@sberdevices.ru, ddrokosov@sberdevcies.ru,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 Alexey Romanov <avromanov@sberdevices.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Useful subcommand designed for run savedefconfig with fragment files.
Simple example of usage:

m linux-savefragment fragment=radio1_a_debug.fragment

The saved fragment for such fragment will be in:

out/$(target)/build/linux-custom/arch/$(arch)/configs/$(target).fragment

Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 package/pkg-kconfig.mk | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 32dcfea0bc..7e5c7d88a1 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -37,6 +37,40 @@ define kconfig-package-savedefconfig
 		$(PKG_KCONFIG_COMMON_OPTS) $($(1)_KCONFIG_OPTS) savedefconfig
 endef
 
+FRAGMENT_CONFIG_PATH=arch/$(KERNEL_ARCH)/configs
+
+# Macro to save the fragment file
+# $(1): the name of the package in upper-case letters
+# $(2): the fragment name
+define kconfig-package-savefragment
+	$(eval ORIG_CONFIG=$(shell mktemp))
+	$(eval CHANGED_CONFIG=$(shell mktemp))
+	$(eval DIFF_CONFIG=$(shell mktemp))
+	$(eval NEW_FRAGMENT=$(shell mktemp))
+
+	$(Q) cp $($(1)_DIR)/.config $(CHANGED_CONFIG)
+
+	$($(1)_MAKE_ENV) $($(1)_MAKE) -C $($(1)_DIR) \
+		$(PKG_KCONFIG_COMMON_OPTS) $($(1)_KCONFIG_OPTS) \
+		$($(1)_KCONFIG_DEFCONFIG)
+
+	$(Q) cp $($(1)_DIR)/.config $(ORIG_CONFIG)
+
+	$(Q) $($(1)_DIR)/scripts/diffconfig -m $(ORIG_CONFIG) \
+		$(CHANGED_CONFIG) > $(DIFF_CONFIG)
+	$(Q) KCONFIG_CONFIG=$(NEW_FRAGMENT) \
+		$($(1)_DIR)/scripts/kconfig/merge_config.sh \
+		-m $($(1)_DIR)/$(FRAGMENT_CONFIG_PATH)/$(2) $(DIFF_CONFIG)
+	$(Q) sed -E -e 's/.*(CONFIG_[^ =]+).*/\1 \0/' $(NEW_FRAGMENT) \
+		| sort -k1 |  cut -d " " -f 2- > \
+		$($(1)_DIR)/$(FRAGMENT_CONFIG_PATH)/$(2)
+
+	$(Q) cp $(CHANGED_CONFIG) $($(1)_DIR)/.config
+
+	$(Q) rm -f $(ORIG_CONFIG) $(CHANGED_CONFIG) \
+		$(DIFF_CONFIG) $(NEW_FRAGMENT)
+endef
+
 # The correct way to regenerate a .config file is to use 'make olddefconfig'.
 # For historical reasons, the target name is 'oldnoconfig' between Linux kernel
 # versions 2.6.36 and 3.6, and remains as an alias in later versions.
@@ -282,6 +316,12 @@ $(1)-savedefconfig: $(1)-check-configuration-done
 	$$(call kconfig-package-savedefconfig,$(2))
 endif
 
+ifeq ($$($(2)_KCONFIG_SUPPORTS_DEFCONFIG),YES)
+.PHONY: $(1)-savefragment
+$(1)-savefragment: $(1)-check-configuration-done
+	$$(call kconfig-package-savefragment,$(2),$(fragment))
+endif
+
 ifeq ($$($(2)_KCONFIG_DEFCONFIG),)
 # Target to copy back the configuration to the source configuration file
 # Even though we could use 'cp --preserve-timestamps' here, the separate
-- 
2.30.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
