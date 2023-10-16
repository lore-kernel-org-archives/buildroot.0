Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA215CDB465
	for <buildroot@archiver.kernel.org>; Mon, 16 Oct 2023 08:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43BB061383;
	Mon, 16 Oct 2023 08:20:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43BB061383
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 03UYCGBhc4aX; Mon, 16 Oct 2023 08:20:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E66661369;
	Mon, 16 Oct 2023 08:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E66661369
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 86AAD1BF3BB
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 08:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D0C240182
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 08:19:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D0C240182
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hRJ4IHLP4c6v for <buildroot@lists.busybox.net>;
 Mon, 16 Oct 2023 08:19:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7543B4030F
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 08:19:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7543B4030F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52F6685C00; Mon, 16 Oct 2023 08:19:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 Oct 2023 10:19:31 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 1b638d8d337c7e22a4b93d50b972ddc839be47a8
X-Git-Newrev: 593454c77e542ca7f6924087376ad0de71412e49
X-Patchwork-Hint: ignore
Message-Id: <20231016081957.52F6685C00@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] Update for 2023.02.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=593454c77e542ca7f6924087376ad0de71412e49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 36 ++++++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index c6ccc09e3f..5c7041963c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,39 @@
+2023.02.6, released October 16th, 2023
+
+	Important / security related fixes.
+
+	Per-package builds: Do not use hard links for host / target
+	dirs, fixing issues with package rebuilds or post-build
+	scripts modifications.
+
+	Infrastructure: Explicitly disable shuffle mode for Make >=
+	4.4 where needed.
+
+	Urandom-scripts: Move seedrng init script to S01 for earlier
+	random number entrophy initialization.
+
+	Go: Bump to 1.20.x as 1.19.x is now EOL and affected by
+	security issues.
+
+	Updated/fixed packages: at91bootstrap, bind, cups, efl,
+	enlightenment, exim, gcc, glibc, gnu-efi, go, go-bootstrap,
+	gptfdisk, gst-omx, gst1-devtools, gst1-libav,
+	gst1-plugins-bad, gst1-plugins-base, gst1-plugins-good,
+	gst1-plugins-ugly, gst1-python, gst1-rstp-server,
+	gst1-rtsp-vaapi, gstreamer1, gstreamer1-editing-services,
+	libcue, libcurl, libfastjson, libhtp, libmodplug, librsvg,
+	libvpx, libyang, linux-tools, mbedtls, mosquitto, mutt, neon,
+	netsnmp, nmap, nodejs, olsr, openblas, opkg-utils, php,
+	powertop, python-mako, python3, rockchip-mali, samba4, sslh,
+	suricata, tar, unifdef, unrandom-scripts, webkitgtk,
+	wireless-regdb, wpewebkit
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15628: Missing dependencies in BR2_PACKAGE_PYTHON_MAKO
+	#15808: connman is not supported on musl
+	#15814: C++ not supported by bootlin toolchain
+
 2023.02.5, released September 27th, 2023
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 67d3f3105a..0fcd1cedab 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.02.5
+export BR2_VERSION := 2023.02.6
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1695815000
+BR2_VERSION_EPOCH = 1697444000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index ae060e4425..911e7ed463 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2023.02.5'
+RELEASE='2023.02.6'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
