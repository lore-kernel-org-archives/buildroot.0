Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3083AECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 19:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7F7E844E4;
	Sun, 11 Sep 2022 19:57:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7F7E844E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yrr4Fjc1iZkS; Sun, 11 Sep 2022 19:57:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDC1A844DD;
	Sun, 11 Sep 2022 19:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDC1A844DD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 416361BF281
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 19:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29EA9844DD
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 19:57:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29EA9844DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hhs17HgE0QX7 for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 19:57:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DE8481420
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DE8481420
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 19:57:27 +0000 (UTC)
Received: from localhost.localdomain ([146.241.22.4])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XT53orgR6eEtAXT53ooG2w; Sun, 11 Sep 2022 21:57:25 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 21:57:24 +0200
Message-Id: <20220911195724.3296064-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCMtL3kZgmAGdRtTJZPFn5EYrrybdlQv2CYqnK+Rj6OMbMGjgjjY4d6z5ggE5aHYzy4EWycPVH+V+GOHlf88H1kXWbhWcAiawcKjLvGD6zi2g38UtFUq
 tJyAbJt8NBxbQeAF4HFIaF1Eg3s7wq10ouxlZ2ue6lvVYsCkSoK3Rc/VX8/kgTO9NEZErUMmPBLeI7XqcLQusWywZqe7lLhu/3+Hp7D2weeHDtbgf5j05Yyb
 7hdkT2Thy7vE7p3UmaOTzdSLq1ISnYn1LjN2gQWoKNtkvV5/wDI2PoyGgzenDX9IO4+mlDNMShUmEsB6qVS75A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1662926245; bh=OqTteif2GS0RgU/Ip3Fy5YV1dNVumo08eW1eLxbQO6Y=;
 h=From:To:Subject:Date:MIME-Version;
 b=c4Ha2oCS4zQmYkytRrpkRCzDcKsHD1cWWrDBhHAUZzfb0IXNoASQKr3zoU1LjGiet
 e2aVEZTZwBTHeCjsObOpK8ATdljR9XBnvu5K/g+/G5c0bjfCCZwXn9TF8h2OhdM5Zj
 sZ57AE1enQuBvGTi8lc4c1LW9+IgZj48Io/ZrxonRdJWr35MdC85/Z1t+ttBRZFUXY
 fPXygOp5O21X5BdShChK7R5CJyh0rVvZRoAbXAGEEQNpVpgwStijkM0FiZ6Vy+hPSz
 QQv8cnl55PwWAKuc1mOWaBxez4b5Q7Zwu//YNgM7d1WAmmIRFP3hwYPcWwIzqllMhn
 Ex+y5sVlmVh1w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=c4Ha2oCS
Subject: [Buildroot] [PATCH] package/rtl8189es: fix build failure due to
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This driver requires CONFIG_CFG80211 and CONFIG_MMC to build so let's add
them to RTL8189ES_LINUX_CONFIG_FIXUPS.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8189es/rtl8189es.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
index 51477ccc97..a283852a11 100644
--- a/package/rtl8189es/rtl8189es.mk
+++ b/package/rtl8189es/rtl8189es.mk
@@ -13,5 +13,10 @@ RTL8189ES_MODULE_MAKE_OPTS = \
 	KVER=$(LINUX_VERSION_PROBED) \
 	KSRC=$(LINUX_DIR)
 
+define RTL8189ES_LINUX_CONFIG_FIXUPS
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
