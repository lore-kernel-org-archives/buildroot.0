Return-Path: <SRS0=c1N3=NF=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03649C4338F
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 23:05:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E19960F48
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 23:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E19960F48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14BE980DBF;
	Sat, 14 Aug 2021 23:05:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MWIIevPFZZea; Sat, 14 Aug 2021 23:05:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1F4F80DC1;
	Sat, 14 Aug 2021 23:05:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FD9B1BF314
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 23:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0003560619
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 23:05:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D-FRLwyYk1mT for <buildroot@lists.busybox.net>;
 Sat, 14 Aug 2021 23:05:11 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
Received: from smtpcmd12141.aruba.it (smtpcmd12141.aruba.it [62.149.156.141])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF110605E0
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 23:05:10 +0000 (UTC)
Received: from ubuntu.localdomain ([141.136.135.234])
 by Aruba Outgoing Smtp  with ESMTPSA
 id F2bMmrQy6nxSqF2bOmsL4f; Sun, 15 Aug 2021 00:58:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1628981887; bh=MLe6glaKTYABm6E3BuNayCsvOZH5w3xKaLi3DHFq624=;
 h=From:To:Subject:Date:MIME-Version;
 b=Is205Qwe8zOS5XopF1Gz5Lyaccf2SSgZn75ymxQRqCIAaXnVAb0scMP5PvCM87aXO
 e7i4ovtxfsmfE0hlLBCSLmvE9qLC6X+N7/3xrtIwru0gIfV23SQuTdUOkRgo9nxWkw
 jSqBmM0vY6a8JttPAWGUup40oHV9LRdYDapFxk0Ix1Fvk+xfhkNQ2ryfag0mnXxgOV
 y0FPPms3KO2CQKk3jPHsKRGgtClXBImEDhvOnF9Riac08GaI9ONgz2clT4ykfEPaY7
 4Iqh1qZoMC3vJzou079fOWynjZNHgtKuthOC8Zc6j6Re6t3Qz/s+xR6mOTQNbvKhEY
 TIreITe5jXtwg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 15 Aug 2021 00:58:02 +0200
Message-Id: <20210814225803.812478-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210814225803.812478-1-giulio.benetti@benettiengineering.com>
References: <20210814225803.812478-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfG7EPHdnkndngn5M+a9x0kdbB9sDmxvff6JrmKjWRRL0ga8/FriDuzSgco3lefZ3z4rKWoVSGh25G1X5QCbc7JVsDQva7cyVU1nz7DVYzEl0I99fftTR
 nyXGTimz9NonuDIJbJbYeMPwZ3XQhMi0BQ3IVvsyjEf33wZjOFqD28DDfwmUF/+U/qlIKTSmANvXVujkSjEWWWqyafIxhP+L8JWsYbS0A98wLSS1c+zeqJSX
 tBFjx517GyqhPBU/0x3CK73hGgc/uLO1yIteC6b6iR3TBR5kziSKx2mYOeaT3SRTh7io18AvO1n37dG5WMyTEjkpfA+vWoMd0YBXtCMzrATJHOatg/kxBZTK
 9ZlKugnoLTMJJyP6iavQHx/nXnGalgaeZRqRmEwd5MB7hyKBbO0=
Subject: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_101916
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

heirloom-mailx package fails to build for the SH4 architecture with
optimization enabled with gcc = 11.1.0:
http://autobuild.buildroot.net/results/911/911f5c024834741754102ff1bbb05c4a64c54a0b/

It's been reported upstream:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101916

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 07320fdef9..c3edf8f48d 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -184,6 +184,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_101915
 	bool
 	default y if BR2_microblaze
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101916
+# ICE: on SH4: Segmentation fault signal terminated program cc1.
+# This bug still exists in gcc = 11.1.0
+config BR2_TOOLCHAIN_HAS_GCC_BUG_101916
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
