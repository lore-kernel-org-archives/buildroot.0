Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FBBEE49B4
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 22:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9628081101;
	Tue, 30 Dec 2025 22:26:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gvXH_qADNltU; Tue, 30 Dec 2025 22:26:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2868810DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767133599;
	bh=D4IaRtgCPpx7K+y+Ll/QnvgmdGWkfHt6ey/PXZZ9Bpo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sr32Xr3xsFuF2YWa+kK0mfOsieQpRBUIwoAN+MlXyts5Q02o7oZR00+LhW2x5cEWa
	 AHyZFFcDhn5/4d7EoPxPkeSfUYHpjRoDcTkW0L1tLqKUktvTfCF8j+jnB4o2CmkD6R
	 OC2BUkYhVpGnqZkYaaPlN7Upn7AjOm4PYK1yl09zYdb4qmE+1tmucRmaSCwsS6FsOp
	 Sytepo3MEYoQckuvr6rigsmc39A5E3fO3vQmWYsb5HThznxHMrdmbRQJJqBt00fR2p
	 MR9OCMI6x7BL0XNy/xyaz30NkYRhmF/BhhrWFOnMJ7UT45JkY5JyLBEv0rkuUxejsl
	 wCn+9DAVf6ydQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2868810DB;
	Tue, 30 Dec 2025 22:26:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 76BF1277
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6666180E1B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V6ZODbAEVh8J for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4F7D80E25
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4F7D80E25
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BED6480714; Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 23:22:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60ede40f169935df91a39824d6220d0f63261c11
X-Git-Newrev: cd1451e65cf0868b33b204c03428256659cb5bef
X-Patchwork-Hint: ignore
Message-Id: <20251230222628.BED6480714@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tvheadend: drop rpi-userland
 support
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cd1451e65cf0868b33b204c03428256659cb5bef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we're about to remove the rpi-userland package, drop support for it
from package/tvheadend.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tvheadend/tvheadend.mk | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 7d83c31e5f..e108a6d23a 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -14,6 +14,8 @@ TVHEADEND_DEPENDENCIES = \
 	host-pngquant \
 	host-python3 \
 	openssl
+TVHEADEND_CONF_OPTS = \
+	--disable-omx
 
 ifeq ($(BR2_PACKAGE_AVAHI),y)
 TVHEADEND_DEPENDENCIES += avahi
@@ -41,12 +43,6 @@ TVHEADEND_DEPENDENCIES += opus
 else
 TVHEADEND_CONF_OPTS += --disable-libopus
 endif
-ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-TVHEADEND_CONF_OPTS += --enable-omx
-TVHEADEND_DEPENDENCIES += rpi-userland
-else
-TVHEADEND_CONF_OPTS += --disable-omx
-endif
 ifeq ($(BR2_PACKAGE_LIBVPX)$(BR2_INSTALL_LIBSTDCPP),yy)
 TVHEADEND_CONF_OPTS += --enable-libvpx
 TVHEADEND_DEPENDENCIES += libvpx
@@ -63,7 +59,6 @@ else
 TVHEADEND_CONF_OPTS += \
 	--disable-libav \
 	--disable-libopus \
-	--disable-omx \
 	--disable-vaapi \
 	--disable-libvpx \
 	--disable-libx264 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
