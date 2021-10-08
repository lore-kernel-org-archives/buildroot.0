Return-Path: <SRS0=JPVL=O4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E4EC433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 22:53:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AF3460E9C
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 22:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7AF3460E9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C80440714;
	Fri,  8 Oct 2021 22:53:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vroPs_hXB2I6; Fri,  8 Oct 2021 22:53:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FEA740712;
	Fri,  8 Oct 2021 22:53:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F7611BF333
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 22:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B10340409
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 22:53:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fjc_d4bhMtiR for <buildroot@lists.busybox.net>;
 Fri,  8 Oct 2021 22:53:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp2.osuosl.org (Postfix) with ESMTP id E017E401C7
 for <buildroot@buildroot.org>; Fri,  8 Oct 2021 22:53:10 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id YycvmAKKuDee6YycvmxL1X; Sat, 09 Oct 2021 00:46:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1633733166; bh=dSn+RoK8OsX5kLSwINPd6f1p2w9xow/I0aXUbnXVVSM=;
 h=From:To:Subject:Date:MIME-Version;
 b=dG147s4pYJXAL4SRnob4Z9V9VeWKLR3JQeixCiP1nsdWzu4IZkI9b/tjg2JsIyoJ5
 I8nQJm9EXw11rf/CoN+JiumxeGM3v+iamx7/tLvKsa0uCFCDqipoM/oHEAA8mICyv2
 Goxkwbtg5xbuJFebKGx600j3ynzlvDaX7Ocga9oAs+fNsVDApHzgMUwnPfHE29arg9
 vLWjy0QFWLjiVdKjL1RBmnoEhYa3y/dR0bZiSBsgJwXzVrv+BbWPzOLoVtbm2gvy8L
 vzDUWbQ/yhMOMDhRivyIotHWmbS9TBD490lE6IJ1N2Cfafd2M9D2XdKGjNPwRcU0Sm
 L60V7ollFqdyw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 00:46:04 +0200
Message-Id: <20211008224605.884413-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfPKRojRax+JXnuVmm/dXSTexTCrX8h+MBlHq8Lf4xH2YiW/hi9o44CPP+r4Bifq5YVltVyMWKd07B1WgZh/Ar2VEX0vSZ3a6e8o3fdob201Oz+9c1In3
 /DatHVtidwLilbS5+QejvEW3CHbm9nj43nskv1q29Lxx8Uqrdl8J7iej0JcEVhNzmosh9oEDiJZT9CALWwKN5aaUnPs+FK0wVWto2x6AG1TTJ18r1FO2hg3c
 393enGVqlsA9aMVeHHpgWRL65lZWJOoVdG9haoqkyvMLLa6gKK2/EpuAtbpCwcazKUAofT7bhoxfgM2zKHYKFkqcmwZ6gec2iWmz8mLICM2xqXpeT33kG1sB
 tL10tVVnEIbu+tNMtJNwfDPdZIWaDnlmTU7uNq0BatX3QrqdJKQhyWW37i6juXyORT6hHrnSseISbtF7DwoK+CHhyEQQYw==
Subject: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_43744
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Romain Naour <romain.naour@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gnuradio package fails to build for the SH4 architecture with optimization
enabled with gcc 9.3.0:
http://autobuild.buildroot.net/results/1db/1db6c59c98e3c09fa13277076ee2fbe7967f1f6b/    http://autobuild.buildroot.net/results/f57/f5742e7fb6e8142bcdb53b7f4f5e9c1bea3558cd/
and I've tested it shows up with gcc 10.x and 11.x

I've commented it and supplied preprocessed file to reopen it since it was
closed with gcc 4.x:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=43744

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 8b01067105..cb03a56cd9 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -109,6 +109,16 @@ config BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK
 	depends on !BR2_or1k
 	depends on !BR2_xtensa
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=43744. This bug no
+# reappeared on gcc 9.x and is still not fixed on gcc 11.x
+config BR2_TOOLCHAIN_HAS_GCC_BUG_43744
+	bool
+	default y if BR2_sh4
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
+		BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
+		BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
+		BR2_TOOLCHAIN_GCC_AT_LEAST_11
+
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63261. This bug no
 # longer exists in gcc 8.x.
 config BR2_TOOLCHAIN_HAS_GCC_BUG_63261
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
