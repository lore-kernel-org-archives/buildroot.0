Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C2FC6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 16:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4AA44154A;
	Tue, 26 Mar 2024 16:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JBs-pvI9n6aX; Tue, 26 Mar 2024 16:21:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 775004152C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 775004152C;
	Tue, 26 Mar 2024 16:21:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46EC21BF487
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 16:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D686740108
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 16:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I6Ez0c9yB5Uu for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 16:21:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA70140385
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA70140385
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 16:21:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A32238409E; Tue, 26 Mar 2024 16:21:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Mar 2024 17:20:45 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 4350ee852b82befb883b4c3aa77d339a37c283a8
X-Git-Newrev: c2e4b76d0328203b0aa5280e6154aeba19839bd6
X-Patchwork-Hint: ignore
Message-Id: <20240326162153.A32238409E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] Update for 2023.11.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=c2e4b76d0328203b0aa5280e6154aeba19839bd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 28 ++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0b9f027f3f..66a48fd19b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,31 @@
+2023.11.3, released March 26th, 2024
+
+	Important / security related fixes.
+
+	Defconfigs: Starfive visionfive2: Use correct genimage
+	configuration.
+
+	Updated/fixed packages: bind, bitcoin, botan, c-ares, clamav,
+	conmon, containerd, cvs, dash, dnsmasq, docker-engine, dracut,
+	ell, expat, fluent-bit, freetype, gcc, ghostscript, gmp,
+	gnupg2, go, google-breakpad, gst1-python, gst1-vaapi, iwd,
+	libcoap, libcurl, libdnet, libgit2, libheif, libkrb5,
+	libmodsecurity, libnfs, libopenssl, libselinux, libunwind,
+	liburing, libuv, libva, libxml2, ltris, lua-http, luvi,
+	mmc-utils, nginx-naxsi, nodejs, octave, openssh, openvmtools,
+	parted, petitboot, php, poco, postgresql, powertop, privoxy,
+	pure-ftpd, putty, python-cheroot, python-configshell-fb,
+	python-django, python-rtslib-fb, python3,
+	rauc-hawkbit-updater, redis, redis-plus-plus, rsync,
+	s390-tools, sdl2, shim, spice, spirv-tools, squid, strace,
+	strongswan, sudo, systemd, targetcli-fb, uhd, unbound,
+	util-linux, v4l2loopback, vim, webkitgtk, wpewebkit, xvisor,
+	zlib-ng
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15997: Build Squid with GCC12.3 in Buildroot 2024.02 will fail
+
 2023.11.2, released March 1st, 2024
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 89693a86c2..b563c99ac9 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.11.2
+export BR2_VERSION := 2023.11.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1709299000
+BR2_VERSION_EPOCH = 1711470000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index ba06c5f5fd..0975e0b5fe 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2023.11.2'
+RELEASE='2023.11.3'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
