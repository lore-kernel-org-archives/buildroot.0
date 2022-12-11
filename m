Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A48C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 16:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0228C60BDA;
	Sun, 11 Dec 2022 16:24:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0228C60BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1bDkDSHZ_TaV; Sun, 11 Dec 2022 16:24:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48D9560BD4;
	Sun, 11 Dec 2022 16:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48D9560BD4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF7851BF2F2
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6DDC40300
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6DDC40300
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E_fgJ7InPqns for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 16:24:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE38140272
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 16:24:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE38140272
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A184B8645A; Sun, 11 Dec 2022 16:24:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 17:24:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5a0c2b779afa886cd1d79dc242f834ed0b87644
X-Git-Newrev: 3fbb447cded5120135ce21ce6a5d2936dc79f645
X-Patchwork-Hint: ignore
Message-Id: <20221211162445.A184B8645A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xr819-xradio: fix build failure
 with Linux 6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3fbb447cded5120135ce21ce6a5d2936dc79f645
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to latest version to fix build failure with Linux 6.0.

Fixes:
http://autobuild.buildroot.net/results/434c1d2a5104090366519278314bf750324d3710/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/xr819-xradio/xr819-xradio.hash | 2 +-
 package/xr819-xradio/xr819-xradio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
index 89201a8eb7..08a3b6e8cc 100644
--- a/package/xr819-xradio/xr819-xradio.hash
+++ b/package/xr819-xradio/xr819-xradio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  0d0449a85488b990d10ecdf67ac88bfbd39fa81c2df5dfcfed583975222afd33  xr819-xradio-4f0cfd5e869ca101e7c624d9ce05ba5d2b2a0bc2.tar.gz
+sha256  839fdae93eba29121d4116de335b00a026ef63874caf516747dbdf24c17f208b  xr819-xradio-58d597bcf081e44904335916e6033bc8ef28b043.tar.gz
 # Locally computed
 sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  LICENSE
diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
index 835e229347..8c1cb1587f 100644
--- a/package/xr819-xradio/xr819-xradio.mk
+++ b/package/xr819-xradio/xr819-xradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XR819_XRADIO_VERSION = 4f0cfd5e869ca101e7c624d9ce05ba5d2b2a0bc2
+XR819_XRADIO_VERSION = 58d597bcf081e44904335916e6033bc8ef28b043
 XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
 XR819_XRADIO_LICENSE = GPL-2.0
 XR819_XRADIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
