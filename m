Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A612C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Feb 2022 21:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F60860FDF;
	Tue, 15 Feb 2022 21:41:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vg2qMEtJFfap; Tue, 15 Feb 2022 21:41:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 766D4606EB;
	Tue, 15 Feb 2022 21:41:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69B031BF32E
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 21:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F92A831A7
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 21:41:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4M1nMQrKcjPo for <buildroot@lists.busybox.net>;
 Tue, 15 Feb 2022 21:41:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2117F83196
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 21:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644961286;
 bh=AeJlSnosLYSajZZPt5awM6etlAEjFRJeuJgeWruu7lk=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=CmjQa7bo/s92o2kcN4EEYDlrAJ6pqlIJxYzM8W3jVG5Qa1MihTUlKYuZtZbWgfxFh
 IheOab0kK/aR0L9D7ppDVi1/Qbe5uD24tuS2Ia22B8YGy7nZZx1AugofRzwpmwmI2E
 sooscE/7b7tHqQhPlDHzQNlbRsizNYQZxUsOiyrA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.232]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MDQeK-1nSMmR498o-00AWMA for <buildroot@buildroot.org>; Tue, 15 Feb 2022
 22:41:26 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 15 Feb 2022 22:41:25 +0100
Message-Id: <20220215214125.20412-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:uCloz5RE7g1kpQZRjtAsRT0l8GK+uLG76NMt/uV6E6xbLLKV9AN
 f5Z2jmXWtdvDxqDmrJTa9JMISK20u+6vh7oYMHt6W+ZnCuMk8Y4JHKm/EQPZ8PqlI+8yvi+
 8NGgegYBQlBieI6ICKRusIeSf6Trb3gDLwV0POF+Is35xshWVFyLLlbqaM6DgR1G5SUfawC
 PuOjkuq+jlcpq8aVT60Vg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:C+1iKtB9Yiw=:Sj1G4mRoEEGo04dMSH2mUM
 payX5yFyUevD2IAutZSdRt2lKBNGCmAJA1ISbaKPwumZn7Q/URKeZLljwt7Y1XKTboHsts2l4
 cXn1An/nT/okTSKamyMHoc39DQa2fjut84ezQtovaFriN3xnBoYuQTNHo8znKtrbDeIcbxL/S
 URwcWNxT8t3uApgS4o+6iUj0ziZqzp0DE8dgYN1e63Xm4qPuwHzUgI0pTaZoIweJUV4Myj2Jt
 vG0H6wVWiEYTInkhrvW8NB2X/UjX5fsxJiEnYMbVHTu8aKsF9oxIn8clvXJMl4anFcAdVWc/3
 FbxnsHqRkNY8oLhZF3Nsr+ri0fdLdZalFQBd7x4B8OuCar5G3FQhJDxKZd5ZEoyRQ2Xbchbu7
 zbUnDNWEVTSb+9m+aRNx8mYWpr2/2bTmIWrRRnJQ0RSuKq+4MGVZDgbYdEoj+AY1ZsiQaGROj
 irbb5NiSnGpNlvqpr0aj/NuF4mNZmsr4gGpgETGTrxNKhmLUpN1D1SecoRUY7TKt8hVFTgoGM
 VcaIMsnWg8ERdy/gkDLiarCnGKngNGJPoNwzw31EoXnk7fyIK5u5YG8kDUE/LqN85q/DuNRTe
 W4UePJx3s/nWT75H+NMT84t54YJjnTK6xMw4xDAMZIPbRCjBurF2tHZMjQlpiiIUHkT/HRo7J
 uWCu8fzrVdpkiGJqkeAsraYeb5FrHbQPwiXyUlKB6MYRlWfWx/qBMlZocwuUIH3HYlLPxrpk8
 BRNf6kx+1QD5i1Ppvqd8+gjYkipe4dwSRSzHuDlYy/dUEkPjJO6EYaTU8rvXYnHZ3xG6JA6wI
 oX71BpyY1vYTw1mNLl/S1+l6CcvNcnkKI2nB25HHiiwWt/RT4zOJBC7OO7luig5gRz8NJQd+a
 c3MLCvYANCDd/KvqKspvsEMHb+7hli38XafpIsCCLCUq8PmhVcXZaM1mhYN8HmCmVbnSBCzCZ
 hFv20mw9McYFa5cx8Ie2SL+ifQ7MmUTOWa8CGK1z5Mc4qBRQrTNSxTQp0MUnLY7U1Hz4G4507
 97v5Pi4Jn6pIWE5+R8nSmIfotY8ZDLgVtjqxkGMIcHoHPIldWEtboFdsIeFupiZfr/lQ8Y2jN
 y/1PEgIEtneZLg=
Subject: [Buildroot] [PATCH v1] package/assimp: bump version to 5.2.1
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

For details see [1].

[1] https://github.com/assimp/assimp/releases/tag/v5.2.1

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/assimp/assimp.hash | 2 +-
 package/assimp/assimp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/assimp/assimp.hash b/package/assimp/assimp.hash
index 50f0b3e6d6..a778b79132 100644
--- a/package/assimp/assimp.hash
+++ b/package/assimp/assimp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  52ad3a3776ce320c8add531dbcb2d3b93f2e1f10fcff5ac30178b09ba934d084  assimp-5.1.6.tar.gz
+sha256  c9cbbc8589639cd8c13f65e94a90422a70454e8fa150cf899b6038ba86e9ecff  assimp-5.2.1.tar.gz
 sha256  147874443d242b4e2bae97036e26ec9d6b37f706174c1bd5ecfcc8c1294cef51  LICENSE
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index 766b2c9b5a..42440f0fa9 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASSIMP_VERSION = 5.1.6
+ASSIMP_VERSION = 5.2.1
 ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
 ASSIMP_LICENSE = BSD-3-Clause
 ASSIMP_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
