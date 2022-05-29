Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2504DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 19:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94399841AA;
	Sun, 29 May 2022 19:33:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h3xqCV3rWTtx; Sun, 29 May 2022 19:33:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D558841A7;
	Sun, 29 May 2022 19:33:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 490501BF969
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 19:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37860410B0
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 19:33:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 81kjGkMsApmI for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 19:33:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAC7D410AD
 for <buildroot@buildroot.org>; Sun, 29 May 2022 19:33:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 65E9B8662D; Sun, 29 May 2022 19:22:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 21:31:48 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 55fcd7979ca47524dfecdfc75d7568be27b96437
X-Git-Newrev: 1335d46be5eaf1adc313ab398273724b0693309b
X-Patchwork-Hint: ignore
Message-Id: <20220529192207.65E9B8662D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] Update for 2022.02.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=1335d46be5eaf1adc313ab398273724b0693309b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 50 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index da18142246..0e6f06ca71 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,50 @@
+2022.02.2, released May 29th, 2022
+
+	Important / security related fixes.
+
+	Archictures: Drop sh2a, correct x86 Bonnell variant
+
+	Toolchain: Bump GCC 11.x to 11.3, correct pre-installed
+	external toolchain logic when toolchain is available in path.
+
+	Rework OCI filesystem entrypoint/command logic to handle
+	command arguments
+
+	Defconfigs: Update Zynqmp zcu102/106 to final 2022.1 release,
+	fix zcu106 PLL config
+
+	Updated/fixed packages: adwaita-icon-theme, afboot-stm32,
+	aircrack-ng, alchemy, alsa-lib, arptables, assimp, asterisk,
+	aubio, avrdude, azure-iot-sdk-c, batman-adv, binutils,
+	bpftool, brotli, cairo, cifs-utils, clamav, cryptodev-linux,
+	dhcp, diffutils, dmalloc, duktape, e2fsprogs, elf2flt, espeak,
+	expat, ffmpeg, fluidsynth, freerdp, gcc, git, glorytun,
+	glslsandbox-player, gnutls, go, gst1-imx, gst1-plugins-good,
+	gzip, imagemagick, janus-gateway, keepalived, kompexsqlite,
+	kvm-unit-tests, libarchive, libcgi, libcurl, libevdev,
+	libeXosip2, libhtp, libinput, libkcapi, libkrb5, libks,
+	libmdbx, libmnl, libnpupnp, libnspr, libopenssl, liboping,
+	libpjsip, libpri, libselinux, libsigsegv, libv4l,
+	libwebsockets, libxml2, linux, linux-tools, ltp-testsuite,
+	luajit, lvm2, mali-driver, mariadb, mc, minizip, mpd, mutt,
+	netatalk, netsurf, network-manager, nodejs, numactl, nut,
+	omniorb, openbox, opencv4, openjdk, openjdk-bin, openocd,
+	pamtester, pango, pcre2, php, php-apcu, pinentry, pixman,
+	polkit, postgis, postgresql, pure-ftpd, python-aenum,
+	python-avro, python-django, python-pillow, python-simplejson,
+	python-urllib3, python-zopfli, python3, qemu, qpdf, quazip,
+	redis, rockchip-mali, rsync, rt-tests, rust, rtl8818eu,
+	rtl8189es, rtl8189fs, rtl_433, sam-ba, samba4, sdl2_ttf,
+	shadowsocks-libev, shim, subversion, sun20i-d1-spl, suricata,
+	systemd, tftpd, trinity, tvheadend, udev, uftrace,
+	urandom-scripts, usb_modeswitch, valgrind, vde2, vim,
+	wireplumber, wolfssl, wpa_supplicant, xlib_libXfont2, xz,
+	zlib, zlog
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14751: LVM2 Outdated Link
+
 2022.02.1, released April 11th, 2022
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index ee7aedf71c..3b11f610c2 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.02.1
+export BR2_VERSION := 2022.02.2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1649713000
+BR2_VERSION_EPOCH = 1653852000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 6cf44d9216..e343cf432e 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2022.02.1'
+RELEASE='2022.02.2'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
