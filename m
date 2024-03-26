Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FF6C6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 16:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C30041550;
	Tue, 26 Mar 2024 16:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ny4LH1TxYYvD; Tue, 26 Mar 2024 16:59:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3935E41557
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3935E41557;
	Tue, 26 Mar 2024 16:59:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30FC11BF487
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 16:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C2FF40819
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 16:59:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9VtZmaT2V8sh for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 16:58:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09152407FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09152407FF
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 16:58:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4B5B84297; Tue, 26 Mar 2024 16:58:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Mar 2024 17:54:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8fcd9876d9e0d0fff8b8aca2462d89d69b0601b
X-Git-Newrev: e7119631bbc3cbad7c30882e212762d7278a2015
X-Patchwork-Hint: ignore
Message-Id: <20240326165858.E4B5B84297@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.11.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=e7119631bbc3cbad7c30882e212762d7278a2015
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c2e4b76d0328203b0aa5280e6154aeba19839bd6)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/CHANGES b/CHANGES
index 9643d52423..a5ee80016e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -117,6 +117,34 @@
 	#15910: USB keyboard is not working by default "raspberrypicm4io_..
 	#15952: Grub fails to load large rootfs files
 
+2023.11.3, released March 26th, 2024
+
+	Important / security related fixes.
+
+	Defconfigs: Starfive visionfive2: Use correct genimage
+	configuration.
+
+	Updated/fixed packages: bind, bitcoin, botan, c-ares, clamav,
+	conmon, containerd, cvs, dash, dnsmasq, docker-engine, dracut,
+	ell, expat, fluent-bit, freetype, gcc, ghostscript, gmp,
+	gnupg2, go, google-breakpad, gst1-python, gst1-vaapi, iwd,
+	libcoap, libcurl, libdnet, libgit2, libheif, libkrb5,
+	libmodsecurity, libnfs, libopenssl, libselinux, libunwind,
+	liburing, libuv, libva, libxml2, ltris, lua-http, luvi,
+	mmc-utils, nginx-naxsi, nodejs, octave, openssh, openvmtools,
+	parted, petitboot, php, poco, postgresql, powertop, privoxy,
+	pure-ftpd, putty, python-cheroot, python-configshell-fb,
+	python-django, python-rtslib-fb, python3,
+	rauc-hawkbit-updater, redis, redis-plus-plus, rsync,
+	s390-tools, sdl2, shim, spice, spirv-tools, squid, strace,
+	strongswan, sudo, systemd, targetcli-fb, uhd, unbound,
+	util-linux, v4l2loopback, vim, webkitgtk, wpewebkit, xvisor,
+	zlib-ng
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15997: Build Squid with GCC12.3 in Buildroot 2024.02 will fail
+
 2023.11.2, released March 1st, 2024
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
