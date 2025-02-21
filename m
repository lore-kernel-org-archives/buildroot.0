Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D839C021B3
	for <buildroot@archiver.kernel.org>; Fri, 21 Feb 2025 14:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE1BF81A58;
	Fri, 21 Feb 2025 14:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lX9wMLT9WjjJ; Fri, 21 Feb 2025 14:54:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FFC3819B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FFC3819B4;
	Fri, 21 Feb 2025 14:54:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DB5E96B
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 14:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB99240194
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 14:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jq3To00mqjVx for <buildroot@buildroot.org>;
 Fri, 21 Feb 2025 14:54:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9EA9401A2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9EA9401A2
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 14:54:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C199C878DB; Fri, 21 Feb 2025 14:54:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 21 Feb 2025 15:52:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca47c9511835c62f27c097faeb5be6a4c20b8895
X-Git-Newrev: eae53ae0f47546b666f3b7637c53bc8a43e9a1da
X-Patchwork-Hint: ignore
Message-Id: <20250221145412.C199C878DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.11.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=eae53ae0f47546b666f3b7637c53bc8a43e9a1da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2287e900c4cad44bad35e34aafdf10c5ef4975f1)
[Peter: drop Makefile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 24 ++++++++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index b83a30c8b2..c8b7cd0492 100644
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
