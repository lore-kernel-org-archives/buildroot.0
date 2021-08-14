Return-Path: <SRS0=c1N3=NF=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E84AC4338F
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 21:52:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 665E860F48
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 21:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 665E860F48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F104401E4;
	Sat, 14 Aug 2021 21:52:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 85WWzhuS1kS3; Sat, 14 Aug 2021 21:52:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8923D4010F;
	Sat, 14 Aug 2021 21:52:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A31BF1BF95D
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 21:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 936756063F
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 21:52:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cBUoj7STXuBl for <buildroot@lists.busybox.net>;
 Sat, 14 Aug 2021 21:52:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0651.aruba.it (smtpcmd0651.aruba.it [62.149.156.51])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CC3D60631
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 21:52:11 +0000 (UTC)
Received: from ubuntu.localdomain ([141.136.135.234])
 by Aruba Outgoing Smtp  with ESMTPSA
 id F1ZYm4rarxC2nF1ZZme37j; Sat, 14 Aug 2021 23:52:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1628977930; bh=2OYzARdRDOR2kDSI0mezZEyvOy9GT30FY47s7IlhZfk=;
 h=From:To:Subject:Date:MIME-Version;
 b=WkA3rNzl/hKGEYi7xIoTTOFCllJPvU7biG3FjjNVEXqAO3iHbKVw6AL/LavUnrvI9
 Nm3Hw4Dpf/3WECC2MFQYNFcs1t+3aNWY7gLA+4DpYBzSvrgL8LuAc3GPjtBY6mujuk
 tctCx1xMpFr6SOZrX4OfdR0ueHHPHu6sZRfVpm3iNXmRd99QgW16sdXXKoexuLuQP2
 9+dpbX25bipSoYYeM6DjtqQzxaHo3vThdEcob0Sk6+KWkIeTT4t10OyikdzmaMLCXW
 PDUJVmxa55UTLCnlJhn3cfKodrvAMR2pjXU8mdIj6CsH48P2x74zDnX3fXf/n5DFol
 AeFj1mSC3Q4tA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 14 Aug 2021 23:52:06 +0200
Message-Id: <20210814215207.251908-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210814215207.251908-1-giulio.benetti@benettiengineering.com>
References: <20210814215207.251908-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKTvCC332rvabQ7UcSKIWi9dxmyGM1QFmrRI7evlVgCtqFJ1467e7dcaFz22rCbsAfaCWFyrt58hqWocQxyXrceOyBhEfLD7Z2G+rW48B9pxTXL5oGZM
 Lv7Ah44x81/bpR+DwDSL6oUqa87Q4mgD7J/XAsCW3+i2G8mxy1164Ve+qPVAQiNiPzWMJN7oOgx03re0gXqp80kU09H0er2Fwf5+0tmNTY5FPjsHp42CgnnW
 VIRrNb18D3ogAz6W+bmLJeqXzESjOZ5TI+IMYxwEvL9XAXIGvNkCLmFtu7x2yLTO+/RBgokELMjnOet1wuX8+/pk7ZxvjxIUBkP6Ehyea66UooDpcPN2TjyC
 Es7G7I8ZYRuAdd5ITwkAHtI8q563HqqbopXpVhWw/91/3aDQcic=
Subject: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_101915
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

lmbench package fails to build for the Microblaze architecture with
optimization enabled with gcc = 11.1.0:
http://autobuild.buildroot.net/results/ae1/ae1e4d61ed367c6cb64442c60d98882cc7985346/

It's been reported upstream:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101915

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 3888eeafe2..07320fdef9 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -177,6 +177,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_101737
 	bool
 	default y if BR2_sh4
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101915
+# ICE: in extract_insn, at recog.c:2294 on microblaze.
+# This bug still exists in gcc = 11.1.0
+config BR2_TOOLCHAIN_HAS_GCC_BUG_101915
+	bool
+	default y if BR2_microblaze
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
