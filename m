Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0B8C6FA82
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 22:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B763182A4F;
	Tue, 20 Sep 2022 22:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B763182A4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xi-dOOkoJusZ; Tue, 20 Sep 2022 22:16:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E068682A17;
	Tue, 20 Sep 2022 22:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E068682A17
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 592BD1BF377
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 22:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3471982A17
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 22:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3471982A17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TMdfjYlXXzRA for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 22:16:10 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7DB882A0E
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7DB882A0E
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 22:16:09 +0000 (UTC)
Received: from localhost.localdomain ([146.241.95.233])
 by Aruba Outgoing Smtp  with ESMTPSA
 id alQPopGB8RFZ1alQPorTLj; Wed, 21 Sep 2022 00:09:05 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 00:09:04 +0200
Message-Id: <20220920220904.98162-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOAeQmVXfLLZ/4xeh5kWrt+SbjugdN0uqVYX+EpvKeCtcKhzD/8zWBHY3QVGmhMVXCcRDQLZntNl7sYK1d49gHX5tWI0j94YntcFmIwApRPWmUovbpnA
 jUJKUoGmLhHImkKWvKfL00+G8h9CqTOp3Bc2rZrErNxdIC1FI9olh8RAlkP7iU4lOUFKHhH5p1k8TOYt1o0wSips+oXH5C96WnGJz05VWB0lF6+AemEqz5wl
 EUibfB0k+ADRhPm0HLAsKkzHUUHAbEetnLtNUHchJ/DGewynbYxlPerOLLAoDA+CglXSG2+D0SIPqPjvJp6jwA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1663711745; bh=tv6eo4+hjJCRsPMgIJFnmEHtmgCO6IDyjR5C7rynv5Y=;
 h=From:To:Subject:Date:MIME-Version;
 b=eGYbMPYsnEx1By6WXQlschUKmLllwZ8H06JZSrucxyX4DwBfblAQNqOxZO5McG0Jr
 RwTFg0yX9rfmbpoK+8AGhzpL46zlpZpBsYK+WYQzNPTPwCJTEBPhSsCH0mkV+UuNSK
 Cq+LZo16sbXl2JuN8gbYeURi2P9wddzTGxQoGj3ha4eO3uVMmdwrqADerSvneDxcUX
 8ee0ItUj9TM4+oEm2X1WGQua3aGKpU+zirUbwnmAg44N4V86EjGPKGwF/zcgRKfyE8
 F0kzYibuwaSTqxDwmwTw0f52JfR3H4qhByjiIEPueSdD55Lol4AmcalgNuSlj4V+82
 rReUHlmb/Cztg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=eGYbMPYs
Subject: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: fix build
 failure due to double defined endianness
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

By default package rtl8812au-aircrack-ng uses CONFIG_PLATFORM_I386_PC that
define -DCONFIG_LITTLE_ENDIAN and this can't be overridden since the
USER_EXTRA_CFLAGS are assigned to EXTRA_CFLAGS in the beginning of Makefile
while -DCONFIG_LITTLE_ENDIAN is assigned later.
Instead of using the default CONFIG_PLATFORM_I386_PC let's set it to 'n'
and let's use the same defines it uses:
-DCONFIG_IOCTL_CFG80211
-DRTW_USE_CFG80211_STA_EVENT
This way -DCONFIG_BIG_ENDIAN can be define without the conflict of being
defined with with the default -DCONFIG_LITTLE_ENDIAN.
Let's also add Linux config FIXUPS to build the module correctly.

Fixes:
http://autobuild.buildroot.net/results/2e4ee705d0e2b728f102aac4e6729f11ef22be36/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk    | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index 60d81469c2..45a6ce5729 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -11,14 +11,25 @@ RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
 
 RTL8812AU_AIRCRACK_NG_EXTRA_CFLAGS = \
 	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
+	-DCONFIG_IOCTL_CFG80211 \
+	-DRTW_USE_CFG80211_STA_EVENT \
 	-Wno-error=address \
 	-Wno-error=array-bounds \
 	-Wno-error=cast-function-type
 
 RTL8812AU_AIRCRACK_NG_MODULE_MAKE_OPTS = \
+	CONFIG_PLATFORM_I386_PC=n \
 	CONFIG_88XXAU=m \
 	KVER=$(LINUX_VERSION_PROBED) \
 	USER_EXTRA_CFLAGS="$(RTL8812AU_AIRCRACK_NG_EXTRA_CFLAGS)"
 
+define RTL8812AU_AIRCRACK_NG_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USB)
+endef
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
