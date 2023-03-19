Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1B0C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 14:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8635410DF;
	Sun, 19 Mar 2023 14:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8635410DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2P0RRTuPSumy; Sun, 19 Mar 2023 14:01:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 858F9414C5;
	Sun, 19 Mar 2023 14:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 858F9414C5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3C7B1BF870
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 14:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DDED60FBC
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 14:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DDED60FBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 58mQsSPv8oSP for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 14:00:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E61F60D4C
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 14:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E61F60D4C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5AB528734F; Sun, 19 Mar 2023 14:00:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Mar 2023 14:58:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 456204e7e02cc787cee65711409025245ce337de
X-Git-Newrev: b2cf393c335b1839b8fed8e1f8e8a499fcb7b6c5
X-Patchwork-Hint: ignore
Message-Id: <20230319140059.5AB528734F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.11.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=b2cf393c335b1839b8fed8e1f8e8a499fcb7b6c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 904c8b538e71fcc565f39b72d93b9dd6c67211c0)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/CHANGES b/CHANGES
index a03a4876b8..f35a55726e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -132,6 +132,31 @@
 	#15301: Selecting NAND Flash boot media (NAND_BOOT) breaks the uboot..
 	#15331: Warning on python-flit-core license when generating legal info
 
+2022.11.3, released March 18th, 2023
+
+	Important / security related fixes.
+
+	Updated/fixed packages: ace, apache, apr, apr-util, asterisk,
+	at91dataflashboot, audit, bash, bind, bridge-utils, clamav,
+	dmalloc, efivar, erlang, exfat, exfat-utils, f2fs-tools, gcc,
+	gdal, gensio, gerbera, git, glslsandbox-player, go, haproxy,
+	hawktracer, intel-gmmlib, ipmiutil, less, libblockdev,
+	libcurl, libev, libgcrypt, libglfw, libmad, libmdbx,
+	libmodsecurity, libolm, libpjsip, lirc-tools,
+	lttng-babeltrace, mender, mpv, mutt, mxs-bootlets, netsurf,
+	ntpsec, nut, opensbi, opus, paho-mqtt-c, pcm-tools, php,
+	pistache, proftpd, proxychains-ng, pulseaudio,
+	python-cryptography, python-django, python-m2crypto,
+	python-numpy, python-werkzeug, qemu, quazip, quickjs,
+	rockchip-mali, rsync, s6-linux-utils, sudo, tiff, uacme, uqmi,
+	webkitgtk, wilc-driver, wpa_supplicant, wpewebkit,
+	xdriver_xf86-video-qxl, znc
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15306: glibc build fails in Docker container
+	#15361: Buildroot linking error on Apple Silicon
+
 2022.11.2, released March 1st, 2023
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
