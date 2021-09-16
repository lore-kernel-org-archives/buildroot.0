Return-Path: <SRS0=h7+E=OG=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84633C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 20:31:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCFF860FBF
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 20:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CCFF860FBF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0A7883F68;
	Thu, 16 Sep 2021 20:30:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hRt12Et8cywQ; Thu, 16 Sep 2021 20:30:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0374683F63;
	Thu, 16 Sep 2021 20:30:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 61F161BF9BA
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 20:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F03283ECB
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 20:30:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uP0mzFQAaMxV for <buildroot@lists.busybox.net>;
 Thu, 16 Sep 2021 20:30:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67CFA83EC7
 for <buildroot@buildroot.org>; Thu, 16 Sep 2021 20:30:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1B7678B4B9; Thu, 16 Sep 2021 20:28:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 16 Sep 2021 22:25:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2a1e959ea6da4ddfc6ffbe9877de9826a832684
X-Git-Newrev: b926d0d30022362a16de0128df8a98779e34839c
X-Patchwork-Hint: ignore
Message-Id: <20210916202853.1B7678B4B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2021.05.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=b926d0d30022362a16de0128df8a98779e34839c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3466797cedb15097924bf207774d11a79d03a9ac)
[Peter: drop Makefile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/CHANGES b/CHANGES
index 78ca4446e0..85cd179491 100644
--- a/CHANGES
+++ b/CHANGES
@@ -122,6 +122,29 @@
 	#13846: BR2_PACKAGE_LVM2_STANDARD_INSTALL should be default to
 	        y as before
 
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
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
