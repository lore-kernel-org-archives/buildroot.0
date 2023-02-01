Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C822C636D4
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 22:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD9B140002;
	Wed,  1 Feb 2023 22:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD9B140002
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pd-yga_7G5d2; Wed,  1 Feb 2023 22:33:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BC684016F;
	Wed,  1 Feb 2023 22:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BC684016F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39FA81BF47F
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 22:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1393060FB0
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 22:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1393060FB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XK4CvS-dJ-9O for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 22:32:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D8CC60D4E
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D8CC60D4E
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 22:32:44 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id NLekpeh5dvodANLelpwuvy; Wed, 01 Feb 2023 23:32:44 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  1 Feb 2023 23:32:37 +0100
Message-Id: <20230201223241.3867678-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201223241.3867678-1-giulio.benetti@benettiengineering.com>
References: <20230201223241.3867678-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHx0opEOFD0m8Wd5y0YKymLKMxwAcVQVwUmah0myaD/0L/m+lziVFSt8tTKC1CnAFuZotZWgNTvHjRVKcJQXTkD2CNP1w80/rghyFAcoVxOh6kjynPPJ
 WJGf8htjbp3u4AVmDAQpnz4EzXWwD4Jiwq9B9cz5Vbt8rIB2vWHJG52WVrE+t9U7w+mU75jmgPNBPcDxICaFacSgC9Prpi4YaSH41COfdOYvWaPX6IIlaz52
 THG7mnXdXxFubkanPIGEOTKSQL5p1SsapRQpAWpIFSA79STn0AuS23fG0HcK2T0RLCJXfb+xIUzwYaUu9Ppdvzyw/6ZzkJ6nJC6q23Z+oeRN59fB8/fGQdEJ
 IWUMyriOMWoiSjNCdHfnKvFqdoYtEeIv8SkhLePBWe0S1iSNeWTSoLrcHImb8FVG8NbuSS1AYM9yl7w+sbbHZe02pPevPA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1675290764; bh=xuNbKzM4qQYwxWyZN2/+trllzXnkIEjof1PEkrDK8go=;
 h=From:To:Subject:Date:MIME-Version;
 b=imc9fFI/GvmSQ9qF20sH5YTztil0GwZfcfibRwvtGxmOzIxlyK1da/KF0DZ78Hwvb
 ey/bbBUPy636VqMdeJAaovF8puN+soNYlmPFNJOO6Yk7aMlM9tlJmUd4SzS9L0l/dO
 QU5ndOWIop/lpiTsVSuMrK+vfFr+0yC91Uwv2ouo6HzpU04EQziv8nFRgiUL4l1upK
 uwP4c3M2+UGCTJetzBW4K0rypVT06Rw5HqgEbnwqhjEXC9SF35SiVbMb3vtuHVa9dl
 /YzxjLfXobCw5xESAbGrh1/npbstp6UlJj/dHIHiHNY3DWJDsRdRsA6+xNG/atAd8P
 1zosWQQct6GIw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=imc9fFI/
Subject: [Buildroot] [PATCH 3/7]
 configs/olimex_a20_olinuxino_lime2_defconfig: bump Linux to 6.1.9
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Leon Anavi <leon.anavi@konsulko.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/olimex_a20_olinuxino_lime2_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index a0ebcaed66..50a0986ab2 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_EABIHF=y
 
-# Linux headers same as kernel, a 5.15 LTS series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+# Linux headers same as kernel, a 6.1 LTS series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # Toolchain
 # glibc is needed for sunxi-mali-utgard package.
@@ -22,7 +22,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.86"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.9"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
