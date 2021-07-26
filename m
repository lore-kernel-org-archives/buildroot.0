Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A308C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:14:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23CC760F93
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 23CC760F93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F365F83848;
	Mon, 26 Jul 2021 21:14:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NN64tkB-2lh7; Mon, 26 Jul 2021 21:14:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EFA8837C0;
	Mon, 26 Jul 2021 21:14:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD5351BF9AD
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB2A0608BA
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:12:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D6zZzSFndP61 for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 21:12:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00D926086F
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 21:12:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 44BA788EF5; Mon, 26 Jul 2021 20:37:50 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 23:11:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31c7f2fc4c3e123c570663cddcc52f16bd3646ed
X-Git-Newrev: c8dd578b135041eed639c06810e67b8b018402d4
X-Patchwork-Hint: ignore
Message-Id: <20210726203750.44BA788EF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libogg: bump version to 1.3.5
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=c8dd578b135041eed639c06810e67b8b018402d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://gitlab.xiph.org/xiph/ogg/-/blob/master/CHANGES

Removed md5 and sha1 hashes, not provided by upstream anymore.
Reformatted hashes.

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libogg/Config.in   | 2 +-
 package/libogg/libogg.hash | 8 +++-----
 package/libogg/libogg.mk   | 4 ++--
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/libogg/Config.in b/package/libogg/Config.in
index bf719ff4d7..48c62063c2 100644
--- a/package/libogg/Config.in
+++ b/package/libogg/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_LIBOGG
 	  with all Xiph.org technology is it an open format free for
 	  anyone to use.
 
-	  http://xiph.org/ogg/
+	  https://xiph.org/ogg/
diff --git a/package/libogg/libogg.hash b/package/libogg/libogg.hash
index 5d95c85d3a..9727c1cfaa 100644
--- a/package/libogg/libogg.hash
+++ b/package/libogg/libogg.hash
@@ -1,7 +1,5 @@
-# From: http://www.xiph.org/downloads/
-md5 eadef24aad6e3e8379ba0d14971fd64a  libogg-1.3.4.tar.xz
-sha1 f07499a35566aa62affb5ca989f62eed5b8092c3  libogg-1.3.4.tar.xz
-sha256 c163bc12bc300c401b6aa35907ac682671ea376f13ae0969a220f7ddf71893fe  libogg-1.3.4.tar.xz
+# From https://www.xiph.org/downloads/
+sha256  c4d91be36fc8e54deae7575241e03f4211eb102afb3fc0775fbbc1b740016705  libogg-1.3.5.tar.xz
 
 # Hash for license file:
-sha256 d2ab5758336489da61c12cc5bb757da5339c4ae9001f9bb0562b4370249af814 COPYING
+sha256  d2ab5758336489da61c12cc5bb757da5339c4ae9001f9bb0562b4370249af814  COPYING
diff --git a/package/libogg/libogg.mk b/package/libogg/libogg.mk
index 08e5f87b72..3faf1b7357 100644
--- a/package/libogg/libogg.mk
+++ b/package/libogg/libogg.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBOGG_VERSION = 1.3.4
+LIBOGG_VERSION = 1.3.5
 LIBOGG_SOURCE = libogg-$(LIBOGG_VERSION).tar.xz
-LIBOGG_SITE = http://downloads.xiph.org/releases/ogg
+LIBOGG_SITE = https://downloads.xiph.org/releases/ogg
 LIBOGG_LICENSE = BSD-3-Clause
 LIBOGG_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
