Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD03C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 15:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB6A34224E;
	Wed, 10 Jan 2024 15:46:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB6A34224E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0RrIQVRcFAA1; Wed, 10 Jan 2024 15:46:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1758941C03;
	Wed, 10 Jan 2024 15:46:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1758941C03
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 55C3B1BF95D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F2B3839C0
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:46:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F2B3839C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2iY2SXEw0WET for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 15:46:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 501A482EB4
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 15:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 501A482EB4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3DA1E7FE06; Wed, 10 Jan 2024 15:46:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 16:27:43 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 3b07e4b0df2385aff0cf9642b7dd334c5ad620a6
X-Git-Newrev: 773db648fb04726ff71f92d9aae72100aacab361
X-Patchwork-Hint: ignore
Message-Id: <20240110154603.3DA1E7FE06@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] Revert
 "package/libcamera-apps: bump to version 1.3.0"
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

commit: https://git.buildroot.net/buildroot/commit/?id=773db648fb04726ff71f92d9aae72100aacab361
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

This reverts commit c9645fd29bf38b5a960aed3eeac36975d64a400a.

Building libcamera-apps 1.3.0 with current libcamera 0.1.0 fails because
some of the symbols like controls::AeFlickerMode are not recognized.
According to my research, they have been introduced after libcamera 0.1.0
but there is no release version of libcamera newer than 0.1.0 available
to which we could bump.

Signed-off-by: Sebastian Bauer <mail@sebastianbauer.info>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit bf7a1f10ddb1f9c327f110dc745762af30310828)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcamera-apps/libcamera-apps.hash | 2 +-
 package/libcamera-apps/libcamera-apps.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcamera-apps/libcamera-apps.hash b/package/libcamera-apps/libcamera-apps.hash
index 281aab88be..1437a0e8fa 100644
--- a/package/libcamera-apps/libcamera-apps.hash
+++ b/package/libcamera-apps/libcamera-apps.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  92ff51e2aa4cd7165a8f5131df57cb0967a259bc74e4a47d7fb9dcfd65e45e25  libcamera-apps-1.3.0.tar.gz
+sha256  e6b74a0ba10a962f1930199d7dd828c8d9ee370dfe1fdfd8ae2638df744f1344  libcamera-apps-1.2.1.tar.gz
 sha256  36dfed86bdef661a0a14ec1a1cc84c771d5a06b6f9b92e9ebb610ba711bd528a  license.txt
diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index d60e58e7e4..2a217f095f 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAMERA_APPS_VERSION = 1.3.0
+LIBCAMERA_APPS_VERSION = 1.2.1
 LIBCAMERA_APPS_SITE = $(call github,raspberrypi,libcamera-apps,v$(LIBCAMERA_APPS_VERSION))
 LIBCAMERA_APPS_LICENSE = BSD-2-Clause
 LIBCAMERA_APPS_LICENSE_FILES = license.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
