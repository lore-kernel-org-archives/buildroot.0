Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7CFC76195
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 14:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 813FA410B0;
	Sun, 19 Mar 2023 14:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 813FA410B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R01XD2EXgK7i; Sun, 19 Mar 2023 14:01:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7165B410AC;
	Sun, 19 Mar 2023 14:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7165B410AC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 822301BF577
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 14:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A6F14017B
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 14:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A6F14017B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PeRFiy2Cok3z for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 14:00:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B611400A6
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 14:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B611400A6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 78DF787354; Sun, 19 Mar 2023 14:00:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Mar 2023 14:58:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e39cbef783e9fbf840cdcb9472b313a1dca3f193
X-Git-Newrev: 1ad6d0dea57cdc0099399c67f68ccf5e693c9da6
X-Patchwork-Hint: ignore
Message-Id: <20230319140059.78DF787354@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.02.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ad6d0dea57cdc0099399c67f68ccf5e693c9da6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 71a2706320dbc22b16397b70b2d53b903bde0752)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/CHANGES b/CHANGES
index f35a55726e..e184f3f3be 100644
--- a/CHANGES
+++ b/CHANGES
@@ -775,6 +775,27 @@
 	#14731: BR2_PACKAGE_IOSTAT
 	#14751: LVM2 Outdated Link
 
+2022.02.11, released March 19th, 2023
+
+	Important / security related fixes.
+
+	Updated/fixed packages: apache, apr, apr-util, asterisk,
+	at91dataflashboot, audit, bash, bind, bridge-utils, clamav,
+	dmalloc, exfat, exfat-utils, f2fs-tools, gcc, git,
+	glslsandbox-player, go, haproxy, intel-gmmlib, ipmiutil, less,
+	libblockdev, libcurl, libev, libgcrypt, libmad, libmdbx,
+	libmodsecurity, libolm, libpjsip, lttng-babeltrace, mender,
+	mpv, mutt, mxs-bootlets, opensbi, opus, paho-mqtt-c,
+	pcm-tools, php, proxychains-ng, python-django,
+	python-m2crypto, python-werkzeug, quazip, quickjs,
+	rockchip-mali, rsync, sudo, tiff, uacme, uqmi, webkitgtk,
+	wpebackend-fdo, wpewebkit, xdriver_xf86-video-qxl, znc
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15306: glibc build fails in Docker container
+	#15361: Buildroot linking error on Apple Silicon
+
 2022.02.10, released March 1st, 2023
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
