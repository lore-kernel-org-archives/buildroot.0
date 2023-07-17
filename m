Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909CFEB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 21:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C94E404E2;
	Mon, 17 Jul 2023 21:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C94E404E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rNDtKF1_iaCw; Mon, 17 Jul 2023 21:42:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33A7E404C6;
	Mon, 17 Jul 2023 21:42:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33A7E404C6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 92EB71BF2C1
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 21:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A189400FC
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 21:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A189400FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q-VgMOI5C5x8 for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 21:42:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98447400AB
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 21:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98447400AB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83CAB873B1; Mon, 17 Jul 2023 21:42:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jul 2023 23:21:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c8abbf72fdebfe8d1b34dc40113c8db0a800ed3
X-Git-Newrev: 66961b267791c21335e9b9dbb8897f7211e1524c
X-Patchwork-Hint: ignore
Message-Id: <20230717214212.83CAB873B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.02.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=66961b267791c21335e9b9dbb8897f7211e1524c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dc7000f0de50a21355198d6ce814143a9d5af582)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/CHANGES b/CHANGES
index bbf8fccca2..6ca8a2c58d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -103,6 +103,30 @@
 	#15376: Libiconv config
 	#15461: QtVirtualKeyboard segfaults
 
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
