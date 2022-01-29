Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0525FC433F5
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 18:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ACEF8144F;
	Sat, 29 Jan 2022 18:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nzno2p7J5t7d; Sat, 29 Jan 2022 18:15:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B1C281491;
	Sat, 29 Jan 2022 18:15:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 269631BF3EB
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 18:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1472760A8D
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 18:15:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H5J7LSS9OwHD for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 18:15:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9D0960A84
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 18:15:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2AD0582761; Sat, 29 Jan 2022 18:08:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 29 Jan 2022 19:14:59 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 90cf9188c96f391ac56788100af326df923b4c37
X-Git-Newrev: af67915161af4243cfdbd81408cd6ba64a8438eb
X-Patchwork-Hint: ignore
Message-Id: <20220129180819.2AD0582761@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] Update for 2021.02.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=af67915161af4243cfdbd81408cd6ba64a8438eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 29 +++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index e967c265cd..f7d14f636d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,32 @@
+2021.02.9, released January 29th, 2022
+
+	Important / security related fixes.
+
+	check-package: Improve variable override check
+
+	pkg-stats: List CVEs where the version info cannot be parsed
+	as unsure rather than completely ignoring them.
+
+	Defconfigs: Beaglebone: Support BeagleBone black wireless
+
+	Updated/fixed packages: alsa-utils, apache, cage, capnproto,
+	civetweb, clamav, collectd, connman, coreutils, dav1d,
+	docker-cli, docker-containerd, docker-engine, expat,
+	findutils, flare-engine, flare-game, font-awesome, freeswitch,
+	gcc, ghostscript, gnuchess, go, grpc, gst1-interpipe,
+	gst1-plugins-bad, gst-rtsp-sever, gupnp-tools, hackrf, icu,
+	imagemagick, janus-gateway, keepalived, lapack, libjpeg,
+	libopenssl, libpjsip, liburiparser, linux-pam, lxc, mbedtls,
+	mongodb, mpd-mpc, nodejs, openblas, pcre2, polkit, poppler,
+	privoxy, prosody, python-django, python-lxml, python-pyqt5,
+	python3, qt5base, qt5location, rhash, ruby, runc, samba4,
+	sofia-sip, targetcli-fb, tcpreplay, tinyxml, vim, vlc,
+	wireshark, xapp_xauth, xen, xlib_libX11, xserver_xorg-server
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14471: alsa_utils wrong deployment
+
 2021.02.8, released December 14th, 2021
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 926695afd3..d1a5d4d71e 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.02.8
+export BR2_VERSION := 2021.02.9
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1639501000
+BR2_VERSION_EPOCH = 1643480000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index ae1dd51650..ff793ccba8 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2021.02.8'
+RELEASE='2021.02.9'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
