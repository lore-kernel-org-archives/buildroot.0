Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CDAC3DA61
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 21:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2066B4071C;
	Wed, 24 Jul 2024 21:23:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nbKC7ORl4Mdz; Wed, 24 Jul 2024 21:23:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CA73406EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CA73406EE;
	Wed, 24 Jul 2024 21:23:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E7EEF1BF277
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 21:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4D7760769
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 21:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LhifRfdJcRn5 for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 21:23:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 30879606FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30879606FF
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30879606FF
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 21:23:38 +0000 (UTC)
Received: from pps.filterd (m0346904.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46OK3Cos031287; Wed, 24 Jul 2024 21:23:30 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40k4mr44pt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jul 2024 21:23:29 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46OLNSBB026825
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jul 2024 21:23:29 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46OLNSh4030871
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 24 Jul 2024 21:23:28 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id 4069830268AE;
 Wed, 24 Jul 2024 16:23:28 -0500 (CDT)
Date: Wed, 24 Jul 2024 21:23:21 +0000
MIME-Version: 1.0
Message-Id: <20240724-revert-output-gitignore-v1-2-510a2795884c@collins.com>
References: <20240724-revert-output-gitignore-v1-0-510a2795884c@collins.com>
In-Reply-To: <20240724-revert-output-gitignore-v1-0-510a2795884c@collins.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-24_24,2024-07-24_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-24_24,2024-07-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 mlxlogscore=834 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407240152
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0
 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=801 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407240152
X-Proofpoint-GUID: gYvPKjWkXrHySaCLFxshWTUujhPKzQcD
X-Proofpoint-ORIG-GUID: gYvPKjWkXrHySaCLFxshWTUujhPKzQcD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-24_24,2024-07-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 phishscore=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 mlxlogscore=908
 mlxscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2407110000 definitions=main-2407240152
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=oIM5Do6zawP2VFRO6o99s1cevJhZdUM7J5q4EGCKB74=;
 b=cNbvHEaS096l3K93lLifAoUITXrTCQ635kXn+T2UpfJgH3ffYCKio1t6Ai47FQ1dxg1r
 x6P1uTy1nvugOfrP0KpmxEFjwahUatszRhddXOqx10PPZSRrjdNApll7ua5cj+DZxNhc
 GnfPFHgfb6MmsJgdbpGDTMpKLB+CJdKt9OyOYGod3k/3N3T9PkVfW60MEpESmmIDqUkk
 ToVrxkE+Raws4W3IAxeQgr1QLjq3tXrtLWn+LZF/FQq8RIoGByyUBYf10jXCFiaJp0cz
 a0yB/R8XD8kybhC8JKKc/74NIX9LxDjKJRTOWWxQ76PGyMkZfeVhtJLk0P64TDoxcBTL /w== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=cNbvHEaS
Subject: [Buildroot] [PATCH 2/2] gitignore: ignore multiple output
 directories
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
From: Brandon Maier via buildroot <buildroot@buildroot.org>
Reply-To: Brandon Maier <brandon.maier@collins.com>
Cc: Bryan Brattlof <bb@ti.com>, Brandon Maier <brandon.maier@collins.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Developers may have multiple output directories when building multiple
boards in parallel. A previous commit attempted to gitignore new output
directories automatically but broke some things (commit a14c862c08
"Create a .gitignore file in the CANONICAL_O directory").

To provide some support, ignore anything in the Buildroot directory that
starts with "output". This is a bit more cumbersome, but doesn't break
packages based on Python maturin.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 .gitignore | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index bb02d9f572..ec5768d053 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,4 +1,4 @@
-/output
+/output*
 /dl
 /.auto.deps
 /.config.cmd

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
