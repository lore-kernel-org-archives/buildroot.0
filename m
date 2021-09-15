Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E7B8C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 15:20:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C552F61250
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 15:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C552F61250
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62B4140476;
	Wed, 15 Sep 2021 15:20:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NcfKvicMvbzh; Wed, 15 Sep 2021 15:20:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C48A240328;
	Wed, 15 Sep 2021 15:20:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 785361BF3A3
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 15:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74B0F40328
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 15:20:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AIYSRJPfxzXb for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 15:20:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9079B40247
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 15:20:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 16F758110F; Wed, 15 Sep 2021 15:18:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Sep 2021 17:20:06 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 9235281bcb505a6630052d38c04250aa5f9a89f8
X-Git-Newrev: 767a2da72fc1690fde33b665851f20492ba5cd75
X-Patchwork-Hint: ignore
Message-Id: <20210915151834.16F758110F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] Update for 2021.02.5
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=767a2da72fc1690fde33b665851f20492ba5cd75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 22 ++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index a692ed7baa..63cb40721e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,25 @@
+2021.02.5, released September 15th, 2021
+
+	Important / security related fixes.
+
+	Toolchain: Disable fortify support for Microblaze as it is not
+	currently working.
+
+	Updated/fixed packages: alsa-utils, arm-trusted-firmware,
+	bayer2rgb-neon, belle-sip, busybox, c-ares, cjson, coreutils,
+	cpio, eigen, environt-setup, fetchmail, fluidsynth,
+	fontconfig, gd, gdb, gnuradio, gnutls, go, haproxy, ipmiutil,
+	iputils, jszip, kvm-unit-tests, libarchive, libexif,
+	libgcrypt, libmodsecurity, libopenssl, librsvg, libshout,
+	libssh, linux, localedef, mc, mesa3d, mosquitto, netsniff-ng,
+	nginx, nodejs, ogre, openmpi, openvmtools, php, postgresql,
+	prelink-cross, prosody, protobuf, python-keyring,
+	python-matplotlib, python-pillow, python-pyudev,
+	python-secretstorage, python3, qt5base, samba4, sdl2, sox,
+	swupdate, sylpheed, tor, uboot-tools, uhd, unbound, vim,
+	wlroots, xapp_xrdb, xapp_xwd, xen, xenomai, xlib_libXfont2,
+	xlib_libXft, zip
+
 2021.02.4, released August 10th, 2021
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index c6be0ca7df..013b29edb7 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.02.4
+export BR2_VERSION := 2021.02.5
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1628627000
+BR2_VERSION_EPOCH = 1631718000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index f0d1e78891..e1f77efdbd 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2021.02.4'
+RELEASE='2021.02.5'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
