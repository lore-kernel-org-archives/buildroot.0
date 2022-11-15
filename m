Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D359C4332F
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 23:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A35CC40B58;
	Tue, 15 Nov 2022 23:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A35CC40B58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6jFVOvrNW2dd; Tue, 15 Nov 2022 23:53:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFD9F40445;
	Tue, 15 Nov 2022 23:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFD9F40445
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3EA701BF421
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 23:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1942D40445
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 23:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1942D40445
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8nO4BXlLDn0q for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 23:53:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2916A40424
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com
 [148.163.156.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2916A40424
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 23:53:01 +0000 (UTC)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AFNTMJX000915; Tue, 15 Nov 2022 15:52:58 -0800
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3kvmg4829n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Nov 2022 15:52:58 -0800
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 36E314008A;
 Tue, 15 Nov 2022 23:52:57 +0000 (UTC)
Received: from de02arcdev2.internal.synopsys.com
 (de02arcdev2.internal.synopsys.com [10.225.41.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id E7A58A005D;
 Tue, 15 Nov 2022 23:52:53 +0000 (UTC)
X-SNPS-Relay: synopsys.com
To: buildroot@buildroot.org
Date: Wed, 16 Nov 2022 00:52:33 +0100
Message-Id: <20221115235235.74897-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
X-Proofpoint-ORIG-GUID: zIixbKXOSCwIeQR2xNYjaBFST8G8QRIg
X-Proofpoint-GUID: zIixbKXOSCwIeQR2xNYjaBFST8G8QRIg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-15_08,2022-11-15_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 malwarescore=0 clxscore=1011 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=385 priorityscore=1501
 impostorscore=0 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211150164
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=from : to : cc :
 subject : date : message-id; s=pfptdkimsnps;
 bh=2hiGalqpblxyliBgeiZxRvV7XUiMOSI7MhknsM3VvWs=;
 b=JKMt4soQiM1ZBjcSMStAWn2As+x5cG8SB76l7+CFeNn4Tl58QbHEyfq79AI29P452W4r
 d+pl7+XIlcod2TAqgwVfsVDFiUT5IYU7Jka9/KyMW9jmBkhkOh4K3f6Pey9/7O9K/+NW
 Uj0EYxTRI6Kzhr1xDhsHMqvl2KD+diE1pqK0tw2tx0LeVmKlBM2PKY6Nr0yEOTAd1T9L
 As5OSJ9RCKw+e4H2cVhyagcZBScLXCz2CcajrOx803NyszaYsZ2K4H+FXGXnOtby15xx
 gqIzuqYwoaWu1yeNZw28Pa5Cw/fTtaGgkWZodu2QT/EjAA/d9rSZ5UWZ3jTold9wYTGT wQ== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1668556378; bh=Dp1Q+O2H0+FR8Hn8ofFayyXPHxZV/gFYrFNaM6SUzOY=;
 h=From:To:Cc:Subject:Date:From;
 b=jSycSOUZBztprJM07KLq42yVIOXJpPs686Yrr1GzpeBrb0KV6H9GiDlqOGqMZGTfu
 yUsdA/Rgq/hOsLd4dVGdYiTJHP8/PmURcIUgAxwI2SJecD8bHguG0nu6cM5UC23qfI
 VZwU8vd1YpMJ+bMHdo4YvrGE9RpgO4yn88xJ7FhVCNilRlJSKHo+6D8end9Md4lul+
 tQ8EZhpdpSwPS1SqbHcbWVV0gFkuobq8rqvwTITkUHjrtJ35IhMez0F4OfAFl7NGGd
 +fHRpA0SyMdlXuJ/PjRAJa4s7EcjzN8bVIjPXaiBg/7C1GYPszXKS8fWrrRuznDnXk
 shmY8qoyJK2xw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=JKMt4soQ; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=jSycSOUZ
Subject: [Buildroot] [PATCH 0/2] Enable (or rather fix) glibc for ARC700
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It's been waiting for a long time and now under pressure of possible
removal of ARC700 support from Buildroot that change is finally
being published.

Among other things it will fix annoying build failures for ARC700,
which now became so much visible since Buildroot switched to glibc
as its default C library, see [1].

[1] https://git.buildroot.net/buildroot/commit/?id=4057e36ca9665edd5248512e4edba2c243b8f4be

Sergey Matyukevich (2):
  package/glibc: add support for ARC700
  configs/snps_arc700_nsim_defconfig: add ARC700 target for nSIM

 board/synopsys/nsim/readme.txt                     |  43 +++++
 configs/snps_arc700_nsim_defconfig                 |  18 ++
 .../glibc/0003-ARC-Synopsys-ARC700-support.patch   | 208 +++++++++++++++++++++
 3 files changed, 269 insertions(+)
 create mode 100644 board/synopsys/nsim/readme.txt
 create mode 100644 configs/snps_arc700_nsim_defconfig
 create mode 100644 package/glibc/0003-ARC-Synopsys-ARC700-support.patch

-- 
2.16.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
