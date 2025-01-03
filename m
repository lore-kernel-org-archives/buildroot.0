Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A9FE77188
	for <buildroot@archiver.kernel.org>; Fri,  3 Jan 2025 14:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5EC28089C;
	Fri,  3 Jan 2025 14:33:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yj809V9_HaFU; Fri,  3 Jan 2025 14:33:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BB31805B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BB31805B7;
	Fri,  3 Jan 2025 14:33:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 32EF5F27
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 14:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E70E607C7
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 14:33:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LGZnAXwXKGrZ for <buildroot@buildroot.org>;
 Fri,  3 Jan 2025 14:33:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 31E6B60839
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31E6B60839
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31E6B60839
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 14:33:05 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:851f:aacd:bf36:fec8] (unknown
 [IPv6:2a01:e0a:12:eba0:851f:aacd:bf36:fec8])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 1B95CBFB50;
 Fri,  3 Jan 2025 15:33:02 +0100 (CET)
Message-ID: <93f83afb-6987-441c-8e06-dab4d43b828f@grenoble.cnrs.fr>
Date: Fri, 3 Jan 2025 15:33:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Buildroot development <buildroot@buildroot.org>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1735914782;
 bh=hgccOkCdONc/K5etL+PdcL1Vj+pfu25xANLijk/7D9c=;
 h=Date:To:Cc:From:Subject:From;
 b=NDfZXsPKFxDCPLdFVl2M9JIoW2IaHtgye+U49VlBDn/HMailEl2qLBPdtFqa5vyah
 GhZppVcqyRf+y1QyQUzjN4Fheh9apb1SS3q3Bm3OlU/TRWfmsN52+T9kC2qZ+KmarD
 jXlKot2jYhsrD/Ftfgh4TkAcQEiITLaD+bcP7Ud0TiKIs99YhjaHhfXAjKvNBtX8ws
 694uZuCienF5lpjW9u5Pye1yBG9OPbZu5qw2GUOanqM8ztRbXxDYuYBB0Zciwa9eAJ
 b72V9HGSeKA3pr/fMKA99lKpkuxSRsWTsIeHWbi0xxU1wyGdh1Cnss9w1oEaIJ13NH
 AyQ2oaVCw2vFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=NDfZXsPK
Subject: [Buildroot] [PATCH v3 1/1] linux: make out-of-tree DTS work with
 newest kernels
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Michael Walle <mwalle@kernel.org>, Sergey Matyukevich <geomatsi@gmail.com>,
 Romain Naour <romain.naour@smile.fr>, Chris Packham <judge.packham@gmail.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Linux 6.12, the Buildroot option BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
does not work as expected on arm, arm64, mips and ricv.[1] These are the
architectures that store the in-tree DTS files in vendor-specific
subdirectories of arch/$ARCH/boot/dts/.

BR2_LINUX_KERNEL_CUSTOM_DTS_PATH was introduced in Buildroot 2012.08
(commit 69fc497df0ae "Rework support for the device tree"). At the time,
the kernel kept all in-tree DTS files directly in arch/$ARCH/boot/dts/,
and this is where Buildroot drops the user's custom DTS. Vendor-specific
subdirectories appeared in Linux v3.19 for the arm64 architecture, and
this scheme was later adopted by mips, riscv and arm.

For these architectures, Linux 6.12 (commit e7e2941300d2, "kbuild: split
device tree build rules into scripts/Makefile.dtbs") made the DTB build
infrastructure incompatible with the way
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH is implemented. This infrastructure now
expects all DTS files to be in vendor-specific subdirectories on the
architectures that use this scheme. Fulfilling this kernel expectation
would require a new configuration parameter for the name of the
appropriate vendor subdirectory. It would also require changing the
relative paths to included .dtsi files.

Let's add instead a rule to the top dts/Makefile for each DTB we want to
build. This avoids breaking user's out-of-tree configurations.

[1] https://lists.buildroot.org/pipermail/buildroot/2024-October/765463.html

Reported-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
Changes v2 -> v3:
  - note, in the comment and in the log message, that this issue only
    affects some architectures
  - expand the log message with some historical context
These changes were suggested by Romain Naour.

Changes v1 -> v2:
  - define a hook for LINUX_POST_PATCH_HOOKS and LINUX_POST_RSYNC_HOOKS
    instead of modifying LINUX_BUILD_CMDS
  - use $(patsubst %.dts,%.dtb,$(dts)) instead of $(dts:%.dts=%.dtb)
both changes suggested by Arnout Vandecappelle.

This was build-tested with an Acqua defconfig,
in the same manner as v2:

    # Test with an old kernel: v6.6.30
    make acmesystems_acqua_a5_512mb_defconfig
    make linux

    # Test with a new kernel: v6.12.8
    make linux-dirclean
    git am bump_Acqua_kernel_to_v6.12.8.patch
    make acmesystems_acqua_a5_512mb_defconfig
    make linux

    # Test the OVERRIDE_SRCDIR case.
    make linux-dirclean
    git -C $HOME/src/linux checkout v6.12.8
    echo "LINUX_OVERRIDE_SRCDIR = $HOME/src/linux" > local.mk
    make acmesystems_acqua_a5_512mb_defconfig
    make linux
---
 linux/linux.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 12699b8ee4..e6e8a3c3bc 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -327,6 +327,17 @@ define LINUX_TRY_PATCH_TIMECONST
 endef
 LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_TIMECONST
 
+# On some architectures, kernels 6.12+ won't compile the custom DTS
+# files we drop into arch/$ARCH/boot/dts unless we add specific rules to
+# that directory's Makefile.
+define LINUX_ADD_DTB_MAKE_RULES
+	$(foreach dts,$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)), \
+		echo "dtb-y += $(patsubst %.dts,%.dtb,$(notdir $(dts)))" >> $(LINUX_ARCH_PATH)/boot/dts/Makefile
+	)
+endef
+LINUX_POST_PATCH_HOOKS += LINUX_ADD_DTB_MAKE_RULES
+LINUX_POST_RSYNC_HOOKS += LINUX_ADD_DTB_MAKE_RULES
+
 LINUX_KERNEL_CUSTOM_LOGO_PATH = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH))
 ifneq ($(LINUX_KERNEL_CUSTOM_LOGO_PATH),)
 LINUX_DEPENDENCIES += host-imagemagick
-- 
2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
