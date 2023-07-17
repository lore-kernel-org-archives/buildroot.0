Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCE5EB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 16:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53DFC60AA4;
	Mon, 17 Jul 2023 16:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53DFC60AA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9B6OHZr9qcvX; Mon, 17 Jul 2023 16:14:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78D5260899;
	Mon, 17 Jul 2023 16:14:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78D5260899
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F9011BF338
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 16:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06ABD8141A
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 16:14:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06ABD8141A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JreUN2WUe5mx for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 16:14:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBC8381413
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 16:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBC8381413
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C367787390; Mon, 17 Jul 2023 16:14:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jul 2023 17:53:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14216c3c85491ea1dc1fa753a8006ab2ce3cc3f7
X-Git-Newrev: 5eec4aac49c4a01ad35a927ad72d0dd2114d93eb
X-Patchwork-Hint: ignore
Message-Id: <20230717161436.C367787390@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.05.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=5eec4aac49c4a01ad35a927ad72d0dd2114d93eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7814dbce1580c51f62255105ae572da2c42f2eb4)
[Peter: drop Makefile update]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 31 +++++++++++++++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 83034c4859..bbf8fccca2 100644
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
