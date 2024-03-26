Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC87CD11DF
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 10:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D56EB40160;
	Tue, 26 Mar 2024 10:42:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LKvvB86sr3iw; Tue, 26 Mar 2024 10:42:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C73FC4036E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C73FC4036E;
	Tue, 26 Mar 2024 10:42:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7899C1BF383
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 10:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72EAF4036E
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 10:42:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IbNVJYToEtVz for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 10:42:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56DBF40160
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56DBF40160
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 10:42:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40373841E6; Tue, 26 Mar 2024 10:42:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Mar 2024 11:41:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc38dde3575a4e69db9ad182f691542dc4aa4e06
X-Git-Newrev: 9b1c4300dd69f18b3bffd22aa7a2b2d45be9e38b
X-Patchwork-Hint: ignore
Message-Id: <20240326104215.40373841E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.02.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b1c4300dd69f18b3bffd22aa7a2b2d45be9e38b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9a3d34139b018bf79ac1c37b0212b5b775e3ae77)
[Peter: drop Makefile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 33 +++++++++++++++++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 34 insertions(+), 1 deletion(-)

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
