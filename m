Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA95EC636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 21:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30DB981B04;
	Sun,  5 Feb 2023 21:25:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30DB981B04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id coLKSDBYIbFH; Sun,  5 Feb 2023 21:25:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 693338194C;
	Sun,  5 Feb 2023 21:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 693338194C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 099C21BF407
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 21:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6F1641634
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 21:25:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6F1641634
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9i03SGKslkzr for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 21:25:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA9EB41622
Received: from smtpdh20-2.aruba.it (smtpdh20-2.aruba.it [62.149.155.165])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA9EB41622
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 21:25:24 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id OmVmpZ6Np4l6gOmVmpfkXN; Sun, 05 Feb 2023 22:25:22 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  5 Feb 2023 22:25:21 +0100
Message-Id: <20230205212521.903480-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230205131559.6f79944f@windsurf>
References: <20230205131559.6f79944f@windsurf>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfETpCfFOKL0bmtH+Q5MOGjroN0y/z3aswkvvF7yJbG8kbyb9LBgRz0JoRtOKY2UFG/QftlKrQtSk6gAs/nAahyNBq3YR5SYDOiUVn7vPi716Tq7V8sBG
 IHPOhI6BrKyVM9dcuVpMJ1+BupO3WE/S4CGnFOgn8WxLS1BCxA1Nr4Z+UrQKdPDRzNsarKRaArOoDuE5X1TzDN6jGTq6R1nzgF+e5PtMQ6sDLs1UYH68hbEH
 vtzKmc0CvnyTMVqJK4/zv2YPtT3dUeWpIP7i8HOh9OXvotKKsWTdmAQs3TPDGxSG5f4FQnsW7TwspVjp3zOT8N/g1ay70c6CMl2q5BPAknYeXFbHaZ5YYS9Z
 QM/pV8dR9G2q8epZy3aBdMCNkIEYOPs13NGNWuSA74X7MqZUXgY5zvqLFMINauP9gdNGSn92
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1675632322; bh=FhXqq2lajaJZ18aMK/cqU8bH9fRAoZ3VK39aEfC2x+c=;
 h=From:To:Subject:Date:MIME-Version;
 b=Ensgi3R4zQwqvsJ6OPQNhUtx5K5O6PBP/nHoTZy96+2zwtLd+5XGfHjdAvms/h2uc
 8NBNdKe+90U+aZvDtwHq2E1nRLKACkgnkiWZkCeqqBUG2kUJ4SoSwzdWBUSb3l4MEI
 chcO4FIdkL58pJzlhM1DqW0l5Cn+xuYlOgyJYz7nIP8Y+v1q414Oqn08wFKoNikgHU
 3Qhp55JBtID5Wa/Qfij3kKooH1uDqo75gyiKW1K6fx9A4f8HFbnrbYCwG+sKlXQvPQ
 sw10xxXR3MZdCpqzNgnLrrkEF2rkIKYsu9jV5fGBeTGe83lcDtwJ4feU1I6hHvYPmS
 RfElZxYwvS9ww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Ensgi3R4
Subject: [Buildroot] [PATCH v2] toolchain/Config.in: extend gcc bug 43744 to
 every sh architecture
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Gcc bug 43744 affects seems to affect all SH family because it already
affects:
1) sh4, here you can find a buildroot defconfig that fails to build:
http://autobuild.buildroot.net/results/1db/1db6c59c98e3c09fa13277076ee2fbe7967f1f6b/defconfig
2) sh4a, here you can find a buildroot defconfig that fails to build:
http://autobuild.buildroot.net/results/cf272cdc5be2faf4070de3d235ec7a0f7190867a/defconfig
Note also that gcc bugzilla entry reports the bug for SH and not for
sub-architectures:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=43744

So let's extend the bug to BR2_sh to match the entire SH architecture.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* add a commit log with details about gcc bug 43744 as pointed by Thomas Petazzoni
---
 toolchain/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 544b423001..01215e0e96 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -115,7 +115,7 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_43744
 	bool
 	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9
-	depends on BR2_sh4
+	depends on BR2_sh
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63261. This bug no
 # longer exists in gcc 8.x.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
