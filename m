Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197A4C54E58
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 23:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96E2C820CF;
	Fri, 15 Mar 2024 23:43:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vGm7gveu4Qj1; Fri, 15 Mar 2024 23:43:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 213C4821A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 213C4821A8;
	Fri, 15 Mar 2024 23:43:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66D641BF362
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 23:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61172824F4
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 23:43:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E6MT9WZc7gof for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 23:43:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DDFFB820CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDFFB820CF
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDFFB820CF
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 23:43:25 +0000 (UTC)
Received: from pps.filterd (m0346910.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 42FGR6C5018458; Fri, 15 Mar 2024 23:43:25 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3wvsuvues0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Mar 2024 23:43:24 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 42FNhN1x027591
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 15 Mar 2024 23:43:23 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 42FNhN1s001070
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 15 Mar 2024 23:43:23 GMT
X-Received: from bspbox.kirk (kirk.rockwellcollins.lab [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 0C3FD3000424;
 Fri, 15 Mar 2024 18:43:23 -0500 (CDT)
To: buildroot@buildroot.org
Date: Fri, 15 Mar 2024 23:43:16 +0000
Message-ID: <20240315234316.17513-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240312190954.71227-1-brandon.maier@collins.com>
References: <20240312190954.71227-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-15_08,2024-03-15_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-15_08,2024-03-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 suspectscore=0 mlxscore=0 spamscore=0 phishscore=0 adultscore=0
 mlxlogscore=893 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403140000 definitions=main-2403150189
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=824 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2403140000
 definitions=main-2403150189
X-Proofpoint-ORIG-GUID: ABuCVXFPJ8DDu04VYH4lR2Lt0Byxl59_
X-Proofpoint-GUID: ABuCVXFPJ8DDu04VYH4lR2Lt0Byxl59_
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2403140000 definitions=main-2403150189
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=WVSFzU/HVorBaijGBJBg5Lw4mgtGQeeJcEAQS8gmEHQ=;
 b=Shf2m7tKwv2qIqdL7WrCnCDvlGGc4v118S3RhNTQa8B+k6ufwi/rwwS+C5KCyAOXP06i
 YUrh/A1v/S8IRovv7JyfU6UlfKcenu+JkMx82ZKIoC9+HGZndDO/0670slTdj5NFb8R4
 lCWtz5LGJ7171kux3pZs5pra5+9vojVUecSS6t2iIZK7kx/nZ9Je0XzhPTqdQ4ydqAop
 nShh6MXNbnokgS9ipcUSRb0riFOedwzParmLRRTyUnm7Wp/f0s3/G5qQLu5Gb7rFvroR
 tNoe5cTqPsGFd90SM+sTpDwy+sKZ44BweSpd1q6CXI+hqAro79PSpcAOVMag6PW6/sgQ gg== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=Shf2m7tK
Subject: [Buildroot] [PATCH v2 1/1] package/gmp: fix target build with host
 gcc 4.9
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
Cc: Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

GMP does not build if the host gcc is v4.9 due to the following error

  gen-sieve.c: In function 'setmask':
  gen-sieve.c:99:3: error: 'for' loop initial declarations are only allowed in C99 or C11 mode
     for (unsigned i = 0; i < 2 * a * b; ++i)
     ^
  gen-sieve.c:99:3: note: use option -std=c99, -std=gnu99, -std=c11 or -std=gnu11 to compile your code

The gen-sieve utility was added in GMP v6.3.0. It is built using
CC_FOR_BUILD (host compiler) during cross compilation as it generates
build files. Autoconf does not have a macro for add -std=c99 to
CC_FOR_BUILD, so it must be set manually.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
v1: https://patchwork.ozlabs.org/project/buildroot/patch/20240312190954.71227-1-brandon.maier@collins.com/

v2:
- remove unnecessary comment and ifdef check
---
 package/gmp/gmp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index bd401c6a80..7e8da9025c 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -14,6 +14,8 @@ GMP_CPE_ID_VENDOR = gmplib
 GMP_DEPENDENCIES = host-m4
 HOST_GMP_DEPENDENCIES = host-m4
 
+GMP_CONF_ENV += CC_FOR_BUILD="$(HOSTCC) -std=c99"
+
 # GMP doesn't support assembly for coldfire or mips r6 ISA yet
 # Disable for ARM v7m since it has different asm constraints
 ifeq ($(BR2_m68k_cf)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6)$(BR2_ARM_CPU_ARMV7M),y)
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
