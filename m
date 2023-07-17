Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7525EB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 21:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D29A40590;
	Mon, 17 Jul 2023 21:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D29A40590
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GvJOxathxY_y; Mon, 17 Jul 2023 21:08:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F27A840857;
	Mon, 17 Jul 2023 21:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F27A840857
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CDD061BF2C1
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 21:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7F644015A
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 21:08:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7F644015A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w_5fJGdLjMti for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 21:08:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B9C8405D4
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 21:08:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B9C8405D4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EBE188739A; Mon, 17 Jul 2023 21:08:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jul 2023 23:07:52 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: eb62b3fc914621a84c616a72de27549f33427511
X-Git-Newrev: dc7000f0de50a21355198d6ce814143a9d5af582
X-Patchwork-Hint: ignore
Message-Id: <20230717210835.EBE188739A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] Update for 2023.02.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc7000f0de50a21355198d6ce814143a9d5af582
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 24 ++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3b2199f447..b5cb5e7665 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,27 @@
+2023.02.3, released July 17th, 2023
+
+	Important / security related fixes.
+
+	Defconfigs: Chiliboard: fix build on hosts without openssl
+	development headers.
+	Nitrogen*: fix build on hosts without openssl or pylibfdt.
+	Raspberrypi: Handle DTB overlays for all variants
+
+	Updated/fixed packages: agentpp, alsa-plugins, assimp, bind,
+	busybox, dbus, c-ares, check, dav1d, fluidsynth, fftw, fwts,
+	ghostscript, gnupg2, gnuradio, gupnp, haproxy, heimdal,
+	hwdata, jhead, libcap, libgcrypt, libgpg-error, libgtk3,
+	libxslt, mesa3d-demos, mpir, nodejs, php, pkgconf,
+	python-cryptography, python-dbus-fast, python-django,
+	python-pyicu, python-requests, python3, qt6, quickjs,
+	sconeserver, taglib, tiff, wireshark, xdriver_xf86-video-dummy
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15643: ERROR: No hash found for linux-6.3.8.tar.xz
+	#15673: PKGCONF_SITE in pkgconf.mk points to parked domain
+	#15682: pkgconf: no longer able to download source from...
+
 2023.02.2, released June 16th, 2023
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 7fcd9e6bcb..7309fd9976 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.02.2
+export BR2_VERSION := 2023.02.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1686923000
+BR2_VERSION_EPOCH = 1689628000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 5bc7a2c012..250766fb1d 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2023.02.2'
+RELEASE='2023.02.3'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
