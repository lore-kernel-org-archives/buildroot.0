Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE70E77188
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 11:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AEF660635;
	Tue, 14 Jan 2025 11:32:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A4cVve6POB_P; Tue, 14 Jan 2025 11:32:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F1FD606A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F1FD606A0;
	Tue, 14 Jan 2025 11:32:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5601DB8B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 11:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38DFC60B0F
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 11:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NwcODD2WUnq8 for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 11:32:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BBFF760EA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBFF760EA1
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBFF760EA1
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 11:32:29 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.119.28]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhU5b-1t2k3e2vyt-00fQZO; Tue, 14
 Jan 2025 12:32:25 +0100
To: buildroot@buildroot.org
Date: Tue, 14 Jan 2025 12:32:11 +0100
Message-ID: <20250114113212.1791033-6-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250114113212.1791033-1-fiona.klute@gmx.de>
References: <20250114113212.1791033-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ya018AkTi4MfeDzIbZvqSzMQUWt4vw8GW9bJtYRDOuMYr3s4O1X
 PPfb9n2c62QpLiywPHEexmgmqZZTgTD3zvxaRdHzNast1J/aAEEL63cxmuEZJYM2fYMchzY
 7aIdTjs7TskHneebpSWZbTjmMfpHDRHDqQpoqU6GCs1MGbyDeOh3U9I3kFgA3a8czl2i0F3
 upvW8BEsI5mJkT9wlshkQ==
UI-OutboundReport: notjunk:1;M01:P0:P/ev5IH6eHw=;rQKb5MjZtpws2BADZtEojG2OKZN
 7MYrAj9FN9Snx6idwkTb5tB0IJ+Vcpv16l1kRyWzuAddVutFuZdbEWQbfplaH0LKgfEYNjrL7
 cmpWm4shKuKVZvxetfTaRx21QIBPxhQ9qrySy+zC4xs+ugeK8Imvyjhki84CUAsybAzVG6LUR
 SC4GrVopNfndX4+4tHgAb9j2cTj2NorbHgk0HernX9O4w8GrNfeWGwq8SaMJdRgoGuS567jbz
 0ZbXtHJiKvqtbmQHslzXpvP5ycdkWOqBGY7AxfxSw2TSyaCCsjhhAOyOymOgRX8B4NZ8bp03t
 aM9iQc9OSc8/MUaLfDShjrabFW6zw7P5V00LI7a9wwupc5PSs8xVle+c6Gp15BL6Qicj9327n
 6GHdI5HQoGSp3wVwt6LLhRJSGcIhspKbVfzMRJ7AUxIvklI+lmaZnLxQ8sXwXTnvCx3Rzrx9B
 IGqEFbCFdv0eyyohotpvpNaCwoj6YmpA+Y2RYW/8vPDXaOpQEVPuny1bsPrueGycZD8K0S0Km
 bwiUxFVryMFKO12fWcPJbcGxy1NrtaExCWLY9xdVsegA6DdEhCTYCBQ0G6F4ZDahziQD7wJmj
 tUQ0aCgB6syYGtYunQppHohMgpwzxoOKcxUCZVOH6kWI9caJM9Iqx5soKS0eWBmTBvSsuMlOd
 UyOlJHXweh7AxVNUyTBisU34okSvQpE73pv8Yjub/SwW6/MtlhJZdFgP6LTNGFMihRpWeSJCA
 CFKYzTf3S70yq5Ju4odN2m3yleU+VtAimn2PxkqJj36zkaLoqxOUZ0h9nXofhXamqz8PJRG+b
 e9c5aYKjLlaG/qy/FeKMo5Moaq8oEg9CTdxNX/MoJNMnya6QkgtHy1uiCyHdPQ+Aa94/v97r/
 7/PgCKJQQeCcdACCCOqqKiyZ6iQ4FgI9nNwN19kpKx0FQoWBM5wi23Qop/ozygedIgQjBhLYk
 tI+EWL5UZoo1mc5KWtAOQkjS+lys4Tr0dCdl04L/8+VVzApA1UWxEeTy3Q9c610sJ8fcPvuu1
 0NEBLb5AYXbd+70nXhLS0I50V5F8d6iD/QmGgwCAutlq/CuGavcwN65LkeVpLeB5qEkL0MjcE
 a/z0fa+OV6hdZB13o7gLitI9JF7Ukf
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1736854345; x=1737459145; i=fiona.klute@gmx.de;
 bh=h67VZGey/jDkwSRcOqELsXALZNRR8dvvWYgrZOhoVbU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=pCLuNO72GgiXbdZHqChSt9Oit6hcNuOtkDZTwA+6toC21tdUDdApoKxcGJnj8Cbd
 0vME2tAI1sb+3VRoeFPvzQTXxYcS/zhQV5gTbOEkcrfg42Mogv2ECcVcfaCGBPO50
 ZDHmKZLF0XGHTEOLUy4FIIPA4bOqwsUlPECJaMRKc0pimO2RCy3+ZoskclxZQYras
 F8UGeW+LPWY/Q/DLRHfDPvo49JymK/0A+ZG59yCaYeoxFYVC8M9kPIIgLvT32sSrG
 6msK3ni0+rvcE/QQZ3NqirzYXM2H+MS39fd3GzSJGiR0rWO6sW+b0heAd3LK8aol0
 q3ouZCVh7D4goumtfA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=pCLuNO72
Subject: [Buildroot] [PATCH v8 5/6] package/python-gobject: bump to version
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Also update the homepage, the old URL now links to the current one.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
Changes v7 -> v8 (Fiona):
* Split python-gobject build with musl from version bump

Changes v3 -> v4 (Fiona):
* Bump python-gobject to 3.50.0

 package/python-gobject/Config.in           | 2 +-
 package/python-gobject/python-gobject.hash | 4 ++--
 package/python-gobject/python-gobject.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-gobject/Config.in b/package/python-gobject/Config.in
index f5d4cebe31..d9d73cc5e3 100644
--- a/package/python-gobject/Config.in
+++ b/package/python-gobject/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_PYTHON_GOBJECT
 	help
 	  Python bindings for the GLib/GObject library
 
-	  https://wiki.gnome.org/action/show/Projects/PyGObject
+	  https://pygobject.gnome.org/
 
 comment "python-gobject needs a glibc or musl toolchain, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_USE_MMU
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
