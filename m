Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CFDC25B78
	for <buildroot@archiver.kernel.org>; Sat, 25 May 2024 14:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65B0782142;
	Sat, 25 May 2024 14:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytqT94AyR3SF; Sat, 25 May 2024 14:06:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C1FE82146
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C1FE82146;
	Sat, 25 May 2024 14:06:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D40E1BF408
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 14:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 499E382146
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 14:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k_n9a-leZF6l for <buildroot@lists.busybox.net>;
 Sat, 25 May 2024 14:06:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.133;
 helo=smtpdh18-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9DE6182142
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DE6182142
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DE6182142
 for <buildroot@buildroot.org>; Sat, 25 May 2024 14:06:45 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id As2ksGTGHV0F9As2ksdCFq; Sat, 25 May 2024 16:06:43 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 25 May 2024 16:06:41 +0200
Message-Id: <20240525140641.1374683-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIlHiGS0bdOsju9/dpRAN5cbO9CbG0dKg0Bngo01pHFG1WwmtG70dWWhDXznq/cwRzKgPEd3Ggg2krHNl1kTcYrxL+sArPENgBg26+pNftv64rJ71oWC
 xCyg9AZqb5FJS53YVmWMGXKOJyUZO/UlwH7LwHrrvdkHMDAzFk+ENk1SxD2r8V+oxttNCR/5udn47wkCHFZobec/d4gKqyrpXcF/1Od2GvLvAIRYzzNIHIw5
 R3BXF5sz6byyp3HHPDhvAMq0Jb5DsnbQ/v0wgRRaPL8Xis9Yu1YO+ESPV7bUNAfHUW1E6Vrprlj0LpNRtbh2eg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1716646003; bh=/tWDf9ldc3Yeskn0E4SL5c0ZRlWCXfjYDZkEwgrlHjY=;
 h=From:To:Subject:Date:MIME-Version;
 b=g6ORJV/x7VVoasWteHE2iS4rXF/1JOyNKxqGOXRTl7E1hEW5BD2dluWoaK9J/sSkY
 3OvXttBUATNHAqacow+smOoE4y9hFmy02Eee2kjySYoqQfvVJKRslXxAzxesr9WhWp
 Dup6IYkSrM+QGIusvDulbedXFSYRDQqtpiyyIpc7IVRkP1quPD3EFpJGPA+7r2Mxus
 9L/K1DOZdPvVeb/jWJAHjlE0Nnd0jktRGbjsFaOL83SVKdGxOOl2g83f50eWlWrIjX
 H/9Y1P4cRVOnuhqbKESGE1Sxr1ynxv1IW/7iBYyVljOFvpB09fwXilGp/au9Lhq0xy
 mJadP8jwWvKvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=g6ORJV/x
Subject: [Buildroot] [PATCH v2] configs/amarula_vyasa_rk3288_defconfig: add
 uboot, linux, linux-headers hashes
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

Add global patch directory pointing to board specific .hash files
for uboot, linux, linux-headers and add BR2_DOWNLOAD_FORCE_CHECK_HASHES.
This way we can drop this defconfig entry in .checkpackageignore.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .checkpackageignore                                          | 1 -
 board/amarula/vyasa/patches/linux-headers/linux-headers.hash | 1 +
 board/amarula/vyasa/patches/linux/linux.hash                 | 2 ++
 board/amarula/vyasa/patches/uboot/uboot.hash                 | 2 ++
 configs/amarula_vyasa_rk3288_defconfig                       | 2 ++
 5 files changed, 7 insertions(+), 1 deletion(-)
 create mode 120000 board/amarula/vyasa/patches/linux-headers/linux-headers.hash
 create mode 100644 board/amarula/vyasa/patches/linux/linux.hash
 create mode 100644 board/amarula/vyasa/patches/uboot/uboot.hash

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
diff --git a/board/amarula/vyasa/patches/linux-headers/linux-headers.hash b/board/amarula/vyasa/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/amarula/vyasa/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/amarula/vyasa/patches/linux/linux.hash b/board/amarula/vyasa/patches/linux/linux.hash
new file mode 100644
index 0000000000..b763fc947a
--- /dev/null
+++ b/board/amarula/vyasa/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  880ace63ca2291b8b639e9bd862cc828649d3e1e00ccfee5861473debd2e4dec  linux-6.1.91.tar.xz
diff --git a/board/amarula/vyasa/patches/uboot/uboot.hash b/board/amarula/vyasa/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..5e017f5499
--- /dev/null
+++ b/board/amarula/vyasa/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  50b4482a505bc281ba8470c399a3c26e145e29b23500bc35c50debd7fa46bdf8  u-boot-2022.10.tar.bz2
diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
index 0dd47f498f..2267d49afc 100644
--- a/configs/amarula_vyasa_rk3288_defconfig
+++ b/configs/amarula_vyasa_rk3288_defconfig
@@ -5,6 +5,8 @@ BR2_ARM_FPU_NEON_VFPV4=y
 
 # Linux headers same as kernel, a 6.1 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_GLOBAL_PATCH_DIR="board/amarula/vyasa/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
 # Bootloader
 BR2_TARGET_UBOOT=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
