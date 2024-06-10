Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8248C27C5E
	for <buildroot@archiver.kernel.org>; Mon, 10 Jun 2024 07:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65441607CC;
	Mon, 10 Jun 2024 07:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bSrguCiA4g96; Mon, 10 Jun 2024 07:38:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A34560752
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A34560752;
	Mon, 10 Jun 2024 07:38:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7EF6D1BF2B9
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 07:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C2E660752
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 07:38:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZaLyFlzizbHp for <buildroot@lists.busybox.net>;
 Mon, 10 Jun 2024 07:38:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38EEA60705
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38EEA60705
 for <buildroot@buildroot.org>; Mon, 10 Jun 2024 07:38:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2ED3F87EB7; Mon, 10 Jun 2024 07:38:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 10 Jun 2024 09:37:56 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 10dd781eacea515951542424033462e67558e258
X-Git-Newrev: a73dd8f787ae8f303fbfb4791a1f77d6c5280692
X-Patchwork-Hint: ignore
Message-Id: <20240610073819.2ED3F87EB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] Update for 2024.02.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=a73dd8f787ae8f303fbfb4791a1f77d6c5280692
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 58 ++++++++++++++++++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 61 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index e5956a5138..91cc951a26 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,61 @@
+2024.02.3, released June 10th, 2024
+
+	Important / security related fixes.
+
+	Misc:
+	- Fixed a number of compilation issues for hosts using GCC
+          14.x, including for kconfig.
+
+	Download:
+	- Drop redundant --passive-ftp from default wget options and
+	  migrate a number of packages using FTP upstreams to HTTP(S)
+	  for compatibility with wget2 which does not have FTP support
+
+	- Ensure downloads are correctly shared for host packages that
+	  try to do so using <pkg>_DL_SUBDIR and ensure the correct
+	  toplevel directory name is used in generated tarballs when
+	  downloads are shared.
+
+	Arch: Enable SSE2 support for x86 Pentium M variant.
+
+	Defconfigs: Orangepi PC/R1, Raspberrypi zero2w, Sipeed
+	licheepi nano, Wandboard: Fix compilation issues. PC x86-64
+	bios/efi: add wireless regdb to fix kernel warning during
+	boot, iMX.8 boards: Adjust FIT external data position to match
+	imx-mkimage changes, fixing boot issues.
+
+	Updated/fixed packages: am33x-cm, apcupsd,
+	arm-trusted-firmware, binutils-bare-metal, bpftool, catch2,
+	ccache, cjson, clamav, cog, coreutils, cryptodev-linux,
+	dhcpcd, dmraid, dnsmasq, docker-cli, docker-compose,
+	docker-engine, doom-wad, duma, elf2flt, ebtables, elfutils,
+	evemu, file, fluidsynth, freeradius-client, freeradius-server,
+	freerdp, fwts, gcc, gcc-bare-metal, git, gnuplot, go,
+	gr-osmosdr, gst1-plugins-good, hidapi, imagemagick,
+	intel-gmmlib, ivi-homescreen, janus-gateway, kexec, kmod,
+	kodi, libarchive, libdrm, libedit, libffi, libglib2, libhtp,
+	libjwt, libkrb5, libmanette, libmdbx, libmnl,
+	libnetfilter_acct, libnetfilter_log, libnpth, libopenssl,
+	libpng, libuhttpd, liburiparser, libutempter, libvncserver,
+	libwpe, lightning, linux-firmware, linux-pam, lua-cffi,
+	luajit, lvm2, lynx, mariadb, mesa3d, micropython, minisign,
+	musl, mutt, ncftp, network-manager, newlib-bare-metal, nfacct,
+	nfs-utils, octave, openjpeg, openocd, oprofile,
+	perl-dbd-mysql, php, postgresql, pppd, privoxy, procps-ng,
+	proftpd, proj, putty, python-ml-dtypes, python-pillow,
+	python-rds-py, qemu, qt5base, redis-plus-plus, rtl8189fs,
+	ruby, samba4, shadow, smcroute, speech, squid, sscep,
+	suricata, swupdate, systemd, ti-sgx-km, tinycbor, tinyproxy,
+	tor, tpm2-tss, ttyd, uboot-tools, ulogd, vala, weston,
+	wpewebkit, x11vnc, zbar, zeromq, zfs, zip, zxing-cpp
+
+	Issues resolved (http://bugs.uclibc.org):
+
+        #15766: BR2_PACKAGE_WESTON_XWAYLAND -- 12.0.1 -- fails to build..
+	#15973: imx8m bootloader image generation broken since update..
+        #16075: Cannot use linux kernel extensions from external tree..
+	#16093: kmod and gcc-14 build error
+
 2024.02.2, released May 7th, 2024
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 4a62be9ff3..e5053e4221 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.02.2
+export BR2_VERSION := 2024.02.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1715067000
+BR2_VERSION_EPOCH = 1718005000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index ac595f5749..983f2f58b3 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2024.02.2'
+RELEASE='2024.02.3'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
