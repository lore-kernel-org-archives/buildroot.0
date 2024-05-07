Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCD4C25B4F
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 08:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63A6D40663;
	Tue,  7 May 2024 08:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S25ag8CMUCOj; Tue,  7 May 2024 08:54:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B65940530
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B65940530;
	Tue,  7 May 2024 08:54:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B9D0A1BF31B
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 08:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A63076085D
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 08:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id In09NK70ZnpP for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 08:54:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3404D60812
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3404D60812
 for <buildroot@buildroot.org>; Tue,  7 May 2024 08:54:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3D1B8673B; Tue,  7 May 2024 08:54:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 May 2024 09:30:06 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 3d1c04c05c27c206e336ad7338d0a882c9c4736d
X-Git-Newrev: 0155095c558e915d6c5261a4d8cb4ec9ee9953a7
X-Patchwork-Hint: ignore
Message-Id: <20240507085436.D3D1B8673B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] Update for 2024.02.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=0155095c558e915d6c5261a4d8cb4ec9ee9953a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 28 ++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9643d52423..e5956a5138 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,31 @@
+2024.02.2, released May 7th, 2024
+
+	Important / security related fixes.
+
+        Security: The /dev/shm entry in the default /etc/fstab used
+        for busybox and sysv init systems was missing the sticky bit,
+        allowing users to delete and replace other users files.
+
+        Defconfigs: Mangopi mq1rdw1: Lock kernel headers to 6.6.x.
+
+	Updated/fixed packages: apache, botan,
+	brcmfmac_sdio-firmware-rpi, clamav, cmake, containerd,
+	crucible, dmenu-wayland, dmraid, docker-cli, docker-engine,
+	domoticz, fmc, freeipmi, gdal, gdb, giflib, gnupg2, go,
+	google-breakpad, googlefontdirectory, imx-gpu-viv, inih,
+	libassuan, libblockdev, libcurl, libdrm, libgpg-error,
+	libksba, libnpth, libressl, libtracefs, lxc, mbedtls, mesa3d,
+	oatpp, opensc, oprofile, perl-net-ssleay, petitboot,
+	php-xdebug, psplash, python-pypng, python-segno,
+	python-service-identity, python3, skeleton-init-sysv, systemd,
+	tcf-agent, tiff, uuu, wolfssl, xmrig, zic
+
+	Issues resolved (http://bugs.uclibc.org):
+
+        #14416: Mesa3D missing DRI3 support for various Gallium drivers
+        #16009: 'select' does not work with 'choice'
+        #16036: android-tools version is too old
+
 2024.02.1, released March 26th, 2024
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index a9d54aa28b..4a62be9ff3 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.02.1
+export BR2_VERSION := 2024.02.2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1711445000
+BR2_VERSION_EPOCH = 1715067000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index cb7a81af6e..ac595f5749 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2024.02.1'
+RELEASE='2024.02.2'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
