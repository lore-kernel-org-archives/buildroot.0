Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587C2C77B7C
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 12:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9E8D615D2;
	Tue,  9 May 2023 12:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9E8D615D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EIrPl0M3Df6j; Tue,  9 May 2023 12:48:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 028AB615CC;
	Tue,  9 May 2023 12:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 028AB615CC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 963DC1BF300
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 12:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CD28615CC
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 12:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CD28615CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wZPSnPKZ3VXU for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 12:48:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA7A060E90
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA7A060E90
 for <buildroot@buildroot.org>; Tue,  9 May 2023 12:48:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.225.6.203]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M8hZJ-1psG1x10nx-004hl9; Tue, 09 May 2023 14:48:08 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Tue,  9 May 2023 14:47:20 +0200
Message-Id: <20230509124720.205717-1-dalang@gmx.at>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:720XQc46tEFJe+5k4Tvbb5b2FehS4qAipTx8qrsTdrS2uo7rYuA
 CAHAp5geU8DiXLFKMT8ZbktibM3j9/Pc87rai8e3mpoVvHAW3sYBsX6SBB35Zj/eDZ8/dk+
 jqsBM+kws26ldzJ2uyToWGIH/Wh0iF1MuYF/XDszgmAXaK+taiRTD8VNEvayeFofcf0DFKq
 adEx0WAP4253nZU3erwLw==
UI-OutboundReport: notjunk:1;M01:P0:Dj0FiOaXtfc=;uKOMcCnMePH2wS6iPHDIIxs0rgB
 FIXHje9qyrFwdAAzLNZoU4w+JNHA99i6HA0BZvFIqUF0UzhKHz8OnrSlAAK/p/r5Gb6bv4wHY
 IPGCxnFNCOIMAwYb72CqKknlOG5PxuBBw5k1Ai0KoyY6G+93O+G9v/LWiNoX6/b3OM/iglwyN
 TbsVKYPagZMAFe+ww977Axk/DwBv66xN4GJDeqI0BsK2JLpvw314mUPqcn1bMVefAiRvjOIHd
 sbl0osl0yrYQRXARWbBg99X2BzFXOsF+kEPnMQSEI57PGE395gKm8kqP0wtDRCEP7GjhAo3RA
 PYhv4yJEooMSTXBxEdQ5EkfxbJMJK2vC33U55+BkM4J5Bm5T2NKXTnGLmWX0VL8kKT+hV6Rdr
 K6gEv8sX1+erArZYfsm5JyURj2LcLThzO+TtMTXB2xDMoDXQ7BK/p5c5K4I1VsJX0lKjw8aXf
 fYj0YmeNaTlUcvFX6fTIc0WuccN00+thVSlaYnFj5xqFyhYy3QUAqcrcIQxedXT5qEPkTw5Z1
 m7Zn2l0z9WAjphH5qbU7Gavn3vxNzhZ0rxDa7WoajsBrcFMJTslqJ6KaOK0sBnCkbyzXn7nHu
 bgPf0XYdWyXnNCjOQ9AV15p5XJAU2oFkPGNQGK7CCZYddwYOP6T7q9QpX8jjtI7SHJ6xrhAXS
 WejCGSyBKorEuV/jTXPC2aKmq+zreD5OvAec8v+Zd6NZxbvgXYALBJ7GswqgNX7cjPqiSwXGV
 xRqfFSLO2h/3j3k2x98ykI8ZuvRTkDj7MrBM5c7ZI/pTMcXTvKz6URpQkdffZKxqZL8KnlDSB
 NKwWARdUsIwxrEN7X2FNU3+tf7H+uHJsxpBuXBd6ZGccDhwL01SVmntnfT8jg6nDUbkCefopU
 SIDxUXUU6hPv8pOsPsTNYq5OIhkhK+0K2FT7Cg9ep/MzF/OiDegnTJuR6cX8zE3H1OjnU6Kkd
 dX0SSKJ48+lPq4oVunZCQ0ZnTXk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1683636488; i=dalang@gmx.at;
 bh=mlPE8JDaJzKFCNshNP6NTB9Yw8kGIdgPYO0+K7+qtzM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=aYdx4GINmpWIdhIhBiXA02G9dXFvqSipyRj8xxbsZiulCL4mw1xYQSQOvf4rPnS1o
 bCgjPYt9hfoHwbUyVX3vKeqBV05er2aK1JeWwrpsS2uxfQuBj6wr0PvoCz7JCUYJzW
 Qkb1+7wO1Shx+ghodAFLbweb4QXz6GhdM4nca5TJHU1kdqwAgaEMRzrkr8LYrLlNfa
 mDty+KG5vQ/+e4kW0IE8mlJ9MDz+5vVc3oqrju88AHS3toM5x+5pvc/G7vqS/qukbK
 CjrEUdpQatSp90X3jLrFvVRbE3dslr8BGDgT0NfXkJemrDisJu1XRSAAexNs7VpNH6
 iYkv0Ch9dINow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=aYdx4GIN
Subject: [Buildroot] [PATCH] package/gtkmm3: bump to version 3.24.7
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Daniel Lang <d.lang@abatec.at>,
 James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.gnome.org/GNOME/gtkmm/-/blob/3.24.7/NEWS

README [0] states:

It's easiest to build with Meson, if the tarball was made with Meson,
and to build with Autotools, if the tarball was made with Autotools.
Then you don't have to use maintainer-mode.
How do you know how the tarball was made? If it was made with Meson,
it contains files in untracked/gdk/gdkmm/, untracked/gtk/gtkmm/ and
other subdirectories of untracked/.

This is the case, therefore switch to meson build system.

Also disable tests and demos.
gtkmm3 tries to detect if X11 is enabled for gtk.
Switch to explicit definition to be safe.

[0]: https://gitlab.gnome.org/GNOME/gtkmm/-/blob/3.24.7/README

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/gtkmm3/gtkmm3.hash |  4 ++--
 package/gtkmm3/gtkmm3.mk   | 16 +++++++++++++---
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/package/gtkmm3/gtkmm3.hash b/package/gtkmm3/gtkmm3.hash
index fc7e33339e..c54862de67 100644
--- a/package/gtkmm3/gtkmm3.hash
+++ b/package/gtkmm3/gtkmm3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtkmm/3.22/gtkmm-3.22.0.sha256sum
-sha256  05da4d4b628fb20c8384630ddf478a3b5562952b2d6181fe28d58f6cbc0514f5  gtkmm-3.22.0.tar.xz
+# From https://download.gnome.org/sources/gtkmm/3.24/gtkmm-3.24.7.sha256sum
+sha256  1d7a35af9c5ceccacb244ee3c2deb9b245720d8510ac5c7e6f4b6f9947e6789c  gtkmm-3.24.7.tar.xz
 # Locally computed
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/gtkmm3/gtkmm3.mk b/package/gtkmm3/gtkmm3.mk
index 8bbcf224e6..df3d688648 100644
--- a/package/gtkmm3/gtkmm3.mk
+++ b/package/gtkmm3/gtkmm3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GTKMM3_VERSION_MAJOR = 3.22
-GTKMM3_VERSION = $(GTKMM3_VERSION_MAJOR).0
+GTKMM3_VERSION_MAJOR = 3.24
+GTKMM3_VERSION = $(GTKMM3_VERSION_MAJOR).7
 GTKMM3_SOURCE = gtkmm-$(GTKMM3_VERSION).tar.xz
 GTKMM3_SITE = https://download.gnome.org/sources/gtkmm/$(GTKMM3_VERSION_MAJOR)
 GTKMM3_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
@@ -13,4 +13,14 @@ GTKMM3_LICENSE_FILES = COPYING COPYING.tools
 GTKMM3_INSTALL_STAGING = YES
 GTKMM3_DEPENDENCIES = atkmm2_28 cairomm1_14 glibmm2_66 libgtk3 libsigc2 pangomm2_46 host-pkgconf
 
-$(eval $(autotools-package))
+GTKMM3_CONF_OPTS += \
+	-Dbuild-demos=false \
+	-Dbuild-tests=false
+
+ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
+GTKMM3_CONF_OPTS += -Dbuild-x11-api=true
+else
+GTKMM3_CONF_OPTS += -Dbuild-x11-api=false
+endif
+
+$(eval $(meson-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
