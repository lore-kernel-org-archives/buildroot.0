Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415BCC636D3
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 20:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEE7D8142D;
	Sun, 12 Feb 2023 20:54:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEE7D8142D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G5-KtkFQkdV0; Sun, 12 Feb 2023 20:54:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 399CF81425;
	Sun, 12 Feb 2023 20:54:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 399CF81425
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D85C1BF30E
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 478DA81421
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:54:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 478DA81421
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a5wz1POIFw2H for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 20:54:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72031813FD
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 20:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72031813FD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5EF1785B5E; Sun, 12 Feb 2023 20:54:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 21:53:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f48b3983cdb32dfcd59e7e549c8eaa1503fe342
X-Git-Newrev: aa93d0cdd7adf1051cdb1643e978c81ae183327c
X-Patchwork-Hint: ignore
Message-Id: <20230212205429.5EF1785B5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_beforelight: bump
 version to 1.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa93d0cdd7adf1051cdb1643e978c81ae183327c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2023-January/003317.html

The license file was previously a stub, but it now contains the proper
license text since upstream commit:
https://gitlab.freedesktop.org/xorg/app/beforelight/-/commit/fa1e473dd64673a36a73a01a84a8db61eaa425dc

Switched tarball to xz, updated _SITE.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998@free.fr: properly explain the license hash change]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_beforelight/xapp_beforelight.hash | 7 ++++---
 package/x11r7/xapp_beforelight/xapp_beforelight.mk   | 6 +++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_beforelight/xapp_beforelight.hash b/package/x11r7/xapp_beforelight/xapp_beforelight.hash
index 00aff75779..f5b0cb21a4 100644
--- a/package/x11r7/xapp_beforelight/xapp_beforelight.hash
+++ b/package/x11r7/xapp_beforelight/xapp_beforelight.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2013-January/002131.html
-sha256  8fcab6f15148ca680c0d3da8de7dcb41f8e6a076f442cf8bdcf272be9e348166  beforelight-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-January/003317.html
+sha256  53f0bf085b7272ebbf626d1b9b0ad320d1a07bc1fe7f3ae260c86a71a857ad28  beforelight-1.0.6.tar.xz
+sha512  48a165d151676f6d213883bee98b34007403a77e025253c8649f9a0f5ea258b09381ab523a5e906030ac9fc8245fce2c6beaf9ad0f81116e302d51ad4a0fad5a  beforelight-1.0.6.tar.xz
 # Locally computed
-sha256  27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff  COPYING
+sha256  3909739fae1ee37c3c7167a91f53d29317965aaf932813e16ef733f033619a7b  COPYING
diff --git a/package/x11r7/xapp_beforelight/xapp_beforelight.mk b/package/x11r7/xapp_beforelight/xapp_beforelight.mk
index 7dcb715ef3..6b753833f7 100644
--- a/package/x11r7/xapp_beforelight/xapp_beforelight.mk
+++ b/package/x11r7/xapp_beforelight/xapp_beforelight.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_BEFORELIGHT_VERSION = 1.0.5
-XAPP_BEFORELIGHT_SOURCE = beforelight-$(XAPP_BEFORELIGHT_VERSION).tar.bz2
-XAPP_BEFORELIGHT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_BEFORELIGHT_VERSION = 1.0.6
+XAPP_BEFORELIGHT_SOURCE = beforelight-$(XAPP_BEFORELIGHT_VERSION).tar.xz
+XAPP_BEFORELIGHT_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_BEFORELIGHT_LICENSE = MIT
 XAPP_BEFORELIGHT_LICENSE_FILES = COPYING
 XAPP_BEFORELIGHT_DEPENDENCIES = xlib_libX11 xlib_libXScrnSaver xlib_libXaw xlib_libXt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
