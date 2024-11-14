Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DC3D68B33
	for <buildroot@archiver.kernel.org>; Thu, 14 Nov 2024 16:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52E2640771;
	Thu, 14 Nov 2024 16:25:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZRabf9MsmMh; Thu, 14 Nov 2024 16:25:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE7AA40792
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE7AA40792;
	Thu, 14 Nov 2024 16:25:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C6D5968
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 16:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5807140741
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 16:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KYXsw3ZBvgnt for <buildroot@buildroot.org>;
 Thu, 14 Nov 2024 16:25:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DD2840769
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DD2840769
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 16:25:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5788C863D9; Thu, 14 Nov 2024 16:25:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Nov 2024 17:25:26 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 7e2038d9efec14f462246b9e2f06146b382863ec
X-Git-Newrev: e843fa764bfbdd64e6b15344a01014c6dccf0ce9
X-Patchwork-Hint: ignore
Message-Id: <20241114162544.5788C863D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] Update for 2024.02.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=e843fa764bfbdd64e6b15344a01014c6dccf0ce9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 13 +++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 61fb82fcc2..527d344c9c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,16 @@
+2024.02.8, released November 14th, 2024
+
+	Important / security related fixes.
+
+	Updated/fixed packages: apache, asterisk, bind, bootgen, criu,
+	file, fluidsynth, ghostscript, heimdal, intel-microcode,
+	jailhouse, jsoncpp, libarchive, libcurl, libldns, liblinear,
+	libmdbx, libopenh264, ltrace, lightning, nghttp2, ntp, php,
+	postgresql, procps-ng, python-pyqt5, ruby, sysvinit, tor,
+	wpebackend-fdo
+
+	New packages: python-pyqt5-sip
+
 2024.02.7, released October 21th, 2024
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 7373f6432f..9702aadf3d 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.02.7
+export BR2_VERSION := 2024.02.8
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1729494000
+BR2_VERSION_EPOCH = 1731601000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 20b22d45e8..91a801bc16 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2024.02.7'
+RELEASE='2024.02.8'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
