Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DEDC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 08:43:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 353C060555
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 08:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 353C060555
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1404060709;
	Tue,  3 Aug 2021 08:43:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bG8Y_evt8hVO; Tue,  3 Aug 2021 08:43:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DCC46078E;
	Tue,  3 Aug 2021 08:43:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A37EB1BF357
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 08:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91D574041C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 08:42:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zOnV6L-mHgg5 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 08:42:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E19B403A0
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 08:42:54 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.149.252])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Aq0cmrnDxrXl6Aq0hmmD3V; Tue, 03 Aug 2021 10:42:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1627980173; bh=G0pjr53uyU91nGRF0ETWGgSlcvYwQO88NabhvWSfgas=;
 h=From:To:Subject:Date:MIME-Version;
 b=Yn1TLt4CpT8hrah35kI1mHJZzdmsTfZFsFAxC2OLitcW1XGp6kgwAFu38wyoiQ8Mq
 p+TnmjapzBFFeDHGVJYr8KwNWCPP/g9pD2KHw73iy+QIQZ19AyrTLrNt2YePdpC4cf
 EbdoanVogrUWILTUljU7nWBSRym3zAWhEDUrCqWyq2gDZDBf+a77BEZsEWMY5s/NdO
 gjGrQMo0tXmlsOiBhasPXgBZ+UVJ+UcShqZ5JBJNluq7H0SFLtdEWi29eR2PSbkODm
 3LBuI6UJQnNRJUPa23Q2c2ZjkoAJJ9heoF19s8XxaHCNuC/KjzWagOWO4jhUD68lrT
 HiwJJmuBp59NA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  3 Aug 2021 10:42:45 +0200
Message-Id: <20210803084245.2740449-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803084245.2740449-1-giulio.benetti@benettiengineering.com>
References: <20210803084245.2740449-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfL/rWiaNWCP76Q/Y3q2yTncGBuKAtrJJvyp7uvZD+eFdsroNO8iTFw/4HAWvBU9fxuQaiHTX6tUY/4Dtshs/hPp4YVHPU4tzqZEWEATyWWHku1beUEAP
 mY803pV2ykApe9xATTAsW3XyLMkBZ6Mi6w8dHD2MwVCpLdqDTtrKc5up8PQJPxdg3k3EMELH9nln15Y5U65opR5afUxnhP7vqDl7enuIjrgzDp+ctd3eXSxU
 dR1hlKOtWa8EvZ92I2IF2fbPQ4aSExs7VClzWLmsHWDIEEZBgMX/RbQnH0LTW3WjoJsNOk20OAs5Nujazoybsm5evbPUR9ijzD3RL3Rrl1+rjyV9h4kzP/Sa
 iNtu7BiLt0UDoZJLjAWdkwEvfw9fV+jx5XTNc6hlAOk1JXBoMiEbMywuiwFFBtSRWMKw/3UP
Subject: [Buildroot] [PATCH 2/2] package/pixman: fix build failure due to
 gcc bug 101737
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

The pixman package exhibits gcc bug 101737 when built for the SH4
architecture with optimization enabled, which causes a build failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_101737=y.
Also let's add PIXMAN_CFLAGS and pass the Codesourcery work around CFLAGS
to it for consistency like we do for the rest of the packages.

Fixes:
http://autobuild.buildroot.net/results/b20/b20869bbb48edb1f0a847ea9e2e1a0462d6350be/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/pixman/pixman.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index d99005ecb7..6fab539593 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -44,12 +44,20 @@ ifneq ($(BR2_iwmmxt),y)
 PIXMAN_CONF_OPTS += --disable-arm-iwmmxt
 endif
 
+PIXMAN_CFLAGS = $(TARGET_CFLAGS)
+
 # toolchain gets confused about TLS access through GOT (PIC), so disable TLS
 # movhi	r4, %got_hiadj(%tls_ldo(fast_path_cache))
 # {standard input}:172: Error: bad expression
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII),y)
-PIXMAN_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DPIXMAN_NO_TLS"
+PIXMAN_CFLAGS += -DPIXMAN_NO_TLS
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101737),y)
+PIXMAN_CFLAGS += -O0
 endif
 
+PIXMAN_CONF_OPTS += CFLAGS="$(PIXMAN_CFLAGS)"
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
