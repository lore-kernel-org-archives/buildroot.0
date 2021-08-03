Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5624DC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 08:43:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E860B60555
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 08:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E860B60555
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD732606FD;
	Tue,  3 Aug 2021 08:43:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TTQGJZ5sOqI0; Tue,  3 Aug 2021 08:43:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3A7260602;
	Tue,  3 Aug 2021 08:43:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6A0171BF357
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 08:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6579F4016B
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 08:42:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cz31uTslSLtQ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 08:42:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp2.osuosl.org (Postfix) with ESMTP id 245B2400E6
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 08:42:52 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.149.252])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Aq0cmrnDxrXl6Aq0fmmD1j; Tue, 03 Aug 2021 10:42:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1627980171; bh=JCYH3PWJpFWx9Pg70JgNlHWb9UNUvINF1r4zG2ShTNw=;
 h=From:To:Subject:Date:MIME-Version;
 b=IPL2KF4LON5+O711XN7sNBUH9HbdL8LQCcVDnkQdswFnVpm81XsnYSu+G29wyLmUi
 t9ObwDAdeg/BFm4zC5lt50O70YacBZvokCbPOghIeRxSouNRRgUIH1C2m2Ww8svxRK
 FRO165Jb3ODy5zzajBPuKZzo6yAEpg/JODUiNWrIfQ55umn5uXrZ2c1UD5IlSQ6VUb
 g8tCyU9hS8to9X8+qtMLMK4X7fAgHG/iwX3Y3O3C/R91EMzMVNBbfktzWzG2WxmC3a
 TPV8do9W+gFH6AVgFTuT5cIY7PbWrPijUjP5eTK72F1L3pkrshDnlLmW2aFPFlYs+o
 1j9GzUsNgcgwA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  3 Aug 2021 10:42:44 +0200
Message-Id: <20210803084245.2740449-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803084245.2740449-1-giulio.benetti@benettiengineering.com>
References: <20210803084245.2740449-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfFy51jE4CdST9ex+udIesfZCXb+fKyNpdq4SYPMyoZn+HSA+wh5cgVo4wUPpyyQG1XGc2lvymN3xk62Nwjv0n9Xx6aTPlTzAOKWvIOSHWZDfHvXk9wT8
 0i6HsTwBhIRlaBmsnswxUuIQH5EFyPghJkGwDID5hosqOILIjk7Ddjw7GSmHWKrI5ENAAEnJ+ml/Z32wJ6GQGNvkxhYAAkatIFY70wA6kGqHmWc5XfoNl/w3
 wxvNbGpFG9pQ3S0Niv+kbKOKHqy/7FTrdyW8cD27HS+HkQfgWzmymgEaDHrAkr6AefAx6b8DtHegPJUuYjvotOBmib6t/F5GduGtr65Mx3Cu9xqh8U83fAL8
 2MuEw2M9FZVtxGO14J8MrdBNPwy9DPSoZdvNyG870rDVGf2FM+ea0TBC7x+2wXGrRDiD2OTo
Subject: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_101737
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

pixman package fails to build for the SH4 architecture with optimization
enabled with gcc up to 11.1.0:
http://autobuild.buildroot.net/results/b20/b20869bbb48edb1f0a847ea9e2e1a0462d6350be/

It's been reported upstream:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 3598307b20..3888eeafe2 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -170,6 +170,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_99140
 	bool
 	default y if BR2_nios2 && !BR2_TOOLCHAIN_GCC_AT_LEAST_9
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737
+# ICE: SH4 -Os causes internal compiler error. This bug
+# still exists in gcc = 11.1.0
+config BR2_TOOLCHAIN_HAS_GCC_BUG_101737
+	bool
+	default y if BR2_sh4
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
