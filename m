Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40E9C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 19:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A43C6158A;
	Fri,  5 Jan 2024 19:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A43C6158A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7MjRMLt9z9JK; Fri,  5 Jan 2024 19:17:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35A316158F;
	Fri,  5 Jan 2024 19:17:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35A316158F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 379091BF841
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 19:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BAD142418
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 19:17:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BAD142418
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sQZAxZle0GKE for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 19:17:31 +0000 (UTC)
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com
 [148.163.158.9])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1ECE42265
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 19:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1ECE42265
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
 by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 405H0qdR012894; Fri, 5 Jan 2024 11:17:28 -0800
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3ve9843t4t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jan 2024 11:17:27 -0800 (PST)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0F5C640556;
 Fri,  5 Jan 2024 19:17:25 +0000 (UTC)
Received: from us01arcgnu3.internal.synopsys.com (unknown [10.194.34.166])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 15BC9A0071;
 Fri,  5 Jan 2024 19:17:25 +0000 (UTC)
X-SNPS-Relay: synopsys.com
To: buildroot@buildroot.org
Date: Fri,  5 Jan 2024 11:17:10 -0800
Message-Id: <20240105191710.1330461-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: AwxcvvFtgmjwE1pxgkibQPHaV7jGqtYn
X-Proofpoint-GUID: AwxcvvFtgmjwE1pxgkibQPHaV7jGqtYn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 malwarescore=0 bulkscore=0 mlxlogscore=902 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401050156
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=pfptdkimsnps; bh=bfWGUuIeCiBBdCTvR
 AeOncjTBiPGrfMk5NZouWTKfaA=; b=g70v+AItzZ9FPGd0YwSczktcCdtb0ItqY
 y6s9qarZZdhTFSHhLi3Kb+KXGvu+F0Uo8D9Z8UHiAmx19Y5HkbUtzrFORqQ5Ata3
 rX2u0l43w5c0bKfDCQtoiQz1ymKMmlzGUxr7jH76rB+SvKng9Ejbh4NtBWJEbkZZ
 ckJaVCi69gM55IBkLYfFjK2W2vCb9PGYLv9jjGvD3LsEy5pF4I7KAqk8QoJq8klz
 pdAlNIXHyyhFrVBh5YIpDCxMiOnwFLODtBBu3rhnuitfEjrpLhsJ9bg1jBIh3/KO
 QSiO2ibJacTqzDrntrQG0R65RJ2wAU6v76JMn/3kxnsoO6PiJO1aQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1704482246; bh=AtF/UluQjHNTR5veIxBPX5WKfzPANQg9N/Hy0KjcyFs=;
 h=From:To:Cc:Subject:Date:From;
 b=kOyiYRoy0kPv4XnHkinVeSEySCWqLlgigYYztoYReH7IyT6EQrx/r8hMmmOzW5X6w
 mXvRbUyEs98JK9V0Y8fPDa/aN3fGwUtj6FPxQ7bqyqvfcoDCqx4t8tsxG9+4gT8xau
 FA0wu9rJEqsz3A3S7RJe5F57Q5z5t+BB+cU3msFZayuliBHubQiYLwOUAcE/eyYAMz
 Jl3ANXI7kAPTp1U6nm8u5yXQ9LLmq96SRPJdnQz3nKQqrQ82hwZCLEAI6xH1O9GeCu
 L1NSBfoGm4QVlam/g885XdyC+S2OrRjHQn8VgErlSHWJYXsR8j/sPVmPHQVWChnaHt
 JAXKCbpVi9FWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=g70v+AIt; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=kOyiYRoy
Subject: [Buildroot] [PATCH v2] arch: Set max/common-page-size for libgcc &
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

What's nice, we're getting rid of a special handling of "-matomic"
as it's already a part of ARCH_TOOLCHAIN_WRAPPER_OPTS.

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

Changes in v2:

 * Instead of setting TARGET_{C|LD}FLAGS use
   ARCH_TOOLCHAIN_WRAPPER_OPTS for configuring GCC.

 package/gcc/gcc.mk | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 93bc46643c..94935d79a2 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -98,23 +98,24 @@ HOST_GCC_COMMON_CONF_ENV = \
 HOST_GCC_COMMON_MAKE_OPTS = \
 	gcc_cv_prog_makeinfo_modern=no
 
-GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
-GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
+# Target binaries and libraries which are being built as a part of GCC
+# don't use Buildroot toolchain wrapper because, instead its very own "xgcc"
+# binary is used. And so we need to explicitly propagate ALL the flags
+# directly to "xgcc" and that is done via configure-time environment
+# variables, see below setup of HOST_GCC_COMMON_CONF_ENV.
+GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS) $(ARCH_TOOLCHAIN_WRAPPER_OPTS)
+GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS) $(ARCH_TOOLCHAIN_WRAPPER_OPTS)
+GCC_COMMON_TARGET_LDFLAGS = $(TARGET_LDFLAGS) $(ARCH_TOOLCHAIN_WRAPPER_OPTS)
 
 # used to fix ../../../../libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
 ifeq ($(BR2_ENABLE_DEBUG),y)
 GCC_COMMON_TARGET_CFLAGS += -Wno-error
 endif
 
-# Make sure libgcc & libstdc++ always get built with -matomic on ARC700
-ifeq ($(GCC_TARGET_CPU):$(BR2_ARC_ATOMIC_EXT),arc700:y)
-GCC_COMMON_TARGET_CFLAGS += -matomic
-GCC_COMMON_TARGET_CXXFLAGS += -matomic
-endif
-
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
