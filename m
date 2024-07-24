Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D35EC3DA61
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 21:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 380D8406EB;
	Wed, 24 Jul 2024 21:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tQCpXf8_5AKD; Wed, 24 Jul 2024 21:23:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35E09406EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35E09406EE;
	Wed, 24 Jul 2024 21:23:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F39321BF277
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 21:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFD4B406A4
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 21:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KViPbjqp1Z_q for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 21:23:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F6174067B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F6174067B
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F6174067B
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 21:23:34 +0000 (UTC)
Received: from pps.filterd (m0346901.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46OK0euV016667; Wed, 24 Jul 2024 21:23:29 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40jjb35w3w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jul 2024 21:23:29 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46OLNS6s012558
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jul 2024 21:23:28 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46OLNSFj006483
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 24 Jul 2024 21:23:28 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id F036C30268AA;
 Wed, 24 Jul 2024 16:23:27 -0500 (CDT)
Date: Wed, 24 Jul 2024 21:23:20 +0000
MIME-Version: 1.0
Message-Id: <20240724-revert-output-gitignore-v1-1-510a2795884c@collins.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407240152
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407240152
X-Proofpoint-ORIG-GUID: L6_KrUDZnLv4UKh4_6NkMNaxbvdq6raT
X-Proofpoint-GUID: L6_KrUDZnLv4UKh4_6NkMNaxbvdq6raT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-24_24,2024-07-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 malwarescore=0 clxscore=1011 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407240152
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=7+vFmPH415lkL2lrftGw8tqKpO6e0oUCox/3b1oPvcA=;
 b=k/jAnuWLqeYvWBrCb9rtRSkvLGOWG80JeU2z8Md6bNp0F0q1BoiFxvVtGTXR/IJfJ0sH
 XG54XobZqGRuxHsEnZ7g+AAxkN7Jl3dQdnepQ0CqwBClRpzluQ+Ff7DpUsSzqCFX1OC6
 CjionPIcT+OtTTYV5+fyo7G2L+8zscfH++qB3hPkxI5VnUmRMthdGC20OhT3SS5B1wVF
 vJJAxkY4TTnl3qIOFrdqoyi0Qa1nQpjiea8VNDjiczHfCpfTn2bK/91TnG2Zi8oWYhJk
 ztY11ZBAOa8md3RusqV5Pm96aFKudgPXDWaTVmzILcmyR+EAOYOOP7GiPZK2RBenWF+a 8w== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=k/jAnuWL
Subject: [Buildroot] [PATCH 1/2] Revert "Create a .gitignore file in the
 CANONICAL_O directory"
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

The packages 'python-jsonschema-specifications', 'pydantic-core', and
likely other packages based on Python maturin silently stopped
installing files to the host and target directories after commit
a14c862c08.

A similar issue was reported by the Conda project[1]. It seems some
build tools scan for gitignore files to decide what files to build
and install.

I attempted various combinations of gitignore patterns including
mimicking the Conda project's gitignore[2], but the only thing that has
worked reliably is the original `/output` ignore in the root Buildroot
directory.

This reverts commit a14c862c08865e053d5fce90a0d0323b8f9e4bc0.

[1] https://github.com/PyO3/maturin/issues/1911
[2] https://github.com/conda-forge/conda-smithy/blob/main/conda_smithy/feedstock_content/.gitignore
Reported-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 .gitignore | 1 +
 Makefile   | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/.gitignore b/.gitignore
index 14b7ca5040..bb02d9f572 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,3 +1,4 @@
+/output
 /dl
 /.auto.deps
 /.config.cmd
diff --git a/Makefile b/Makefile
index 0432a014ab..f51e8f690f 100644
--- a/Makefile
+++ b/Makefile
@@ -63,9 +63,6 @@ ifneq ($(findstring @,$(CANONICAL_O)),)
 $(error The build directory can not contain a '@')
 endif
 
-# Create a default .gitignore file that ignores everything
-$(shell echo "*" > "$(CANONICAL_O)/.gitignore")
-
 CANONICAL_CURDIR = $(realpath $(CURDIR))
 
 REQ_UMASK = 0022

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
