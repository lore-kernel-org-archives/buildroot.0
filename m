Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7725C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 17:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53DDD8142C;
	Mon, 15 Aug 2022 17:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53DDD8142C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q9gffdVfuMQl; Mon, 15 Aug 2022 17:18:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0A1D8141F;
	Mon, 15 Aug 2022 17:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0A1D8141F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 330431BF279
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 17:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D4E18141F
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 17:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D4E18141F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NKaCgL4G29Mq for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 17:17:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11AC7813F0
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com
 [148.163.156.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11AC7813F0
 for <buildroot@busybox.net>; Mon, 15 Aug 2022 17:17:58 +0000 (UTC)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27FGrQPf006106;
 Mon, 15 Aug 2022 10:17:56 -0700
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3hxaym7str-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 10:17:56 -0700
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 538B9C00F4;
 Mon, 15 Aug 2022 17:17:55 +0000 (UTC)
Received: from us01arcgnu2.internal.synopsys.com
 (us01arcgnu2.internal.synopsys.com [10.15.128.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 83DC4A0063;
 Mon, 15 Aug 2022 17:17:54 +0000 (UTC)
X-SNPS-Relay: synopsys.com
To: buildroot@busybox.net
Date: Mon, 15 Aug 2022 10:17:44 -0700
Message-Id: <20220815171744.105903-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
X-Proofpoint-ORIG-GUID: wkZ35RnXMtumtUfxHLdeg9zmNFYHI2Nm
X-Proofpoint-GUID: wkZ35RnXMtumtUfxHLdeg9zmNFYHI2Nm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-15_08,2022-08-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 clxscore=1011 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208150066
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=from : to : cc :
 subject : date : message-id; s=pfptdkimsnps;
 bh=peZR929VSHRDiPZLKS/XMrnFk4kluD+8pMhvBzfTupQ=;
 b=HOoT5NacEAsWoS5OGWc4tvlbs8QV5ci6PXILMF+kTvW3M5MnQyXmf78ZEJQdGJu0zCU5
 Z5KjEfigXVcL+D3dK/X1SD9j8TGcMGvIR4ZzD84g1w/DLiTg4Mi0SYptEuEwAE64zRaF
 HjL8CYk23yzvkBwfZU2ndKQwFePsa9YjaBVf2bckpA4UbpW1A5JdB51lpGZsc/Woo+Bz
 4Ld20m4rSLgcl6lzQNEx24F7KgcEyE623g83gDjrI1U3QwLnKjmnjV4gLE0Mj0Tjh7M8
 feXUEyqiJwmcFbJWck/Ui2gFyho3XsboHqUVlrSLR3H4SlHsvwC9q9XlIkC6d+fiWbr6 CA== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1660583875; bh=VFxwBQ8zC5I7t/NyvJ3e4BPjQxpZ47m8By1eS/vnniQ=;
 h=From:To:Cc:Subject:Date:From;
 b=eGbV2gSjyWYO9tX4yjWkpgtWxicK0D8V9NJdwdz2Y/MPL8FnvVaY6deG156mZe0yX
 OowFUHVw2nhNek03mgpUYFJaC/8KAjnYN8KWG+0H3epZn9oUdPnhIKEUwLzvhYIvnK
 S4gyTimWu2izNekJaxL9IqBSUDtNJTAxyaccjTCd1iLTJSDtSO/LJysIr+wYzP75CT
 7CuTGZGejBNEaj8d4ospNfFqTs0w62AB4ngrKq9nnKwz7WI0QEDeXh3hIzwGvoMCY+
 L6Ef6pR7XV3sV7KF3KyDhtkZzE6ZJ3dxgOiXOBzTUbV7OWugmHVpRx04ztJJFuI/gS
 uPrLTCVlCZNng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=HOoT5Nac; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=eGbV2gSj
Subject: [Buildroot] [PATCH] arch: Set common-page-size explicitly
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, l.stelmach@samsung.com,
 thomas.petazzoni@bootlin.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On some CPU architecures it's possible to use MMU pages of different
sizes. Those are for example are ARC & ARM. And while for use-space
applications page size is supposed to be transparent, there's still
some use of that extra information. In particular it's possible to
align data structures or code/data sections on page boundary, etc.

For these tricks to become possible tools which pack data (think of
the linker, like GNU "ld") need to be informed of the page size to
be considered.

Obviously, there're some sane defaults which are being used most of
the time, so we even think about that peculiarity, but when non-default
value needs to be used, GNU "ld" accepts 2 properties related to page
size:

 -z common-page-size=XXX
 -z max-page-size=YYY

And while in thery those might be different (but always "common" <= "max"),
and that might make sense if we build for some unknown platfrom,
in case of Buildroot when we build entire target's filesystem and so
know exactly the configuration we're targeting to, we may safely assume
"common-page-size"="max-page-size".

See a lengthly discussions in this thread [1].

Fixes:

  http://autobuild.buildroot.net/results/c8b2f331c98453670cd982558144c4fd84674a3d/ (uclibc)
  http://autobuild.buildroot.net/results/3a22f7aac38145b26c549254b819f87329e7a77e/ (glibc)

And while at it, recover use of "XX-page-size" for ARC, as with [2]
moving page size selection in the generic code we've got unexpected
override for ARC (note "=", but not "+="):
--------------------->8--------------------
ARCH_TOOLCHAIN_WRAPPER_OPTS = -matomic
--------------------->8--------------------

[1] https://lists.buildroot.org/pipermail/buildroot/2022-July/646176.html
[2] https://git.buildroot.net/buildroot/commit/?id=dcb74db89e74e512e36b32cea6f574a1a1ca84c4

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 arch/arch.mk     | 8 ++++----
 arch/arch.mk.arc | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arch.mk b/arch/arch.mk
index 96f11eba42..2e737b92ac 100644
--- a/arch/arch.mk
+++ b/arch/arch.mk
@@ -20,13 +20,13 @@ GCC_TARGET_MODE := $(call qstrip,$(BR2_GCC_TARGET_MODE))
 
 # Explicitly set LD's "max-page-size" instead of relying on some defaults
 ifeq ($(BR2_ARC_PAGE_SIZE_4K)$(BR2_ARM64_PAGE_SIZE_4K),y)
-ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=4096
+ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=4096 -Wl,-z,common-page-size=4096
 else ifeq ($(BR2_ARC_PAGE_SIZE_8K),y)
-ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=8192
+ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=8192 -Wl,-z,common-page-size=8192
 else ifeq ($(BR2_ARC_PAGE_SIZE_16K),y)
-ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=16384
+ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=16384 -Wl,-z,common-page-size=16384
 else ifeq ($(BR2_ARM64_PAGE_SIZE_64K),y)
-ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=65536
+ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=65536 -Wl,-z,common-page-size=65536
 endif
 
 # Include any architecture specific makefiles.
diff --git a/arch/arch.mk.arc b/arch/arch.mk.arc
index a6b56a869f..42037626a6 100644
--- a/arch/arch.mk.arc
+++ b/arch/arch.mk.arc
@@ -2,7 +2,7 @@ ifeq ($(BR2_arc),y)
 
 # -matomic is always required when the ARC core has the atomic extensions
 ifeq ($(BR2_ARC_ATOMIC_EXT),y)
-ARCH_TOOLCHAIN_WRAPPER_OPTS = -matomic
+ARCH_TOOLCHAIN_WRAPPER_OPTS += -matomic
 endif
 
 endif
-- 
2.16.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
