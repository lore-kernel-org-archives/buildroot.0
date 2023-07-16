Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481C6EB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 13:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 582B94090F;
	Sun, 16 Jul 2023 13:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 582B94090F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IFvpw3KU2n_a; Sun, 16 Jul 2023 13:34:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38BFC40918;
	Sun, 16 Jul 2023 13:34:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38BFC40918
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D75F1BF279
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 13:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32865605AE
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 13:34:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32865605AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U_sOWgJSwuGu for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 13:34:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0AA360593
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0AA360593
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 13:34:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 79148A4C00B8;
 Sun, 16 Jul 2023 15:34:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43820)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qL1tI-0000KO-0k;
 Sun, 16 Jul 2023 15:34:24 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 15:34:23 +0200
Message-Id: <20230716133424.4131847-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689514464;
 bh=u7W8WaaTPgfhopDkOWgxm3MhF7wOxQUNzPYk7w/7B74=;
 h=From:To:Cc:Subject:Date:From;
 b=ZCmXtGXmb0FU0HBN8NRNGM6NiVJOHjiyhIk7/EzdiJmqOUpSxrK0On/bVNzI9tJS+
 5y8oLsdBkjMjiu7upqE7Vq2/3xQauNJQBar8K2gk8ukk3vInGVk4/cLyDlyFk88moM
 agbSFWZWBj33SM7Pf4O6a+XDeEJTR3W0U+DZJqAiqQ9VtmOvzfXny4QRJdi98ZttMZ
 Sh8aRKCU6y6ZY6Ks1ss8SLu+p7GfMmodluE1+teT+59Q9/KZ39sVNIWXjUwtvKRRpO
 kmbNJvopcY+I4+KOItg7Z1HuAvEW+zVI2QuAjU+VBGNNswbQLA2C3n2i+UOxtLL94J
 hDDken7v98ikQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=ZCmXtGXm
Subject: [Buildroot] [PATCH 1/2] package/x11r7/xlib_libXpresent: new package
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed for mpv since version 0.35.0:
https://github.com/mpv-player/mpv/commit/3d459832a88a9bd2835b339cf6ca98f84aad0115

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/Config.in                       |  1 +
 package/x11r7/xlib_libXpresent/Config.in      |  9 +++++++++
 .../xlib_libXpresent/xlib_libXpresent.hash    |  5 +++++
 .../xlib_libXpresent/xlib_libXpresent.mk      | 20 +++++++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/x11r7/xlib_libXpresent/Config.in
 create mode 100644 package/x11r7/xlib_libXpresent/xlib_libXpresent.hash
 create mode 100644 package/x11r7/xlib_libXpresent/xlib_libXpresent.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 4de8922e0d..b91f97bb34 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -42,6 +42,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xlib_libXinerama/Config.in
 		source package/x11r7/xlib_libXmu/Config.in
 		source package/x11r7/xlib_libXpm/Config.in
+		source package/x11r7/xlib_libXpresent/Config.in
 		source package/x11r7/xlib_libXrandr/Config.in
 		source package/x11r7/xlib_libXrender/Config.in
 		source package/x11r7/xlib_libXres/Config.in
diff --git a/package/x11r7/xlib_libXpresent/Config.in b/package/x11r7/xlib_libXpresent/Config.in
new file mode 100644
index 0000000000..f6e2d93fab
--- /dev/null
+++ b/package/x11r7/xlib_libXpresent/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_XLIB_LIBXPRESENT
+	bool "libXpresent"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXFIXES
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  X.Org Xpresent library
diff --git a/package/x11r7/xlib_libXpresent/xlib_libXpresent.hash b/package/x11r7/xlib_libXpresent/xlib_libXpresent.hash
new file mode 100644
index 0000000000..d0ab359fd2
--- /dev/null
+++ b/package/x11r7/xlib_libXpresent/xlib_libXpresent.hash
@@ -0,0 +1,5 @@
+# From https://lists.x.org/archives/xorg-announce/2022-October/003225.html
+sha256  b964df9e5a066daa5e08d2dc82692c57ca27d00b8cc257e8e960c9f1cf26231b  libXpresent-1.0.1.tar.xz
+sha512  a4551f49a68f4487eb70dc5b50b7f745fbc8b6842cfa60422afe3834af41c504a37bcfddb4e7e9ee084b250df256034290776c8eb7d8838e392eb626fff55d25  libXpresent-1.0.1.tar.xz
+# Locally computed
+sha256  d64e671ffeb483d4543f98c842788ab34c77427e27d83d6b082065a4438d4885  COPYING
diff --git a/package/x11r7/xlib_libXpresent/xlib_libXpresent.mk b/package/x11r7/xlib_libXpresent/xlib_libXpresent.mk
new file mode 100644
index 0000000000..38d87b863f
--- /dev/null
+++ b/package/x11r7/xlib_libXpresent/xlib_libXpresent.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# xlib_libXpresent
+#
+################################################################################
+
+XLIB_LIBXPRESENT_VERSION = 1.0.1
+XLIB_LIBXPRESENT_SOURCE = libXpresent-$(XLIB_LIBXPRESENT_VERSION).tar.xz
+XLIB_LIBXPRESENT_SITE = https://xorg.freedesktop.org/archive/individual/lib
+XLIB_LIBXPRESENT_LICENSE = MIT
+XLIB_LIBXPRESENT_LICENSE_FILES = COPYING
+XLIB_LIBXPRESENT_INSTALL_STAGING = YES
+XLIB_LIBXPRESENT_DEPENDENCIES = \
+	xlib_libX11 \
+	xlib_libXext \
+	xlib_libXfixes \
+	xlib_libXrandr \
+	xorgproto
+
+$(eval $(autotools-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
