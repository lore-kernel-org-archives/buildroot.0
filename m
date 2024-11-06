Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D95D59F74
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 20:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3D6340220;
	Wed,  6 Nov 2024 20:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AZuf2GhjjaTJ; Wed,  6 Nov 2024 20:41:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 807DC40248
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 807DC40248;
	Wed,  6 Nov 2024 20:41:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60F964C38
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FF3E40282
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:41:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gJklcPptBWqt for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 20:41:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AD3FA4049C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD3FA4049C
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD3FA4049C
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:41:33 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.161]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8ykW-1tDiWN0rHa-00312f; Wed, 06
 Nov 2024 21:41:29 +0100
To: buildroot@buildroot.org
Date: Wed,  6 Nov 2024 21:41:06 +0100
Message-ID: <20241106204108.4039479-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241106204108.4039479-1-fiona.klute@gmx.de>
References: <20241106204108.4039479-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:8rzdL7O1V7qdaXKqdsg55+I89Opj8FUUvQlA/ws44R3aEuDB1gS
 JvMwWPnNl2dXvL1/Ewcg9nkXJGvBG2OGH9SsFMqMtdoWflCnwHH7YOBPaWcxzVZVgt7JVlM
 WeiOl6SZQ3LipUeDeCxwLKFlzP6dfQ29ZRvmrtfMndZlBvfhcgBzTSWyNZsfLh4A3wn0xP5
 SNbYxljcBR9qE5xQeEDcA==
UI-OutboundReport: notjunk:1;M01:P0:Pbj02qKlFdk=;9Ir8xP2GiA/d6PmeFebHJ/Hwk7k
 IiFtomMYPU/JsuxDwHk9wCeYDgEyaTi0aSwxeBogpWjo62W+Y/APAnEovsfcIsrNifrUHrUgm
 DIWZ79vW0inMgcktuAU5n02QBcfsQCbu4KKQuylXW+of9H9jZw88UAMERgkQnUx94LKUeAJBN
 dJyvAfdI3WJ48f/d8r483nCn8Hm6JA/5WIUvTdWE64fZvPlbeLnkmkaq2mkvPn8Zeznb9aqwo
 YupFeQqoMSymogsxocrVd5e/dYXVUiy4ReE9IoylRFGy6Uf2C1c45GITnGga0xOWrdUJe8Jpf
 9qMqKqz/NRU5BT03C73M7NzxeW7/rUvdVnIOSiGm0RxkM7IVHoC0JUu5vvVze9rXkWus3KMAg
 MhNfMZxQxxT5kq063CWd7nlFf1lkF3jM3PxrxpaCzNY2aidM/fx6wlBr0hhweJGo4p4PdoQj0
 JFaEtSLXRQZ14qlO9MiuYPaVxKbpZ22O8SVMwEPi6PV8lh+gG7EtO9Hb6+UoBmAF9FuX3mak/
 ltB5k4TrDww5Rinfl9+ADikveW3o0GQ7ndtFIKF+mQsNsCU4+ilSDe34CUhFR63ynoj0uIMxv
 OP+jSj7dCBtHw9fgNN5YU2LMv2rcTIe2+3pFwQJceKdSFKgDk6CjcZP1GmJmMbi6/ZaoX8lgH
 QKULqZfwmH3p6WIiCo4VKn8XF3yvf0fAGh0Tj25NVtrGqmp7svhFXYLuR3DW8OtwFfsEPBqLO
 3ovWia2xa58Ci4fv/8l2CAhp2GPTgloHmcr0kbCI6VqkvznhVtNetqma5tsM02wNAAPUxxgoV
 RuE7/OytXu+hXFXd5k1sVLfA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1730925689; x=1731530489; i=fiona.klute@gmx.de;
 bh=WKOUY5qSSTW90pTHRO+2vNCZH8Ilu4lMJjjFnHq3UcI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=WHMYtJvIukXXHeTM5a/TdU5KygXJCzW3lJHhHL5YsPIK7IMWSW/iN9DdEaiSiD8l
 UaKymNI+MdGF18mT1Vs5WyVER890NzZvrWdS5HCindsy4yTh5gUOVb0rSxV6PiaMr
 poW2RhdeXU4e7/0won9+eFNiu6640C5MEkPKWlAVOOnl2uBZFHqrrQzEG0eds+osf
 yv9Ghm9qPXcvqjF0iURLlogKyUFE8W41n/mFC3kHmM2769NRBV6zqipsXjcKq2OlQ
 6HWpNL1tGlpZjpFg7oOJrgJFZqohR1PfWEfep87HUt1ODvVUN/9PRpRTDZJcK7UjM
 4VRlCN6HNjuROBTFnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=WHMYtJvI
Subject: [Buildroot] [PATCH v6 3/5] package/python-gobject: bump to version
 3.50.0
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
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
