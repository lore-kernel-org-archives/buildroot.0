Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917AAC433FE
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 23:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AC5260F0F;
	Tue, 15 Nov 2022 23:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AC5260F0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s5Ugr00NskVi; Tue, 15 Nov 2022 23:53:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F3EC60EFE;
	Tue, 15 Nov 2022 23:53:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F3EC60EFE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 45D0E1BF8A8
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 23:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E8B581DE8
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 23:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E8B581DE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aTkLth3eneIC for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 23:53:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F2F18144C
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com
 [148.163.156.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F2F18144C
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 23:53:01 +0000 (UTC)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AFNU5rW002390; Tue, 15 Nov 2022 15:52:58 -0800
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3kvmg4829q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Nov 2022 15:52:58 -0800
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5D3CD40181;
 Tue, 15 Nov 2022 23:52:57 +0000 (UTC)
Received: from de02arcdev2.internal.synopsys.com
 (de02arcdev2.internal.synopsys.com [10.225.41.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id DF0D2A0060;
 Tue, 15 Nov 2022 23:52:55 +0000 (UTC)
X-SNPS-Relay: synopsys.com
To: buildroot@buildroot.org
Date: Wed, 16 Nov 2022 00:52:35 +0100
Message-Id: <20221115235235.74897-3-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20221115235235.74897-1-abrodkin@synopsys.com>
References: <20221115235235.74897-1-abrodkin@synopsys.com>
X-Proofpoint-ORIG-GUID: pCR_WF8cF7r_Ic72aa72brjLEf3UlX8R
X-Proofpoint-GUID: pCR_WF8cF7r_Ic72aa72brjLEf3UlX8R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-15_08,2022-11-15_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=995 priorityscore=1501
 impostorscore=0 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211150164
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=pfptdkimsnps;
 bh=VxasKQUZglGS1rjwjutNp80j5REcDUoyndrsxDaY3zo=;
 b=P235X62tLAy318rgMvW+YkzDKSGOT5ab3Sqv2bu29ucDa5KS49MGMYBfqrq018+Xk+Ev
 2JYUmXzgWIzVBWIXtcHv7aiZcGYio6MUhVPwVPTB0pxABF6TyETrla1lM4xV0spKrte8
 D9RF4v0ALHHnmqcQFWHRWJalRXHW0tQHa2VnkpOUZV72g3kfQSX8RGH09lKd9fA+SNuY
 heZtjI5Fnn4iPyYZWAPftAjAeorzD0fRpMZMn9be6iBysb7rdblqmGyy/AXpmHlaMDsR
 3l8S3L68WAt+epd3nvZN7h50iZ+kL/5mJPkh2Zud5mo7UMRejRkFzDBVKyQU3K/AaJfL RQ== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1668556378; bh=D7N6iOppFD7shlYVFc2HcZ9TYwiirrw8k/f81X47SqQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MUIXsVGjt3LWCu1C7Mjy8NDn+I9cbmG2KxDjyJD9+S/IiJH3g7p602IzL14ELIUpt
 tD3913I1LYrOLmW6k2qlktBEqOkQigmp0eFOF6m/KbDMSvwialAaTd+HBejx6S0V0K
 g/6Z9RCUFAw8+uqBslLFQOTxUviZH5fInx513fc4GpGZ6niClz3sXINtcrGEi9fkE3
 rZWZ0LGOkii6UpPpFUbtobLcqAMv2RSNQyBiP2BlEpH5Rom3FmicQ3mGSIv0EyXxle
 2b55h/m+0HgGPDDkqGLjtQGqeD+4R1xqS/VxI+Zbzps1q6PrerMsaLFUnTn6VemlGw
 Oc3gkRe4EKFlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=P235X62t; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=MUIXsVGj
Subject: [Buildroot] [PATCH 2/2] configs/snps_arc700_nsim_defconfig: add
 ARC700 target for nSIM
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sergey Matyukevich <Sergey.Matyukevich@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Sergey Matyukevich <sergey.matyukevich@synopsys.com>

Add ARC700 image configuration for nSIM instruction set simulator.

This is a nice starting point for ARC700 in nSIM.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 board/synopsys/nsim/readme.txt     | 43 ++++++++++++++++++++++++++++++++++++++
 configs/snps_arc700_nsim_defconfig | 18 ++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 board/synopsys/nsim/readme.txt
 create mode 100644 configs/snps_arc700_nsim_defconfig

diff --git a/board/synopsys/nsim/readme.txt b/board/synopsys/nsim/readme.txt
new file mode 100644
index 0000000000..cc89cf87ac
--- /dev/null
+++ b/board/synopsys/nsim/readme.txt
@@ -0,0 +1,43 @@
+How to build it
+===============
+
+Configure build for the selected nSIM target. For instance, for
+ARC700 nSIM target use the following defauilt configuration:
+$ make snps_arc700_nsim_defconfig
+
+Optionally modify the configuration:
+$ make menuconfig
+
+Build:
+$ make
+
+How to use it
+=============
+
+Resulting image can be booted using ARC nSIM instruction set simulator.
+Free version of nSIM is available for download:
+- https://www.synopsys.com/cgi-bin/dwarcnsim/req1.cgi
+It provides nsimdrv binary for Linux that can be used stand-alone
+or with GDB.
+
+To run ARC700 image use the following command:
+$ nsimdrv \
+	-prop=nsim_mem-dev=uart0,kind=dwuart,base=0xf0000000,irq=24 \
+	-prop=icache=32768,64,2,0 \
+	-prop=dcache=32768,64,4,0 \
+	-prop=nsim_isa_enable_timer_0=1 \
+	-prop=nsim_isa_enable_timer_1=1 \
+	-prop=nsim_isa_host_timer=1 \
+	-prop=nsim_mmu=3 \
+	-prop=nsim_isa_family=a700 \
+	-prop=nsim_isa_atomic_option=1 \
+	-prop=nsim_isa_dpfp=none \
+	-prop=nsim_isa_shift_option=2 \
+	-prop=nsim_isa_swap_option=1 \
+	-prop=nsim_isa_bitscan_option=1 \
+	-prop=nsim_isa_sat=1 \
+	-prop=nsim_isa_mpy32=1 \
+	-prop=isa_counters=1 \
+	-prop=nsim_isa_pct_counters=8 \
+	-prop=nsim_isa_pct_size=48 \
+	output/images/vmlinux
diff --git a/configs/snps_arc700_nsim_defconfig b/configs/snps_arc700_nsim_defconfig
new file mode 100644
index 0000000000..3964924bed
--- /dev/null
+++ b/configs/snps_arc700_nsim_defconfig
@@ -0,0 +1,18 @@
+# Architecture
+BR2_arcle=y
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="arc700"
+
+# Linux headers same as kernel, a 6.0 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.0.8"
+BR2_LINUX_KERNEL_DEFCONFIG="nsim_700"
+BR2_LINUX_KERNEL_VMLINUX=y
+
+# Rootfs
+BR2_TARGET_ROOTFS_INITRAMFS=y
-- 
2.16.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
