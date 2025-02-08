Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A5FC02198
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 17:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D4C6600D4;
	Sat,  8 Feb 2025 17:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xh5r3_7ZmerL; Sat,  8 Feb 2025 17:06:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E2AF605EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E2AF605EF;
	Sat,  8 Feb 2025 17:06:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C49D1BC
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 17:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62D6A404D4
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 17:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uKMOnbP_H9Qg for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 17:06:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46102400C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46102400C7
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 17:06:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40AEB872FB; Sat,  8 Feb 2025 17:06:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Feb 2025 17:58:34 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 4c47699fb17674405b91496aa1a5cfa2b8c86be7
X-Git-Newrev: 6a1cc89d898195bd9eb37dea864efea942a5e50c
X-Patchwork-Hint: ignore
Message-Id: <20250208170649.40AEB872FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/dillo: move to
 github
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a1cc89d898195bd9eb37dea864efea942a5e50c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Fixes http://autobuild.buildroot.net/results/9c33099772398ab592bf38c2f4c56c2594594695/

The tarball is no longer available on dillo.org, but has been uploaded to
github so use that instead:

https://github.com/dillo-browser/dillo/releases/tag/v3.0.5

Also adjust the URL in the help text to the new location, which states:

"The domain dillo.org is no longer under control of Dillo developers."

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f2a862fe603b1d0c52249f58b8eacf85a0d37b8a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dillo/Config.in | 2 +-
 package/dillo/dillo.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dillo/Config.in b/package/dillo/Config.in
index d06f2d1f51..1ebab8ab3f 100644
--- a/package/dillo/Config.in
+++ b/package/dillo/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_DILLO
 
 	  Enable openssl package to gain https support.
 
-	  http://www.dillo.org
+	  https://dillo-browser.github.io/
 
 comment "dillo needs a toolchain w/ C++"
 	depends on BR2_PACKAGE_XORG7 && BR2_USE_MMU
diff --git a/package/dillo/dillo.mk b/package/dillo/dillo.mk
index a6885f5c14..5a823aa4a3 100644
--- a/package/dillo/dillo.mk
+++ b/package/dillo/dillo.mk
@@ -6,7 +6,7 @@
 
 DILLO_VERSION = 3.0.5
 DILLO_SOURCE = dillo-$(DILLO_VERSION).tar.bz2
-DILLO_SITE = http://www.dillo.org/download
+DILLO_SITE = https://github.com/dillo-browser/dillo/releases/download/v$(DILLO_VERSION)/
 DILLO_LICENSE = GPL-3.0+
 DILLO_LICENSE_FILES = COPYING
 # configure.ac gets patched, so autoreconf is necessary
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
