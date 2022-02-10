Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C923C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 19:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E116A4091D;
	Thu, 10 Feb 2022 19:31:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PXJL1_aXPq5h; Thu, 10 Feb 2022 19:31:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26A2F40873;
	Thu, 10 Feb 2022 19:31:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A71E11BF3BB
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B194960A74
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FBFe2lGPld8V for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 19:29:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 787E1607F9
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 19:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644521347;
 bh=Tm4RXh6uF0mapwYEkwJ2hMs5l9NewavtfSDMUy0P42Y=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=hRXtPigy2/Q9lkjAhgaBUocdkoodASM0/Cgyo+TlJqZYtQvQMe8aASWuN4dfPqKAS
 Ye36iv8xu6kHQEy9RQOMgkqfse1e5fGXJI4vCD0OJ3LAWtCK1lrH+437AOb4dIqz8D
 iT2vaATYRaZc8ctHxhn0Ve3AbtOVzM6ih6lMWR/Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.34]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtOGa-1oAlBt103S-00upWR; Thu, 10
 Feb 2022 20:29:07 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 20:28:58 +0100
Message-Id: <20220210192905.4500-7-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210192905.4500-1-ps.report@gmx.net>
References: <20220210192905.4500-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:46NOLMBy55t8dgpMMOIpHHX5n1mZcXMY3iFWZc8s+lz4/5PXyPE
 ofl4WY/0KvaGT1iw6B4vxnRwS4ebJHn/MdFbhDPuyHGYjWct51ZT6aEHJSvCFlRx8KLhSuM
 7cprAQt73E0dcrll5J/Dgf/VKT7Cqeh3CphhBJ1TP4rErlHGQqzDps4pcgLaC2Vuct7F3EZ
 F8gFRCytLRtTgMASR4i5g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:O7Loq672no4=:jomjyJppd1zQM2xzv0OtB8
 QPdPtQEqTLbVVYHIASMCFCVlW6pYMWBRm84Fy4KL9ETaQTOaDjfg78mkGqh2vSAzlVI6zXt3/
 wxKy4toTa3hYd5TW8oJnyXpSX8zpPCpECB+b8X0/iNL0PKNLDy/eyx99VAo76gXrcWd5aQLoU
 GV2X0vvzAKfxXwgSSoeLzjbBE+V+DSNaf8xXhC68Nl70JtA7aZ6imKjcBt6vU7ChqDRJADnrN
 pw2S361j1mqWWCSZMsTLMY5spvOopclDvNn6vt/AQRk4QBsf4WgK1poAxy0C+uvacIh/hHBCe
 IiHTKQ6terUcCGJU/wDcyoCkNi9qmvMY12fg6Ef0XliF1rMKqipIyqwTnTqQBHeMl2bCyX1AM
 fqz9jdPdXjpkgh8KtO4othegdNam1+8r2yuO1SGId9GivAg0wGI251uiVfVxuH3QqUiZ8tugT
 ErDGdgdA+MMAP/XYkTp2b8me00zmRgHo89sU1G/ksIQ4mZcDeTGz1s9fyORGXEHVaqsXu3v2L
 x8v80MdCFfeF2QcrXxIewPn/1arIUr4fPgoNnJalzQWqzzdXFzs3b7knBSPPwMKuwLtt4aBPP
 9dZ+HJiR+OiBkUqIu+WyJFVWH7hQWfOckYgUzmnp4MIXxSAiy9G93m1Y342HifhWJo7VMGtfB
 Hp5mq10x5J7uuhlJXmplo/3JreQOuglddnEGf1fe5SSGQ2vAyDjs9VcBCdN0Ed920RQfV9d13
 2Ym7ifwHh0CVR/KD6U03xOqLFb2/JyThW85z7USqMAaYM7xwRunBybmYRgwRehkvFNqEhxqfG
 y0FU2EpNwvX4PCRCNRM/0/7d9QlfDUYv3wpWRRTHNfaP9t3ink++sZrIkh+rVbPbzCDfrnrPl
 Dkm/6/DAD5C6dB1ZdMfVVm0t0pP4oo7/DW3P54ZCqOAvI/8dBoiF7eSoNx+WWN0g+9OUspfCE
 EgdcQ/oXfzzhkFCRzUxJesvqFkadQC3CYaPT4NHs5q0HbqQjo07KfhcNh0VacKlUN3Z1ca1sc
 vUJhOfyF72gg5paj8qwWwzm6I6hfx/j6SNcSPKIaRIfmIWNMzbcXwvHTZbViMvlwjko7F0vUi
 gev7SmTVWJEYgI=
Subject: [Buildroot] [PATCH v2 06/13] package/gst1-devtools: bump version to
 1.20.0
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
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- use new option cairo ('Build GstValidateVideo') instead pure optional
  dependency on packet cairo

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-devtools/gst1-devtools.hash |  4 ++--
 package/gstreamer1/gst1-devtools/gst1-devtools.mk   | 13 ++++++++++---
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.hash b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
index 011385e757..dd09280a9c 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.hash
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.18.6.tar.xz.sha256sum
-sha256  3725622c740a635452e54b79d065f963ab7706ca2403de6c43072ae7610a0de4  gst-devtools-1.18.6.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.20.0.tar.xz.sha256sum
+sha256  69fc8756ec9d93e5c5258c99088434f203e91fdbc5af28d1f2c583fd819b7a1d  gst-devtools-1.20.0.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  validate/COPYING
diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.mk b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
index 9089b12188..f72df9cf71 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.mk
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_DEVTOOLS_VERSION = 1.18.6
+GST1_DEVTOOLS_VERSION = 1.20.0
 GST1_DEVTOOLS_SOURCE = gst-devtools-$(GST1_DEVTOOLS_VERSION).tar.xz
 GST1_DEVTOOLS_SITE = https://gstreamer.freedesktop.org/src/gst-devtools
 GST1_DEVTOOLS_LICENSE = LGPL-2.1+
@@ -16,8 +16,7 @@ GST1_DEVTOOLS_DEPENDENCIES = \
 	python3 \
 	gstreamer1 \
 	gst1-plugins-base \
-	json-glib \
-	$(if $(BR2_PACKAGE_CAIRO),cairo)
+	json-glib
 
 ifeq ($(BR2_PACKAGE_GST1_RTSP_SERVER),y)
 GST1_DEVTOOLS_DEPENDENCIES += gst1-rtsp-server
@@ -30,4 +29,12 @@ GST1_DEVTOOLS_CONF_OPTS = \
 	-Dtests=disabled \
 	-Ddoc=disabled
 
+# build GstValidateVideo
+ifeq ($(BR2_PACKAGE_CAIRO),y)
+GST1_DEVTOOLS_CONF_OPTS += -Dcairo=enabled
+GST1_DEVTOOLS_DEPENDENCIES += cairo
+else
+GST1_DEVTOOLS_CONF_OPTS += -Dcairo=disabled
+endif
+
 $(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
