Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789CAC369C9
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 21:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AFC86067C;
	Sat, 19 Apr 2025 21:29:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C6UZDecga00n; Sat, 19 Apr 2025 21:29:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D2616067E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D2616067E;
	Sat, 19 Apr 2025 21:29:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 645D322F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56347406EA
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:28:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4SHnIATMR9G5 for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 21:28:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD7F84052F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD7F84052F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:28:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9939F85D45; Sat, 19 Apr 2025 21:28:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 23:27:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4d371309fb70fe9127f2b4312f2a914283ddcf8
X-Git-Newrev: 55718ca3cfe5f7c317b03f70e353e2712c656dff
X-Patchwork-Hint: ignore
Message-Id: <20250419212858.9939F85D45@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apparmor don't reference
 libapparmor variables
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=55718ca3cfe5f7c317b03f70e353e2712c656dff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ian Merin <Ian.Merin@ncipher.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/apparmor/apparmor.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index 61e62c7515..20dbce6f97 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -7,9 +7,9 @@
 # When updating the version here, please also update the libapparmor package
 APPARMOR_VERSION_MAJOR = 3.1
 APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).7
-APPARMOR_SOURCE = apparmor-v$(LIBAPPARMOR_VERSION).tar.gz
-APPARMOR_SITE = https://gitlab.com/apparmor/apparmor/-/archive/v$(LIBAPPARMOR_VERSION)
-APPARMOR_DL_SUBDIR = libapparmor
+APPARMOR_SOURCE = apparmor-v$(APPARMOR_VERSION).tar.gz
+APPARMOR_SITE = https://gitlab.com/apparmor/apparmor/-/archive/v$(APPARMOR_VERSION)
+APPARMOR_DL_SUBDIR = apparmor
 APPARMOR_LICENSE = GPL-2.0
 APPARMOR_LICENSE_FILES = LICENSE parser/COPYING.GPL
 APPARMOR_CPE_ID_VENDOR = canonical
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
