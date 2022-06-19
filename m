Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E12C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 10:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13BF860E2E;
	Sun, 19 Jun 2022 10:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13BF860E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lmPZg69rlSER; Sun, 19 Jun 2022 10:19:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE2C660D56;
	Sun, 19 Jun 2022 10:19:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE2C660D56
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C65C11BF3AD
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 10:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0EE68248F
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 10:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0EE68248F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QEJRzwSi0P3K for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 10:19:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 953838176F
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 10:19:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 953838176F
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DE24F86C69; Sun, 19 Jun 2022 10:07:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 12:19:18 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a4c72961e94af0d63ec11cb18b24c3d1f259f741
X-Git-Newrev: fb3c633cf24188b2300426201d1fe5578ebbf972
X-Patchwork-Hint: ignore
Message-Id: <20220619100709.DE24F86C69@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] Update for 2022.02.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb3c633cf24188b2300426201d1fe5578ebbf972
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 32 ++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0e6f06ca71..6c5b38b28e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,35 @@
+2022.02.3, released June 19th, 2022
+
+	Important / security related fixes.
+
+	Infrastructure: Fix building under paths containing regex
+	characters (E.G. '+')
+
+	Toolchain: Only allow ppc64le variants for which a
+	glibc/musl/uclibc toolchain is supported.
+	Mark codescape mti/img mips toolchains as shared library only
+	(glibc).
+
+	Updated/fixed packages: arm-trusted-firmware,
+	at91dataflashboot, boinc, dhcp, diffutils, edk2, fbv, gensio,
+	glibc, go, gtest, iucode-tool, janet, libcec, libcurl,
+	libfreeimage, libnftnl, libodb-boost, linux, linux-tools,
+	lttng-modules, mariadb, memcached, mono, mutt,
+	network-manager, nginx, ntfs-3g, ogre, openjpeg, openvpn,
+	qemu, qpid-proton, qt5webengine, rauc, rockchip-mali, rsyslog,
+	ruby, runc, rustc, samba4, strace, tiff, uclibc, unrar, vim,
+	webkitgtk, wpewebkit, xdriver_xf86-video-amdgpu,
+	xdriver_xf86-video-ati, zlib-ng
+
+	New packages: qt5webengine-chromium,
+	qt5webengine-chromium-catapult
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14766: package dhcp on buildroot 2022.02.1 failed
+	#14821: Samba server is failing to compile
+	#14826: make qemu_x86_64_defconfig stopped working
+
 2022.02.2, released May 29th, 2022
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 3b11f610c2..e4007d2c38 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.02.2
+export BR2_VERSION := 2022.02.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1653852000
+BR2_VERSION_EPOCH = 1655633000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index e343cf432e..976647d65d 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2022.02.2'
+RELEASE='2022.02.3'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
