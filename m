Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25368C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 13:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A548404DA;
	Tue,  2 Jan 2024 13:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A548404DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V9xrQxysBcBw; Tue,  2 Jan 2024 13:29:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40C5640649;
	Tue,  2 Jan 2024 13:29:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40C5640649
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 149A91BF314
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 13:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF14760EC5
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 13:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF14760EC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VEfDdpw6q6Ci for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 13:28:58 +0000 (UTC)
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com
 [148.163.158.9])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E55E160EC4
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 13:28:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E55E160EC4
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
 by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4028A8qx008957; Tue, 2 Jan 2024 05:28:57 -0800
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3vajqfs7gm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jan 2024 05:28:56 -0800 (PST)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A6EB94012B;
 Tue,  2 Jan 2024 13:28:55 +0000 (UTC)
Received: from us01arcgnu3.internal.synopsys.com
 (us01arcgnu3.internal.synopsys.com [10.194.34.166])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 46D08A008E;
 Tue,  2 Jan 2024 13:28:55 +0000 (UTC)
X-SNPS-Relay: synopsys.com
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 05:28:43 -0800
Message-Id: <20240102132843.587559-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: iAtPAIR6gifE5QFhlNJMfdD6E9BwAuv2
X-Proofpoint-GUID: iAtPAIR6gifE5QFhlNJMfdD6E9BwAuv2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 mlxlogscore=966 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401020103
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=pfptdkimsnps; bh=yEWlgzOlaWlncS/p9
 utXoX+wPNjEmvMvJBNUCZmXD54=; b=CNBDpNnKThuDxx8vEHe3tbwKQbzxNPoB2
 zd6kRKCZAls9sfPWrPE4F5qhdPvTbRMY80AUIHpgcTfMDRNw3lqq2u8rNZ1oPrI5
 bVY0YKacTJ7U5cN3e7cwodGqdh0qeKsFxoyH+raEpjoet+sMFR8O62pMYC/9ibfp
 DmSor5DbZkJq9PTLVX01I0Z3lefQsEctKhl5rptsPeIgum4uwP7xa2G5oFESJbBG
 DijzYdo/0lptqQZWP2pGGFbqr4LjWVy1sv7CeaKT2HfZNBTx0wID083Hh++j6FwH
 bWv2LL6zfQqcBpxcOqEUWr/JyOTvyBXjEsHv83QI0ZQhN6GTCMRwQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1704202135; bh=8GEZfzgpXDe1B0yW48n483iRDaFFjQglyYXF3ATjNCg=;
 h=From:To:Cc:Subject:Date:From;
 b=lEJiHilKjPCxObvh3aQ4nBhz97PeLqZnNye48k12grUOkw2bhqk1/9s5aaWLIUym4
 25mrME/fzeZ1dvdheGkqAtfskfoN+XamuFto2NTMm+5oAWR6XMVRr3eUvoP1WJp+B8
 VVC63IJTuSlmnC3Rr3ZPXFplic0YXd8e/00TexMfwcG2+FyWfnvkmQlobZ4mLOEJj/
 lCZUFEoUvq/GaOwj0Gp4pw/XAMR6Rt5H0Sk5JiAuY+GPkKdjy/D3nhFGCbljk49I/b
 5BhMrMxmXIkiQ/pnaZi+uViL5R0ZnMbyBpbj8gFxEdiSdG9MCLmLdF5DoG2l/08VL1
 X0hDwAXLmvq1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=CNBDpNnK; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=lEJiHilK
Subject: [Buildroot] [PATCH] package/gcc: Enable ARC HS rel 3.10 in vanilla
 GCC 13+
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
From: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For quite some time a special tuning for ARC HS release 3.10
was only implemented in ARC fork of GCC, thus there was a dependency
introduced back in the day, see [1].

But finally that tuning got merged upstream (see [2]) and
so could be used with vanilla GCC starting from version 13.1.

[1] https://git.buildroot.net/buildroot/commit/?id=770c9e5ce3de4ef1743948898a37e9a2ad76ca8f
[2] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=7501eec65c60701f72621d04eeb5342bad2fe4fb

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
---
 package/gcc/Config.in.host | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index eb553008db..fabc6173f5 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -47,8 +47,6 @@ config BR2_GCC_VERSION_13_X
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_POWERPC_CPU_HAS_SPE
-	# ARC HS48 rel 31 only supported by gcc arc fork.
-	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 
 endchoice
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
