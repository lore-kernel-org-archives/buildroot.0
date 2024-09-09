Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E55ECE57A
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 14:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B441140531;
	Mon,  9 Sep 2024 14:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4dcS90RWODrx; Mon,  9 Sep 2024 14:39:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EF7640412
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EF7640412;
	Mon,  9 Sep 2024 14:39:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 815881BF863
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 14:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 990EA80E39
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 14:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Foj_O0xs0DYf for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 14:39:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 112C280E43
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 112C280E43
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 14:39:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0792086D75; Mon,  9 Sep 2024 14:39:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 9 Sep 2024 16:33:59 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: ba22d70c074e0b2790279e461d510dcffebacb07
X-Git-Newrev: d9b046e634f4b4390e2d36f7224b30851ee1e46c
X-Patchwork-Hint: ignore
Message-Id: <20240909143901.0792086D75@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] Update for 2024.02.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9b046e634f4b4390e2d36f7224b30851ee1e46c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 30 ++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 64d89277f2..059c4ba4ee 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,33 @@
+2024.02.6, released September 9th, 2024
+
+	Important / security related fixes.
+
+        Added a large number of additional runtime tests.
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
+	apache, apr, apr-util, attr, boost, btrfs-progs, busybox,
+	cryptsetup, dropbear, elfutils, fetchmail, ffmpeg, fluidsynth,
+	freerdp, gcc, gdb, gnutls, gpsd, hiawatha, hostapd, htop,
+	intel-microcode, iperf3, ksmbd-tools, libcoap, libcurl,
+	libest, libgtk3, libpwquality, libressl, libupnp, libxml2,
+	libxslt, lrzsz, mdio-tools, micropython, mjpg-streamer, mpir,
+	ncftp, nginx, nodejs, open-iscsi, openldap, openvpn, pistache,
+	procps-ng, python-django, ruby, speex, swaybg, tinyssh,
+	uclibc, uclibc-ng-test, unbound, uuu, wpewebkit, zfs
+
+        Issues resolved:
+	- Toolchain (host-gcc-final-14.1.0) build failure with
+	  y2038/BR2_TIME_BITS_64 enabled
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/16
+
 2024.02.5, released August 14th, 2024
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 4d005cd06f..e3e2d4377d 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.02.5
+export BR2_VERSION := 2024.02.6
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1723635000
+BR2_VERSION_EPOCH = 1725892000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index ca7e161e1b..523943fa51 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2024.02.5'
+RELEASE='2024.02.6'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
