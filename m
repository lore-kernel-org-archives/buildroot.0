Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E246C433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 15:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89BB880D47;
	Mon,  9 May 2022 15:31:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l5qnsqwowDHU; Mon,  9 May 2022 15:31:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91A1C80BDC;
	Mon,  9 May 2022 15:31:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B2C2A1BF369
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 15:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0311408B2
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 15:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=163.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TOtkdmydKF2o for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 15:31:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from m12-18.163.com (m12-18.163.com [220.181.12.18])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE0A940253
 for <buildroot@buildroot.org>; Mon,  9 May 2022 15:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Ba1Wu
 voSQnairdcQyfToFsXnyWd1/kVogNNgDcIQW7k=; b=ikZNLxJNbAfspGrP4cXiy
 7DjnHms12NYaBGH8K0Z7NHUV9510zMV57J7UUmwZP72pdU8alqVTqcjrbeCrOzCU
 phtMTklva3HtT5Cwyk9yKd3wI2jMkdfsJANihmpONs3bBr1ByxDBpOzLc6og5w9A
 5D5eRKIcZSKzRfKGauc3Rg=
Received: from localhost.localdomain (unknown [123.185.180.235])
 by smtp14 (Coremail) with SMTP id EsCowAA3xv7CM3lifgl_Bg--.21951S2;
 Mon, 09 May 2022 23:31:15 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Mon,  9 May 2022 08:30:31 -0700
Message-Id: <20220509153031.1562693-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: EsCowAA3xv7CM3lifgl_Bg--.21951S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF45uw4rXr4rGrW7Zr4fZrb_yoW8Gw1fpr
 93W3y5twn5trWrKFW7CFsFkr9Ygr1DWr1UAw43X3Wxu3yrGa1FvF1UKFWDZF47XrWxJ3yf
 AFZ3J34a9F17Ga7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_YLvrUUUUU=
X-Originating-IP: [123.185.180.235]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiXBD7jVXl2vle6QABsf
Subject: [Buildroot] [PATCH 1/1] package/rtl8188eu: enable required kernel
 options
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>, TIAN Yuanhao <tianyuanhao3@163.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable Linux kernel configuration options required by the driver.

Fixes:
 - http://autobuild.buildroot.org/results/951/9514704d6d44fc1b5dd188eac06b269427d3dee2
 - http://autobuild.buildroot.org/results/9ea/9ea060cc35e859ebc73c65fe2d1f7478f9b4fa8d
 - http://autobuild.buildroot.org/results/658/658c06f8125613b56511d3351cdfd3d8e19d48da

Reported-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
---
 package/rtl8188eu/rtl8188eu.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index fa420b0d57..ebce4617ac 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -10,6 +10,14 @@ RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
 RTL8188EU_MODULE_MAKE_OPTS = CONFIG_RTL8188EU=m
 
+define RTL8188EU_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USB)
+endef
+
 define RTL8188EU_INSTALL_FIRMWARE
 	$(INSTALL) -D -m 644 $(@D)/rtl8188eufw.bin \
 		$(TARGET_DIR)/lib/firmware/rtlwifi/rtl8188eufw.bin
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
