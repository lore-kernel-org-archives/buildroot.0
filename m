Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AE2C02194
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 13:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D30CE41708;
	Mon,  3 Feb 2025 13:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XvysI7twLer6; Mon,  3 Feb 2025 13:11:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE56741710
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE56741710;
	Mon,  3 Feb 2025 13:11:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D87C81A1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 13:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC9724171C
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 13:11:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fPa-sCB_VKac for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 13:11:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6446D41708
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6446D41708
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 13:11:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48F08868D5; Mon,  3 Feb 2025 13:11:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 14:10:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e67d0730ffe1dc0729cad82669ff8abcdbccef3
X-Git-Newrev: 29088086b5144fb37dd4c88da2de5e07605b7781
X-Patchwork-Hint: ignore
Message-Id: <20250203131114.48F08868D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysvinit: bump to version 3.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=29088086b5144fb37dd4c88da2de5e07605b7781
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Move URL to slicer69. This is where any releases past 3.04 are.
  - Continue to use the tar.xz archives.

See doc/Changelog for details.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysvinit/sysvinit.hash | 2 +-
 package/sysvinit/sysvinit.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sysvinit/sysvinit.hash b/package/sysvinit/sysvinit.hash
index 67b0ab38f0..e806ad3786 100644
--- a/package/sysvinit/sysvinit.hash
+++ b/package/sysvinit/sysvinit.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  2a621fe6e4528bc91308b74867ddaaebbdf7753f02395c0c5bae817bd2b7e3a5  sysvinit-3.04.tar.xz
+sha256  cbaeabddc35a6511b87c87452ee5e87c678a26329c7d7d17fb69a2b42a314d86  sysvinit-3.13.tar.xz
 
 # Hash for license files:
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index e05a6dee38..e0eabc933c 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SYSVINIT_VERSION = 3.04
+SYSVINIT_VERSION = 3.13
 SYSVINIT_SOURCE = sysvinit-$(SYSVINIT_VERSION).tar.xz
-SYSVINIT_SITE = http://download.savannah.nongnu.org/releases/sysvinit
+SYSVINIT_SITE = https://github.com/slicer69/sysvinit/releases/download/$(SYSVINIT_VERSION)
 SYSVINIT_LICENSE = GPL-2.0+
 SYSVINIT_LICENSE_FILES = COPYING
 SYSVINIT_CPE_ID_VALID = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
