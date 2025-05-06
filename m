Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDEAC3ABBF
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 08:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5477760645;
	Tue,  6 May 2025 08:58:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1UrzIhGHwKOQ; Tue,  6 May 2025 08:58:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89C5E60C0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89C5E60C0E;
	Tue,  6 May 2025 08:58:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 99DFE20F8
 for <buildroot@buildroot.org>; Tue,  6 May 2025 08:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B38040AFD
 for <buildroot@buildroot.org>; Tue,  6 May 2025 08:57:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Duv0kfrxbb3M for <buildroot@buildroot.org>;
 Tue,  6 May 2025 08:57:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7969440ADB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7969440ADB
 for <buildroot@buildroot.org>; Tue,  6 May 2025 08:57:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65307864FE; Tue,  6 May 2025 08:57:57 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 May 2025 10:19:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a31dc4c21a2309e142daf662355b14a5f18be284
X-Git-Newrev: 108af0293504d6ad8858df8e580c347da6e42498
X-Patchwork-Hint: ignore
Message-Id: <20250506085757.65307864FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx28evk: Rename the defconfig
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=108af0293504d6ad8858df8e580c347da6e42498
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The i.MX defconfig files follow the following name pattern:

- freescale_<board_name>_defconfig when it uses software components,
such as kernel and U-Boot from NXP.
- <SoC_name><board_name>_defconfig when it uses software components,
such as kernel and U-Boot from upsream.

This imx28evk target uses U-Boot and kernel from upstream, so rename it to
imx28evk_defconfig for consistency.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                          | 2 +-
 board/freescale/imx28evk/readme.txt                          | 2 +-
 configs/{freescale_imx28evk_defconfig => imx28evk_defconfig} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 997ed1b896..7bfc457c90 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -139,7 +139,7 @@ configs/engicam_imx6qdl_icore_qt5_defconfig lib_defconfig.ForceCheckHash
 configs/engicam_imx6qdl_icore_rqs_defconfig lib_defconfig.ForceCheckHash
 configs/engicam_imx6ul_geam_defconfig lib_defconfig.ForceCheckHash
 configs/engicam_imx6ul_isiot_defconfig lib_defconfig.ForceCheckHash
-configs/freescale_imx28evk_defconfig lib_defconfig.ForceCheckHash
+configs/imx28evk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_p1025twr_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_t1040d4rdb_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_t2080_qds_rdb_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/freescale/imx28evk/readme.txt b/board/freescale/imx28evk/readme.txt
index 3b77634fe1..5520ff1f05 100644
--- a/board/freescale/imx28evk/readme.txt
+++ b/board/freescale/imx28evk/readme.txt
@@ -12,7 +12,7 @@ Build
 
 First, configure Buildroot for your i.MX28 EVK board:
 
-  make freescale_imx28evk_defconfig
+  make imx28evk_defconfig
 
 Build all components:
 
diff --git a/configs/freescale_imx28evk_defconfig b/configs/imx28evk_defconfig
similarity index 100%
rename from configs/freescale_imx28evk_defconfig
rename to configs/imx28evk_defconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
