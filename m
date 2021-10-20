Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000F8C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 21:37:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CD566112D
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 21:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8CD566112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68DEA407B3;
	Wed, 20 Oct 2021 21:37:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lNxg3j0eSAch; Wed, 20 Oct 2021 21:37:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3C04407B6;
	Wed, 20 Oct 2021 21:37:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3AF991BF9B9
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 21:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26AB060C1F
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 21:37:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q3HhqZNvkC1c for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 21:37:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80CF260BBB
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 21:37:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 68EC0881BC; Wed, 20 Oct 2021 21:34:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 20 Oct 2021 23:36:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee5efd4bbb93cee24850426d63acc34854ba1dc2
X-Git-Newrev: 77f4d2f8efcb6e3d842cd9719311907ecec6147b
X-Patchwork-Hint: ignore
Message-Id: <20211020213408.68EC0881BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ipcalc: add libmaxminddb support
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

commit: https://git.buildroot.net/buildroot/commit/?id=77f4d2f8efcb6e3d842cd9719311907ecec6147b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ipcalc/ipcalc.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/ipcalc/ipcalc.mk b/package/ipcalc/ipcalc.mk
index ff9d643389..145b6904b9 100644
--- a/package/ipcalc/ipcalc.mk
+++ b/package/ipcalc/ipcalc.mk
@@ -10,8 +10,13 @@ IPCALC_SOURCE = ipcalc-$(IPCALC_VERSION).tar.bz2
 IPCALC_LICENSE = GPL-2.0+
 IPCALC_LICENSE_FILES = COPYING
 
-IPCALC_CONF_OPTS = \
-	-Duse_maxminddb=disabled \
-	-Duse_geoip=disabled
+IPCALC_CONF_OPTS = -Duse_geoip=disabled
+
+ifeq ($(BR2_PACKAGE_LIBMAXMINDDB),y)
+IPCALC_CONF_OPTS += -Duse_maxminddb=enabled
+IPCALC_DEPENDENCIES += host-pkgconf libmaxminddb
+else
+IPCALC_CONF_OPTS += -Duse_maxminddb=disabled
+endif
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
