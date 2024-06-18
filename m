Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0CCC27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 15:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FB8840912;
	Tue, 18 Jun 2024 15:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DvzJcDyitVIs; Tue, 18 Jun 2024 15:14:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 243884096F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 243884096F;
	Tue, 18 Jun 2024 15:14:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B687A1BF27E
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 15:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A48A260EFC
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 15:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eC_2CMOx6FB4 for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 15:14:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D4B3D60ECE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4B3D60ECE
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4B3D60ECE
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 15:14:49 +0000 (UTC)
Received: from pps.filterd (m0346901.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 45IC6YHs023584; Tue, 18 Jun 2024 15:14:48 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3ytpg3m4k4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jun 2024 15:14:48 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IFEl6u023802
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jun 2024 15:14:47 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45IFEkMs012788
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 18 Jun 2024 15:14:47 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id A75023000445;
 Tue, 18 Jun 2024 10:14:46 -0500 (CDT)
Date: Tue, 18 Jun 2024 15:14:39 +0000
MIME-Version: 1.0
Message-Id: <20240618-apply-patches-tar-default-v1-1-12207e518c62@collins.com>
X-B4-Tracking: v=1; b=H4sIAF6kcWYC/x3MQQqAIBBA0avErBvIioquEi0GHWsgStSikO6et
 HyL/xME9sIBxiKB50uCHHuGKgvQK+0Lo5hsqKu6rTo1IDm3Pego6pUDRvJo2NK5RWQ7dEbbplf
 KQO6dZyv3/57m9/0AoCg9/WsAAAA=
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=853 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406180114
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=808 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406180114
X-Proofpoint-ORIG-GUID: 844FNZzhAkr71J4qP841xnJgtIXUf_9n
X-Proofpoint-GUID: 844FNZzhAkr71J4qP841xnJgtIXUf_9n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 mlxlogscore=920 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406180114
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=+gLC9mnZqFkJ5GoGHmBP1Dn2T/zdULaJtEstIEM9atQ=;
 b=E/Yd2QR17fl/3NxsT2vUGIJ0Pz4isI8uUt7KVQX3yDHwLs0qbzn7mcuZszf5BVW36VCz
 GlCWFSBE7IumW/auJj5HrWb7Fp2ujyE1X1Mx/Bl2mIXmh3MQsGDm6arv38ZrRzGFS4ky
 PCsyHl0V78fHTyKZNWaS34op0FvpGFsozeYvle4CmbqWYNXW1AEsacRGBV3nEB41pWpL
 wtyZMsAOkmbpcdHEem5zpDi1S8nZnpmZ0CN5zmX1qj/kxUJCsX6ZnvanQo5nvnweb0jd
 6A40G9awmXVbzzvgkThG1mgwktvwf2Xy2uDLEPp+dIFyCzxwwFg9lJF4UZ3EVx+r2+6e AA== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=E/Yd2QR1
Subject: [Buildroot] [PATCH] support/scripts/apply-patches: fallback $TAR to
 `tar`
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit f77d698f83b230f7efcb7d28af3aacfa9589cc89 changed apply-patches to
use $TAR instead of `tar`, but did not define a fallback if $TAR is not
defined. This results in an error when calling apply-patches.sh from
outside Buildroot's Makefile. Our team uses this script to setup local
checkouts of Buildroot package's with patches for development.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 support/scripts/apply-patches.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 4e633b23be..73aa6c8e5f 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -46,6 +46,8 @@ patchdir=${2-../kernel-patches}
 shift 2
 patchpattern=${@-*}
 
+export TAR=${TAR:-tar}
+
 # use a well defined sorting order
 export LC_COLLATE=C
 

---
base-commit: 7bfea9372f1842279a8f57b5fc4428bbae822e91
change-id: 20240618-apply-patches-tar-default-ef86dcf3711d

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
