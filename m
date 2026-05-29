Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAEBCD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9712985E16;
	Tue,  9 Jun 2026 13:05:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FpRU-mhO7WLO; Tue,  9 Jun 2026 13:05:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FABD85AB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010334;
	bh=4NbRWD6UG11onanKs2qyqF/9Hgb+7UG4z/mrBbrz7j0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=khWFEdjfEPds8sdsH+JRANAXrYnBiv4JW93tbzGZDk20LnpnzhjHuPkWjQst9BRwL
	 1Hocr26eHHW7NoJrW1VVy+F8NshCiWbOmHNf1LDtTIdBVl6DlTfGVUttAz2HHk5CJE
	 mNX+TWvPrCRUeeAVecK+fKCWhGKI9UMOrqk/ecGE/rNof+mOeVT0bfbyPYUnM2vXl2
	 jVbMboDTsTN4wFcudqL6LvB36rC05IecwLP5UL5oL4feo097dxFHsuNjQoAdXlWkc7
	 qNwfjmmG0U9RuDG12N+phkf092VkHF1DzD1g8cj3PP6XRO6BR36ki8FzqIQfLXQHw0
	 OWVn1+cfsECgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FABD85AB2;
	Tue,  9 Jun 2026 13:05:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E485190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEAD2426DE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id irAJVV0rX-Ro for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDF95426F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDF95426F3
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0556987E68; Tue,  9 Jun 2026 13:01:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 15:37:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8714f00265fd9fec7fa48f75424cb188bd1e0bdf
X-Git-Newrev: a85ec5435c79490596e5048afc796b59d906c110
X-Patchwork-Hint: ignore
Message-Id: <20260609130120.0556987E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: only needs libudev,
 not udev daemon
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a85ec5435c79490596e5048afc796b59d906c110
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/kodi/Config.in | 6 +++---
 package/kodi/kodi.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index a05a180eb3..e91b8cfb96 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -25,10 +25,10 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
 	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_HAS_LIBGBM
 	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
-	depends on BR2_PACKAGE_HAS_UDEV # libinput
+	depends on BR2_PACKAGE_HAS_LIBUDEV # libinput
 	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
 
-comment "kodi needs udev support for gbm"
+comment "kodi needs libudev support for gbm"
 	depends on !BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
 
 config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND
@@ -254,7 +254,7 @@ config BR2_PACKAGE_KODI_LIBUSB
 	bool "usb"
 	# https://github.com/xbmc/xbmc/blob/Jarvis/configure.ac#L1554
 	# "if libudev is available, we don't need libusb"
-	depends on !BR2_PACKAGE_HAS_UDEV
+	depends on !BR2_PACKAGE_HAS_LIBUDEV
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 0c177a94dd..85c15926ae 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -233,9 +233,9 @@ else
 KODI_CONF_OPTS += -DENABLE_MYSQLCLIENT=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
 KODI_CONF_OPTS += -DENABLE_UDEV=ON
-KODI_DEPENDENCIES += udev
+KODI_DEPENDENCIES += libudev
 else
 KODI_CONF_OPTS += -DENABLE_UDEV=OFF
 ifeq ($(BR2_PACKAGE_KODI_LIBUSB),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
