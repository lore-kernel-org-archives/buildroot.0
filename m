Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF0DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 23:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7E1960AFE;
	Sat, 29 Jan 2022 23:09:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6RJVRp8tHiEI; Sat, 29 Jan 2022 23:09:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11C7160AE0;
	Sat, 29 Jan 2022 23:09:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A3EA1BF370
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 23:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56ADA60AE0
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 23:09:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 09MZAK5FjhiJ for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 23:09:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 259E260A78
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 23:09:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DE9B6822BA; Sat, 29 Jan 2022 23:02:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 00:09:05 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: d1e6c004d0707a3c024356cad0bfc820da9a5ebf
X-Git-Newrev: 323ae1e681c24babfb375cb46bc81df551a3e0b7
X-Patchwork-Hint: ignore
Message-Id: <20220129230245.DE9B6822BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] Update for 2021.11.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=323ae1e681c24babfb375cb46bc81df551a3e0b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 36 ++++++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 698d5d72a6..1e1c060107 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,39 @@
+2021.11.1, released January 29th, 2022
+
+	Important / security related fixes.
+
+	check-package: Improve variable override check
+
+	pkg-stats: List CVEs where the version info cannot be parsed
+	as unsure rather than completely ignoring them.
+
+	Defconfigs: Beaglebone: Support BeagleBone black wireless,
+	stm32f469_xip_disco: Fix kernel boot
+
+	Updated/fixed packages: alsa-utils, apache, binutils, cage,
+	capnproto, civetweb, clamav, collectd, connman, containerd,
+	coreutils, dav1d, docker-cli, docker-engine, erlang,
+	erlang-rebar, expat, findutils, flare-engine, flare-game,
+	font-awesome, freeswitch, gcc, ghostscript, glibc, gnuchess,
+	go, grpc, gst1-interpipe, gst1-rtsp-server, gupnp-tools,
+	hackrf, icu, imagemagick, janus-gateway, json-for-modern-cpp,
+	keepalived, lapack, libdbi, libiio, libjpeg, libmbim, libnss,
+	libopenssl, libpjsip, libqmi, liburiparser, libvirt,
+	linux-pam, lxc, mbedtls, mender, mongodb, mpd-mpc, mutt,
+	nodejs, openblas, pcre2, php, pipewire, polkit, privoxy,
+	prosody, python-charset-normalizer, python-django,
+	python-idna, python-lxml, python-pyqt5, python-requests,
+	python-urllib3, python3, qt5base, qt5location, rhash,
+	rng-tools, ruby, runc, rustc, samba4, sofia-sip, targetcli-fb,
+	tcpreplay, tinyxml, tor, tpm2-tss, util-linux-libs, vim, vlc,
+	wireshark, xapp_xauth, xapp_xinput-calibrator, xen, xenomai,
+	xlib_libX11, xserver_xorg-server
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14451: nodejs won't build on Fedora 35
+	#14471: alsa_utils wrong deployment
+
 2021.11, released December 5th, 2021
 
 	Various fixes.
diff --git a/Makefile b/Makefile
index 386b4f4e44..45fd44dd62 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.11
+export BR2_VERSION := 2021.11.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1638734000
+BR2_VERSION_EPOCH = 1643497000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 2bcb59c08b..eb312081fe 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2021.11'
+RELEASE='2021.11.1'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
