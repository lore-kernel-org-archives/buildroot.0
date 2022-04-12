Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A06C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 22:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 706D940B48;
	Tue, 12 Apr 2022 22:13:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dKr-l5Tkakbe; Tue, 12 Apr 2022 22:13:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6927A4042B;
	Tue, 12 Apr 2022 22:13:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C77D91BF3E9
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 22:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9BCD80D50
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 22:13:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AcFry4XR3wAm for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 22:13:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFAA083EE9
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 22:13:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EDA4583BD3; Tue, 12 Apr 2022 22:03:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Apr 2022 00:09:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3872457e50ba98dbeea0dc44277a671b7923d03d
X-Git-Newrev: 11b6b65d509c24e41af5ce0da941556fb10354fc
X-Patchwork-Hint: ignore
Message-Id: <20220412220343.EDA4583BD3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.02.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=11b6b65d509c24e41af5ce0da941556fb10354fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9da87c52934842026918b9eb8511b35cd935c552)
[Peter: skip Makefile bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 54 ++++++++++++++++++++++++++++++++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index e37c6d0fe7..12df66916c 100644
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
