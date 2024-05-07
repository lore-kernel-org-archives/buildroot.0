Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8955C25B4F
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 08:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3991E405BE;
	Tue,  7 May 2024 08:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z25Su4-0Szv8; Tue,  7 May 2024 08:51:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2EB0405C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2EB0405C6;
	Tue,  7 May 2024 08:51:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D0A241BF31B
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 08:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6B1A40516
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 08:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BMMvY9YT575Y for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 08:51:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E275840012
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E275840012
 for <buildroot@buildroot.org>; Tue,  7 May 2024 08:51:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCA0086A0C; Tue,  7 May 2024 08:51:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 May 2024 10:49:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 818b6270a845df43d03d85622d4dfc1d48248bf6
X-Git-Newrev: b34fa00d85df2b8905d0edd60a2d3863815b1a71
X-Patchwork-Hint: ignore
Message-Id: <20240507085144.CCA0086A0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.02.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=b34fa00d85df2b8905d0edd60a2d3863815b1a71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0155095c558e915d6c5261a4d8cb4ec9ee9953a7)
[Peter: drop Makefile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 28 ++++++++++++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 4b0cc08244..13ac108549 100644
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
