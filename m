Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F2AC4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 20:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF7C141722;
	Tue, 13 Dec 2022 20:39:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF7C141722
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ii1Q27VbxJff; Tue, 13 Dec 2022 20:39:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACD9541724;
	Tue, 13 Dec 2022 20:39:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACD9541724
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F3AD1BF301
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 20:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAE8141722
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 20:39:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAE8141722
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 009wcZwzOveX for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 20:39:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7EC9410E0
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7EC9410E0
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 20:39:46 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 5Bx7paJLQOQIK5Bx7p2gFA; Tue, 13 Dec 2022 21:32:37 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 13 Dec 2022 21:32:36 +0100
Message-Id: <20221213203236.171656-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJzdiRIXI5hBg7P3HbcZtcn2cH0+malxfjLSAjY0qKFuJ4QnrlSo5TNSk50jN7SPSZ/B5ldZ8W1ZIPeF2fGmxIJ/HmqhXPhpnpy97hEX8xwMQh0MpMwF
 z73bnHVzUHCry6yreBS6mt4MW7yT7dTB6dvoGLy6p4E8xCxiz/KDyovwKLqUszonN92eULSHUGZvjCCdSg2dMlatz92EDWlmzFvBCBhgS4xR/dXyw4EDrylS
 qrK5RcFFnLzDglrzeKqBxTztMIwM8K99wtm+tIHxUT38vtred/7VFcWP0NRPCcjjWMHT68ca9eMOKRsW0dxIC2hEAiHpOnKBZwb0iSuSiLo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1670963557; bh=GpMqbeC5XbM/eWebd3H1szsuE07NexC3tdHgOUIk5IY=;
 h=From:To:Subject:Date:MIME-Version;
 b=VBmWh+6+e2eYJiExEBWfrX5i3DbdhHwF8GD6JljLAIq57gJOCIFjdS4PwCRgcL1o5
 iqlFuW5IzrlZSDMSB56dl0tAiZAvElLc7pjsiT8Ic+jmSxOrShAOWFBequRXPqngoc
 PdxmIrSaIoHFv2mERU+94ABHk75tn2/oVWYfD4lrUyinhGMnGz0l88ZHhEekUfgd3/
 mSTVcOUdO3WL537gyxMHIWvZr3fUF3Ke66vwACJ1Gkmd8RpGdMf8kNS+0sUdwd7mW2
 iAEjzj9LzfnuLNujT0V2pIMzQimCaF01uGh+qFvhokk4ilRkZh7nB3QiiswqyTgdEr
 XEZBnApVdnMVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=VBmWh+6+
Subject: [Buildroot] [PATCH v2] package/rtl8192eu: fix build failure on Big
 Endian architectures
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Let's disable the CONFIG_PLATFORM_I386_PC that is set to y by default
involving the endianness to be set to little. This way we can set the
CFLAGS according to architecture with some default define like:
-DCONFIG_IOCTL_CFG80211
-DRTW_USE_CFG80211_STA_EVENT
-Wno-error

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8192eu/rtl8192eu.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
index e1688eef1b..d967db90b8 100644
--- a/package/rtl8192eu/rtl8192eu.mk
+++ b/package/rtl8192eu/rtl8192eu.mk
@@ -7,9 +7,16 @@
 RTL8192EU_VERSION = 94bce7798bbb18de6d8b1646dedb2511f24867d3
 RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
 RTL8192EU_LICENSE = GPL-2.0
+
+RTL8192EU_USER_EXTRA_CFLAGS = -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
+			      -DCONFIG_IOCTL_CFG80211 \
+			      -DRTW_USE_CFG80211_STA_EVENT \
+			      -Wno-error
+
 RTL8192EU_MODULE_MAKE_OPTS = \
+	CONFIG_PLATFORM_I386_PC=n \
 	CONFIG_RTL8192EU=m \
-	USER_EXTRA_CFLAGS="-Wno-error"
+	USER_EXTRA_CFLAGS="$(RTL8192EU_USER_EXTRA_CFLAGS)"
 
 define RTL8192EU_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
