Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAC5C83F37
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 18:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EE0E83935;
	Thu, 31 Aug 2023 18:29:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EE0E83935
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JKzJiiP6LMky; Thu, 31 Aug 2023 18:29:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 818F183381;
	Thu, 31 Aug 2023 18:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 818F183381
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5AF61BF990
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 18:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E1B841EF9
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 18:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E1B841EF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ca6dy53IEV0j for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 18:29:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AAF441EF4
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 18:29:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AAF441EF4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 71F6A8677E; Thu, 31 Aug 2023 18:29:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 20:12:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16c3b4b92bb7b2fef6ad314a5fb9b7203b3d80b3
X-Git-Newrev: 386b72ca224fba927a0bd768c2f772ee1b892ed1
X-Patchwork-Hint: ignore
Message-Id: <20230831182906.71F6A8677E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.05.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=386b72ca224fba927a0bd768c2f772ee1b892ed1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3923a4fac8c9e501b5fd94eea98bd7e842b31876)
[Peter: drop Makefile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 32 ++++++++++++++++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 3ee83f64c6..e623d8b439 100644
--- a/CHANGES
+++ b/CHANGES
@@ -80,6 +80,38 @@
 
 	Removed packages: libasplib, ocf-linux, tovid
 
+2023.05.2, released August 31th, 2023
+
+	Important / security related fixes.
+
+	Toolchains: Correctly mark Bootlin external toolchains as
+	having OpenMP support.
+
+	Arch: Mark Alderlake x86 variants as no AVX512 support.
+
+	Utils: Ensure utils/docker-run correctly supports git
+	worktrees.
+
+	Defconfigs: Beaglebone: U-Boot needs OpenSSL. Beaglebone qt5:
+	Enable support for green wireless variant.
+
+	Updated/fixed packages: arm-trusted-firmware, bind, cairo,
+	cmocka, containerd, crudini, cryptodev-linux, dmidecode,
+	ffmpeg, firmware-imx, gcc, gdb, ghostscript, gkrellm,
+	gnuradio, go, igh-ethercat, iperf3, kodi, libcurl, libopenssl,
+	libssh, libubootenv, libuhttpd, linux-tools, mali-driver,
+	nfs-utils, ntp, openssh, php, pipewire, python-pysmb,
+	python-iniparse, python-iptables, rtl8189es, rtl8189fs,
+	sam-ba, samba4, seatd, shadow, speex,
+	sunxi-mali-utgard-driver, supertuxkart, sysdig, systemd, tor,
+	tpm2-tss, transmission, uboot, unzip, webkitgtk,
+	wireless-regdb, wolfssl, wpebackend-fdo, wpewebkit, xenomai,
+	yaml-cpp, yavta
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15634: fluidsynths refers to missing libgomp.so.1
+
 2023.05.1, released July 17th, 2023
 
 	Important / security related fixes.
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 12da353f2e..75aae858b7 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2023.05.1'
+RELEASE='2023.05.2'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
