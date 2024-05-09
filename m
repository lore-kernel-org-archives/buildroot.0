Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D249C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0692741E34;
	Thu,  9 May 2024 16:31:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yfuxP8JXXx6G; Thu,  9 May 2024 16:31:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B4A041734
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B4A041734;
	Thu,  9 May 2024 16:31:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C2A01BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39C4183EC1
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:31:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XOLybhbR2-l5 for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:31:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E1F183EBC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E1F183EBC
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:31:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4CDE286CA7; Thu,  9 May 2024 16:31:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 18:25:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1bbc7ac6ea90baef7559fc33d2a7e067428eebc
X-Git-Newrev: 5649202ddccdbc4d6e2a6aca8330c0846d9cd999
X-Patchwork-Hint: ignore
Message-Id: <20240509163113.4CDE286CA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libapparmor: bump to version 3.1.7
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5649202ddccdbc4d6e2a6aca8330c0846d9cd999
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump also apparmor relative package.
Change also the download URL to gitlab where the development
activities were moved.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/apparmor/apparmor.hash       | 4 ++--
 package/apparmor/apparmor.mk         | 5 +++--
 package/libapparmor/libapparmor.hash | 4 ++--
 package/libapparmor/libapparmor.mk   | 6 +++---
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/package/apparmor/apparmor.hash b/package/apparmor/apparmor.hash
index 22037e3e11..190045cd65 100644
--- a/package/apparmor/apparmor.hash
+++ b/package/apparmor/apparmor.hash
@@ -1,5 +1,5 @@
-# From https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.1.2
-sha256  7cbd0b2f6393abf57acaf25dc2b32b2ae197c0b5b0d661e14be46127df93a5eb  apparmor-3.1.2.tar.gz
+# From https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.1.7
+sha256  64494bd99fa6547a9cbdb4fc6bc732451a02dd19e6eb70eab977b239632151eb  apparmor-v3.1.7.tar.gz
 
 # locally computed
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index eeedd805e6..61e62c7515 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -6,8 +6,9 @@
 
 # When updating the version here, please also update the libapparmor package
 APPARMOR_VERSION_MAJOR = 3.1
-APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).2
-APPARMOR_SITE = https://launchpad.net/apparmor/$(APPARMOR_VERSION_MAJOR)/$(APPARMOR_VERSION)/+download
+APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).7
+APPARMOR_SOURCE = apparmor-v$(LIBAPPARMOR_VERSION).tar.gz
+APPARMOR_SITE = https://gitlab.com/apparmor/apparmor/-/archive/v$(LIBAPPARMOR_VERSION)
 APPARMOR_DL_SUBDIR = libapparmor
 APPARMOR_LICENSE = GPL-2.0
 APPARMOR_LICENSE_FILES = LICENSE parser/COPYING.GPL
diff --git a/package/libapparmor/libapparmor.hash b/package/libapparmor/libapparmor.hash
index 574ff95b60..68b0468ae3 100644
--- a/package/libapparmor/libapparmor.hash
+++ b/package/libapparmor/libapparmor.hash
@@ -1,5 +1,5 @@
-# From https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.1.2
-sha256  7cbd0b2f6393abf57acaf25dc2b32b2ae197c0b5b0d661e14be46127df93a5eb  apparmor-3.1.2.tar.gz
+# From https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_3.1.7
+sha256  64494bd99fa6547a9cbdb4fc6bc732451a02dd19e6eb70eab977b239632151eb  apparmor-v3.1.7.tar.gz
 
 # locally computed
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
index 7f3cfcab2f..fa59ff2924 100644
--- a/package/libapparmor/libapparmor.mk
+++ b/package/libapparmor/libapparmor.mk
@@ -6,9 +6,9 @@
 
 # When updating the version here, please also update the apparmor package
 LIBAPPARMOR_VERSION_MAJOR = 3.1
-LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).2
-LIBAPPARMOR_SOURCE = apparmor-$(LIBAPPARMOR_VERSION).tar.gz
-LIBAPPARMOR_SITE = https://launchpad.net/apparmor/$(LIBAPPARMOR_VERSION_MAJOR)/$(LIBAPPARMOR_VERSION)/+download
+LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).7
+LIBAPPARMOR_SOURCE = apparmor-v$(LIBAPPARMOR_VERSION).tar.gz
+LIBAPPARMOR_SITE = https://gitlab.com/apparmor/apparmor/-/archive/v$(LIBAPPARMOR_VERSION)
 LIBAPPARMOR_LICENSE = LGPL-2.1
 LIBAPPARMOR_LICENSE_FILES = LICENSE libraries/libapparmor/COPYING.LGPL
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
