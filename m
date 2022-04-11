Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021D3C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 21:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80A164074E;
	Mon, 11 Apr 2022 21:50:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t__b2LLS6k5p; Mon, 11 Apr 2022 21:50:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CFDA4052A;
	Mon, 11 Apr 2022 21:50:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ACA0C1BF30D
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 21:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BA5860A6D
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 21:50:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ySm9OHdq__RD for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 21:50:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BB3A607C1
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 21:50:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EA42383A55; Mon, 11 Apr 2022 21:40:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Apr 2022 23:49:53 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a4c060c95680b7e7f56c2dba8b0442836ed9d08d
X-Git-Newrev: 9da87c52934842026918b9eb8511b35cd935c552
X-Patchwork-Hint: ignore
Message-Id: <20220411214018.EA42383A55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] Update for 2022.02.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=9da87c52934842026918b9eb8511b35cd935c552
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 54 ++++++++++++++++++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 57 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 59ae8f15ce..da18142246 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,57 @@
+2022.02.1, released April 11th, 2022
+
+	Important / security related fixes.
+
+	Graphs: Also generate a build time timeline graph (for top
+	level parallel builds).
+
+	scripts/pkg-stats: Optimize memory consumption for CPE parsing
+
+	Fix compatibility issue with the fakeroot script logic and
+	modern versions of dash.
+
+	Change git:// URLs pointing to Github to https://, now that
+	Github has turned off support for git://
+
+	Updated/fixed packages: ace, apache, apr, apr-util, belr,
+	bind, bluez5_utils, boinc, bpftool, busybox, cloop, cog,
+	containerd, cppcms, dav1d, dhcp, dieharder, dnsmasq,
+	docker-cli, docker-engine, efl, ell, fakeroot, flac,
+	fluidsynth, gdk-pixbuf, glib-networking, gnutls, gst-omx,
+	gst1-devtools, gst1-libav, gst1-plugins-bad,
+	gst1-plugins-base, gst1-plugins-good, gst1-plugins-ugly,
+	gst1-python, gst1-rtsp-server, gst1-vaapi, gstreamer1,
+	gstreamer1-editing-services, haproxym htop, intel-gmmlib,
+	ipmiutil, iwd, jack1, jack2, lftp, libabseil-cpp, libbluray,
+	libcamera-apps, libcoap, libcurl, libest, libgee, libglib2,
+	libgtk3, libiec61850, libkrb5, libminiupnpc, libodb,
+	libodb-boost, libopenssl, libp11, libpsl, libressl, librstp,
+	librtlsdr, liburing, libyang, libzlib, luasec, lxc, matio,
+	meson, minidlna, minizip, mpd, mtools, netatalk, nbd, odb,
+	openblas, openssh, openvpn, optee-os, opus, paho-mqtt-c,
+	pango, php, pipewire, pkcs11-helper, postgresql, ppp,
+	protozero, python-aioconsole, python-avro, python-brotli,
+	python-greenlet, python-paramiko, python-pillow,
+	python-rpi-gpio, python-treq, python-twisted, python-ujson,
+	python-weasyprint, qt5base, qt5wayland, raptor, rpi-firmware,
+	rpi-userland, rtl_433, runc, rust, rygel, samba4,
+	shairport-sync, spice, spidev_test, stunnel, systemd,
+	timescaledb, trace-cmd, trousers, ts4900-fpga, tvheadend,
+	udpcast, unbound, upower, urandom-scripts, usbguard, valgrind,
+	valijson, vim, wavpack, wget, wireplumber, wireshark, woff2,
+	xmrig, zabbix, zlib-ng, zynaddsubfx, zziplib
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13971: ip6tables-nft build does not include MASQUERADE target..
+	#14651: OpenSSH 8.9p1 compiler error under ARM
+	#14656: Adding dependencies from an external tree does not work
+	#14661: Fakeroot script relies on bash-isms, does not work ..
+	#14686: genimage.cfg have a hard-coded .ext4 extension which..
+	#14701: Multiple unresolved symbols while building kernel ..
+	#14711: nodjs build problem missing bzip
+	#14731: BR2_PACKAGE_IOSTAT
+
 2022.02, released March 8th, 2022
 
 	Various fixes.
diff --git a/Makefile b/Makefile
index db2ac30b10..ee7aedf71c 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.02
+export BR2_VERSION := 2022.02.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1646777000
+BR2_VERSION_EPOCH = 1649713000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index a5a0e3f41a..6cf44d9216 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2022.02'
+RELEASE='2022.02.1'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
