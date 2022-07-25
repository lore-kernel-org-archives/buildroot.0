Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA196C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 15:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3239861288;
	Mon, 25 Jul 2022 15:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3239861288
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6aUPBiTjR0ve; Mon, 25 Jul 2022 15:26:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F79660C0D;
	Mon, 25 Jul 2022 15:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F79660C0D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0DDE11BF2BD
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC6B883E88
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC6B883E88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BI9_HfY-XO-N for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 15:25:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79CCC83E54
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79CCC83E54
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:25:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 401ED240012;
 Mon, 25 Jul 2022 15:25:30 +0000 (UTC)
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Peter Seiderer <ps.report@gmx.net>,
 Buildroot List <buildroot@buildroot.org>
Date: Mon, 25 Jul 2022 17:25:18 +0200
Message-Id: <20220725152522.1579992-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220725152522.1579992-1-thomas.petazzoni@bootlin.com>
References: <20220725152522.1579992-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658762730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vPHcvkG2sG9Rg/h7E0EYfMMdbcPt3Pvpcptg9qEgdNE=;
 b=RlDtxdUK9ACUWuzYa/XI/01zTi+ZiPEAhND94yxXpP3F6FkeB01mOfLSV5zOBZEzIvuCfG
 lh3jWd337SlssngxXIpnBFkM4L14HyiAxh3DOxZ00GO/LvNrtyvNT0CkXIA6uYiZ1Zc1Xr
 YXCn+PZL+od0n5o8QKEVhg9P8Vwda2yI3BGyCQCOHoRssAVrGSLDebRxao5XB5UuMNEdix
 rxlTyiuK44AH1WF+oaAIb45pfTGjQx1ckg35uQdZWuNvhfsKMbj+bQvL7FoCsqHF1WvicB
 0IakfyfWvgTawKS1HZf4VyK/qOSiIhOXf7iDjIuJdz7C8LHHr6sBicYoDRKA1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RlDtxdUK
Subject: [Buildroot] [PATCH 2/5] package/libb2: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Peter Seiderer <ps.report@gmx.net>

Both the target and host variants of this package will be needed for
qt6base.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS               |  2 ++
 package/Config.in        |  1 +
 package/libb2/Config.in  |  6 ++++++
 package/libb2/libb2.hash |  3 +++
 package/libb2/libb2.mk   | 18 ++++++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/libb2/Config.in
 create mode 100644 package/libb2/libb2.hash
 create mode 100644 package/libb2/libb2.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c580d3ebd8..197fb24f8e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2328,6 +2328,7 @@ F:	package/gstreamer1/gst1-devtools/
 F:	package/gstreamer1/gst1-interpipe/
 F:	package/gstreamer1/gstreamer1-editing-services/
 F:	package/iwd/
+F:	package/libb2/
 F:	package/libcamera-apps/
 F:	package/libevdev/
 F:	package/libuev/
@@ -2848,6 +2849,7 @@ F:	package/hiawatha/
 F:	package/igh-ethercat/
 F:	package/intltool/
 F:	package/jh71xx-tools/
+F:	package/libb2/
 F:	package/libcap/
 F:	package/libffi/
 F:	package/libsha1/
diff --git a/package/Config.in b/package/Config.in
index b9a17c12ba..ce0169a308 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1415,6 +1415,7 @@ menu "Crypto"
 	source "package/gnutls/Config.in"
 	source "package/libargon2/Config.in"
 	source "package/libassuan/Config.in"
+	source "package/libb2/Config.in"
 	source "package/libgcrypt/Config.in"
 	source "package/libgpg-error/Config.in"
 	source "package/libgpgme/Config.in"
diff --git a/package/libb2/Config.in b/package/libb2/Config.in
new file mode 100644
index 0000000000..5cb462eb19
--- /dev/null
+++ b/package/libb2/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBB2
+	bool "libb2"
+	help
+	  C library providing BLAKE2b, BLAKE2s, BLAKE2bp, BLAKE2sp.
+
+	  https://github.com/BLAKE2/libb2
diff --git a/package/libb2/libb2.hash b/package/libb2/libb2.hash
new file mode 100644
index 0000000000..6ef24a98ca
--- /dev/null
+++ b/package/libb2/libb2.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  10053dbc2fa342516b780a6bbf6e7b2a2360b8d49c5ac426936bf3df82526732  libb2-0.98.1.tar.gz
+sha256  6a1ee543e5282cd9061881edf462e6fdab181f328da71fc2c9a6950a80e94d01  COPYING
diff --git a/package/libb2/libb2.mk b/package/libb2/libb2.mk
new file mode 100644
index 0000000000..29df233ad2
--- /dev/null
+++ b/package/libb2/libb2.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# libb2
+#
+################################################################################
+
+LIBB2_VERSION = 0.98.1
+LIBB2_SITE = $(call github,BLAKE2,libb2,v$(LIBB2_VERSION))
+LIBB2_LICENSE =  CC0-1.0
+LIBB2_LICENSE_FILES = COPYING
+LIBB2_INSTALL_STAGING = YES
+LIBB2_AUTORECONF = YES
+LIBB2_DEPENDENCIES = host-pkgconf
+LIBB2_CONF_OPTS = --disable-fat --disable-native
+HOST_LIBB2_CONF_OPTS = --disable-fat --enable-native
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
