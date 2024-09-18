Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68FACDD552
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 20:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6007F40096;
	Wed, 18 Sep 2024 20:15:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BeNyJqR7XKEL; Wed, 18 Sep 2024 20:15:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 067BC401F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 067BC401F6;
	Wed, 18 Sep 2024 20:15:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D01E1BF30C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B2E9401F6
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:15:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bqu7v8HZMykX for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 20:15:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 47A8740096
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47A8740096
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47A8740096
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 20:15:35 +0000 (UTC)
Received: from pps.filterd (m0346906.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48IITDRM005447;
 Wed, 18 Sep 2024 20:15:35 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 41r226tj6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Sep 2024 20:14:53 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 48IKCouF017408
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Sep 2024 20:12:50 GMT
Received: from crulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 48IKCnGX004391
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 18 Sep 2024 20:12:50 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id C32779718;
 Wed, 18 Sep 2024 15:12:49 -0500 (CDT)
Date: Wed, 18 Sep 2024 20:12:35 +0000
MIME-Version: 1.0
Message-Id: <20240918-ls1046a-frwy-linux-6-6-v1-1-941f6224e052@collins.com>
References: <20240918-ls1046a-frwy-linux-6-6-v1-0-941f6224e052@collins.com>
In-Reply-To: <20240918-ls1046a-frwy-linux-6-6-v1-0-941f6224e052@collins.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-18_14,2024-09-18_01,2024-09-02_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-18_14,2024-09-18_01,2024-09-02_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=463
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409180132
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 mlxlogscore=472 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409180131
X-Proofpoint-GUID: LUOMM0KvpvCLrVwzNo0qfo70pjtcH4xC
X-Proofpoint-ORIG-GUID: LUOMM0KvpvCLrVwzNo0qfo70pjtcH4xC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-18_14,2024-09-18_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=567 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2408220000 definitions=main-2409180132
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=EIHa3IXi+dftIylgy95r9w0hyu4zkCWI6YHJ9tEMWu4=;
 b=dDpoyPsalD+qULUt4JhJLllVP/nNM2gHSDwcMFslsUxD19L9oX/t77jbqCb00+SNeBLA
 DuXmOdllALs+uRp9wQoEEUntNRudWlS4xCwuyTjz++NIMzlIqKum+tFkMrfO6d1EfmuP
 Zl7463RtuMX+FbH/OmaPgfPPsXA7iejMDmWlZ0HR3PEb3VOwzokXQbEIWN430sdnnTaM
 aVVWxNG+f1fIpM82+ZN5mZLV8t/VlRtE4yt2eKGzuycnW2A9MpL9EWOfRslwOjJfSwye
 e6XEzPKX72/OO1ThiNDfuvar9LmybK5lYU53gsEy1QvkatrbzduS2QKt3i8bUvNmiJLc fQ== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=dDpoyPsa
Subject: [Buildroot] [PATCH 1/5] configs/ls1046a-frwy: add hashes
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

and enable BR2_DOWNLOAD_FORCE_CHECK_HASHES

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 .checkpackageignore                                                    | 1 -
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash             | 2 ++
 board/freescale/ls1046a-frwy/patches/linux-headers/linux-headers.hash  | 1 +
 board/freescale/ls1046a-frwy/patches/linux/linux.hash                  | 2 ++
 board/freescale/ls1046a-frwy/patches/uboot/uboot.hash                  | 2 ++
 configs/ls1046a-frwy_defconfig                                         | 3 ++-
 6 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index c24b94a794d28ab05c0a99ac37ff4dcf4b344087..04b06444b30b88b3459599e01cf4b4ee4118c76c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -177,7 +177,6 @@ configs/kontron_bl_imx8mm_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_pitx_imx8m_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_smarc_sal28_defconfig lib_defconfig.ForceCheckHash
 configs/linksprite_pcduino_defconfig lib_defconfig.ForceCheckHash
-configs/ls1046a-frwy_defconfig lib_defconfig.ForceCheckHash
 configs/mangopi_mq1rdw2_defconfig lib_defconfig.ForceCheckHash
 configs/mender_x86_64_efi_defconfig lib_defconfig.ForceCheckHash
 configs/microchip_sam9x60ek_mmc_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000000000000000000000000000000000..17c409530da290baae620085a1fb364355810cb5
--- /dev/null
+++ b/board/freescale/ls1046a-frwy/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0dda154c335e1a50c727601e698b6a0827e3f92308873b373449fb888df5acfd  atf-LSDK-21.08.tar.gz
diff --git a/board/freescale/ls1046a-frwy/patches/linux-headers/linux-headers.hash b/board/freescale/ls1046a-frwy/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000000000000000000000000000000000..5808d92afe89015ae416e941adf041644162d996
--- /dev/null
+++ b/board/freescale/ls1046a-frwy/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/ls1046a-frwy/patches/linux/linux.hash b/board/freescale/ls1046a-frwy/patches/linux/linux.hash
new file mode 100644
index 0000000000000000000000000000000000000000..bd5e29d026cf25f30bc9c686e7e0e89722b31f2c
--- /dev/null
+++ b/board/freescale/ls1046a-frwy/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  6db58cf91b98f7fc279f341279a5d43d4069fb56a660a34209aba6af53ea2b57  linux-LSDK-21.08.tar.gz
diff --git a/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash b/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
new file mode 100644
index 0000000000000000000000000000000000000000..d0cc110fdd018677217b8e859a9a68657bcbbe4a
--- /dev/null
+++ b/board/freescale/ls1046a-frwy/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  6279c161ad8a218b549e6631be969b74f358cf01a20103953ccaf3bb14185ac2  u-boot-LSDK-21.08.tar.gz
diff --git a/configs/ls1046a-frwy_defconfig b/configs/ls1046a-frwy_defconfig
index ce796ce3ef46e8291bb24335441deb6038b37f6b..51abf2a8c686d34a87eab193d283433c3f8e4ae5 100644
--- a/configs/ls1046a-frwy_defconfig
+++ b/configs/ls1046a-frwy_defconfig
@@ -3,7 +3,8 @@ BR2_aarch64=y
 BR2_cortex_a72=y
 
 # patches
-BR2_GLOBAL_PATCH_DIR="board/freescale/common/patches"
+BR2_GLOBAL_PATCH_DIR="board/freescale/ls1046a-frwy/patches board/freescale/common/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
 # Toolchain
 # Linux headers same as kernel, a 5.10 series

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
