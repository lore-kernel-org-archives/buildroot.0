Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA34C05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 08:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFF8041620;
	Sun, 29 Jan 2023 08:32:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFF8041620
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NxKUvclHoTcK; Sun, 29 Jan 2023 08:32:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D72C841626;
	Sun, 29 Jan 2023 08:32:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D72C841626
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 58A191BF337
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 08:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3217160C15
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 08:32:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3217160C15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AivvZZ19o8vG for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 08:32:03 +0000 (UTC)
X-Greylist: delayed 00:46:40 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D141960C08
Received: from delivery18.mailspamprotection.com
 (delivery18.mailspamprotection.com [185.56.85.135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D141960C08
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 08:32:02 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se18.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1pM2NK-000539-SV; Sun, 29 Jan 2023 01:45:21 -0600
Received: from [95.111.54.43] (port=56654 helo=localhost.localdomain)
 by es87.siteground.eu with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <dimi@tpm.dev>) id 1pM2NI-000NKV-2E;
 Sun, 29 Jan 2023 07:45:16 +0000
From: Dimi Tomov <dimi@tpm.dev>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 09:45:09 +0200
Message-Id: <20230129074509.246281-1-dimi@tpm.dev>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00785891141234)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT/Fywzlmd+WWFMbqKSpi7e2PUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5xKipkaFeQDP2JiLCjsOSqCBHoJjdDPbdunZvlh+03gEx+y
 AgUhs4TMs248ll4GqtGr/hqYzjDWzrFya1I3MqUAQaXPwIlI4yu/PH1NWDdGRQDwTY+YJmWvm39/
 uo5ziShTtObPqIqeRAv2CqzEPfjvzn3+O390ZiUEIR10am7COXQg45AD+/l6P8h0+TPjaDxMfcvw
 9uVrltEafCGDyHAgHlsrgHdRWEueoBSMqiQzPh1yRvIbtitNGnLjaBpZxUE1lUtc0sYymngJCgc9
 CmsixbRnzikbOeDgA3lYbBLbioPAgTtUp75uqlx0KezvZHXNck283Ma4f9Sv82S3dBYCh4qquF0m
 STLvgCmSR4faGwwvmLeDYYVoZCdncqjCVTxqe+hzuzR4e2zKsft/i9azUpyDFBOp1ITdzGU/ruyy
 5nGfZreTrrCodBGR0eudR/Re4NVbVEBU/8Tv9RjL1Pyu39sUHXwyAFnSuVW90ZJgh3r6hAL/pjzQ
 N/GQ45ibIzsEkC4p6ub0lMDXu5jHKgmeLKPFRdvGVz6FathkOrvSVdrtItr3uBzqAPuBJFUGX0Q2
 t+qRiaPwgDRu7DKiN+p7bBfpnQAiZ9/ZqWhbBZN1xB+2FvX49cAdKCmINeQFZ0RFQVRTn8m0sooR
 S7h6xdEgKTjECb0PwpN4olPuA0AI936c0SM84BxzaZIqKXfxGEIg2IO/jqGUcCa68likktQ46SeB
 KJmBlMDme7P1FJK1el8fx2XLnRvLZaJFT83BKy4HmFDqewO9xyOqCYO8P1aHoGlJESAu14YV1AR3
 U+UyFj+4P7/NsNT7JHCvOnHPp4Pdn+cousT5+gFGAcOaNJ6l+dSxHUtSz59+xi/FGxobR1FMy82T
 FetP/kBSV5/trvtTk9ny2vM+IFavT6E+140lSi66606MmcL5+j5rbl/CvPs4zg7JC5EE3xJO3P3P
 mVFy2DNwOgV373pfDhBQ21OdK8j0MlXJpYeYPfC0zHdZ/J5eJAr6utz50zF3Q796+PuYLgdrOtLC
 bKvBiH1ahgeoC4oi1BMd6NlIvsvDiIUHqJSTET5IrgKSqpC5j8AO0HtX0QIjIjCn1zvQuUxCBw4J
 0zMC1EkB/dUo3Uq7Q+K/Z3ayN55WV0bFGLn8N/dDfCx2SKR4BpkzgM/GypUylheSR7d4CWpSt/sm
 /gYhmNcISA==
X-Report-Abuse-To: spam@quarantine2.mailspamprotection.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tpm.dev; 
 s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=in6bs/HgTRhkBwYUM3if+HtzApB25Vt3gl/89vx5oyI=; b=GYkHapvRt48Q759nm6ZaVGpkcK
 GHUUh/MXMjckh9tCJuubBGRPmhahMsF+JYAN06yOF+PjBfjMcsLhPqMrsyXELKPqufG2IU8MfdcNp
 J2Zuc5lXN/f4YFdphINMT8SuLQAgnaGDn6eJ8rctaJsP6ohkG6fzIGJDqI1bTOn+kAxJAreWy6XX+
 NkMGJBtc78KPpcJKGXBsTmFQQUJweWU4NPo11pXEuXiT/6p5bLXqaMSbrElRMNkhoeQhdjwDDJG3+
 PXOkVjAx3a7+eXqNvYdTUNzHHgpaCLYDRAJweGeK7JQh1dXieeASYIoetNd6Jp+MJJcnrMDuKmV1v
 DksRmXsQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=tpm.dev header.i=@tpm.dev
 header.a=rsa-sha256 header.s=default header.b=GYkHapvR
X-Mailman-Original-Authentication-Results: mailspamprotection.com; auth=pass
 smtp.auth=35.214.247.6@es87.siteground.eu
Subject: [Buildroot] [PATCH 1/1] package/wolftpm: bump version to v2.7.0
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
Cc: Dimitar Tomov <dimi@tpm.dev>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dimitar Tomov <dimi@tpm.dev>

Signed-off-by: Dimitar Tomov <dimi@tpm.dev>
---
 package/wolftpm/wolftpm.hash | 2 +-
 package/wolftpm/wolftpm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wolftpm/wolftpm.hash b/package/wolftpm/wolftpm.hash
index 735c731a53..3329528095 100644
--- a/package/wolftpm/wolftpm.hash
+++ b/package/wolftpm/wolftpm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  78331cc2d98339247857f5ceb3e7cd3c4f5773e3d81bf1d73e8df9446e37472b  wolftpm-2.6.0.tar.gz
+sha256  d8e06e77893f104be7eb9421cac50518552ad9c5fc7fe8a9c1cdfaf4f11b92df  wolftpm-2.7.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
index 398fa668af..db332712f5 100644
--- a/package/wolftpm/wolftpm.mk
+++ b/package/wolftpm/wolftpm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFTPM_VERSION = 2.6.0
+WOLFTPM_VERSION = 2.7.0
 WOLFTPM_SITE = $(call github,wolfSSL,wolfTPM,v$(WOLFTPM_VERSION))
 WOLFTPM_INSTALL_STAGING = YES
 WOLFTPM_LICENSE = GPL-2.0+
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
