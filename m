Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BF2ECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 21:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF87D84214;
	Sun, 11 Sep 2022 21:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF87D84214
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OXggiVfE3hhO; Sun, 11 Sep 2022 21:42:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 180A28414A;
	Sun, 11 Sep 2022 21:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 180A28414A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C3281BF36D
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 21:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63E2740169
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 21:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63E2740169
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id az6xg-PPal9K for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 21:42:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89A9C40156
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89A9C40156
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 21:42:09 +0000 (UTC)
Received: from localhost.localdomain ([146.241.22.4])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XUiNohRRzMW5FXUiNoyj8A; Sun, 11 Sep 2022 23:42:08 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 23:42:06 +0200
Message-Id: <20220911214206.3641655-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <057e0c0f-ce16-1c0f-3406-3694bb83321b@benettiengineering.com>
References: <057e0c0f-ce16-1c0f-3406-3694bb83321b@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJqvulmi//i3ZbRF5zdXdfSiw4ma1CkjxConIFvxogAVmzrtLOVcHhqGRogMXgFpzSLoi9jk0RodHhoRjGhU/6Idu5okMyGxr9ybshhVmB/CEqeY1vh0
 QmuIXEiyUnwuU13noYF9sqs8/WK/OVlzuUX/VegI0h8r/V/NFwxuBFBAWV5Qsc/j9dnL6/eDdA0r+o5NE5t2dCo5/49ck8vR64jEWIfOX0+wrjwNKBMbn2t7
 x783fabmJIhHGTRuCdF1O33Pd51smdnn32UDe+fviiR/xz6dMN0izU+nHLgWobkwrtO3Y2VjPubHe8z+FE1QTLvOF1eUGvEUo+F9qqshMwCtGPyFNEBhhRCO
 LxSjCG4C
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1662932528; bh=woEgq7PjGl6qh1/zPgzkDj9Hjct9oBaBai7yIVkw4Ko=;
 h=From:To:Subject:Date:MIME-Version;
 b=ja73WoPS/9Xb4xiL/ddIF9Rt3WXH3ko6nrXkmZKBgviqYrLGymud3AOijUsbfWmYZ
 beIL0+wMmC2owlCmhz3sUmDsPtOllVMAtuS9hxnqLkXJacDNhsmBFxJ3dJX3oTVjPs
 7XTTG2XeO9IOPUOcMY19RXML/nOmClMZWXV9EZQkdCYo0Pv+CyMjeXfgAxHQp6OGIh
 eV0FE+tXkL/Re6v1XHMOLg4s0n2MVfuFnYRfK49qyYD0cmELq5ddSrpwTuxrd9oijg
 t5jrqe/mDsgVGe2CDTOKad7LqAZ5jQN79rVcIl2FP5JRGzpfc2b6Ef2ZncKUgh7Iqm
 ToE+x4KimgILw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ja73WoPS
Subject: [Buildroot] [PATCH v2] package/rtl8189es: fix build failure due to
 missing Linux options
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This driver requires:
CONFIG_NET
CONFIG_WIRELESS
CONFIG_CFG80211
CONFIG_MMC
to build so let's add them to RTL8189ES_LINUX_CONFIG_FIXUPS.

Fixes:
http://autobuild.buildroot.net/results/4b7/4b7b5bbf5b3839d99397eb2597dd7be79f403233/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* add also CONFIG_NET and CONFIG_WIRELESS to be sure CONFIG_CFG80211 is
  selectable
* add Fixes: in commit log
---
 package/rtl8189es/rtl8189es.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
index 51477ccc97..2fa6a3a483 100644
--- a/package/rtl8189es/rtl8189es.mk
+++ b/package/rtl8189es/rtl8189es.mk
@@ -13,5 +13,12 @@ RTL8189ES_MODULE_MAKE_OPTS = \
 	KVER=$(LINUX_VERSION_PROBED) \
 	KSRC=$(LINUX_DIR)
 
+define RTL8189ES_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MMC)
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
