Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09171CEFC29
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 15:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 687DD40597;
	Tue,  8 Oct 2024 15:58:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Moi84jKAQkxA; Tue,  8 Oct 2024 15:58:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F46F405BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F46F405BD;
	Tue,  8 Oct 2024 15:58:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B15E01BF36F
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 15:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A07998101F
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 15:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w-e7QvLTFXeb for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 15:57:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D949380FDD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D949380FDD
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D949380FDD
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 15:57:55 +0000 (UTC)
Received: from pps.filterd (m0346903.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498EQRS3028194;
 Tue, 8 Oct 2024 15:57:54 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 424kax9tan-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Oct 2024 15:57:54 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph008rp050.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 498FvqAk014581
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Oct 2024 15:57:53 GMT
Received: from dtulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 498Fvqws003730
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 8 Oct 2024 15:57:52 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id 2179F202368E;
 Tue,  8 Oct 2024 10:57:52 -0500 (CDT)
Date: Tue, 08 Oct 2024 15:57:49 +0000
Message-Id: <20241008-check-package-requirements-v1-0-a137acc133e6@collins.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAH1WBWcC/x3MQQqDMBBG4avIrBuIQap4ldJFHP/UQYx2oiJI7
 t7Q5ceDd1OCChL11U2KU5KssaB+VMSTjx8YGYvJWdfU1naGJ/BsNs+zL1HxPUSxIO7JdAMPHBy
 79slUBpsiyPWfv945/wBoZnaTbAAAAA==
X-Change-ID: 20241008-check-package-requirements-8bcbcf2c276c
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_14,2024-10-08_01,2024-09-30_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_14,2024-10-08_01,2024-09-30_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=381
 malwarescore=0
 mlxscore=0 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410080101
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=409
 suspectscore=0
 bulkscore=0 spamscore=0 adultscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410080101
X-Proofpoint-ORIG-GUID: bq3jMfWaZOZ8xKLF6hrFPAE-hS5inItD
X-Proofpoint-GUID: bq3jMfWaZOZ8xKLF6hrFPAE-hS5inItD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_14,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1015
 malwarescore=0 phishscore=0 mlxlogscore=487 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410080101
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=pyaFq0MiQZU31mcyvyLUP2J6O6y/eU2hkSwLcWsp/w8=;
 b=T45817gHlEaVHeReM55s16XcYskrDY++dcexHYdl36+zeOAjAVNKLVy6TTYiOM50jAj3
 JQvSXpn+1NPwtGZ+DNfU1bgvSXwp0ioZMlIPo49yEXTx/kmYxZ/E65y+lRbKs8+QIesO
 FC2rN0HmvwqYqsVG5BDnQBVC5PqDXe2fLy3J1VLNI/eDWVjBEGc+r3kHC3n/pTOOR3+t
 HaATILlY8zqHwjCfTj0IkhKGmKnrcEqy0s5m+kkcem1wsGYZTf8WWphr+ynpPr/XsFim
 mBQfksCFAKElsihf5M0vRNYIbAYXtxLM9PaL1H2rtEY9eEFDy6tpLt7i0TqMuYbeVYb5 Gw== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=T45817gH
Subject: [Buildroot] [PATCH 0/3] utils/check-package: make check-package
 easier to run
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
Cc: Brandon Maier <brandon.maier@collins.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Try to make `utils/check-package` easier to run with Python's inline
script requirements. See the second patch for a detailed description.

We also attempt to document the requirements for running check-package.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
Brandon Maier (3):
      docs/manual/adding-packages-tips: mention check-package requirements
      utils/check-package: add inline script requirements
      docs/manual/adding-packages-tips: mention uv

 docs/manual/adding-packages-tips.adoc | 17 +++++++++++++++++
 utils/check-package                   |  7 +++++++
 2 files changed, 24 insertions(+)
---
base-commit: 09964bc5c0f8b329cda6383a1297029354269da9
change-id: 20241008-check-package-requirements-8bcbcf2c276c

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
