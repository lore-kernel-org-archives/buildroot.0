Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E796C19F29
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 09:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C13C3400FD;
	Fri, 29 Jul 2022 09:40:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C13C3400FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6GNAdLwVjlNW; Fri, 29 Jul 2022 09:40:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 879D740339;
	Fri, 29 Jul 2022 09:40:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 879D740339
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AAE9E1BF339
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 09:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8348C40355
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 09:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8348C40355
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SHY3vvSW44CE for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 09:40:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B82A40320
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 09:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B82A40320
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E1ECE868B7; Fri, 29 Jul 2022 09:26:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 11:39:12 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 7032d5826d0927f3f60f5656d3d4fe8afc86e697
X-Git-Newrev: 9dd3bb1963bc906c72146d9872462bf493d512ac
X-Patchwork-Hint: ignore
Message-Id: <20220729092635.E1ECE868B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] Update for 2022.02.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=9dd3bb1963bc906c72146d9872462bf493d512ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 32 ++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 6c5b38b28e..dc5edc1cdf 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,35 @@
+2022.02.4, released July 28th, 2022
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
+	rabbitmq-server, rpi-userland, rustc, sofia-sip, systemd,
+	tcpreplay, tinyproxy, tor, uacme, uboot-tools, vim, watchdogd,
+	webkitgtk, wireguard-linux-compat, wpa_supplicant, wpewebkit,
+	zstd
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14881: Watchdogd Package missing INSTALL_STAGING
+
 2022.02.3, released June 19th, 2022
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index e4007d2c38..e14bb8f1ec 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.02.3
+export BR2_VERSION := 2022.02.4
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1655633000
+BR2_VERSION_EPOCH = 1659087600
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 976647d65d..4415f94418 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2022.02.3'
+RELEASE='2022.02.4'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
