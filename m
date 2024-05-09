Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9D4C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 14:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 634304035D;
	Thu,  9 May 2024 14:31:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJKdEWjEQX3t; Thu,  9 May 2024 14:31:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1305B404CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1305B404CA;
	Thu,  9 May 2024 14:31:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 073D01BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 011D783D5E
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:31:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qvjeNfyb3W8J for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 14:31:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D05F83D46
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D05F83D46
 for <buildroot@buildroot.org>; Thu,  9 May 2024 14:31:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 272A886BB7; Thu,  9 May 2024 14:31:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 16:14:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe925f76233daa574ba9852b3f1042002031a79a
X-Git-Newrev: 69d06fda2aa1030b6ceb767ccec62ced1cc0c8b3
X-Patchwork-Hint: ignore
Message-Id: <20240509143147.272A886BB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libunwind: bump to version 1.8.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=69d06fda2aa1030b6ceb767ccec62ced1cc0c8b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch site to get latest release

https://github.com/libunwind/libunwind/releases/tag/v1.8.1
https://github.com/libunwind/libunwind/releases/tag/v1.8.0
https://github.com/libunwind/libunwind/releases/tag/v1.7.2
https://github.com/libunwind/libunwind/releases/tag/v1.7.1
https://github.com/libunwind/libunwind/releases/tag/v1.7.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libunwind/libunwind.hash | 2 +-
 package/libunwind/libunwind.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libunwind/libunwind.hash b/package/libunwind/libunwind.hash
index 1d532a7830..512cc7b9b5 100644
--- a/package/libunwind/libunwind.hash
+++ b/package/libunwind/libunwind.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  4a6aec666991fb45d0889c44aede8ad6eb108071c3554fcdff671f9c94794976  libunwind-1.6.2.tar.gz
+sha256  ddf0e32dd5fafe5283198d37e4bf9decf7ba1770b6e7e006c33e6df79e6a6157  libunwind-1.8.1.tar.gz
 
 # Hash for license file
 sha256  6a0dbbdaec2b3136b7bf045586f4212bdf74e7af688bf9dfe9154607cf5ec156  COPYING
diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
index 94e9bbd1b8..3eb3b483d1 100644
--- a/package/libunwind/libunwind.mk
+++ b/package/libunwind/libunwind.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBUNWIND_VERSION = 1.6.2
-LIBUNWIND_SITE = http://download.savannah.gnu.org/releases/libunwind
+LIBUNWIND_VERSION = 1.8.1
+LIBUNWIND_SITE = https://github.com/libunwind/libunwind/releases/download/v$(LIBUNWIND_VERSION)
 LIBUNWIND_INSTALL_STAGING = YES
 LIBUNWIND_LICENSE_FILES = COPYING
 LIBUNWIND_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
