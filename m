Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F266C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 18:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ADB740493;
	Wed, 27 Dec 2023 18:30:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ADB740493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gH0rv90eCGPJ; Wed, 27 Dec 2023 18:30:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37C84404C8;
	Wed, 27 Dec 2023 18:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37C84404C8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EDE011BF3E3
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 18:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C75D4404A4
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 18:30:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C75D4404A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4rblL1mP3feK for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 18:30:18 +0000 (UTC)
Received: from relay4.mail.vrmd.de (relay4.mail.vrmd.de [81.28.224.58])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13E7F40493
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 18:30:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13E7F40493
Received: from [95.90.241.14] (helo=murray.fritz.box)
 by relay2.mail.vrmd.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <mail@sebastianbauer.info>)
 id 1rIYa8-009Brb-Nm; Wed, 27 Dec 2023 19:24:40 +0100
From: Sebastian Bauer <mail@sebastianbauer.info>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 19:24:27 +0100
Message-ID: <20231227182429.1215185-1-mail@sebastianbauer.info>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Relay-User: mail@sebastianbauer.info
Subject: [Buildroot] [PATCH 1/3] Revert "package/libcamera-apps: bump to
 version 1.3.0"
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Sebastian Bauer <mail@sebastianbauer.info>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit c9645fd29bf38b5a960aed3eeac36975d64a400a.

Building libcamera-apps 1.3.0 with current libcamera 0.1.0 fails because
some of the symbols like controls::AeFlickerMode are not recognized.
According to my research, they have been introduced after libcamera 0.1.0
but there is no release version of libcamera newer than 0.1.0 available
to which we could bump.

Signed-off-by: Sebastian Bauer <mail@sebastianbauer.info>
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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
