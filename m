Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271E5ECE57A
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 12:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BB59402FD;
	Mon,  9 Sep 2024 12:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aoU53EAIXV1d; Mon,  9 Sep 2024 12:54:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BD5F40321
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BD5F40321;
	Mon,  9 Sep 2024 12:54:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F51C1BF2FC
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 12:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0FCF80EC5
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 12:54:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YgXMsh8oCyhe for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 12:54:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9B4E80EBA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9B4E80EBA
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 12:54:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C026D86D01; Mon,  9 Sep 2024 12:54:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 9 Sep 2024 14:50:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be5a0ce9bc52eb43d0c597097b6716809ed0098d
X-Git-Newrev: a8c74cae45e4836a6662ffc083c1d227498f389a
X-Patchwork-Hint: ignore
Message-Id: <20240909125451.C026D86D01@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.05.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8c74cae45e4836a6662ffc083c1d227498f389a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e4a5ab3b319753f41e2b5cf22e90b6b0304ca225)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/CHANGES b/CHANGES
index 544931921b..39f62d5603 100644
--- a/CHANGES
+++ b/CHANGES
@@ -130,6 +130,44 @@
 	- Can't subscribe buildroot mailing list
 	  https://gitlab.com/buildroot.org/buildroot/-/issues/25
 
+2024.05.3, released September 9th, 2024
+
+	Important / security related fixes.
+
+        A large number of GCC 14.x compilation fixes and additional
+        runtime tests.
+
+        Infrastructure:
+        - Be more robust against text files (for package hashes and
+          users) incorrectly missing a terminating newline.
+
+        - Fix various issues with the pkg-kconfig infrastructure and
+          per-package-directories builds
+          (BR2_PER_PACKAGE_DIRECTORIES).
+
+	Updated/fixed packages: aer-inject, am335x-pru-package,
+	apache, apr, apr-util, attr, augeas, autossh, bandwidthd,
+	bcusdk, boost, brcm-patchram-plus, btrfs-progs, busybox,
+	can-utils, coreutils, cpuload, cryptsetup, cwiid, dhrystone,
+	dvb-apps, elfutils, faifa, fetchmail, ffmpeg, fluent-bit,
+	fluidsynth, freerdp, gcc, gcc-bare-metal, gdb, gnutls, gpsd,
+	hiawatha, hostapd, htop, ibm-sw-tpm2, intel-microcode, iperf3,
+	iproute2, ksmbd-tools, libcli, libcoap, libcurl, libest,
+	libfreefare, libgtk3, libngs, libpwquality, libressl, libupnp,
+	libxml2, libxslt, lrzsz, mdio-tools, micropython,
+	mjpg-streamer, mokutil, mpir, ncftp, nginx, nodejs, odb,
+	open-iscsi, openldap, openswan, openvpn, pistache, procps-ng,
+	python-django, quotatool, rtty, ruby, sconeserver, speex,
+	swaybg, tar, tftpd, tinyssh, uclibc, uclibc-ng-test, unbound,
+	uuu, vorbus-tools, wpewebkit, zfs, zsh
+
+        Issues resolved:
+	- TAR-1.35 will not build for target (host-variant will build)
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/4
+	- Toolchain (host-gcc-final-14.1.0) build failure with
+	  y2038/BR2_TIME_BITS_64 enabled
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/16
+
 2024.05.2, released August 14th, 2024
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
