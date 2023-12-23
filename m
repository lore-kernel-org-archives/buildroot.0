Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BDFC3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 19:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84F298216F;
	Sat, 23 Dec 2023 19:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84F298216F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m4MP3bHnwZcr; Sat, 23 Dec 2023 19:55:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D35D68216A;
	Sat, 23 Dec 2023 19:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D35D68216A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9FCC31BF32A
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 19:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CFE74176A
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 19:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CFE74176A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xp4Y_y3JeNDH for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 19:55:17 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD2CE41769
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 19:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD2CE41769
Received: by mail.gandi.net (Postfix) with ESMTPA id C2354E0003;
 Sat, 23 Dec 2023 19:55:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 20:55:09 +0100
Message-ID: <20231223195510.18755-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703361314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=fDOz9PL/uCVhXUyshEqMOxdhPHSU/MHIpyO7Oeb6j8E=;
 b=XfEtsm2DIWsNnpj0G4Lj5tYIHFnk3WN/fVDX2UeoWgNCO6QLd1IsGAQiSn2pf5GUXZ1ai5
 R/k+0liJryjDPuwTlYlJrk+ZF+4aryGmz6ISbc9Onyi1qXq+nhE/24FHclSNgdYhysL44J
 zH+jB6uNpggFBzUhDjXh1L7ApQZ/EI9svfD0Z1vTB9hoavKX5BlyNcnSA0VQcCJB/8SHmK
 f5/82qSma/ZXxVPsDvd7Ii1c6l9Q82pxrUKm/wY9/af5DNEGqK9rz6CDPJzZTTSou/Ea//
 AGa9/ta8PyLwjAkbGcW7wHnyxpTEjDhBxBP1bYmYGc0tI5rGKHYObFeDU4qn/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XfEtsm2D
Subject: [Buildroot] [PATCH] package/x11r7/xwayland: security bump to 23.2.3
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

According to
https://lists.x.org/archives/xorg-announce/2023-December/003437.html:

  This release contains the fixes for CVE-2023-6377 and CVE-2023-6478
  in today's security advisory:
  https://lists.x.org/archives/xorg-announce/2023-December/003435.html

The release has only 10 commits compared to 23.2.2, all of which being
fixes, two of them being the security fixes. So it seems like bumping
the version is a reasonable trade-off vs. backporting the security
fixes.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xwayland/xwayland.hash | 6 +++---
 package/x11r7/xwayland/xwayland.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xwayland/xwayland.hash b/package/x11r7/xwayland/xwayland.hash
index 12363a66bf..533ef9de86 100644
--- a/package/x11r7/xwayland/xwayland.hash
+++ b/package/x11r7/xwayland/xwayland.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2023-October/003432.html
-sha256  9f7c0938d2a41e941ffa04f99c35e5db2bcd3eec034afe8d35d5c810a22eb0a8  xwayland-23.2.2.tar.xz
-sha512  f5b319fdace7d7c078544730ecd26afeb63b1a0c779fb097455147945df85af32d9e91501ebdb70209d48e8a3ead3b23be31e9d5118358ac17e699abb4b6ac07  xwayland-23.2.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-December/003437.html
+sha256  eb9d9aa7232c47412c8835ec15a97c575f03563726c787754ff0c019bd07e302  xwayland-23.2.3.tar.xz
+sha512  37198aa2f06313a0cb2add51cc78f81b26a42f2c9d55a0d3eecf958777107ea5560961c128f2d0af055f7460ba10fadb1b9050251c2c50f2251b40ab517e79cd  xwayland-23.2.3.tar.xz
 
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index b0bff19be5..8f4bcd8117 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XWAYLAND_VERSION = 23.2.2
+XWAYLAND_VERSION = 23.2.3
 XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
 XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XWAYLAND_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
