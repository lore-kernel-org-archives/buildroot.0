Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA04C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 17:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E29D9408F3;
	Tue, 14 Dec 2021 17:18:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WHTYsLpWl6LZ; Tue, 14 Dec 2021 17:18:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 304E540929;
	Tue, 14 Dec 2021 17:18:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85F571BF2A7
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 17:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75228815AC
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 17:18:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gkBudsSW8Oe0 for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 17:18:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D670817A4
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 17:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C984E814DA; Tue, 14 Dec 2021 17:12:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 18:02:50 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 7f48212a2efffe7654f5e6fcb974aff555c5a03c
X-Git-Newrev: 170f42eb6b891e06fd500483c92a5e00f77d1dc6
X-Patchwork-Hint: ignore
Message-Id: <20211214171248.C984E814DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] Update for 2021.02.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=170f42eb6b891e06fd500483c92a5e00f77d1dc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 25 +++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index b7b335d598..e967c265cd 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,28 @@
+2021.02.8, released December 14th, 2021
+
+	Important / security related fixes.
+
+	Defconfigs: Various fixes for building with gcc >= 10 host or
+	target compilers.
+
+	Updated/fixed packages: alsa-lib, apparmor, apr, asterisk,
+	binutils, bluez5_utils, busybox, coreutils, e2fsprogs, ell,
+	exfat, freeswitch, gdb, glmark2, glog, glorytun, gmp,
+	gpu-amd-bin-mx51, gst1-interpipe, gstreamer1, guile, gupnp,
+	hackrf, heimdal, hiawatha, hplip, icu, imx-vpuwrap, isl, iwd,
+	janus-gateway, libatomic_ops, libbson, libdnet, libffi,
+	libgdiplus, libgee, libhtp, libmodsecurity, libnspr, libnss,
+	libunwind, linux, lynx, meson, micropython, mkpasswd, mksh,
+	mosquitto, motion, mxml, netdata, nfs-utils, oracle-mysql,
+	pcre, pkcs11-helper, postgresql, pure-ftpd, python-cycler,
+	qdecoder, rcw-smarc-sal28, samba4, smack, speex, stress-ng,
+	suricata, syslinux, uboot, unixodbc, unrar, vim, websocketpp,
+	wireshark
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14346: BR2_PACKAGE_NFS_UTILS_RPC_NFSD does not patch CONFIG_NFSD..
+
 2021.02.7, released November 10th, 2021
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 47973344d3..926695afd3 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.02.7
+export BR2_VERSION := 2021.02.8
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1636550000
+BR2_VERSION_EPOCH = 1639501000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index c05053f2b2..ae1dd51650 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2021.02.7'
+RELEASE='2021.02.8'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
