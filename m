Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93A0C7618A
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 10:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E09F408D7;
	Sun, 19 Mar 2023 10:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E09F408D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CKJ7ESD5elvK; Sun, 19 Mar 2023 10:21:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 902B740629;
	Sun, 19 Mar 2023 10:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 902B740629
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 70A751BF3C1
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 10:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A00E415FD
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 10:21:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A00E415FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p9jmBmlbgznw for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 10:21:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D065415F0
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 10:21:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D065415F0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 069D88707E; Sun, 19 Mar 2023 10:21:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Mar 2023 11:20:22 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 499947acac5b6f1a565261c631406f0d420fab82
X-Git-Newrev: 71a2706320dbc22b16397b70b2d53b903bde0752
X-Patchwork-Hint: ignore
Message-Id: <20230319102146.069D88707E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] Update for 2022.02.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=71a2706320dbc22b16397b70b2d53b903bde0752
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 21 +++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3ffae0f7cc..ee4ee1ff3f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,24 @@
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
diff --git a/Makefile b/Makefile
index a7ed8e5a80..7ce00cab0a 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.02.10
+export BR2_VERSION := 2022.02.11
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1677703000
+BR2_VERSION_EPOCH = 1679221000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index bd48f6e600..bb3e6be4f3 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2022.02.10'
+RELEASE='2022.02.11'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
