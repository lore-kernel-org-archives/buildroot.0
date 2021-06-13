Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E883C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:03:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F197E60F93
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F197E60F93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBDA6404F9;
	Tue,  3 Aug 2021 23:03:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gco20VQQ03UI; Tue,  3 Aug 2021 23:03:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D63BB40360;
	Tue,  3 Aug 2021 23:03:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 309EE1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 785DB40626
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6jzwWulNnrhG for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20C294062F
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 73EB385C5F; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Jun 2021 10:42:59 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e812aa83437fda05d06626102fa8716a17ea4d72
X-Git-Newrev: 339810921beb1899e93caedd0f0b6a27e1aa760b
X-Patchwork-Hint: ignore
Message-Id: <20210803210950.73EB385C5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Update for 2021.02.3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=339810921beb1899e93caedd0f0b6a27e1aa760b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5293208a57ce78f9fc958704d7df52f28532cde6)
[Peter: drop Makefile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/CHANGES b/CHANGES
index c7ae5fbfc3..91487cc058 100644
--- a/CHANGES
+++ b/CHANGES
@@ -144,6 +144,51 @@
 	#13751: libopenssl (static): huge drop in performance in newer ..
 	#13771: package htop has undeclared dependency on host python
 
+2021.02.3, released June 12th, 2021
+
+	Important / security related fixes.
+
+	CPE meta data has been added for a large number of packages
+
+	Updated/fixed packages: acpid, apache, apcupsd, assimp, bird,
+	bitcoin, blktrace, boost, capnproto, chrony, dc3dd, dhcp,
+	directfb, dmalloc, docker-engine, ebtables, efibootmgr,
+	enlightenment, enscript, environment-setup, exempi, expat,
+	findutils, flatcc, fluidsynth, frr, gdb, go, gptfdisk, grpc,
+	gst1-plugins-bad, gst1-rtsp-server, gstreamer1, gupnp,
+	hostapd, hwloc, i2c-tools, iftop, imagemagick, imx-gpu-viv,
+	intel-mediadriver, intel-microcode, jquery-validation,
+	keepalived, kodi, less, libcamera, libcurl, libcutl, libesmtp,
+	libeXosip2, libffi, libfuse, libfuse3, libgeos, libgtk2,
+	libgtk3, libical, libidn, libidn2, libkcapi, libldns, libmms,
+	libmodbus, libmspack, libnids, libopenh264, liboping, libraw,
+	librelp, libsamplerate, libtirpc, libusb, libuv, libxcb,
+	libxml2, libxslt, live555, llvm, lmbench, localedef,
+	lttng-tools, lvm2, lz4, mesa3d, mimic, mini-snmpd, minidlna,
+	minissdpd, minizip, mono-gtksharp3, mpg123, mpv, msmtp, musl,
+	mutt, nasm, nbd, netperf, netsurf, nginx, odb, opencv3,
+	openssh, opentyrian, oprofile, p7zip, paho-mqtt-c, perl,
+	php-imagick, pifmrds, picocom, pigz, pngquant, poco,
+	postgresql, prosody, proxychains-ng, pulseaudio, putty, pwgen,
+	python-autobahn, python-bluezero, python-engineio,
+	python-keyring, python-pillow, python-requests, python-tqdm,
+	qemu, qpdf, qt5base, redis, refpolicy, rt-tests, runc,
+	shellinabox, squid, strace, supervisor, synergy, taglib,
+	tclap, terminology, thermald, tini, tinyproxy, tinyxml2,
+	tpm2-tss, uclibc, udisks, uhd, unscd, vlc, waylandpp,
+	webkitgtk, weston, wireshark, wpa_supplicant, wpewebkit,
+	xlib_libdmx, xlib_libFS, xlib_libICE, xlib_libX11,
+	xlib_libXcursor, xlib_libXdmcp, xlib_libXext, xlib_libXfixes,
+	xlib_libXfont2, xlib_libXinerama, xlib_libXpm, xlib_libXres,
+	xlib_libXt, xlib_libXtst, xlib_libXxf86dga, xlib_libXxf86vm,
+	xterm
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13781: isc dhcp-server package don't create file /usr/bin/dhcpd
+	#13801: toolchainfile.cmake CMAKE_BUILD_TYPE
+	#13806: Building host-localedef fails on fedora 34/gcc 11
+
 2021.02.2, released May 12th, 2021
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
