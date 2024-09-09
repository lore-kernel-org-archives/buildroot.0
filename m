Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7CDE6FE49
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 07:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A27B84033F;
	Mon,  9 Sep 2024 07:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M3pNjoX2LDjN; Mon,  9 Sep 2024 07:39:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19A064022B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19A064022B;
	Mon,  9 Sep 2024 07:39:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5BE1D1BF3BF
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 07:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49633605BB
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 07:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0DKoD2-gt0Ih for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 07:39:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25E97605A6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25E97605A6
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 07:39:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DD7086C05; Mon,  9 Sep 2024 07:39:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 9 Sep 2024 09:38:08 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 28252450c4418d6544992563029448a27cbbc8b1
X-Git-Newrev: e4a5ab3b319753f41e2b5cf22e90b6b0304ca225
X-Patchwork-Hint: ignore
Message-Id: <20240909073929.0DD7086C05@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] Update for 2024.05.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4a5ab3b319753f41e2b5cf22e90b6b0304ca225
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 38 ++++++++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 156d0550b8..00ec6d8fc8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,41 @@
+2024.05.3, released September 9th, 2024
+
+	Important / security related fixes.
+
+        A large number of GCC 14.x compilation fixes and additional
+        runtime tests.
+
+        Infrastructure:
+        - Be more robust against text files (for package hashes and
+          users) incorrectly missing a terminating newline.
+
+        - Fix various issues with the pkg-kconfig infrastructure and
+          per-package-directories builds
+          (BR2_PER_PACKAGE_DIRECTORIES).
+
+	Updated/fixed packages: aer-inject, am335x-pru-package,
+	apache, apr, apr-util, attr, augeas, autossh, bandwidthd,
+	bcusdk, boost, brcm-patchram-plus, btrfs-progs, busybox,
+	can-utils, coreutils, cpuload, cryptsetup, cwiid, dhrystone,
+	dvb-apps, elfutils, faifa, fetchmail, ffmpeg, fluent-bit,
+	fluidsynth, freerdp, gcc, gcc-bare-metal, gdb, gnutls, gpsd,
+	hiawatha, hostapd, htop, ibm-sw-tpm2, intel-microcode, iperf3,
+	iproute2, ksmbd-tools, libcli, libcoap, libcurl, libest,
+	libfreefare, libgtk3, libngs, libpwquality, libressl, libupnp,
+	libxml2, libxslt, lrzsz, mdio-tools, micropython,
+	mjpg-streamer, mokutil, mpir, ncftp, nginx, nodejs, odb,
+	open-iscsi, openldap, openswan, openvpn, pistache, procps-ng,
+	python-django, quotatool, rtty, ruby, sconeserver, speex,
+	swaybg, tar, tftpd, tinyssh, uclibc, uclibc-ng-test, unbound,
+	uuu, vorbus-tools, wpewebkit, zfs, zsh
+
+        Issues resolved:
+	- TAR-1.35 will not build for target (host-variant will build)
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/4
+	- Toolchain (host-gcc-final-14.1.0) build failure with
+	  y2038/BR2_TIME_BITS_64 enabled
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/16
+
 2024.05.2, released August 14th, 2024
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index ebf8bb8af1..8cc747a809 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.05.2
+export BR2_VERSION := 2024.05.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1723625000
+BR2_VERSION_EPOCH = 1725867000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 1f4c1b85e2..730d9fbbb7 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2024.05.2'
+RELEASE='2024.05.3'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
