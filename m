Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A392DC05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 08:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38E4D8142D;
	Wed,  8 Feb 2023 08:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38E4D8142D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id so2TKPef_Lxe; Wed,  8 Feb 2023 08:50:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70D0681E1C;
	Wed,  8 Feb 2023 08:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70D0681E1C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C61DF1BF5EA
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 08:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACCE181F24
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 08:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACCE181F24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uBnFSUtI29Ss for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 08:50:18 +0000 (UTC)
X-Greylist: delayed 00:05:04 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 194BD8142D
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 194BD8142D
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 08:50:17 +0000 (UTC)
Received: from localhost ([109.43.49.211]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M3Upe-1pP86u3nQA-000c3V; Wed, 08 Feb 2023 09:45:11 +0100
Date: Wed, 8 Feb 2023 09:45:08 +0100
From: Andreas Klinger <ak@it-klinger.de>
To: buildroot@buildroot.org
Message-ID: <Y+NhFA5/pfRlQbiR@arbad>
MIME-Version: 1.0
Content-Disposition: inline
X-Provags-ID: V03:K1:v/8HO19MVKbPFi6x4+kciBMLgN5Xcm4DabcBwkbf2HEWMIK3mXM
 nHPepGo+e9Xb3upnBx0etucBv0aH6hYq75zb/HA+C6MXJ73LVu0z5UlKsb7DDHWJNhI+/io
 VshZfGeI1P/t62pGkspWn2gYr7STzuXtarxXNKogI1pLEZV7kexxKL6wbWBDlCCF3EeyUKK
 qfdF4RT0Cqr9xO6GH9Pbw==
UI-OutboundReport: notjunk:1;M01:P0:JEcZo0UMbN8=;RyLiun7qVMBbwtvzH8ePUu8fcQZ
 Ja7vaqusofSbadHpJoaVgUogsMzLq54O+paYn3nxO9KVfEabIFXs0shARV1cvvzl+Ixr05xzm
 kLPcw8g4DxiL85n+h+FKYp3gt5THdDZuC7SL2+oetab0TECw2Lfk7hHbYG6uQQezSkdK3HBv2
 QpYd8OviKekxfiJiXxOqEflplRdGqLbjfkADSd2hPiKTe5T01sy0ZHMSsudGLwChJJoZeB8Tt
 f6v/CZrDsRdz2k660sz81HBMMCTPaqWUuw2FCwIRn37sWLPLg9vuAsxF04D4rrDcXB1t/SR47
 brRZNbsdUVTgF2jzn/GGuoHV5ccID50fr+iZ2mOLFvG4ZroABLpT6n1Ik0M5H5BxykNcVRMjS
 OZhgb95hGhOI2ujU8tH78SlXpl2enM4+k2Lu8E5SWmPdfl3kM0CwhvfP6UZyyVqgg3Qnre1JT
 IxzZ/VbU3iLxQVNI2udjpBPxBOVSVcGOBCPpjBSdgrHsjXWTq9w4E4VW54JZ1x/qj4VKb9ebW
 kbi+c8q9h2zHy0culI3FjzOWqwUnnJo6jrkgO2LRNyL4K+OlN/2rCWq0sZ5aF9MWE3LX0pN+f
 AnlFQ8A8HTbLCEx0Lf87shmeUXb4RMWPO77Bpnyr+jiAJKa7KHe8jIYf9P7mPVmFYeUUqsReN
 /Brjl+nnio6/Z01xYWCkwniBZqtx2uDS1pWR1ESOJg==
Subject: [Buildroot] [PATCH 1/1] package/ply: add dependency on Linux
 headers >= 5.5
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
Cc: ak@it-klinger.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 2.3.0 of ply now requires Linux headers >= 5.5

This was missing in commit b9612601b037e6deb79af300e64e0557dda1be5c
("package/ply: bump to version 2.3.0")

Fixes:

  http://autobuild.buildroot.net/results/ce37039991cb0fb02b97d341d78327e54d0e1d26
  http://autobuild.buildroot.net/results/c00714847ae92dd609bc8990df318bee58be38b8
  http://autobuild.buildroot.net/results/8210bd2b9c67d6d7616ada525019b2658195416a

This is a resend, because there are still the same autobuild failures.

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
---
 package/ply/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ply/Config.in b/package/ply/Config.in
index 0500e7883f..f7507095c1 100644
--- a/package/ply/Config.in
+++ b/package/ply/Config.in
@@ -5,16 +5,16 @@ config BR2_PACKAGE_PLY_ARCH_SUPPORTS
 	default y if BR2_powerpc
 	default y if BR2_x86_64
 
-comment "ply needs a toolchain w/ dynamic library, headers >= 4.14"
+comment "ply needs a toolchain w/ dynamic library, headers >= 5.5"
 	depends on BR2_PACKAGE_PLY_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5 || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_PLY
 	bool "ply"
 	depends on BR2_PACKAGE_PLY_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 # BPF_JLT
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5 # BPF_JLT
 	depends on !BR2_STATIC_LIBS
 	help
 	  ply is a light-weight dynamic tracer for Linux. By means of
-- 
2.30.2

-- 
Andreas Klinger
Grabenreith 27
84508 Burgkirchen
+49 8623 919966
ak@it-klinger.de
www.it-klinger.de
www.grabenreith.de
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
