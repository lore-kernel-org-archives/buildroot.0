Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35036C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C96354255C;
	Fri,  2 May 2025 11:13:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m1bXtz8zTfyX; Fri,  2 May 2025 11:13:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3407417D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3407417D0;
	Fri,  2 May 2025 11:13:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 43C02229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 127AC60AE6
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id To5brsp5UQqz for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2B5661543
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2B5661543
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F090C864AE; Fri,  2 May 2025 11:11:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 12:13:09 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c26923c5ca0d1fd377162926d39703c3311bb686
X-Git-Newrev: 930f2070f95715b67b63c6b48945b783a8821bed
X-Patchwork-Hint: ignore
Message-Id: <20250502111136.F090C864AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/apparmor don't
 reference libapparmor variables
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=930f2070f95715b67b63c6b48945b783a8821bed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Ian Merin <Ian.Merin@ncipher.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 55718ca3cfe5f7c317b03f70e353e2712c656dff)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
