Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E7AC282D1
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 12:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1208484CD7;
	Sat,  1 Mar 2025 12:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xSIZM22OMduT; Sat,  1 Mar 2025 12:49:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0610980D17
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0610980D17;
	Sat,  1 Mar 2025 12:49:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CD1F181
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 12:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED43884A79
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 12:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ap5eEcqjnTop for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 12:49:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 228C98494D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 228C98494D
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 12:49:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E6C587E83; Sat,  1 Mar 2025 12:49:23 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Mar 2025 11:32:53 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 793b45cea77ed645f6800240811d03f8be392ccd
X-Git-Newrev: 0f0949cee02a8bc577bed151673d032f630ce405
X-Patchwork-Hint: ignore
Message-Id: <20250301124923.1E6C587E83@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/freescale-imx/imx-seco: bump version to 5.9.4.1
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
Content-Type: multipart/mixed; boundary="===============6349094822785428137=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6349094822785428137==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0f0949cee02a8bc577bed151673d032f630ce405
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This version is aligned with NXP Linux BSP version "lf-6.6.52-2.2.0".

License hashes changed because the LA_OPT_NXP_Software_License changed
from "v56 April 2024" to "v57 July 2024".
Add SCR.txt and SCR-imx-seco.txt to _LICENSE_FILES.

Note: in this release, the package source archive name changed to
include a revision. This commit adds a new _REVISION variable with the
value published in the corresponding NXP BSP.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
[Julien: fixed the bsp version name in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/imx-seco/imx-seco.hash | 8 +++++---
 package/freescale-imx/imx-seco/imx-seco.mk   | 7 ++++---
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-seco/imx-seco.hash b/package/freescale-imx/imx-seco/imx-seco.hash
index a91dbc2274..5c29ec4fa9 100644
--- a/package/freescale-imx/imx-seco/imx-seco.hash
+++ b/package/freescale-imx/imx-seco/imx-seco.hash
@@ -1,4 +1,6 @@
 # Locally calculated
-sha256  9b04be33814a9cbda9bbfcb6711585cf7e4ed2527793813c95230f350323cba7  imx-seco-5.9.4.bin
-sha256  165f6c0eacb4d3a05289dfb79331c9a2c05207eb7a67ef28a117f246a0145428  EULA
-sha256  c9ee518510d72e254d62743f5098163eacdb6428c6ba4d8119afe2d12edba068  COPYING
+sha256  bd8dc01966076836aabff53f2463295294166595006e1db430db21b6ffa6b667  imx-seco-5.9.4.1-0333596.bin
+sha256  c3d9a7b2a5a7db5da690e9c1081b98b665802c3efbbba7fb237339395a92f607  EULA
+sha256  601fa790c5b4d03579bd182fb4d65a6f329a32faf49db22f98e4608221e861f7  COPYING
+sha256  92d7a6594cece4d59f4da4677f3128aa4997fd49955aee50a6fed32e3800df76  SCR.txt
+sha256  92d7a6594cece4d59f4da4677f3128aa4997fd49955aee50a6fed32e3800df76  SCR-imx-seco.txt
diff --git a/package/freescale-imx/imx-seco/imx-seco.mk b/package/freescale-imx/imx-seco/imx-seco.mk
index 4afac8005b..012f367099 100644
--- a/package/freescale-imx/imx-seco/imx-seco.mk
+++ b/package/freescale-imx/imx-seco/imx-seco.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-IMX_SECO_VERSION = 5.9.4
+IMX_SECO_VERSION = 5.9.4.1
+IMX_SECO_REVISION = 0333596
 IMX_SECO_SITE = $(FREESCALE_IMX_SITE)
-IMX_SECO_SOURCE = imx-seco-$(IMX_SECO_VERSION).bin
+IMX_SECO_SOURCE = imx-seco-$(IMX_SECO_VERSION)-$(IMX_SECO_REVISION).bin
 
 IMX_SECO_LICENSE = NXP Semiconductor Software License Agreement
-IMX_SECO_LICENSE_FILES = EULA COPYING
+IMX_SECO_LICENSE_FILES = EULA COPYING SCR.txt SCR-imx-seco.txt
 IMX_SECO_REDISTRIBUTE = NO
 
 define IMX_SECO_EXTRACT_CMDS

--===============6349094822785428137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6349094822785428137==--
