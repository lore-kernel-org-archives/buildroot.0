Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FAED65C6C
	for <buildroot@archiver.kernel.org>; Thu, 14 Nov 2024 10:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65DD540275;
	Thu, 14 Nov 2024 10:29:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LW5q1oOZT5L5; Thu, 14 Nov 2024 10:29:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DDF040661
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DDF040661;
	Thu, 14 Nov 2024 10:29:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DE3C5972
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 10:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BED0A8414F
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 10:29:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gjk541vbZdKU for <buildroot@buildroot.org>;
 Thu, 14 Nov 2024 10:28:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CD9584153
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CD9584153
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 10:28:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DD408637D; Thu, 14 Nov 2024 10:28:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Nov 2024 11:28:39 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: b4b4522e6353fa08be380837bedd41c75c92608c
X-Git-Newrev: a91b9c7400fcd7813668f2fe6342cbd762c849e6
X-Patchwork-Hint: ignore
Message-Id: <20241114102859.8DD408637D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] Update for 2024.08.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=a91b9c7400fcd7813668f2fe6342cbd762c849e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 14 ++++++++++++++
 Makefile                 |  2 +-
 support/misc/Vagrantfile |  2 +-
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5e6140efa0..b1a558adba 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,17 @@
+2024.08.2, released November 14th, 2024
+
+	Important / security related fixes.
+
+	Updated/fixed packages: apache, asterisk, bind, cmake, criu,
+	file, fluidsynth, ghostscript, heimdal, intel-microcode,
+	iproute2, jailhouse, jsoncpp, libarchive, libcurl, libldns,
+	libgit2, liblinear, libmdbx, libopenh264, libpng,
+	libtraceevent, libxml2, ltrace, nethogs, nghttp2, ntp,
+	openjdk, php, postgresql,procps-ng, python-pyqt5, python3,
+	qemu, ruby, sqlite, sysvinit, tor, trace-cmd, wpebackend-fdo
+
+	New packages: python-pyqt5-sip
+
 2024.08.1, released October 20th, 2024
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 4afd15f2c9..3d89449eee 100644
--- a/Makefile
+++ b/Makefile
@@ -92,7 +92,7 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.08.1
+export BR2_VERSION := 2024.08.2
 # Actual time the release is cut (for reproducible builds)
 BR2_VERSION_EPOCH = 1729431000
 
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 25a360d976..c3cb15d727 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2024.08.1'
+RELEASE='2024.08.2'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
