Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5316ACD1280
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 09:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4886400FB;
	Tue, 26 Mar 2024 09:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1s2rNTrb5ygJ; Tue, 26 Mar 2024 09:29:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF1F540378
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF1F540378;
	Tue, 26 Mar 2024 09:29:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5360A1BF397
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 09:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4009D81319
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 09:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yN1V5BUT5OmS for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 09:29:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10D3E812CC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10D3E812CC
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 09:29:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8C82841A2; Tue, 26 Mar 2024 09:29:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Mar 2024 10:28:48 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 39466535d0ff49948557430ade1439130d147d65
X-Git-Newrev: 9a3d34139b018bf79ac1c37b0212b5b775e3ae77
X-Patchwork-Hint: ignore
Message-Id: <20240326092925.E8C82841A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] Update for 2024.02.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a3d34139b018bf79ac1c37b0212b5b775e3ae77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 33 +++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8f0b4042fa..9643d52423 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,36 @@
+2024.02.1, released March 26th, 2024
+
+	Important / security related fixes.
+
+	Toolchain: Dropped old Codesourcery ARM / AARCH64 and
+	Codescape MIPS external toolchains as they use old Glibc
+	versions not compatible with 64-bit time_t
+
+	Defconfigs: Starfive visionfive2: Use correct genimage
+	configuration. TI am62x_sk / am64_sk: Use correct optee-os
+	platform setting and use a fixed ti-k3-r5-loader version.
+
+	Infrastructure: Use git to fetch CVE data from the FKIE
+	repository to work around an issue with missing meta files in
+	the releases.
+
+	Updated/fixed packages: axel, bash, bitcoin, botan, busybox,
+	containerd, cryptsetup, cvs, docker-compose, docker-engine,
+	ell, expat, giflib, gmp, go, harfbuzz, intel-gmmlib,
+	intel-mediadriver, iwd, kodi, kodi-pvr-hts, libcgroup, libdrm,
+	libgit2, libkrb5, libnfs, libunwind, libvpl,
+	libtorrent-rasterbar, libxml2, linux, mariadb, mesa3d,
+	mmc-utils, msmtp, multipath-tools, neon, onevpl-intel-gpu,
+	openssh, openvpn, osm2pgsql, owfs, php, poco, policycoreutils,
+	postgis, privoxy, pulseaudio, pure-ftpd, putty,
+	python-configshell-fb, python-rtslib-fb, rauc, restorecond,
+	spice, squid, targetcli-fb, tzdata, util-linux, vdr, xmrig,
+	xvisor, zic
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15997: Build Squid with GCC12.3 in Buildroot 2024.02 will fail
+
 2024.02, released March 5th, 2024
 
 	Various fixes.
diff --git a/Makefile b/Makefile
index 6d5e9a7972..a9d54aa28b 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.02
+export BR2_VERSION := 2024.02.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1709640000
+BR2_VERSION_EPOCH = 1711445000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 73bdcc8b5e..cb7a81af6e 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2024.02'
+RELEASE='2024.02.1'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
