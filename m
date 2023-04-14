Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0B1C77B71
	for <buildroot@archiver.kernel.org>; Fri, 14 Apr 2023 21:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C689428CD;
	Fri, 14 Apr 2023 21:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C689428CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id alGThLo0q9h9; Fri, 14 Apr 2023 21:35:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7832C428CE;
	Fri, 14 Apr 2023 21:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7832C428CE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0484E1BF2FB
 for <buildroot@lists.busybox.net>; Fri, 14 Apr 2023 21:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF3DE8447A
 for <buildroot@lists.busybox.net>; Fri, 14 Apr 2023 21:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF3DE8447A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id grdwYQXGEClx for <buildroot@lists.busybox.net>;
 Fri, 14 Apr 2023 21:35:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AA1584474
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1AA1584474
 for <buildroot@buildroot.org>; Fri, 14 Apr 2023 21:35:07 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.232]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MfYPi-1qFvGb1brs-00fytb; Fri, 14 Apr 2023 23:35:05 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 14 Apr 2023 23:35:03 +0200
Message-Id: <20230414213504.14634-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414213504.14634-1-ps.report@gmx.net>
References: <20230414213504.14634-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:DXZdMMR8LbBrzDyeK5TzKq93M9eVJwkZGSTsC9VtcpolrvXoTzf
 pz7SUf84yPTHXtfalE9NyZZ250SMz50RlW04qc8gRvbphyQXIyklgV89FHHzTJGuBlPR0yQ
 DlzjRwhKj1g4NMsEMwdmW1VcoYEpDahgFquq/akrrG90w5eu9Uhxv8CviA8cR8cvmcYmBFr
 YpP0/Gkn8+y98qAVDxbMA==
UI-OutboundReport: notjunk:1;M01:P0:rFCHBiHkh+o=;ygmSUrErKxtSuhjwyVkz/SqnA7c
 gUUgupWd55ZLS93Qhb7+50GS+m44chYSc0i85yGEG+wRJ51WVG7MDxNc5FcJ7+eMQVeo39EBz
 PfAPh0gBOWk366otEreNSLFwSTh2ixqOxc2ta/UhU7lByut4NUkwt0wcNETO7DFriSE7hhBUL
 KDhJJDNI7HxMsamh7K3gCffwr0EXu4FK6v302XHg3E8eJ6Ve2DpfoPsmkHO4N51Rh81lGYVMp
 G9lFEFiQ8W8z9XdfL1gIOdCMzgjlo7mcNzEXmxxpmyxWMoiSy9n22YvMKjj+GAKZBXCGY7NiU
 dHE8y0V6TpPL0awesvnW9/w0Spgz1X7aTsAB12qqTfPFXO4lWJwK8NN5aWri5xsELFt9nLzPH
 nyRBPqAUYsKJl93+AEQFcE4BLRPL6Xu41obuRzaLBEdHlrhE5RAFqgHhOCF9iM0lgcbpG4sR4
 glqYMT2ZLCYIqDkfo870nCvoShgvh46v44/eetDaRZ713ASk61a78ljZi+qzIPpWnYtJRmZJS
 enIkq2hZrOqyscB7D2kw2tyWNeJYe4qHZA8oeFlu1WehtLjcO6z3g0brjSZ4KCBESjRR4A1jo
 cJ6OZP21wSDjBjkJ2S0oKqNmn2Gn4AAYse6vPqKSvig8w37AXl2uNm9kpX5+r9+DtZpIm/9iv
 RF/S9s+jFsKIbHXSsAmSk0o3mm67XOA1i1//CbKOGHX/DHehipQUm4AWjUfYhdjT0gAo77uVU
 NccDLzBRnWpcGPWrDxrHypM3hrcgdvhGCszC3IFz+6qViNwBc7cHL0IwAvEEQeTdZAXVHnYvM
 AaXcEvUCHhuZekhVqKDKS3Btf12TRITMC0Osct7KqnLEcNICbehiSO0xpEPauuH3NbZdtKyJW
 eXFl9uQFn0eeT+443G96xdrj94qXHzrQo4lMJq5I8erCAkFkpZ0Ut83TqI+XPjkrcDrYF6a9U
 h7mV9W775qMDB90iUXpDLMQcfdQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1681508105; i=ps.report@gmx.net;
 bh=bi8nSROdWMnha09kpInOKSUtlulwPIX7VOl4JlW6QMg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=mjT1/Hymbv8CsCJbF9ZDonme3yd7xrygVjXX3iwHZ8o6B76YZWeeUcObL3fAWKufS
 G2YDEL9kYgiIFsMxGPtI9yAk/c0JnWaoXi2L9/ZQqUWxCI1ZavctXihi/M4XvL1q2P
 G+7M/RzpAbqSr+hVWvyUBr8n9L4hoV5T4nUZkm6b734q10ktVhgHwze+Vb2F7r0Bl2
 WRg1/SmSf3LL6SGq5c4VlK+qnvLmGQ958yhQJ4L/kHsGJuSZmatJURugk68SpJnjyb
 c6qS8bVRyRx+WWaAUuCpBdVaobiATAbtc9aJYtXbI7O52oIonTWnW0JT3BIQ3fr93/
 R7SQS5KJeSV7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=mjT1/Hym
Subject: [Buildroot] [PATCH v1 2/3] package/nginx: bump version to 1.24.0
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://nginx.org/en/CHANGES-1.24

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/nginx/nginx.hash | 2 +-
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 06454c5e32..24bc588d85 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  9ebb333a9e82b952acd3e2b4aeb1d4ff6406f72491bab6cd9fe69f0dea737f31  nginx-1.22.1.tar.gz
+sha256  77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d  nginx-1.24.0.tar.gz
 # License files, locally calculated
 sha256  ececed0b0e7243a4766cbc62b26df4bd3513b41de3a07425da1679c836d06320  LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 185bcd576f..7bd2173b48 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.22.1
+NGINX_VERSION = 1.24.0
 NGINX_SITE = https://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
