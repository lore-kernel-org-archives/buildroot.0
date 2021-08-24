Return-Path: <SRS0=7Mk9=NP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA7DC4338F
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 21:54:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84071613CD
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 21:54:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84071613CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 501E04011B;
	Tue, 24 Aug 2021 21:54:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tvTIqYR8s1sY; Tue, 24 Aug 2021 21:54:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9329840171;
	Tue, 24 Aug 2021 21:54:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0930C1BF2A2
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 21:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECCED6138E
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 21:54:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eKFvzaLRqpHt for <buildroot@lists.busybox.net>;
 Tue, 24 Aug 2021 21:54:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74161606BF
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 21:54:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6BCA58D4C8; Tue, 24 Aug 2021 21:53:12 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 24 Aug 2021 23:53:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1f4ba521cd3a2534643aad021d0bb7c619c206af
X-Git-Newrev: 50b6d7d69f880e940d7c281c493a6a6694d6ebe3
X-Patchwork-Hint: ignore
Message-Id: <20210824215312.6BCA58D4C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libiio: bump to
 version 0.23
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

commit: https://git.buildroot.net/buildroot/commit/?id=50b6d7d69f880e940d7c281c493a6a6694d6ebe3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In versions > 0.21, the CMake script doesn't auto-enable features
according to what it detects in the environment; options have to be
explicitely enabled. Update the libiio.mk script accordingly.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
