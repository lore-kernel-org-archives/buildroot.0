Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4C4C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 09:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA8E982F11;
	Thu, 28 Jul 2022 09:00:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA8E982F11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uehgu4Q-m6FD; Thu, 28 Jul 2022 09:00:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0535C82EB5;
	Thu, 28 Jul 2022 09:00:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0535C82EB5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A7291BF2BC
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 09:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61E3A82EB5
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 09:00:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61E3A82EB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zrrhRUFWC1rn for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 09:00:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84A3082EA2
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 09:00:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84A3082EA2
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7CBD784CA4; Thu, 28 Jul 2022 08:46:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 10:54:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 622e5f67bd7f9249514c44c7b64f2821a8f74635
X-Git-Newrev: 6ba523c813397d6ca629df4110a68921b5cc6693
X-Patchwork-Hint: ignore
Message-Id: <20220728084632.7CBD784CA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.05.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ba523c813397d6ca629df4110a68921b5cc6693
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2e399893b4f60f1e103228df6e4439d4e4ac3dd5)
[Peter: drop Makefile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 32 ++++++++++++++++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 38e83171f2..de57f62e4a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,35 @@
+2022.05.1, released July 24th, 2022
+
+	Important / security related fixes.
+
+	Disable big endian no-mmu on ARM as it is not supported by
+	elf2flt.
+
+	Tighten dependencies for external Bootlin toolchains to ensure
+	they can only be selected in compatible configurations.
+
+	Support external toolchains without gdbserver.
+
+	Updated/fixed packages: apache, avahi, bdwgc, bind, bpftool,
+	cups, darkhttpd, dmalloc, ecryptfs-utils, fxload, ghostscript,
+	gnutls, gst-omx, gst1-devtools, gst1-libav, gst1-plugins-base,
+	gst1-plugins-bad, gst1-plugins-good, gst1-plugins-ugly,
+	gst1-python, gst1-rtsp-server, gst1-vaapi, gstreamer1,
+	gstreamer1-editing-services, gtest, iptables, keyutils, lcms2,
+	libabseil-cpp, libcamera, libcurl, libeastl, libgpgme,
+	libgtk3, libmdbx, libmediaart, libmodsecurity, libnetconf2,
+	libopenssl, libpjsip, libsamplerate, libsndfile, libtalloc,
+	logrotate, luajit, nginx, noip, paxtest, php, postgresql,
+	procrank_linux, pure-ftpd, python-pillow, qdecoder,
+	rabbitmq-server, rpi-userland, ruby, rustc, sofia-sip,
+	systemd, tcpreplay, tinyproxy, tor, uacme, uboot-tools, vim,
+	watchdogd, webkitgtk, weston, wireguard-linux-compat,
+	wpa_supplicant, wpewebkit, zstd
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14881: Watchdogd Package missing INSTALL_STAGING
+
 2022.05, released June 6th, 2022
 
 	Fixes all over the tree.
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 21e3455ae1..69dfb0ca28 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2022.05'
+RELEASE='2022.05.1'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
