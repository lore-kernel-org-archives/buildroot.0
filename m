Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358CDC369B0
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 09:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC1F060724;
	Wed, 25 Sep 2024 09:06:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mUojWcLVTyyB; Wed, 25 Sep 2024 09:06:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A369861174
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A369861174;
	Wed, 25 Sep 2024 09:06:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D192B1BF865
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 09:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD4E440443
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 09:05:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6JQQzhW574A for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 09:05:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 11D3B4010F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11D3B4010F
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 11D3B4010F
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 09:05:48 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.185]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgvrL-1sIfm02tzB-00niSl; Wed, 25
 Sep 2024 11:05:45 +0200
To: buildroot@buildroot.org
Date: Wed, 25 Sep 2024 11:05:23 +0200
Message-ID: <20240925090526.3462217-6-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925090526.3462217-1-fiona.klute@gmx.de>
References: <20240925090526.3462217-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:g7OH+HQ1utlwMvAZvb2Y1gSeFMYwknWSMlV6V5X3Vl83wNgQ6fK
 15+vKapI+AcqvKNNK8Isx4WbJFwQ6a+TiyENh9rdI49xbczqV+tJymVCEawDdv6LW0kzVnW
 JoHfApWhYxieq+Y+6Ko4ryjefV5oQI9X+NFYIbl+ndMC4D5rHuX4bZZDi452JkAc6dwrd65
 jFNGc/81dBn9uXktbAyEg==
UI-OutboundReport: notjunk:1;M01:P0:zxikpbcvVdY=;///5uufyuFdxyvCjHbc1Ero5XGc
 rvvxk/CSwbpdI7LuDI8nYNdMh1kZPhkdfaJglly6Wt1sZAi2JTd9eRjsWkU5v3IPSHpL0I8Wp
 MwLkCf8Kc5oMtZkIBPo0eGEWvvHuDmlk23jiKsn6ZC8JRE2fgtUaUPLKitqchmkHmigignEFF
 iL2oJQ+/aBYnHCu/JHbLsN88piSJIq46f5hXHQFgRzSvY7LgZduHIVTZ7xGmZa3l/uVh40kiF
 /vJwJqIv/iiODDQ2SwhWh6vxqTUuyjUaesfNO2ObUfWlfbuVNW3m8XIa4U2NJBCNc0h/SEN+s
 hMyjOcOOFavHGWVr9ZbvjMWj3Hskn0he6TJYwP5pBuTC9SM4aNcyW2a1ZRDJferBbOTiKWKe8
 t8/kdURh2nhibZT8jXX9IioBeQGD+5dXG17Dza0gzIHsaHuwYWFhqdcX/08nDB9R76gP0jpMT
 kXeFXG+m8qoQ2oL2jBMsu1xRhzV3/GbvKS4+/IClVmzn52kdJdaJnR50NCRtDE7aTE7uaRLoq
 Bc23wx6+lwS2QfH6OTz4UKmlLJbaNd3qgwUiLBnUMzVB0sxQsW01fdMFU6Epr23zN4jbm6ecC
 jSSeAwZfllHalQRvr70SZK3VhbOY2QCKBtolpLaAIKIR2r5WSsemp/YDnoFBS3pDePoAAhSIc
 1o14+lhQCkMxThRFOy+YkhqHUFTwJ89ViJIJoi+I0bCrL8es/zCIGdvTWq1Jz+/iO7sVCICl0
 JAIUbGH7FqiI8vqOa1m9BJGhhc0BsA/nsla26xjMt9ptXmRZPMzVpQvM6SRdrXe5YpO1/kUKB
 aWqWLQL/IBYNl4tXl4eXndvQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1727255146; x=1727859946; i=fiona.klute@gmx.de;
 bh=WKOUY5qSSTW90pTHRO+2vNCZH8Ilu4lMJjjFnHq3UcI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=PinoB69U/qDzj9Q2vfeM7z9jbq0hWxeBX4h+e77NI1hWOXzUqjIarxGG3KfByN9y
 4szavwpHCDMQ5Bamah/hPi3etoeNuxE4HZCvRnzIH3ys/pctT5wXtHLCA/waPH0q0
 GUqpMJBnRMXfHEo5xTL0PaVuvRz/QWepWuAOcsicSQv1AgVA+z54nZG45ArsXBPpZ
 ElOOgr4hs+aP2i/JkmDOJsNSZ/ZdzbVT9pKc1H9tMVGcx3YeVMEBSjv8EcvofL6Kg
 yx96QJPSF2zgCJQvMYi2XQ3mDQ0y1udClqc4gtoeZi3ENOYKqj1ZlYz+5ss/1ncQG
 Zo3IAVToIMrj8o/BMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=PinoB69U
Subject: [Buildroot] [PATCH v4 5/7] package/python-gobject: bump to version
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
 James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
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
