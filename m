Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABEEC433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 20:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8457F60E8A;
	Sun, 30 Jan 2022 20:15:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XHJMhvKd4XdT; Sun, 30 Jan 2022 20:15:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C90E760E88;
	Sun, 30 Jan 2022 20:15:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A49D61BF3FD
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 20:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FC7140412
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 20:14:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YXrhL8e6_I5w for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 20:14:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10A22402C3
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 20:14:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D12F3819CC; Sun, 30 Jan 2022 20:07:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 21:06:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce361c33615437c17f55c1765a20766b0fa2602f
X-Git-Newrev: 24c390dcedcebce33191c503410e8420721c7f6a
X-Patchwork-Hint: ignore
Message-Id: <20220130200732.D12F3819CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2021.02.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=24c390dcedcebce33191c503410e8420721c7f6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit af67915161af4243cfdbd81408cd6ba64a8438eb)
[Peter: drop Makefile/Vagrantfile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/CHANGES b/CHANGES
index b2fcab8776..4fa4e12b9f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -624,6 +624,35 @@
 	#13751: libopenssl (static): huge drop in performance in newer ..
 	#13771: package htop has undeclared dependency on host python
 
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
