Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91ECCAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 20:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACD80425FB;
	Thu, 11 Sep 2025 20:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ds066rhxQksM; Thu, 11 Sep 2025 20:13:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C43EB425E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C43EB425E9;
	Thu, 11 Sep 2025 20:13:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E4E792E
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10353612B9
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ebvTYnBu7rc for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 20:13:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40BE560AC0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40BE560AC0
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:13:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F298843B8; Thu, 11 Sep 2025 20:13:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 22:09:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d45984a208016d9acd03ec77b0162acf99947af3
X-Git-Newrev: 86d698091faf5074efbf7f57bd8dcb4108647085
X-Patchwork-Hint: ignore
Message-Id: <20250911201307.2F298843B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mjpegtools: drop optional
 dependency on libgtk2
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

commit: https://git.buildroot.net/buildroot/commit/?id=86d698091faf5074efbf7f57bd8dcb4108647085
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we're about to remove libgtk2, let's drop the optional dependency
of mjpegtools on libgtk2, and forcefully disable gtk support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/mjpegtools/mjpegtools.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/mjpegtools/mjpegtools.mk b/package/mjpegtools/mjpegtools.mk
index 8d6c475518..871d1b8f36 100644
--- a/package/mjpegtools/mjpegtools.mk
+++ b/package/mjpegtools/mjpegtools.mk
@@ -10,6 +10,7 @@ MJPEGTOOLS_DEPENDENCIES = host-pkgconf jpeg
 MJPEGTOOLS_INSTALL_STAGING = YES
 MJPEGTOOLS_LICENSE = GPL-2.0+
 MJPEGTOOLS_LICENSE_FILES = COPYING
+MJPEGTOOLS_CONF_OPTS = --without-gtk
 
 ifeq ($(BR2_PACKAGE_MJPEGTOOLS_SIMD_SUPPORT),y)
 MJPEGTOOLS_CONF_OPTS += --enable-simd-accel
@@ -53,11 +54,4 @@ else
 MJPEGTOOLS_CONF_OPTS += --without-dga
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGTK2),y)
-MJPEGTOOLS_CONF_OPTS += --with-gtk
-MJPEGTOOLS_DEPENDENCIES += libgtk2
-else
-MJPEGTOOLS_CONF_OPTS += --without-gtk
-endif
-
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
