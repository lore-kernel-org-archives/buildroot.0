Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E219C25B78
	for <buildroot@archiver.kernel.org>; Sat, 25 May 2024 19:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B77E405CC;
	Sat, 25 May 2024 19:41:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LcsvE8EY0pgI; Sat, 25 May 2024 19:41:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AF41405E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AF41405E3;
	Sat, 25 May 2024 19:41:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A2661D08C2
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 19:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33CBB4060B
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 19:41:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gfHKV4w19pPL for <buildroot@lists.busybox.net>;
 Sat, 25 May 2024 19:41:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FDB8405E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FDB8405E3
 for <buildroot@buildroot.org>; Sat, 25 May 2024 19:41:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CCF887604; Sat, 25 May 2024 19:41:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 25 May 2024 18:48:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96e41a849e128b580507f65ca25ffc8233e227d3
X-Git-Newrev: a808203c90e4988bdb7599678e5738925b8ab3f0
X-Patchwork-Hint: ignore
Message-Id: <20240525194130.1CCF887604@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/amarula_vyasa_rk3288_defconfig:
 add uboot, linux, linux-headers hashes
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a808203c90e4988bdb7599678e5738925b8ab3f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add global patch directory pointing to board specific .hash files
for uboot, linux, linux-headers and add BR2_DOWNLOAD_FORCE_CHECK_HASHES.
This way we can drop this defconfig entry in .checkpackageignore.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                          | 1 -
 board/amarula/vyasa/patches/linux-headers/linux-headers.hash | 1 +
 board/amarula/vyasa/patches/linux/linux.hash                 | 2 ++
 board/amarula/vyasa/patches/uboot/uboot.hash                 | 2 ++
 configs/amarula_vyasa_rk3288_defconfig                       | 2 ++
 5 files changed, 7 insertions(+), 1 deletion(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
