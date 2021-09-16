Return-Path: <SRS0=h7+E=OG=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A25D7C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 20:37:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BCDD61056
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 20:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BCDD61056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD8FB83F67;
	Thu, 16 Sep 2021 20:37:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tGdOFLrcOgGT; Thu, 16 Sep 2021 20:37:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FD6683F63;
	Thu, 16 Sep 2021 20:37:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 997281BF2F1
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 20:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9630083F63
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 20:37:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NIKBw8xDYrpp for <buildroot@lists.busybox.net>;
 Thu, 16 Sep 2021 20:37:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAF4683F61
 for <buildroot@buildroot.org>; Thu, 16 Sep 2021 20:37:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8C3B08B4C6; Thu, 16 Sep 2021 20:35:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 16 Sep 2021 22:33:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c040feba86c2986c39a388fac75aefd94e25859
X-Git-Newrev: 1d550990ea68c7674f25217d036631243690b0e7
X-Patchwork-Hint: ignore
Message-Id: <20210916203511.8C3B08B4C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2021.02.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=1d550990ea68c7674f25217d036631243690b0e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 767a2da72fc1690fde33b665851f20492ba5cd75)
[Peter: drop Makefile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/CHANGES b/CHANGES
index 85cd179491..aa43729732 100644
--- a/CHANGES
+++ b/CHANGES
@@ -343,6 +343,28 @@
 	#13751: libopenssl (static): huge drop in performance in newer ..
 	#13771: package htop has undeclared dependency on host python
 
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
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
