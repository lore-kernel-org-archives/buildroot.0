Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A55E77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 20:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B4FE403D0;
	Sun,  8 Dec 2024 20:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UyaL7gguVBqd; Sun,  8 Dec 2024 20:52:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 638BF403D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 638BF403D2;
	Sun,  8 Dec 2024 20:52:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D570979
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 20:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E041400E5
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 20:52:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u7Zjdg6rxsoP for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 20:52:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27CA7400D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27CA7400D1
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 20:52:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CFA982890; Sun,  8 Dec 2024 20:52:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Dec 2024 21:51:20 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 25ba1643728bce6b8c5d76ee0080b5fe8734d849
X-Git-Newrev: d37527ba498c34508b9f3fede34135686c94581e
X-Patchwork-Hint: ignore
Message-Id: <20241208205219.0CFA982890@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] Update for 2024.02.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=d37527ba498c34508b9f3fede34135686c94581e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 18 ++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 527d344c9c..23b490d60b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,21 @@
+2024.02.9, released December 8th, 2024
+
+	Important / security related fixes.
+
+	Updated/fixed packages: alsa-lib, android-tools, babeld,
+	bmap-tools, boost, ebtables, expat, fbv, foot, frr, gamin,
+	gnutls, intel-microcode, irssi, libcurl, libkrb5, libmodbus,
+	libvpl, linux-tools, lmbench, mbedtls, mosquitto, musl,
+	musl-compat-headers, nfs-utils, ntp, php, postgresql,
+	procps-ng, python-psycopg2, python-sip, qt6base, quagga,
+	rt-tests, sshguard, systemd, tiff, x11vnc
+
+	Issues resolved:
+	- procps-ng: builderror in 2024.08
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/38
+	- fbv package download link is broken in long term support branch
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/73
+
 2024.02.8, released November 14th, 2024
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 9702aadf3d..0546a9b1a9 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.02.8
+export BR2_VERSION := 2024.02.9
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1731601000
+BR2_VERSION_EPOCH = 1733691000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 91a801bc16..07959ea064 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2024.02.8'
+RELEASE='2024.02.9'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
