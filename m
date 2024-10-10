Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346DDCF11F8
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 13:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 051B141028;
	Thu, 10 Oct 2024 13:54:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xq8uDVV4N5li; Thu, 10 Oct 2024 13:54:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E6B941036
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E6B941036;
	Thu, 10 Oct 2024 13:54:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C8E11BF427
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 13:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48A5F403BB
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 13:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sAH3V-03UmsR for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 13:53:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A63D640D53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A63D640D53
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A63D640D53
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 13:53:55 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.249]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MulqD-1tofHn3ZYJ-00uHT0; Thu, 10
 Oct 2024 15:53:52 +0200
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 15:53:12 +0200
Message-ID: <20241010135318.3064224-6-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241010135318.3064224-1-fiona.klute@gmx.de>
References: <20241010135318.3064224-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:EM0SD3zp5wILyF6GGOZO4WMLIM/sG/AwczVXRL5P3ywjAHiED5V
 jDoIuqZSAutOQ20J0+xhP3szQd1LYf9bM53iG28Tu1b3kRuJeoFglcSNpUFJCXo7fimrN1S
 GRhF7uuJx+gg6J1GSsmsCb1E6Dy3B9LXxH72m4pKKbE0SD8wQ3z0CSvs2JIJ2HecAIUGoTV
 j1vwAVuLRl03Ca/NKwJ7Q==
UI-OutboundReport: notjunk:1;M01:P0:Q6RUy5Myqzw=;zzYsFRie9jujcLclYpJZhyajRVO
 uvtopx2JcbD0v+fWEEVtOKnp7GyqifMZNsh2Hm9675QD6D+KuCTxl+vbHRiL1np9bwiQDfBkL
 CRHA/OSgZIHXVhfk/Tujjog6ygeWEBti3zM4PaUHXGP6LU/P5c7ebkN1acyL49wbLMuz/8Zit
 sjFygAA3SkeXTi+Ty4+gkYYjKj5KWWl1sEgqI424kcgoKE2cjrp8CTo6IrLH/u/qK9TaIpLdY
 Umsf2ZMP2RY4UAr4vrGx3Gjcyfsz7zWNjZYOUadvSxGqOpiOzdmOAJcoDxM8yY6/8d4oTZm5i
 lRjQH5AU3Tr5uQ0WVPJHmwzHx7XCma25jWTy/dSdYneCoQyD6Ro9iQD+RJye5Kzwph2M8xHe5
 Aq4gNMuW1rTrKETTk8zwQetDtLawGzECLlQy3wz3y39FbJY6TNjWUWMrMV9HxJMz6Pkqq46in
 bWXHIgozZlP7I9cLDesxnRLWDtkzsVOEBSoApWNCt+ehRiQ/8AtA6w6jmIWsRbZKVdySYbp17
 eBy4TvHgt9nGTABloITTD1bWbJ1xm9BIIdNDape9zA3YnyPqY2ZQl7Ori9taO5kKZLuRIiM6S
 d4ssCodiWN4lDt424QqNB6txFLAEcLKevhIYGeAhRMo8W+VZiL8pL4cHNLXM0NSlWMbxOAmAz
 gAZtucDQNmPFJGompFKMfwQi+zk1q7+r3k2ka74t1GKe0O4QGcmYvTqMs8Vm0qOOIn24ust+D
 juMwtmqYA2SXN2ft9b3H9RynWnHCWScGJyQZzgxpnYePUDHmdZLQLaCUAXIR6ILnQRY1dgrlB
 +gj0gHd2i9X1IFaIvx6T6q/gNrTR+duHBuJA3MEamQ9dY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1728568433; x=1729173233; i=fiona.klute@gmx.de;
 bh=WKOUY5qSSTW90pTHRO+2vNCZH8Ilu4lMJjjFnHq3UcI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=JMjiYq1xgcb3qigwqiqB8JPxTfIeCj4j3j0uIBR4IRhFVA60BTbdJBBx04Gos0p3
 LwTVybJkb17NJEtVzWycJWaxYf4lyx13fGn0FQ+Eg4lwxCukJSVr+Uk8YuQM36e92
 bxqBcLywvWX45ShIvj6Qx7MmR1omc0awLy3KhsPt4ofgudr09x0P8CMEIIhh4IREx
 8IruTeWhgx6+2S4UPY4KidHSXjHWkn3HVmQfcH9OiCzJe5FEg1c7u8ZgLslvSYwVA
 OfyRnvroLkZChId8beY4hSQ5+y0mNsyF94g8EyUN+4veAfEMCtN/ikP08X28XMpWQ
 pDJVgd/spu6aWIZ3Mw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=JMjiYq1x
Subject: [Buildroot] [PATCH v5 5/7] package/python-gobject: bump to version
 3.50.0
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Current gobject-introspection releases work with musl, so relax the C
library requirement.

Also update the homepage, the old URL now links to the current one.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
Changes v3 -> v4 (Fiona):
* Bump python-gobject to 3.50.0

 package/python-gobject/Config.in           | 8 ++++----
 package/python-gobject/python-gobject.hash | 4 ++--
 package/python-gobject/python-gobject.mk   | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/python-gobject/Config.in b/package/python-gobject/Config.in
index 3354535637..d9d73cc5e3 100644
--- a/package/python-gobject/Config.in
+++ b/package/python-gobject/Config.in
@@ -4,17 +4,17 @@ config BR2_PACKAGE_PYTHON_GOBJECT
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # gobject-introspection
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
 	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection -> host-qemu
-	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # gobject-introspection
 	select BR2_PACKAGE_GOBJECT_INTROSPECTION
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Python bindings for the GLib/GObject library
 
-	  https://wiki.gnome.org/action/show/Projects/PyGObject
+	  https://pygobject.gnome.org/
 
-comment "python-gobject needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
+comment "python-gobject needs a glibc or musl toolchain, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_HOST_GCC_AT_LEAST_8
diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
index 2fb9d38ab0..1dbd40d038 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,3 +1,3 @@
-# from https://download.gnome.org/sources/pygobject/3.42/pygobject-3.42.2.sha256sum
-sha256  ade8695e2a7073849dd0316d31d8728e15e1e0bc71d9ff6d1c09e86be52bc957  pygobject-3.42.2.tar.xz
+# from https://download.gnome.org/sources/pygobject/3.50/pygobject-3.50.0.sha256sum
+sha256  8d836e75b5a881d457ee1622cae4a32bcdba28a0ba562193adb3bbb472472212  pygobject-3.50.0.tar.xz
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index a12ce5c107..001f355844 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_GOBJECT_VERSION_MAJOR = 3.42
-PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).2
+PYTHON_GOBJECT_VERSION_MAJOR = 3.50
+PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).0
 PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.xz
 PYTHON_GOBJECT_SITE = https://download.gnome.org/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
 PYTHON_GOBJECT_LICENSE = LGPL-2.1+
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
