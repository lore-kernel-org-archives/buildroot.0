Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDB0C433F5
	for <buildroot@archiver.kernel.org>; Fri, 25 Mar 2022 11:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D107C61086;
	Fri, 25 Mar 2022 11:08:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZGjN4NthfL-9; Fri, 25 Mar 2022 11:08:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDABB60BCF;
	Fri, 25 Mar 2022 11:08:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 785131BF372
 for <buildroot@lists.busybox.net>; Fri, 25 Mar 2022 11:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61A3384265
 for <buildroot@lists.busybox.net>; Fri, 25 Mar 2022 11:08:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PHGNSwm0Ju_4 for <buildroot@lists.busybox.net>;
 Fri, 25 Mar 2022 11:08:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62B71841CC
 for <buildroot@buildroot.org>; Fri, 25 Mar 2022 11:08:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id ED86B85CC8; Fri, 25 Mar 2022 10:59:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 25 Mar 2022 12:08:14 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: be37df00dabf5155d7d9bd8ff7414ed2e44426fa
X-Git-Newrev: 6a78c830a49b19425de5d1df407c2ba8c302cb7a
X-Patchwork-Hint: ignore
Message-Id: <20220325105935.ED86B85CC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] Update for 2021.02.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a78c830a49b19425de5d1df407c2ba8c302cb7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 24 ++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index ee01f12a3c..c9822cdf80 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,27 @@
+2021.02.11, released March 25th, 2022
+
+	Important / security related fixes.
+
+	Updated/fixed packages: apache, azure-iot-sdk-c, dbus,
+	directfb, docker-engine, exempi, expat, flac, gdk-pixbuf,
+	gnutls, go, haproxy, libcurl, libiec61850, libminiupnpc,
+	libodb, libodb-boost, libopenssl, libpjsip, libressl, librsvg,
+	libsrtp, libxml2, libxslt, lxc, mariadb, odbm openblas,
+	openvpn, oprofile, php, pppd, python-ipython, python-treq,
+	python-twisted, python-txbus, python-txtorcon, raptor,
+	rpi-firmware, samba4, timescaledb, util-linux, vim, wavpack,
+	wireless-regdb, wireshark, wolfssl, xscreensaver, xterm, zsh
+
+	New packages: gdk-pixbuf-xlib
+
+	Removed packages: python-coherence
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13126: make fails - bzip2-1.0.6.tar.gz and DirectFB-1.7.7.tar..
+	#14636: azure-iot-sdk-c: Installed headers do not compile
+	#14641: oprofile can not find the events files
+
 2021.02.10, released February 28th, 2022
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 9dc0a8673c..a3c5802d55 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.02.10
+export BR2_VERSION := 2021.02.11
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1646081600
+BR2_VERSION_EPOCH = 1648206000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 85aa167efc..7e97a277ea 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2021.02.10'
+RELEASE='2021.02.11'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
