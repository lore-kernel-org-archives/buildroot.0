Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AABDC433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 14:27:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C9CC611CA
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 14:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C9CC611CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1AB360BB6;
	Wed, 15 Sep 2021 14:27:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id soxfmiKzYQk8; Wed, 15 Sep 2021 14:27:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 471DB6066D;
	Wed, 15 Sep 2021 14:27:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E0791BF384
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 14:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A8CE4067A
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 14:27:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KgKTwrj2_r28 for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 14:27:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2381640679
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 14:27:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B37468B3E0; Wed, 15 Sep 2021 14:25:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Sep 2021 16:26:50 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 2a411da1a6a683b1721de59dd5142228abbba487
X-Git-Newrev: 3466797cedb15097924bf207774d11a79d03a9ac
X-Patchwork-Hint: ignore
Message-Id: <20210915142530.B37468B3E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] Update for 2021.05.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=3466797cedb15097924bf207774d11a79d03a9ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 23 +++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index ebc454c9f1..ef8e9b39da 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,26 @@
+2021.05.2, released September 15th, 2021
+
+	Important / security related fixes.
+
+	Toolchain: Disable fortify support for Microblaze as it is not
+	currently working.
+
+	Updated/fixed packages: alsa-utils, arm-trusted-firmware,
+	bayer2rgb-neon, belle-sip, bullet, busybox, c-ares, cjson,
+	coreutils, cpio, eigen, environment-setup, fetchmail, ffmpeg,
+	fontconfig, gd, gdb, gnuradio, gnutls, go, haproxy, ipmiutil,
+	iputils, jszip, kvm-unit-tests, libarchive, libargtable2,
+	libexif, libgcrypt, libmodsecurity, libopenssl, librsvg,
+	libshout, libssh, libxcrypt, linux, linux-pam, localedef, mc,
+	mesa3d, mosquitto, netsniff-ng, nginx, nodejs, ogre, openjdk,
+	openmpi, openvmtools, perl-net-ssh2, php, pipewire,
+	postgresql, prelink-cross, prosody, protobuf, python-keyring,
+	python-matplotlib, python-pillow, python-pyudev,
+	python-secretstorage, python3, qt5base, samba4, sdl2, sox,
+	swupdate, sylpheed, tar, terminology, tor, uboot-tools, uhd,
+	unbound, ushare, vim, wlroots, xapp_xrdb, xapp_xwd, xen,
+	xenomai, xlib_libXfont2, xlib_libXft, zip
+
 2021.05.1, released August 10, 2021
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 259706719a..43abe05001 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.05.1
+export BR2_VERSION := 2021.05.2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1628580000
+BR2_VERSION_EPOCH = 1631716000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
