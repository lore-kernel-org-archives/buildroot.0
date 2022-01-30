Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A57C433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 20:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AF39410A0;
	Sun, 30 Jan 2022 20:15:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MsE2MY2HrGZ0; Sun, 30 Jan 2022 20:15:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99EF440939;
	Sun, 30 Jan 2022 20:15:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C5D01BF962
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 20:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39C3740412
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 20:14:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ip1K1FJoMxlI for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 20:14:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEF644013B
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 20:14:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B5256819CC; Sun, 30 Jan 2022 20:07:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 20:48:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75bea7b215675da9e097f9105d9b97aa4fc4f5b1
X-Git-Newrev: 4f4a3152f656e7b2c8f427436336e463d15d35cf
X-Patchwork-Hint: ignore
Message-Id: <20220130200732.B5256819CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2021.11.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f4a3152f656e7b2c8f427436336e463d15d35cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 323ae1e681c24babfb375cb46bc81df551a3e0b7)
[Peter: drop Makefile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 36 ++++++++++++++++++++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index b49afd1075..b2fcab8776 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,39 @@
+2021.11.1, released January 29th, 2022
+
+	Important / security related fixes.
+
+	check-package: Improve variable override check
+
+	pkg-stats: List CVEs where the version info cannot be parsed
+	as unsure rather than completely ignoring them.
+
+	Defconfigs: Beaglebone: Support BeagleBone black wireless,
+	stm32f469_xip_disco: Fix kernel boot
+
+	Updated/fixed packages: alsa-utils, apache, binutils, cage,
+	capnproto, civetweb, clamav, collectd, connman, containerd,
+	coreutils, dav1d, docker-cli, docker-engine, erlang,
+	erlang-rebar, expat, findutils, flare-engine, flare-game,
+	font-awesome, freeswitch, gcc, ghostscript, glibc, gnuchess,
+	go, grpc, gst1-interpipe, gst1-rtsp-server, gupnp-tools,
+	hackrf, icu, imagemagick, janus-gateway, json-for-modern-cpp,
+	keepalived, lapack, libdbi, libiio, libjpeg, libmbim, libnss,
+	libopenssl, libpjsip, libqmi, liburiparser, libvirt,
+	linux-pam, lxc, mbedtls, mender, mongodb, mpd-mpc, mutt,
+	nodejs, openblas, pcre2, php, pipewire, polkit, privoxy,
+	prosody, python-charset-normalizer, python-django,
+	python-idna, python-lxml, python-pyqt5, python-requests,
+	python-urllib3, python3, qt5base, qt5location, rhash,
+	rng-tools, ruby, runc, rustc, samba4, sofia-sip, targetcli-fb,
+	tcpreplay, tinyxml, tor, tpm2-tss, util-linux-libs, vim, vlc,
+	wireshark, xapp_xauth, xapp_xinput-calibrator, xen, xenomai,
+	xlib_libX11, xserver_xorg-server
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14451: nodejs won't build on Fedora 35
+	#14471: alsa_utils wrong deployment
+
 2021.11, released December 5th, 2021
 
 	Various fixes.
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 2bcb59c08b..eb312081fe 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2021.11'
+RELEASE='2021.11.1'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
