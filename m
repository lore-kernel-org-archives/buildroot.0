Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29D5C6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 20:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E9FE406A1;
	Tue, 26 Mar 2024 20:14:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gU_Sa9owKivm; Tue, 26 Mar 2024 20:14:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 069E44085F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 069E44085F;
	Tue, 26 Mar 2024 20:14:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D3F101BF95D
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 20:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C050540698
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 20:14:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wNXf-ur1Uzfp for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 20:14:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B66A64059F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B66A64059F
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 20:14:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B462842AE; Tue, 26 Mar 2024 20:14:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Mar 2024 21:13:41 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 33e2f18b3c952124a36b9f9bad2493aa67f285e3
X-Git-Newrev: cc34b5b2abf2588f0ef55e46a4fe85a60c19ba1f
X-Patchwork-Hint: ignore
Message-Id: <20240326201410.9B462842AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] Update for 2023.02.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc34b5b2abf2588f0ef55e46a4fe85a60c19ba1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 23 +++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index f0f42184cd..3958a8b27c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,26 @@
+2023.02.11, released March 26th, 2024
+
+	Important / security related fixes.
+
+	Defconfigs: Starfive visionfive2: Use correct genimage
+	configuration.
+
+	Updated/fixed packages: bind, bitcoin, botan, c-ares, clamav,
+	cvs, dash, dnsmasq, ell, exim, expat, freetype, ghostscript,
+	gnupg2, google-breakpad, gst1-python, gst1-vaapi, iwd,
+	libcoap, libcurl, libgit2, libkrb5, libmodsecurity, libunwind,
+	libuv, libxml2, lua-http, luvi, nginx-naxsi, nodejs, openssh,
+	openvmtools, parted, php, poco, postgresql, privoxy,
+	pure-ftpd, putty, python-cheroot, python-configshell-fb,
+	python-django, python-rtslib-fb, python3, rsync, sdl2, shim,
+	spice, squid, strace, strongswan, sudo, systemd, targetcli-fb,
+	unbound, uvw, v4l2loopback, vim, webkitgtk, wpewebkit, xvisor,
+	zlib-ng
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15997: Build Squid with GCC12.3 in Buildroot 2024.02 will fail
+
 2023.02.10, released March 1st, 2024
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 5513f2c3b5..46ca0beba7 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.02.10
+export BR2_VERSION := 2023.02.11
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1709311000
+BR2_VERSION_EPOCH = 1711484000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 822f11efba..f18c6067b9 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2023.02.10'
+RELEASE='2023.02.11'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
