Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47AFC4338F
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 08:52:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 702A06102A
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 08:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 702A06102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16B1340144;
	Mon, 23 Aug 2021 08:52:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b0FBoZ83BcNY; Mon, 23 Aug 2021 08:52:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C40740250;
	Mon, 23 Aug 2021 08:52:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A05A1BF3BE
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 08:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69C0480D99
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 08:52:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NPQHI5ueUn8g for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 08:52:11 +0000 (UTC)
X-Greylist: delayed 00:08:53 by SQLgrey-1.8.0
Received: from aposti.net (aposti.net [89.234.176.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0798280DB1
 for <buildroot@busybox.net>; Mon, 23 Aug 2021 08:52:10 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: buildroot@busybox.net
Date: Mon, 23 Aug 2021 09:43:03 +0100
Message-Id: <20210823084303.5267-1-paul@crapouillou.net>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libiio: bump to version v0.23
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
Cc: Paul Cercueil <paul@crapouillou.net>, michael.hennerich@analog.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Bump to the upstream version v0.23.

In versions > 0.21, the CMake script doesn't auto-enable features
according to what it detects in the environment; options have to be
explicitely enabled. Update the libiio.mk script accordingly.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 package/libiio/libiio.hash |  2 +-
 package/libiio/libiio.mk   | 12 +++++++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/libiio/libiio.hash b/package/libiio/libiio.hash
index dd85ffa695..b0a901ca98 100644
--- a/package/libiio/libiio.hash
+++ b/package/libiio/libiio.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 81c414d5c47b715d9bc9275b9fabbfd9e9483e60c035f3001b5977932049595d  libiio-0.19.tar.gz
+sha256 df1577740ea93dca732e7d7c04786600cb083117901dee793f3d38980754af00  libiio-0.23.tar.gz
 sha256 102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b  COPYING.txt
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index af5b27ba5f..aec251e9a1 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIIO_VERSION = 0.19
+LIBIIO_VERSION = 0.23
 LIBIIO_SITE = $(call github,analogdevicesinc,libiio,v$(LIBIIO_VERSION))
 LIBIIO_INSTALL_STAGING = YES
 LIBIIO_LICENSE = LGPL-2.1+
@@ -54,9 +54,19 @@ else
 LIBIIO_CONF_OPTS += -DWITH_IIOD_USBD=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBAIO),y)
+LIBIIO_DEPENDENCIES += libaio
+LIBIIO_CONF_OPTS += -DWITH_AIO=ON
+else
+LIBIIO_CONF_OPTS += -DWITH_AIO=OFF
+endif
+
 # Avahi support in libiio requires avahi-client, which needs avahi-daemon and dbus
 ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
 LIBIIO_DEPENDENCIES += avahi
+LIBIIO_CONF_OPTS += -DHAVE_DNS_SD=ON
+else
+LIBIIO_CONF_OPTS += -DHAVE_DNS_SD=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBIIO_BINDINGS_PYTHON),y)
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
