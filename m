Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46ED0EB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 15:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0B3281EC7;
	Mon, 17 Jul 2023 15:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0B3281EC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B-FHDPZlzNGD; Mon, 17 Jul 2023 15:06:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4DBF81EB6;
	Mon, 17 Jul 2023 15:06:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4DBF81EB6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 79F431BF341
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 15:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 616A640A5A
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 15:06:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 616A640A5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sg0GlzlJ8v70 for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 15:06:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9576C40181
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 15:06:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9576C40181
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F3148732C; Mon, 17 Jul 2023 15:06:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jul 2023 17:06:21 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 50ceb24bb6cf133fb61d534dc633cef5cd443a5c
X-Git-Newrev: 7814dbce1580c51f62255105ae572da2c42f2eb4
X-Patchwork-Hint: ignore
Message-Id: <20230717150648.7F3148732C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] Update for 2023.05.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=7814dbce1580c51f62255105ae572da2c42f2eb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 31 +++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index fec806a215..937b50ea7d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,34 @@
+2023.05.1, released July 17th, 2023
+
+	Important / security related fixes.
+
+	Defconfigs: Chiliboard, mx53loco: fix build on hosts without
+	openssl development headers.
+	Nitrogen*: fix build on hosts without openssl or pylibfdt.
+	Hifive unleased: Bump OpenSBI to 1.2 to fix a build issue.
+	Raspberrypi: Handle DTB overlays for all variants
+
+	Updated/fixed packages: agentpp, alsa-plugins, assimp, audit,
+	bind, busybox, c-ares, check, cups, dav1d, dbus, fftw,
+	fluidsynth, freetype, fwts, ghostscript, gnupg2, gnuradio,
+	graphicsmagick, gupnp, haproxy, heimdal, hwdata, jhead, kodi,
+	libcap, libgcrypt, libgpg-error, libgtk3, libmdbx, libxslt,
+	mesa3d, mesa3d-demos, mpir, nodejs, php, pkgconf,
+	python-cryptography, python-dbus-fast, python-django,
+	python-docker, python-pyicu, python-requests, python3, qemu,
+	qt6, quickjs, rtl8192eu, samba4, sconeserver, syslog-ng,
+	taglib, tiff, wine, wireshark, xdriver_xf86-video-dummy,
+	xlib_libX11,
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15643: ERROR: No hash found for linux-6.3.8.tar.xz
+	#15658: hifive_unleashed_defconfig: Linker errors in opensbi-0.9
+	#15661: mx53loco_defconfig: Dependency on OpenSSL missing
+	#15664: Can't compile mesa3d with v3d driver
+	#15673: PKGCONF_SITE in pkgconf.mk points to parked domain
+	#15682: pkgconf: no longer able to download source from...
+
 2023.05, released June 7th, 2023
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 3187791d9b..dbf13c1e07 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.05
+export BR2_VERSION := 2023.05.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1686172000
+BR2_VERSION_EPOCH = 1689606300
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index eaac13e32b..12da353f2e 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2023.05'
+RELEASE='2023.05.1'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
