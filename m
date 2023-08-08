Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F21CC04A6A
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 17:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E2F64044A;
	Tue,  8 Aug 2023 17:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E2F64044A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zJ0WUhqctDGX; Tue,  8 Aug 2023 17:26:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D785405AA;
	Tue,  8 Aug 2023 17:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D785405AA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 276181BF59C
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 17:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 011D881E98
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 17:26:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 011D881E98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rIrVZ1munLc2 for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 17:26:29 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A62480D5E
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 17:26:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A62480D5E
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.240]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MXXuH-1qJ7s50D9T-00Yz0t for <buildroot@buildroot.org>; Tue, 08 Aug 2023
 19:26:26 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 19:26:25 +0200
Message-ID: <20230808172625.20598-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:XdAPcWjFJ8eRkf8j7thlELRwgbwAS4XAwYImmyk1rXzo/F1UB3H
 8gqcMQETB0TFJW87L+7BkT3j5pyOo0Jc03e6VNgR7VLU2dELjJ2uFJIKi0PI0A9uI+L+O6x
 AxehmGXjou2ZDY5leO2QVo8LiHjkChWGgMOD73+sbZeK0UaA1ctq0P5UuRZ2GEeFNcNIGvV
 nsqNllL3ehsy3G9ja7k/w==
UI-OutboundReport: notjunk:1;M01:P0:/O2IChz8c20=;FQnTm5bOKwDdJ9TRCralSrNJbqH
 cOZ6i/C1K679pAUJjwMJGVqqvkiI5usbTRwZRkz8UxkHNWan6ylkMTblYNbWEcifJ0or90OLk
 lmxQBR9K0LmJMR3wNw3BGjkqu6JWiop9KJtDKuLoLmRYqVq15RVwiouJDg8xJ5MyoySfqQgZs
 Jrx5Eb6uGjSmGBB1gX0ZH9XxwW8xc/ahL0FfAnSBFSiBVr/mYRBBjJW6ngSmnBKLyGrHq4tyf
 09HjnIvItST+gWBHjRAhuWBhtKP0AiOW1WlJ72/GsmzzYa6jkrEQz9M+a02VBO1EUCLJ3KRiJ
 NfKh61Uv3x08NeETVx5TbB2Dm7k60SNHshB6H5XL+znt1AIrMm4LSv9ivpsIf84Lfqr5FiEln
 /NC4Jzqk5MxXRqxAGEBUlZymn7uFZzzGCBnjDeEW+K/EtZNqyH3VpSPlP2DMNHyykIEzWyiZb
 +lNAu0Ue1st8z/doGbzfmvT8upEIdGHTz4HYGepLKueJaY2J98Hro6HuBon4rd3z/qGDEhknI
 NchTUIp1UDQld+SpskxrTkwG9nYfw0RXj4fQpMTY/cVGvCt+XbXi+hSjyvLm9tuZlrPiLpk1Y
 1xexa14p4s7UDkN1MJ+QihesCEMkx0vTU4coT6XBn3vRZR5x1CsuQXMKovXaTvg0dXyqJqK+d
 xAf4B3myi+u64oQYGhDTia5vADZnFM0eQXVD4Ackav7zqi/r6sw5tN6QHSTgzxaUsyjmTf5tf
 1EtB2GxNsmnsD1mJu0JSuvmUFxMUHeoIPHznu+8yXDOced+utBFL0Mk4xn2/5CtMH4FY4J2F7
 nipQ6MkfDBselpNnxQnyrOXr59vNj/7K3Y9gwG1poAhJGA0Ju+TJPVkrBKZLe/4uEEZ6mzAYa
 W+b3J2SOwOsHw8tnYMRs0JyNA5vs2AmDnRIoqot97IMygCz8giJ7wZa2411a9+T08QmXNtpID
 27Y5wldu1cBnA13pDFIVfKEMLqg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1691515586; x=1692120386; i=ps.report@gmx.net;
 bh=Cswzj2ZtkMXVCSEtzravVwb6CFLBbfYscNg6N9f+H6g=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=KYFCkuX5cw+em9wjDoK/4t6WoG+p8RB4u/cAE+m+usuX+Eq+T7TshdxPMX2vsLxcP/y4yWq
 evgXA7t5LQA1HVNI/va6T6UTQc95CkTc2lQ8e5OxzUfYafH+PXlaPpUsSoXkcs3XSNi2/zqDJ
 TsGFGO3ZGR2Ch4FjIaHHboMRqKJE5lkZFP0AUgGgCN0rxvSnNuN3jXqcnYk4Shor/Or4cHJZS
 ao0Dms1yX1FOK4+U70nXwFjhHGDTfqQd94h2mowAlxr6II3rAdOj9Q0mYXgktgTl+ESPRYAQx
 WCTSbUmU/Oq2y3QhguLxoGqohXdSV+sIim2uZhao0NAUa54Fa4mA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=KYFCkuX5
Subject: [Buildroot] [PATCH v1] package/ntpsec: bump version to 1.2.2a
 (fixes CVE-2023-4012)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2023-4012 (see [1] for details).

[1] https://gitlab.com/NTPsec/ntpsec/-/releases/NTPsec_1_2_2a

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/ntpsec/ntpsec.hash | 2 +-
 package/ntpsec/ntpsec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ntpsec/ntpsec.hash b/package/ntpsec/ntpsec.hash
index 44e04b2403..8d98b5c411 100644
--- a/package/ntpsec/ntpsec.hash
+++ b/package/ntpsec/ntpsec.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ad45f5b88d08a159bc9f44ecb79e08358d26d3d22bb6c96ab7aaa3734de130e6  ntpsec-NTPsec_1_2_2.tar.bz2
+sha256  ef901df5a05d486563db22f4d0dad3840a3bf5d0a9aceb8c3ecaeb396c67a805  ntpsec-NTPsec_1_2_2a.tar.bz2
 sha256  899261d6eb6c922cf8f051225411f27b738ba0014be18c2eaf6afbf30d421bb1  LICENSES/BSD-2
 sha256  5fe38d8724c53ff4e69f0a3492a368b4a6719700ac16f706efeb01a45c62f2b5  LICENSES/BSD-3
 sha256  9ba9550ad48438d0836ddab3da480b3b69ffa0aac7b7878b5a0039e7ab429411  LICENSES/CC-BY-4.0
diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
index e612e982ec..f6262cdaca 100644
--- a/package/ntpsec/ntpsec.mk
+++ b/package/ntpsec/ntpsec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NTPSEC_VERSION = 1.2.2
+NTPSEC_VERSION = 1.2.2a
 NTPSEC_SOURCE = ntpsec-NTPsec_$(subst .,_,$(NTPSEC_VERSION)).tar.bz2
 NTPSEC_SITE = https://gitlab.com/NTPsec/ntpsec/-/archive/NTPsec_$(subst .,_,$(NTPSEC_VERSION))
 NTPSEC_LICENSE = BSD-2-Clause, NTP, BSD-3-Clause, MIT, CC-BY-4.0 (docs)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
