Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763D3C3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BADE400D8;
	Mon, 15 Jul 2024 14:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n8PrftgeYmi8; Mon, 15 Jul 2024 14:50:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B42A40734
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B42A40734;
	Mon, 15 Jul 2024 14:50:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D59A71BF3AD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3258811C1
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:50:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CcCugUxvHm87 for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:50:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B15AE80DE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B15AE80DE1
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B15AE80DE1
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:50:45 +0000 (UTC)
Received: from pps.filterd (m0346907.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46FDjFqL013011; Mon, 15 Jul 2024 14:50:45 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40bh64eamr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jul 2024 14:50:44 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46FEogw3013571
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jul 2024 14:50:43 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46FEogTD023907
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 15 Jul 2024 14:50:42 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id 2D0903026D65;
 Mon, 15 Jul 2024 09:50:42 -0500 (CDT)
Date: Mon, 15 Jul 2024 14:50:38 +0000
Message-Id: <20240715-support-testing-fix-testinitsystemnone-v1-0-299145b2d342@collins.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAD43lWYC/y2NQQrCQBAEvxLm7MAmUSJ+RTxskk6cg7PLzihKy
 N9dxFsVFN0bGYrA6NJsVPASk6RV2kND0z3qCpa5OnWhO4ahPbE9c07F2WEuuvIi7z+L28ccD00
 KDnHBME59nHGmOpYLavk7ut72/Qv7GSdEeAAAAA==
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_09,2024-07-11_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_09,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 mlxlogscore=778 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407150117
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=728
 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407150116
X-Proofpoint-GUID: -YfSCqH5hDe1nm2R-Ccq1GaN5PH5rK45
X-Proofpoint-ORIG-GUID: -YfSCqH5hDe1nm2R-Ccq1GaN5PH5rK45
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_09,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxlogscore=861
 mlxscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407150117
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=PqQoJpWLyZw8Utqt/DV8AKDG6eGMDD3qyTfTobypCoU=;
 b=iFO4nefvSz2H6Dw4kvQeBghAnomdceXMNiuzY3XWGiG/SOvRc5two6E3LB9IIA8OeqI1
 pP40f43xXc6Lt9ALIVNocjo+V4hE9ENqzQhbDY+Iz6IHo0GfjWbOyRC0oqTFUgrkybEU
 d3OLChlTEPUsWu8hfU2fYn7UI62BFzdkK5mmhqV/CF47ixOVHJtFFKZRpeFoiYqGov0k
 C6UagbfO3XnDVP1fc6QskWQVzEUvxMgh8/QaJ+6877bYlfbyCINO53HVYPHHsGXPyWiB
 TFPmN2BXCvqgkGozq5lEo/ZH1U8YcqwEBsr9cGF1bP4S+cl+wKLYg/nVgf8IItn16Tzh iQ== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=iFO4nefv
Subject: [Buildroot] [PATCH 0/2] support/testing: fix TestInitSystemNone for
 non-login shell
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

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
Brandon Maier (2):
      support/testing/infra/emulator.py: support init=/bin/sh
      support/testing: fix TestInitSystemNone for non-login shell

 support/testing/infra/emulator.py       | 3 +++
 support/testing/tests/init/test_none.py | 6 ++----
 2 files changed, 5 insertions(+), 4 deletions(-)
---
base-commit: 51a58ff0624f62ca0fa0ca6494928e8bd1410f69
change-id: 20240715-support-testing-fix-testinitsystemnone-0afe7bc3ade8

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
