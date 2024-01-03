Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B56C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 10:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4254F40B64;
	Wed,  3 Jan 2024 10:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4254F40B64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F9qzWAimt0dU; Wed,  3 Jan 2024 10:23:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B3E440B5D;
	Wed,  3 Jan 2024 10:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B3E440B5D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CE0E1BF409
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 10:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 432FC414FE
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 10:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 432FC414FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4h57SSPN8He0 for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 10:23:31 +0000 (UTC)
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com
 [148.163.158.9])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD64F4021C
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 10:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD64F4021C
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
 by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4035EvOG007019; Wed, 3 Jan 2024 02:23:23 -0800
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3vajqfyks9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jan 2024 02:23:22 -0800 (PST)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 72A9B401CE;
 Wed,  3 Jan 2024 10:23:21 +0000 (UTC)
Received: from us01arcgnu3.internal.synopsys.com
 (us01arcgnu3.internal.synopsys.com [10.194.34.166])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 98418A0083;
 Wed,  3 Jan 2024 10:23:20 +0000 (UTC)
X-SNPS-Relay: synopsys.com
To: buildroot@buildroot.org
Date: Wed,  3 Jan 2024 02:23:11 -0800
Message-Id: <20240103102311.4048759-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: CargpvGimow-kQX_wMDgtlYG-0CMTFBM
X-Proofpoint-GUID: CargpvGimow-kQX_wMDgtlYG-0CMTFBM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 clxscore=1011 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 mlxlogscore=631 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401030085
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=pfptdkimsnps; bh=+uimIblkhVJHc5O4o
 pvucv7dJTpV1z/XsK1CWH3FaTc=; b=FRszWxucUVbekmJ3gezqdpxM8ZVlAHALH
 R5RAsW7unnxc6zra/Y0bT0hx1uFLOseiLfBB6XdO4AF9mkgRNXl+c7W388gAtbV8
 dugdOuX5WQBQUaaQwKes57pPxgo0LcYo5Y88Ocf9/w5yzWyD0lHisPjD4kRpwV5o
 8BIl6s61JlH/UtcObGKt8LX88r3JmbKpqL9xl5OCSI8aEXmir0s/5wsDH3CkFyfp
 9BA2UUxdVzkh0fLBXXhKf7rZT4gh7e8ExnXkj7busA4woS0NNAEJWF0ZGcMTKDyH
 V//kNzhPtMvedmMP7F7K7I9okB3/VDX/AKZKNgR4hSLgUYPzH84HA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1704277401; bh=6NkI8Ckle5k6SjoFc2T9t8rIXqC56/Y/3RDpI4ynGn0=;
 h=From:To:Cc:Subject:Date:From;
 b=QuLwpF8M/3CXpZpTq4cR0XnXmFvt06ZUodXyzcsghW79G7tJeyGVrTnH6/XZtonVV
 EWwrgAQVzvZgTXwUen2Rayx4qrTLSg6kMgnBua/fgZMuXwuNX3qUdsotfpabY11XMv
 Noh67pFdLhpDyh+Sji9zMCjkMCeorGqJfXnSbB3BPpY7/IyuSFGWccbjf7GL0hWVtZ
 XWgqDwqbuER9sUef1x9Szob03h3sOrK+enygBkaNtTwDnrjd5DpNAuvTiJKPc/oqoT
 ZpX1Wm3TPB62r6UY/Bc8Ubl5z0HI6AL6JA+j+iObDugp7w9m7pyCk5n1Y2/75xZNoM
 OkpLKjLZid78A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=FRszWxuc; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=QuLwpF8M
Subject: [Buildroot] [PATCH] arch: Set max/common-page-size for libgcc &
 libstdc++
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
Cc: Vladimir Isaev <VVIsaev@gmail.com>,
 Pavel Kozlov <Pavel.Kozlov@synopsys.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With [1], [2] & [3] we made sure Buildroot packages get built with
proper MMU page size assumed. This was done nicely through insertion of
required flags into the toolchain wrapper so that there's no need to
pass these flags to each and every package separately - toolchain
wrapper used for real building has all set internally and so proper
flags are impleicitly used.

But there's yet another corner case which is not handled that way -
these are binaries or rather libraries which are being used as a part of
GCC compilation: libgcc_s.so.1 and libstdc++.so.

And so to make sure both the libraries get built properly we need to set
TARGET_CFLAGS (cures libgcc_s.so) & TARGET_LDFLAGS (cures libstdc++.so).

In case of ARM by defaut 64 KiB page size seems to be used, as w/o that
patch I see the following for BR2_ARM64_PAGE_SIZE_4K=y:
--------------------------->8----------------------------
$ ./output/host/bin/aarch64-linux-readelf -l ./output/target/lib/libgcc_s.so.1

Elf file type is DYN (Shared object file)
Entry point 0x0
There are 6 program headers, starting at offset 64

Program Headers:
  Type           Offset             VirtAddr           PhysAddr
                 FileSiz            MemSiz              Flags  Align
  LOAD           0x0000000000000000 0x0000000000000000 0x0000000000000000
                 0x0000000000013d1c 0x0000000000013d1c  R E    0x10000
  LOAD           0x000000000001fd98 0x000000000002fd98 0x000000000002fd98
                 0x0000000000000438 0x00000000000005c8  RW     0x10000
  DYNAMIC        0x000000000001fdb8 0x000000000002fdb8 0x000000000002fdb8
                 0x0000000000000200 0x0000000000000200  RW     0x8

$ ./output/host/bin/aarch64-linux-readelf -l ./output/target/usr/lib/libstdc++.so.6.0.32

Elf file type is DYN (Shared object file)
Entry point 0x0
There are 7 program headers, starting at offset 64

Program Headers:
  Type           Offset             VirtAddr           PhysAddr
                 FileSiz            MemSiz              Flags  Align
  LOAD           0x0000000000000000 0x0000000000000000 0x0000000000000000
                 0x00000000001d3462 0x00000000001d3462  R E    0x10000
  LOAD           0x00000000001d5760 0x00000000001e5760 0x00000000001e5760
                 0x000000000000e528 0x0000000000012de8  RW     0x10000
  DYNAMIC        0x00000000001deef0 0x00000000001eeef0 0x00000000001eeef0
                 0x0000000000000240 0x0000000000000240  RW     0x8
--------------------------->8----------------------------

Note alignment of 0x10000 in sections marked for loading.
And with the patch applied we get expected alignment of 0x1000 (4 KiB):
--------------------------->8----------------------------
$ ./output/host/bin/aarch64-linux-readelf -l ./output/target/lib/libgcc_s.so.1

Elf file type is DYN (Shared object file)
Entry point 0x0
There are 6 program headers, starting at offset 64

Program Headers:
  Type           Offset             VirtAddr           PhysAddr
                 FileSiz            MemSiz              Flags  Align
  LOAD           0x0000000000000000 0x0000000000000000 0x0000000000000000
                 0x0000000000013d1c 0x0000000000013d1c  R E    0x1000
  LOAD           0x0000000000013d98 0x0000000000014d98 0x0000000000014d98
                 0x0000000000000438 0x00000000000005c8  RW     0x1000
  DYNAMIC        0x0000000000013db8 0x0000000000014db8 0x0000000000014db8
                 0x0000000000000200 0x0000000000000200  RW     0x8

$ ./output/host/bin/aarch64-linux-readelf -l ./output/target/usr/lib/libstdc++.so.6.0.32

Elf file type is DYN (Shared object file)
Entry point 0x0
There are 7 program headers, starting at offset 64

Program Headers:
  Type           Offset             VirtAddr           PhysAddr
                 FileSiz            MemSiz              Flags  Align
  LOAD           0x0000000000000000 0x0000000000000000 0x0000000000000000
                 0x00000000001d3462 0x00000000001d3462  R E    0x1000
  LOAD           0x00000000001d3760 0x00000000001d4760 0x00000000001d4760
                 0x000000000000e528 0x0000000000012de8  RW     0x1000
  DYNAMIC        0x00000000001dcef0 0x00000000001ddef0 0x00000000001ddef0
                 0x0000000000000240 0x0000000000000240  RW     0x8
--------------------------->8----------------------------

I would agree that it gets more and more ugly, but so far I cannot see
any more elegant solution. So if there're suggestions how to improve,
let's discuss.

[1] https://git.buildroot.net/buildroot/commit/?id=3cc2c6d19ab2e1bb4634f26f9318da9b07df5fff
[2] https://git.buildroot.net/buildroot/commit/?id=dcb74db89e74e512e36b32cea6f574a1a1ca84c4
[3] https://git.buildroot.net/buildroot/commit/?id=5e52c28397b79f8c4c99552217cbe95202166626

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Vladimir Isaev <VVIsaev@gmail.com>
Signed-off-by: Pavel Kozlov <kozlov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 arch/arch.mk       | 8 ++++++++
 package/gcc/gcc.mk | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/arch/arch.mk b/arch/arch.mk
index 2e737b92ac..23733eb199 100644
--- a/arch/arch.mk
+++ b/arch/arch.mk
@@ -21,12 +21,20 @@ GCC_TARGET_MODE := $(call qstrip,$(BR2_GCC_TARGET_MODE))
 # Explicitly set LD's "max-page-size" instead of relying on some defaults
 ifeq ($(BR2_ARC_PAGE_SIZE_4K)$(BR2_ARM64_PAGE_SIZE_4K),y)
 ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=4096 -Wl,-z,common-page-size=4096
+TARGET_CFLAGS += -Wl,-z,max-page-size=4096 -Wl,-z,common-page-size=4096
+TARGET_LDFLAGS += -Wl,-z,max-page-size=4096 -Wl,-z,common-page-size=4096
 else ifeq ($(BR2_ARC_PAGE_SIZE_8K),y)
 ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=8192 -Wl,-z,common-page-size=8192
+TARGET_CFLAGS += -Wl,-z,max-page-size=8192 -Wl,-z,common-page-size=8192
+TARGET_LDFLAGS += -Wl,-z,max-page-size=8192 -Wl,-z,common-page-size=8192
 else ifeq ($(BR2_ARC_PAGE_SIZE_16K),y)
 ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=16384 -Wl,-z,common-page-size=16384
+TARGET_CFLAGS += -Wl,-z,max-page-size=16384 -Wl,-z,common-page-size=16384
+TARGET_LDFLAGS += -Wl,-z,max-page-size=16384 -Wl,-z,common-page-size=16384
 else ifeq ($(BR2_ARM64_PAGE_SIZE_64K),y)
 ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=65536 -Wl,-z,common-page-size=65536
+TARGET_CFLAGS += -Wl,-z,max-page-size=65536 -Wl,-z,common-page-size=65536
+TARGET_LDFLAGS += -Wl,-z,max-page-size=65536 -Wl,-z,common-page-size=65536
 endif
 
 # Include any architecture specific makefiles.
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 93bc46643c..d9a2164c74 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -100,6 +100,7 @@ HOST_GCC_COMMON_MAKE_OPTS = \
 
 GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
 GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
+GCC_COMMON_TARGET_LDFLAGS = $(TARGET_LDFLAGS)
 
 # used to fix ../../../../libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
 ifeq ($(BR2_ENABLE_DEBUG),y)
@@ -115,6 +116,7 @@ endif
 # Propagate options used for target software building to GCC target libs
 HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CFLAGS)"
 HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
+HOST_GCC_COMMON_CONF_ENV += LDFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_LDFLAGS)"
 HOST_GCC_COMMON_CONF_ENV += AR_FOR_TARGET=gcc-ar NM_FOR_TARGET=gcc-nm RANLIB_FOR_TARGET=gcc-ranlib
 
 # libitm needs sparc V9+
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
