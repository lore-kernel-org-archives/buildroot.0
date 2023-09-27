Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9365EE7F14F
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 22:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2814F400D8;
	Wed, 27 Sep 2023 22:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2814F400D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ghP6aWZHYL8L; Wed, 27 Sep 2023 22:26:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F33F41995;
	Wed, 27 Sep 2023 22:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F33F41995
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 471A71BF263
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 22:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18328421B3
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 22:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18328421B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4fyosCP9umpI for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 22:25:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C75C42139
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 22:25:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C75C42139
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07AFC82846; Wed, 27 Sep 2023 22:25:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 28 Sep 2023 00:22:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05fbb29322aa3aa093191c393befe9a03c654b4a
X-Git-Newrev: 55fbb5519ca8c179e528638cc1b7ba3f166a7b64
X-Patchwork-Hint: ignore
Message-Id: <20230927222559.07AFC82846@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.08.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=55fbb5519ca8c179e528638cc1b7ba3f166a7b64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9266ab06e0ef1a448ac3f1c848bba59ec9908fbf)
[Peter: drop Makefile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 23 +++++++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 2d18c32f24..4164bd81f3 100644
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
