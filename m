Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE5DE7D0AB
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 21:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55A1A418C2;
	Thu, 21 Sep 2023 21:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55A1A418C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XW07DaXi4RgG; Thu, 21 Sep 2023 21:57:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 555E94188D;
	Thu, 21 Sep 2023 21:57:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 555E94188D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 31B831BF3DB
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 21:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17384613FB
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 21:56:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17384613FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nc4LtPgL2FGf for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 21:56:55 +0000 (UTC)
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AE1F613F5
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 21:56:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AE1F613F5
Received: from pps.filterd (m0346901.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38LI2huT031868; Thu, 21 Sep 2023 21:56:52 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3t8ts0adp6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Sep 2023 21:56:52 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 38LLuplJ013940
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Sep 2023 21:56:51 GMT
Received: from crulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 38LLuoXP029785
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 21 Sep 2023 21:56:51 GMT
X-Received: from bspbox.kirk (kirk.rockwellcollins.lab [10.148.204.208])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id BFD70606AA;
 Thu, 21 Sep 2023 16:56:50 -0500 (CDT)
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 21:56:31 +0000
Message-ID: <20230921215633.34828-2-brandon.maier@collins.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230921215633.34828-1-brandon.maier@collins.com>
References: <20230921215633.34828-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-21_19,2023-09-21_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-21_19,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=744 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309210190
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 mlxlogscore=664 adultscore=0 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309210190
X-Proofpoint-ORIG-GUID: Q9aAvd6cnuphqAFOF2ImmmY_iSUtcwWd
X-Proofpoint-GUID: Q9aAvd6cnuphqAFOF2ImmmY_iSUtcwWd
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 mlxlogscore=793 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2309210189
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=wo2o/Vgwxe0Tn1Y4U/kbDKon/4hak1hTB5hujvm2gZU=;
 b=TnjmWj+VAL5+jAChKXRvt0CLxGDYR7v2OB1afTk7dl/NWOHbYvJzXIDtipyjbNdL4JrU
 gB8ptu/jNLaw4s4AUwyjhmIH+1b3+Lg+zJ6WgAe8UB8DWq1WeukQhkH5wEmWE82cUxIe
 6uyL43veVMYgUUTrR7wGOFuei5gnwHf9ZyM597kSICaJDQgZ6R5PqSnLXG6xI94Uh+rz
 AKCqkDEpwuy8N08lqynm+Bs2qVIbiLOAcclc6Ie9ZD6T8qxFE3USV0s8Ouo4S9yeTTRC
 BWlxABiqp99x0uIvg8Md6IRLrPCqrWazSdoWKvmGgW54TryVZdIOgkdX6ZbMIPKX1XOi Ew== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=TnjmWj+V
Subject: [Buildroot] [PATCH 2/4] board/freescale: fix imx
 arm-trusted-firmware for GCC12
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>, Gilles Talis <gilles.talis@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>,
 Maeva Manuel <maeva.manuel@oss.nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The arm-trusted-firmware package for IMX boards fails due to a GCC bug.
See the attached patch description for detail.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 ...Makefile-Suppress-array-bounds-error.patch | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 board/freescale/common/patches/arm-trusted-firmware/0002-LF-7968-01-fix-Makefile-Suppress-array-bounds-error.patch

diff --git a/board/freescale/common/patches/arm-trusted-firmware/0002-LF-7968-01-fix-Makefile-Suppress-array-bounds-error.patch b/board/freescale/common/patches/arm-trusted-firmware/0002-LF-7968-01-fix-Makefile-Suppress-array-bounds-error.patch
new file mode 100644
index 0000000000..7a7a7bbc28
--- /dev/null
+++ b/board/freescale/common/patches/arm-trusted-firmware/0002-LF-7968-01-fix-Makefile-Suppress-array-bounds-error.patch
@@ -0,0 +1,51 @@
+From b2a94de52ae4a940a87d569815b19d3fa92dd32a Mon Sep 17 00:00:00 2001
+From: Tom Hochstein <tom.hochstein@nxp.com>
+Date: Mon, 16 May 2022 13:45:16 -0500
+Subject: [PATCH] LF-7968-01 fix(Makefile): Suppress array-bounds error
+
+The array-bounds error is triggered now in cases where it was silent
+before, causing errors like:
+
+```
+plat/imx/imx8m/hab.c: In function 'imx_hab_handler':
+plat/imx/imx8m/hab.c:64:57: error: array subscript 0 is outside array bounds of 'uint32_t[0]' {aka 'unsigned int[]'} [-Werror=array-bounds]
+   64 | #define HAB_RVT_CHECK_TARGET_ARM64      ((unsigned long)*(uint32_t *)(HAB_RVT_BASE + 0x18))
+      |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+```
+
+The error is a false-positive and is entered as a bug [1]. The problem
+is fixed partially in GCC 12 and fully in GCC 13 [2].
+
+The partial fix does not work here because the constant addresses used
+are less than the 4kB boundary chosen for the partial fix, so suppress
+the error until GCC is upgraded to 13.
+
+[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578
+[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578#c39
+
+Upstream-Status: Inappropriate [other]
+Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
+Signed-off-by: Jacky Bai <ping.bai@nxp.com>
+Reviewed-by: Ye Li <ye.li@nxp.com>
+Signed-off-by: Brandon Maier <brandon.maier@collins.com>
+Upstream: https://github.com/nxp-imx/imx-atf/commit/058bf0f104115037d03e277f079825ef3659c5b9
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index c87c3ae08..2d6b90f47 100644
+--- a/Makefile
++++ b/Makefile
+@@ -346,7 +346,7 @@ WARNINGS	+=		-Wshift-overflow -Wshift-sign-overflow \
+ endif
+ 
+ ifneq (${E},0)
+-ERRORS := -Werror
++ERRORS := -Werror -Wno-error=array-bounds
+ endif
+ 
+ CPPFLAGS		=	${DEFINES} ${INCLUDES} ${MBEDTLS_INC} -nostdinc	\
+-- 
+2.41.0
+
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
