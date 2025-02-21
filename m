Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252B8C021B3
	for <buildroot@archiver.kernel.org>; Fri, 21 Feb 2025 14:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1103812E1;
	Fri, 21 Feb 2025 14:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EaDEAa9oOjg6; Fri, 21 Feb 2025 14:32:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C379C82013
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C379C82013;
	Fri, 21 Feb 2025 14:32:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A635D92
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 14:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 144AA40454
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 14:32:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYsO_yD0CJSE for <buildroot@buildroot.org>;
 Fri, 21 Feb 2025 14:32:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B034401A2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B034401A2
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 14:32:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00B57875D5; Fri, 21 Feb 2025 14:32:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 21 Feb 2025 15:31:53 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 4ed78586e8859dd1f299c45de9637e184e783b8a
X-Git-Newrev: 2287e900c4cad44bad35e34aafdf10c5ef4975f1
X-Patchwork-Hint: ignore
Message-Id: <20250221143211.00B57875D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] Update for 2024.11.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=2287e900c4cad44bad35e34aafdf10c5ef4975f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 24 ++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 72da8d9084..65990ce831 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,27 @@
+2024.11.2, released February 21st, 2025
+
+	Important / security related fixes.
+
+	Infrastructure: support/script/genimage.sh: exit on errors
+
+	Defconfigs: ti_am62ax_sk: Include PMIC driver to fix boot
+	issue
+
+	Updated/fixed packages: acpica, apache, assimp, asterisk,
+	bind, busybox, clamav, curlpp, dillo, elfutils, fakeroot,
+	ffmpeg, freetype, git, glibc, gnu-efi, gnutls, go, gpsd,
+	heimdal, imagemagick, intel-microcode, kodi, libbsd, libcurl,
+	libopenssl, libtasn1, libxml2, mdnsd, mpg123, musl, nettle,
+	nginx, nodejs, openjpeg, openssh, openvpn, php, pipewire,
+	postgresql, python-django, python3, redis, rsync, socat,
+	swipl, syslinux, tor, tzdata, uclibc, uemacs, unbound,
+	usbutils, util-linux, webkitgtk, xen, zic, zlog, zstd,
+	zxing-cpp
+
+	Issues resolved:
+	- samba4 build failed in master
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/86
+
 2024.11.1, released January 9th, 2025
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 7f61909aff..9f95280e79 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.11.1
+export BR2_VERSION := 2024.11.2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1736433000
+BR2_VERSION_EPOCH = 1740148000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index add08ccae7..34d404dc4c 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2024.11.1'
+RELEASE='2024.11.2'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
