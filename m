Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A98C02184
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 20:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60EE740576;
	Mon, 13 Jan 2025 20:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w0bGTC3YBNj6; Mon, 13 Jan 2025 20:05:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3247A4052C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3247A4052C;
	Mon, 13 Jan 2025 20:05:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EFCB940
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F17854048F
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r905VI0EdYns for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 20:05:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 34F48400BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34F48400BD
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34F48400BD
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:05:31 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.119.64]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbAci-1t0ZuK3Mka-00oiCq; Mon, 13
 Jan 2025 21:05:28 +0100
To: buildroot@buildroot.org
Date: Mon, 13 Jan 2025 21:04:52 +0100
Message-ID: <20250113200454.3108562-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113200454.3108562-1-fiona.klute@gmx.de>
References: <20250113200454.3108562-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:AbiUlOCFd4yAr3s9C2nPUdc3ardFIwMwGX3/EgHKQqWXBDRiZdj
 lOww2+4HscNJg3DryBkqH+n4Fa7m4fGUERbHY4YZd8fB4dBKkccNTBppq0/SpK6Im/lW5YD
 ljwenS4LV9/NiyCQQOn/QsL6q2Eqq8xtId9kyN/IVpkRYD9vkFRn9pSp3wbjmb9/MB5iSh1
 E4pbnjuTsSwAi/uIHwoZQ==
UI-OutboundReport: notjunk:1;M01:P0:RawDLxNiYoM=;sL+PDop58PNfU1ozPuAp7rWwwiF
 38J8Z+Qu6h9AvpY5NfiyAW78la08UqbYjvK6D94OGIHeJGVM3BonjiaY/qxNCk8nvgGMeJyhi
 M2hYW841Fiv2EAm82oiTrM47Gg04YdIa7PHMqlBOEptFyGOcornP2gjK+mOK9pK2GAKJvtkrY
 ZAHWT1oF1HGap7QsYK0yms/MG9/Uql4PPyM1CX027EuL0qwmKxoOvSIgdUGF5zphbdvPt85ew
 8mqfzQ6u2P+1YdonAF/3geqsoqNG5JT5oeyQcuhYh4kSS9KgoRrTV5x0VcXFlgbfMKEINpJPD
 8bm+SBuq/ybE8yzrboJbhNZbqBe7mP0Oa2uO23qqnz5dHb9vgYOZOrMJyfznLVE+f228n+ki9
 Sz2jnMcsYfnuCFHS3ayLaIr3KlTFVoallJFfoUeqNm0J3qIuTz547KfePYuXxmCeQ2AfTV3rx
 B4v3Zg/kWo/QtA2C62Y5VdmQOxYCJyoEYi4U1IRXZsBEwTFBEHfFE1lsAG2TNymoU+8HXxw5z
 Qui7ZxMKNI8pF456apPTKWIVmVDsrEx2algXz3fQRjxiTfDPjFDBgU8OEbbd91xuQb2AQQg0a
 RNg92/qvCqxJvYRBZsxMNw6JfvM2G2luiyHTifPer6mCGa3PcKxs1rBHbiCcHRvgVNLru3vbX
 4Kvwn3Fe8ZIeroEhh285vrzE/cHpnU+XczlaXQjCxlQQ23OQEcbVhXXfHwoZn7IX35N+V4ooU
 iPu4jF9kgnm7jFbJ51dxzMdPmpcwhUIaSKaDjEjtNU+DOUo6ezYhZcePHg+E88K59t9fmPxGZ
 zD0ENjkKQHIXgrmD+LjRUixxDuN7jaW/9jnz9FZwcixCLSf6Dv7qMVVg5drJMnZBohbL7nfLR
 S0puTkafIn/gjwmMl/UHZUDqkWWxXTGEWd0UtPFfDsuaz60NuzydfqHdj6VJ7JIWftvjNpx72
 BiHGsNQ6C3JNnec9hJuHPJiDnTX0HxBI6Y1IUUOW3KtRvDM1IIgQeQfb+rHYyeAwxuTXQOsc9
 ypnWEqFBCKRxfjqwPBwrxuPpF+GO4CiRzyvrYgKzftVeDM6ZmEgSnveRbGmwRGqqXPD0o0cwF
 lTt/aT4H0WWNphciminutYpDDoxBZz
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1736798729; x=1737403529; i=fiona.klute@gmx.de;
 bh=CdTpaFcbKu59mMkH2W/wNfdQSsHRmGg4kCUZZEyae9E=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Je2Kh3bSw1xfCYATBVZ/RZyzO/JDQLxiIhIBHaWbtKUfHA69zt6tOs/YMsFZMSw1
 XHWDQwhjpPzdry5h5mlSRIOQJbCmmkuzOLh1P22PYBtW4w9xMVmjYNNvEhmK/aCGM
 PUcBGtYG+75QtYxSjAZPD7Soew1V0uR2stul+HElDBYucRWmzJvhoxDy9vjWFQcbh
 3NXYVjjx69affXFCSoYiENI/Dk4RfV3vSRkQEz6ccCM/8OzZ53HCYJy7WCr6eOGS2
 Sf7inE1dFiyVF/+n5eJByBqK+CBxpkAU7MVFByKSayBS6HBwtJp0ALWl3r1Ld8FZV
 RgY3CAq55A+O+XorpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Je2Kh3bS
Subject: [Buildroot] [PATCH v7 3/5] package/python-gobject: bump to version
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
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
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
