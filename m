Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E404C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:22:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C55A61283
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:22:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C55A61283
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ABD640653;
	Mon, 18 Oct 2021 19:22:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kbOuU31Cf3Hz; Mon, 18 Oct 2021 19:22:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D0BE40637;
	Mon, 18 Oct 2021 19:22:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 92C3A1BF319
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 807A76078A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:19:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e1t1nJblzB3u for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:19:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D64C60654
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:19:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C84778750C; Mon, 18 Oct 2021 19:16:53 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 21:19:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e092ba253414479c48a283517a2bd66abb6a8bf
X-Git-Newrev: d178fe6c64be23214248eddf6bb060ddfaf93e2a
X-Patchwork-Hint: ignore
Message-Id: <20211018191653.C84778750C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hidapi: bump to version 0.11.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d178fe6c64be23214248eddf6bb060ddfaf93e2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following build failure raised since
bump of autoconf to version 2.71 in commit
ecd54b65c1f998a7ccd91f7c523e4ff38c4781da thanks to
https://github.com/libusb/hidapi/commit/d15d594a415e5f51d2cd8ff8bb77b3765a539b98:

configure.ac:16: error: AC_CONFIG_MACRO_DIR can only be used once

https://github.com/libusb/hidapi/releases/tag/hidapi-0.11.0

Fixes:
 - http://autobuild.buildroot.org/results/4e55332625b7e55b338368e231f7bc6086403a04

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hidapi/hidapi.hash | 2 +-
 package/hidapi/hidapi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hidapi/hidapi.hash b/package/hidapi/hidapi.hash
index b49b6d1f91..95046386a7 100644
--- a/package/hidapi/hidapi.hash
+++ b/package/hidapi/hidapi.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  f71dd8a1f46979c17ee521bc2117573872bbf040f8a4750e492271fc141f2644  hidapi-0.10.1.tar.gz
+sha256  391d8e52f2d6a5cf76e2b0c079cfefe25497ba1d4659131297081fc0cd744632  hidapi-0.11.0.tar.gz
 sha256  7d3b087c34f35d4d538e3bcddd1ff8f66e92f9ef336881999482800ddf840913  LICENSE.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE-gpl3.txt
 sha256  30eb1bef29b46f8ba7ab8b416035dbd93cb034a45481dd97815b944284582cd2  LICENSE-bsd.txt
diff --git a/package/hidapi/hidapi.mk b/package/hidapi/hidapi.mk
index 7598ef7fb9..9341f0186c 100644
--- a/package/hidapi/hidapi.mk
+++ b/package/hidapi/hidapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HIDAPI_VERSION = 0.10.1
+HIDAPI_VERSION = 0.11.0
 HIDAPI_SITE = $(call github,libusb,hidapi,hidapi-$(HIDAPI_VERSION))
 HIDAPI_INSTALL_STAGING = YES
 # No configure provided, so we need to autoreconf.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
