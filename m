Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAECC433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 21:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D74F941088;
	Thu, 24 Mar 2022 21:51:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fm-3yuLCrvZh; Thu, 24 Mar 2022 21:51:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8115C4107C;
	Thu, 24 Mar 2022 21:51:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1776D1BF313
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF77461041
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:51:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u44M-O3gH4Se for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 21:51:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09D9D60A78
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 21:51:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D52D585CA2; Thu, 24 Mar 2022 21:42:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 24 Mar 2022 22:51:07 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 3106b412be4d70d4f8e6b7b2c81a6aa5a7eb8eff
X-Git-Newrev: d30542dde748f4d3b04ac5d1a238c8280de611fb
X-Patchwork-Hint: ignore
Message-Id: <20220324214238.D52D585CA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] Update for 2021.11.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=d30542dde748f4d3b04ac5d1a238c8280de611fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 23 +++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 29b7f2159a..72a4fabd37 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,26 @@
+2021.11.3, released March 24th, 2022
+
+	Important / security related fixes.
+
+	Updated/fixed packages: apache, azure-iot-sdk-c, boinc, dbus,
+	directfb, docker-engine, exempi, expat, flac, gdb, gdk-pixbuf,
+	gnutls, go, haproxy, libcurl, libiec61850, libminiupnpc,
+	libodb, libodb-boost, libopenssl, libpjsip, libressl, librsvg,
+	libsrtp, libvirt, libxml2, libxslt, lxc, mariadb, minidlna,
+	odb, openblas, openvpn, oprofile, php, pppd, python-ipython,
+	python-twisted, raptor, rpi-firmware, samba4, seatd,
+	timescaledb, usbguard, util-linux, vim, wavpack,
+	wireless-regdb, wireplumber, wireshark, wolfssl, xscreensaver,
+	xterm, zsh
+
+	New packages: gdk-pixbuf-xlib
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13126: make fails - bzip2-1.0.6.tar.gz and DirectFB-1.7.7.tar..
+	#14636: azure-iot-sdk-c: Installed headers do not compile
+	#14641: oprofile can not find the events files
+
 2021.11.2, released February 28th, 2022
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 09bf835b05..2493c8acfb 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.11.2
+export BR2_VERSION := 2021.11.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1646080000
+BR2_VERSION_EPOCH = 1648158600
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 37981d7932..9101b8ea49 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2021.11.2'
+RELEASE='2021.11.3'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
