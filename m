Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B05FC021B3
	for <buildroot@archiver.kernel.org>; Fri, 21 Feb 2025 13:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ACD54085B;
	Fri, 21 Feb 2025 13:24:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Temf0ivSXXws; Fri, 21 Feb 2025 13:24:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 240DC40801
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 240DC40801;
	Fri, 21 Feb 2025 13:24:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 170886B
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 13:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAE658176B
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 13:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S2XGPLFLLMdm for <buildroot@buildroot.org>;
 Fri, 21 Feb 2025 13:24:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D10D8179A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D10D8179A
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 13:24:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 69961879DC; Fri, 21 Feb 2025 13:24:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 21 Feb 2025 14:06:27 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: cd2e6cb008c1bc5cb0b811e8d92a12b1ccb0cd59
X-Git-Newrev: 4d772ebe75a922695e3c0c71ae7236c89ba76e01
X-Patchwork-Hint: ignore
Message-Id: <20250221132400.69961879DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] Update for 2024.02.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d772ebe75a922695e3c0c71ae7236c89ba76e01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 19 +++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 445375b834..89169128c9 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,22 @@
+2024.02.11, released February 21th, 2025
+
+	Important / security related fixes.
+
+	Updated/fixed packages: acpica, apache, assimp, asterisk,
+	bind, busybox, clamav, curlpp, dillo, elfutils, ffmpeg, foot,
+	freetype, git, gnutls, go, gpsd, heimdal, imagemagick,
+	intel-microcode, libbsd, libcurl, libopenssl, libtasn1, mdnsd,
+	mpg123, musl, nginx, nodejs, openjpeg, openssh, openvpn,
+	postgresql, python-django, redis, rsync, sdbus-cpp, socat,
+	tor, tzdata, uemacs, unbound, usbutils, webkitgtk, xen, zic,
+	zlog, zmqpp, zstd
+
+	Issues resolved:
+        - OpenSSH 9.8 broken
+          https://gitlab.com/buildroot.org/buildroot/-/issues/11
+        - samba4 build failed in master
+          https://gitlab.com/buildroot.org/buildroot/-/issues/86
+
 2024.02.10, released January 9th, 2025
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 2fe31201f8..79394f32bb 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.02.10
+export BR2_VERSION := 2024.02.11
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1736430000
+BR2_VERSION_EPOCH = 1740143000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index b857241c47..6d456ae647 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2024.02.10'
+RELEASE='2024.02.11'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
