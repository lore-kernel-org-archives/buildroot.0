Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496B8C3DA63
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 21:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFA094067B;
	Wed, 24 Jul 2024 21:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VzODZ9PF4xlf; Wed, 24 Jul 2024 21:23:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9996C406A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9996C406A4;
	Wed, 24 Jul 2024 21:23:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBE891BF277
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 21:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABA2460769
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 21:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id do-MSPL2FE8Q for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 21:23:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EEF77606FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEF77606FF
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EEF77606FF
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 21:23:34 +0000 (UTC)
Received: from pps.filterd (m0346904.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46OKGfiM031246; Wed, 24 Jul 2024 21:23:30 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40k4mr44ps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jul 2024 21:23:29 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46OLNSQn024166
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jul 2024 21:23:28 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46OLNRtC030863
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 24 Jul 2024 21:23:28 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id A9ED23026D68;
 Wed, 24 Jul 2024 16:23:27 -0500 (CDT)
Date: Wed, 24 Jul 2024 21:23:19 +0000
Message-Id: <20240724-revert-output-gitignore-v1-0-510a2795884c@collins.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMhwoWYC/x2MwQqDMBAFf0X27EKMaSv+ivQg+pruJQmbKAXJv
 xt6HJiZizJUkGnuLlKckiWGBkPf0fZdgwfL3pissc68rOMmQQvHo6SjsJciPkQFjxMebsRgtv1
 JrU6Kj/z+5+Vd6w1B0l4raQAAAA==
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-24_24,2024-07-24_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-24_24,2024-07-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=584
 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407240152
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0
 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=552 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407240152
X-Proofpoint-GUID: _GRS4L3eHQiVHqJRnoqEUezlMolO89RV
X-Proofpoint-ORIG-GUID: _GRS4L3eHQiVHqJRnoqEUezlMolO89RV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-24_24,2024-07-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 phishscore=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 mlxlogscore=658
 mlxscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2407110000 definitions=main-2407240152
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=M187JVHMVRdOoCgWKEhEpIvxCMncNbLpP8ywiN+M/UA=;
 b=uGwV0koQTM1S0l2xV1E5i673UvNgnsF0Ccya8XLmPJbGOWwUcfTeTxUUjplS1XAxvWJU
 tJVVKWbeX4DngJ+CKGHcd913y1FcRHUiFU2TcJm7kNRxDZ3fyo0UJfucvBhp2sOAW6yl
 thXwSxxD6yiWeAXh1o6I70y38EW6MgXMr6RsgHuYX/N35truVGCFAXklwOpzdQdf/Kmo
 GoDx6vBaaLIMVIwiqgz64SftEVwNFxw9/y/Icogs37G8QeC1kBBt4IUwZyrn1Em4lwPt
 jSEmFIMKQ/V2bp1z0bXnyy17/aaQnz2iqejVCNuYO+cudwAOpKAi/MU3FCM6BPf15MsR kA== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=uGwV0koQ
Subject: [Buildroot] [PATCH 0/2] Fix .gitignore in CANONICAL_O breaking
 Python packages
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

I attempted to make the existing gitignore logic work with the
python-jsonschema-specifications, but I haven't found a method that
works.

To unbreak the package, revert the gitignore change. I included a second
patch that just ignores all directories that match 'output*', as this at
least allows for multiple output directories but didn't break
python-jsonschema-specifications.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
Brandon Maier (2):
      Revert "Create a .gitignore file in the CANONICAL_O directory"
      gitignore: ignore multiple output directories

 .gitignore | 1 +
 Makefile   | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)
---
base-commit: 8ce17e304b02c6969e4fd51f0bde97798d49eb3b
change-id: 20240724-revert-output-gitignore-38e543e10cd6

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
