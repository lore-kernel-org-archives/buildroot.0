Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16636C25B74
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 22:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE3B3830E6;
	Fri, 24 May 2024 22:11:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id egizEvro4Qzh; Fri, 24 May 2024 22:11:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3434831E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3434831E7;
	Fri, 24 May 2024 22:11:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D1B81CFF0C
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 22:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63E02830E6
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 22:11:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YuH8ZApCzcCK for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 22:11:34 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 24 May 2024 22:11:32 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D9346830A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9346830A7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.101;
 helo=smtpdh16-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9346830A7
 for <buildroot@buildroot.org>; Fri, 24 May 2024 22:11:32 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Ad1TssF9XbsngAd1TsgNpg; Sat, 25 May 2024 00:04:23 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 25 May 2024 00:04:21 +0200
Message-Id: <20240524220421.710392-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfG8hidiZm+krUrTcxqdiCz8kGfTba2qyL95RaawScoofVxUsnoo5QZ7wa1/a1wOyfqHD9fuD/WU0f0yOlHKgrLDfNWPZvDgjlJFF/x8QV1Bxmi6+Tlp2
 y06hsr20Zq4bR8w0I1gI4HXW2Lno/0bQwqTKsTxqTrTqVFGSSCQYwH+u4KXGFtKLUNmqkVrtlNZ0pfXEgXfUyJhPNFxeIIjFef5hnFT6Z96Sz5vZHit6yRIH
 buFt1InNjCh0LvyEpqH9jGd04hp0+nOzrsaLXDTu1kptNvlwkWHC4neJNJ9MqxDVG7jhIoQa1jiUTibBXoGQYQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1716588263; bh=y7BhbdxZELgrV5Mrvve7Rb9LEGmO4REQY++M99YrtlI=;
 h=From:To:Subject:Date:MIME-Version;
 b=DF45DLaa8ixrf0Gkw0U0HNzMypHrtEmUiJwtMJ8vSCHyOneFaU1td/A2u7+eix3RS
 KXOjMIV61r1OS9+48R0H2phqWTdZsXMT0nvxJk512+4Jfy3+Tb9KnNjxVkZS0+GxEt
 AzuoUl4ZsfwVXhM+80Az3YtLR4/KRxtc7iNRrFBv1OHdboxvFCN9VEOD2OEprqoWaI
 U0DbZBPMbkVV7JbqikodLBZzTqcfvI2w/7vEYw8+BvtdInlFamDpnjAXGZQoLPKb7P
 h05/8hk5cem2SI/T1Z65hYC0S958OzrLTq8UX0aAZdb9dN2lZSvQtpkOl1XCVpxwAf
 5KMHjvttqFdhA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=DF45DLaa
Subject: [Buildroot] [PATCH] configs/amarula_vyasa_rk3288_defconfig: add
 uboot and linux hashes
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
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add BR2_DOWNLOAD_FORCE_CHECK_HASHES and drop defconfig entry in
.checkpackageignore.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .checkpackageignore                    | 1 -
 boot/uboot/uboot.hash                  | 1 +
 configs/amarula_vyasa_rk3288_defconfig | 1 +
 linux/linux.hash                       | 1 +
 4 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index ebf320c3c5..9b9e4a61f9 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -122,7 +122,6 @@ configs/acmesystems_aria_g25_256mb_defconfig lib_defconfig.ForceCheckHash
 configs/acmesystems_arietta_g25_128mb_defconfig lib_defconfig.ForceCheckHash
 configs/acmesystems_arietta_g25_256mb_defconfig lib_defconfig.ForceCheckHash
 configs/am574x_idk_defconfig lib_defconfig.ForceCheckHash
-configs/amarula_vyasa_rk3288_defconfig lib_defconfig.ForceCheckHash
 configs/andes_ae350_45_defconfig lib_defconfig.ForceCheckHash
 configs/arcturus_ucls1012a_defconfig lib_defconfig.ForceCheckHash
 configs/arcturus_ucp1020_defconfig lib_defconfig.ForceCheckHash
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index a8021fb696..b0ffd7e69d 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,3 +1,4 @@
 # Locally computed:
+sha256  50b4482a505bc281ba8470c399a3c26e145e29b23500bc35c50debd7fa46bdf8  u-boot-2022.10.tar.bz2
 sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
index 0dd47f498f..c88fb761c3 100644
--- a/configs/amarula_vyasa_rk3288_defconfig
+++ b/configs/amarula_vyasa_rk3288_defconfig
@@ -5,6 +5,7 @@ BR2_ARM_FPU_NEON_VFPV4=y
 
 # Linux headers same as kernel, a 6.1 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
 # Bootloader
 BR2_TARGET_UBOOT=y
diff --git a/linux/linux.hash b/linux/linux.hash
index af82148e80..0d4de985ab 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -2,6 +2,7 @@
 sha256  f905f1238ea7a8e85314bacf283302e8097006010d25fcea726d0de0ea5bc9b6  linux-6.8.9.tar.xz
 sha256  b66a5b863b0f8669448b74ca83bd641a856f164b29956e539bbcb5fdeeab9cc6  linux-6.6.30.tar.xz
 sha256  83a3d72e764fceda2c1fc68a4ea6b91253a28da56a688a2b61776b0d19788e1d  linux-6.1.90.tar.xz
+sha256  880ace63ca2291b8b639e9bd862cc828649d3e1e00ccfee5861473debd2e4dec  linux-6.1.91.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  f9071c83a4fd8b80af026b48cfc1869bfa25883f9148b92b5dc1e1e1e26dd5c6  linux-5.15.158.tar.xz
 sha256  e310588c4b23f0959614e60f007afc20e9b1a8f296d682b041fa129f96fbe151  linux-5.10.216.tar.xz
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
