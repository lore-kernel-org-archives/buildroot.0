Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB9ACD68ED
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 07:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A001360B65;
	Tue, 10 Oct 2023 07:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A001360B65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25-s2OrY2EQT; Tue, 10 Oct 2023 07:06:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B85B560BF3;
	Tue, 10 Oct 2023 07:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B85B560BF3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0068C1BF307
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 07:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE29E81D7D
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 07:06:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE29E81D7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0eAfBsFp6oJr for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 07:06:37 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 896EB81D5A
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 07:06:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 896EB81D5A
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50444e756deso7126346e87.0
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 00:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696921595; x=1697526395;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vomflwQRYubwd7NvxUlzhkChUvq4wrcjNJR8eHoDbDA=;
 b=Jyq+BH8ribNHfQQNEW57XUXNdMkwBU5tUmeHMEMBwhLRJfu1vNHUVv+h1xkbHqsp5/
 QphkMlnpjFEkhdUVtIglE3CkVQLyo+jP2Y8Lg6Rf+rR8HxMoLOd9MEVl4Oee+PWP7n+z
 V1XYpRXIyl7aTLzNIdfZCXvKDwUyKjf62doUdhscW0a0HOIbqdlnE3U2OwmoifHlAKGU
 Xvdf/x8hc0VZa/v3de7A9h+ZkzXqqrMHXYtLy/jRTbE0oDqVw1+ykqZL4/m61VYqrn8a
 VGYNXVggJ6gFqpCSBNIOdNLtFRm31xPXTQ5sFSWIW9E/xdXJf2zURmCe+I2/KYSAyFJQ
 V63Q==
X-Gm-Message-State: AOJu0Yy6RrhmyM6KJ0iztiOUY9huM2/FbQsFglD14WrKpNsYG13WiM+K
 HuNRGbGusYQ49ryzxJGaYDKHQT6MCCUc9PJJ
X-Google-Smtp-Source: AGHT+IHoSArfwujp39rKs+i9aaOMej5KWq4VmNRHF9Jqsgcv2Ingxwpot+tdZBIIagYoA/oXlPWRCQ==
X-Received: by 2002:ac2:5f62:0:b0:4fe:5860:7abf with SMTP id
 c2-20020ac25f62000000b004fe58607abfmr12036552lfc.13.1696921594714; 
 Tue, 10 Oct 2023 00:06:34 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a317:2237:5400:b107:2101:7b04:5326])
 by smtp.gmail.com with ESMTPSA id
 f22-20020ac25336000000b0050334e5f5a8sm1680019lfh.271.2023.10.10.00.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 00:06:34 -0700 (PDT)
From: Clement Ramirez <ramirez.clement3@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 09:05:58 +0200
Message-Id: <20231010070558.9791-1-ramirez.clement3@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696921595; x=1697526395; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vomflwQRYubwd7NvxUlzhkChUvq4wrcjNJR8eHoDbDA=;
 b=Cw5K1A0zxg8tit3gOYRnAVrMsmgWl/o2oQz/slnYQ8ZiL6lrHrite0X9QDDvT+bvWQ
 5yDMLn5i1q+XL5ZIe61lv1wK1f6pLTrV8oAG+K1sF9eXvSyxHitkNFETxbl9TP2hwqrO
 97cijPICY0ZWQNMS2CkIt0c6AkAYdjyXsB3v1FPoy8ACkRsapvg/rNjEW+zFQHCKh0gU
 jsRNp3PAqho+qbaLnts0yFKE7uz4MN/uUbaPGbrZ7GAabPVwZp6KX0gLqutk5Fa/97IV
 EUxYHsLfM4X35znYZv7zs6B/O/VmRdASkMMQhz2JHL4F54zOrIMr4YVyOlVpzULxHnNo
 sOBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Cw5K1A0z
Subject: [Buildroot] [PATCH] package/qemu: security bump version to 8.1.1
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Clement Ramirez <ramirez.clement3@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following CVEs :
    - CVE-2023-4135 (https://gitlab.com/qemu-project/qemu/-/commit/ecb1b7b082d3b7dceff0e486a114502fc52c0fdf)
    - CVE-2023-3354 (https://gitlab.com/qemu-project/qemu/-/commit/10be627d2b5ec2d6b3dce045144aa739eef678b4)
    - CVE-2023-3180 (https://gitlab.com/qemu-project/qemu/-/commit/9d38a8434721a6479fe03fb5afb150ca793d3980)

The changes between 8.1.0 and 8.1.1 are only limited to bug fixes:

6bb4a8a47a (v8.1.1) Update version for 8.1.1 release
045fa84784 tpm: fix crash when FD >= 1024 and unnecessary errors due to EINTR
56270e5d3d meson: Fix targetos match for illumos and Solaris.
60da8301fe s390x/ap: fix missing subsystem reset registration
8b479229ff ui: fix crash when there are no active_console
d4919bbcc2 virtio-gpu/win32: set the destroy function on load
cae7dc1452 target/riscv: Allocate itrigger timers only once
7385e00665 target/riscv/pmp.c: respect mseccfg.RLB for pmpaddrX changes
1d4fb5815c target/riscv: fix satp_mode_finalize() when satp_mode.supported = 0
b822207513 hw/riscv: virt: Fix riscv,pmu DT node path
2947da750e linux-user/riscv: Use abi type for target_ucontext
60a7f5c8fe hw/intc: Make rtc variable names consistent
566dac7127 hw/intc: Fix upper/lower mtime write calculation
8ae20123b6 target/riscv: Fix zfa fleq.d and fltq.d
6c24b6000b target/riscv: Fix page_check_range use in fault-only-first
987e90cfd2 target/riscv/cpu.c: add zmmul isa string
b9f83298b9 hw/char/riscv_htif: Fix the console syscall on big endian hosts
3d6251f416 hw/char/riscv_htif: Fix printing of console characters on big endian hosts
9832a670b3 arm64: Restore trapless ptimer access
df33ce9b6d virtio: Drop out of coroutine context in virtio_load()
eeee989f72 qxl: don't assert() if device isn't yet initialized
93d4107937 hw/net/vmxnet3: Fix guest-triggerable assert()
6356785daa docs tests: Fix use of migrate_set_parameter
01bf87c8e3 qemu-options.hx: Rephrase the descriptions of the -hd* and -cdrom options
25ec23ab3f hw/i2c/aspeed: Fix TXBUF transmission start position error
9dc6f05cc8 hw/i2c/aspeed: Fix Tx count and Rx size error in buffer pool mode
d5361580ac hw/ide/ahci: fix broken SError handling
e8f5ca57e4 hw/ide/ahci: fix ahci_write_fis_sdb()
4448c345bc hw/ide/ahci: PxCI should not get cleared when ERR_STAT is set
4fbd5a5202 hw/ide/ahci: PxSACT and PxCI is cleared when PxCMD.ST is cleared
16cc9594d2 hw/ide/ahci: simplify and document PxCI handling
1efefd13ca hw/ide/ahci: write D2H FIS when processing NCQ command
c2e0495e3c hw/ide/core: set ERR_STAT in unsupported command completion
f64f1f8704 target/ppc: Fix LQ, STQ register-pair order for big-endian
9f54fef2c0 target/ppc: Flush inputs to zero with NJ in ppc_store_vscr
5358980d33 hw/ppc/e500: fix broken snapshot replay
6864f05cb1 ppc/vof: Fix missed fields in VOF cleanup
0175121c6c ui/dbus: Properly dispose touch/mouse dbus objects
e975434d62 target/i386: raise FERR interrupt with iothread locked
e5e77f256f linux-user: Adjust brk for load_bias
645b87f650 target/arm: properly document FEAT_CRC32
86d7b08d71 block-migration: Ensure we don't crash during migration cleanup
5691fbf440 softmmu: Assert data in bounds in iotlb_to_section
441106eebb docs/about/license: Update LICENSE URL
63188a00bb target/arm: Fix 64-bit SSRA
7012e20b2d target/arm: Fix SME ST1Q
c8e381d672 accel/kvm: Specify default IPA size for arm64
34808d041c kvm: Introduce kvm_arch_get_default_type hook
01f6417f15 include/hw/virtio/virtio-gpu: Fix virtio-gpu with blob on big endian hosts
14a8213b75 target/s390x: Check reserved bits of VFMIN/VFMAX's M5
c12eddbd48 target/s390x: Fix VSTL with a large length
880e82ed78 target/s390x: Use a 16-bit immediate in VREP
5980189e96 target/s390x: Fix the "ignored match" case in VSTRS

Signed-off-by: Clement Ramirez <ramirez.clement3@gmail.com>
---
 package/qemu/qemu.hash | 2 +-
 package/qemu/qemu.mk   | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 506afa8bf3..61e51a923f 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  710c101198e334d4762eef65f649bc43fa8a5dd75303554b8acfec3eb25f0e55  qemu-8.1.0.tar.xz
+sha256  37ce2ef5e500fb752f681117c68b45118303ea49a7e26bd54080ced54fab7def  qemu-8.1.1.tar.xz
 sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 6aaed32336..167ae007f0 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, check whether the list of supported targets
 # needs to be updated.
-QEMU_VERSION = 8.1.0
+QEMU_VERSION = 8.1.1
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
@@ -16,6 +16,10 @@ QEMU_LICENSE_FILES = COPYING COPYING.LIB
 #       individual source files.
 QEMU_CPE_ID_VENDOR = qemu
 
+QEMU_IGNORE_CVES += CVE-2023-4135
+QEMU_IGNORE_CVES += CVE-2023-3354
+QEMU_IGNORE_CVES += CVE-2023-3180
+
 #-------------------------------------------------------------
 
 # The build system is now partly based on Meson.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
