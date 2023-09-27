Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79080E7F14F
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 22:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE27C400D8;
	Wed, 27 Sep 2023 22:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE27C400D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yIHW2oGEVqcA; Wed, 27 Sep 2023 22:09:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FE67405B5;
	Wed, 27 Sep 2023 22:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FE67405B5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D8BF1BF263
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 22:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3758F60DA0
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 22:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3758F60DA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bpjnmWNA9PQZ for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 22:09:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0268A60A7B
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 22:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0268A60A7B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E27F38280F; Wed, 27 Sep 2023 22:09:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 28 Sep 2023 00:08:42 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 4e7856226c37d192c5466b092404a309735507c8
X-Git-Newrev: 9266ab06e0ef1a448ac3f1c848bba59ec9908fbf
X-Patchwork-Hint: ignore
Message-Id: <20230927220906.E27F38280F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] Update for 2023.08.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=9266ab06e0ef1a448ac3f1c848bba59ec9908fbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 23 +++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 260e883973..fa7dc51b42 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,26 @@
+2023.08.1, released September 27th, 2023
+
+	Important / security related fixes.
+
+	Updated/fixed packages: agentpp, asterisk, bind, binutils,
+	conmon, cpio, docker-cli, docker-engine, e2fsprogs, erlang,
+	esp-hosted, expect, fail2ban, fio, freerdp, fstrcmp, gcc, gdb,
+	ghostscript, go, haproxy, hwloc, icu, irssi, libcoap, libcurl,
+	libde265, libheif, libiec61850, libjxl, libopenssl, libpjsip,
+	libqb, libraw, libssh, libuv, lldpd, mdadm, mutt, ne10,
+	netatalk, nodejs, nut, openblas, opensc, openvpn, petitboot,
+	php, pound, pppd, python-pytest, python3, qt5,
+	rtl8812au-aircrack-ng, sngrep, stress-ng, strongswan, sysstat,
+	tar, tcl, timescaledb, util-linux, vim, webkitgtk, webp,
+	wireshark, xserver_xorg-server, xterm, zbar, zxing-cpp,
+	zynaddsubfx
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14366: Nodejs fails with "version `GLIBC_2.34' not found"..
+	#15787: atmel_sama5d3_xplained_mmc_defconfig: Missing...
+	#15790: at91sam9x5ek_dev_defconfig: Missing...
+
 2023.08, released September 6th, 2023
 
 	Various fixes.
diff --git a/Makefile b/Makefile
index d017b7e0eb..5635bff6e8 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.08
+export BR2_VERSION := 2023.08.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1694030000
+BR2_VERSION_EPOCH = 1695852000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 340d931d1a..a7e3b7456c 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2023.08'
+RELEASE='2023.08.1'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
