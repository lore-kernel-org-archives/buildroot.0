Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81120E7716D
	for <buildroot@archiver.kernel.org>; Thu,  5 Dec 2024 14:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C3BD415AB;
	Thu,  5 Dec 2024 14:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8xogd7NQD23B; Thu,  5 Dec 2024 14:37:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACF76415B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACF76415B0;
	Thu,  5 Dec 2024 14:37:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6112D1DD9
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 14:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42439811E5
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 14:37:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uLxz-YUhxcgh for <buildroot@buildroot.org>;
 Thu,  5 Dec 2024 14:37:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C31F180B10
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C31F180B10
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C31F180B10
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 14:37:19 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.30.37]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWzjt-1t7wap4BQX-00Nnmd; Thu, 05
 Dec 2024 15:37:07 +0100
To: buildroot@buildroot.org
Cc: Grzegorz Blach <grzegorz@blach.pl>, Marcin Bis <marcin@bis.org.pl>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Thu,  5 Dec 2024 15:36:47 +0100
Message-ID: <20241205143650.3262372-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:dvXoBVoXt7bh9NCrmokacMi6yHNAPscxZ8nZDDPrHan4cWq5sEg
 yqE1yQj/1g5b7AHFChdSSS01SW5V2ySrkUAefYFu8ZbGxOstY1gRFINppLyc7SXXFuKQhTg
 lguDxfBkUpKL5/eDzFNnA4AR7GFjvIbbs+h5rppnsvzc8vnzYpTtw9b9jz10Lf3YbwX2Gx/
 niVFgxZDiD/RKDn/UG63Q==
UI-OutboundReport: notjunk:1;M01:P0:w5akBAVHD5Y=;hmy7L24e5XMQgHqa8mufSCEvrfx
 OV0r8vrViObUOFC2C5nhNZNnTQ4NcyeGlWSfdGADxsZ+GtkIh0II/AK35jmrpug3MqQ3Ukedk
 QIHqemVaWmi+S2rpKTqEJEWA7m50NOWxyYDCjmgtkB6lmHdatP7BkWgG8nAz1vm3IMaPDyNE5
 QeE6FOY56UwXzprC9SmYC8pvgtgIoW5+tsip6ICxPr7QYnXYk4lWPe6FjUMNuxDcTy0ctULzU
 VNBNnPp3ple+fQ+9F2SX9uLgiZGUStB81Xv12aWTvrWXfMR6kidk8lqtCs4KOtOQVrl7y5oKU
 6MvrJuiet1xmBbJ0fCFWA7rcLAssy4MTmnEm4+9GFAkkyiYBpb8NXqU7Jbx2lR2TX7onJzgbP
 2SRbYiXYPSu+UmBEZoyc0xaGCJ25BCBKqE1jeNzDNTBlCjtjHOQp3VyWjBuChT/AjHFOloJO/
 QXG7pwaGO84nrDWBFUF9ubRDogRJJJJLJ7BtE2GYi+DDT5lgaKsrYMetsKh9fgUhTzXVhNtU/
 wz713g34K/4JfcHfDq68n7HP915jrSG4Qws6+A5jZX9JyUmMFEbILUF5axn8+w8oCJU/FbZtT
 hB7YtOwfpdPJBVUGUPBboAeOV4tYsdhjJnMMlwLQznG5+veIgrJOANEiGWJrvw5w7ESV5ryDU
 6UajaMS4Heve9fIlipSPNCMJUFXvBzDYCVKP6g9DQvXlDBRCndVbuesg61ZJZyWF/uE1KpPfN
 I8C0pn23b6hQMI4Jm8wpP9k5xJ4WW9dFheOUucUhXKqQykjgGAN0EQvzfANLwnbLzgTcB2lLp
 bL1dqaYhpMIXwhAOYjSK5n8//+M532RSL0W4+7hjU/9STaOgstak65h17pdG/1ELQYJZ48jpn
 XZPRYEbsnOHgl1Oyh/htJdFpek9NwmuBQMTeSnXLuvGcpW8q1aYZpMh90N2+pROTLaFkp2Q7f
 RVrHJ41Aqdo70WUXfN4FLlID/Y1pzN4wix0U62BxCv/KOHIJzJ4ZLnB/Ncg3HQ0e2jeB8tOdg
 4rJGxqiLtoGhHQpYcUw39lIc6oyovfLGv5x47kdvK6/5DlT1WQuuS6j+nX6I3304lKPUzpn3g
 05NdocHToSVgN9ZVCVi8+HhcnqOpQA
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1733409427; x=1734014227; i=fiona.klute@gmx.de;
 bh=wfJkzcR/fFB0RMGQUzSD6ZCHYuFVh3Zg+xdJz8hmJpI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=LHNGA3SZKWs47zXo81+TmqLHBE9yPhASBOt57vWJzp16z9UlIfhdsaULse43keho
 VLYMcfN3f4kM8R4nKB1m5Z2YEspsCTOOsxi2bwa/hPDLItXnn2LSPmCU9oamPRM+2
 z2G0yRdO7yScxQzr6qFiIWSiY3HcL5168d36bvwPr3/KuxtxjiuvhuuoTR/52V0Pi
 mx4+wZ+pkz3KIQ25xn1hxnR+rrJiJNQtGBRpzH/ILNfVInEGm3MWLnfvFkV41sbfG
 VmFVurlVJsyk2KYmupz7x2tGSdwn+k3HZ0HFCGXNSXEWZ2utkVk3QBQetwJyaKPwX
 whO0+5Eq11DMFWSAUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=LHNGA3SZ
Subject: [Buildroot] [PATCH 1/4] package/bluez5_utils{,
 -headers}: bump version to 5.79
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Upstream changelog:
https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?h=5.79&id=0845b8f6ef2ac004b1c953cf4fe4ca3458cd8e36

Patch for musl compatibility taken from upstream "master".

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 .../bluez5_utils-headers.mk                   |  2 +-
 ...0001-gdbus-define-MAX_INPUT-for-musl.patch | 33 +++++++++++++++++++
 package/bluez5_utils/bluez5_utils.hash        |  2 +-
 package/bluez5_utils/bluez5_utils.mk          |  2 +-
 4 files changed, 36 insertions(+), 3 deletions(-)
 create mode 100644 package/bluez5_utils/0001-gdbus-define-MAX_INPUT-for-musl.patch

diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.mk b/package/bluez5_utils-headers/bluez5_utils-headers.mk
index 1fd4e0fff3..7acf62b226 100644
--- a/package/bluez5_utils-headers/bluez5_utils-headers.mk
+++ b/package/bluez5_utils-headers/bluez5_utils-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils
-BLUEZ5_UTILS_HEADERS_VERSION = 5.78
+BLUEZ5_UTILS_HEADERS_VERSION = 5.79
 BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils
diff --git a/package/bluez5_utils/0001-gdbus-define-MAX_INPUT-for-musl.patch b/package/bluez5_utils/0001-gdbus-define-MAX_INPUT-for-musl.patch
new file mode 100644
index 0000000000..dc823e9277
--- /dev/null
+++ b/package/bluez5_utils/0001-gdbus-define-MAX_INPUT-for-musl.patch
@@ -0,0 +1,33 @@
+From 9d69dba21f1e46b34cdd8ae27fec11d0803907ee Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
+Date: Sat, 2 Nov 2024 16:10:18 +0000
+Subject: [PATCH] gdbus: define MAX_INPUT for musl
+
+This is the same solution as was done in src/shared/util.c
+
+Upstream: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=9d69dba21f1e46b34cdd8ae27fec11d0803907ee
+Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+---
+ gdbus/object.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/gdbus/object.c b/gdbus/object.c
+index 84f116bf1..7b0476f1a 100644
+--- a/gdbus/object.c
++++ b/gdbus/object.c
+@@ -20,6 +20,12 @@
+ #include <dbus/dbus.h>
+ 
+ #include "gdbus.h"
++
++/* define MAX_INPUT for musl */
++#ifndef MAX_INPUT
++#define MAX_INPUT _POSIX_MAX_INPUT
++#endif
++
+ #include "src/shared/util.h"
+ 
+ #define info(fmt...)
+-- 
+2.45.2
+
diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
index 41e39e0b5c..9b39b19c08 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256  830fed1915c5d375b8de0f5e6f45fcdea0dcc5ff5ffb3d31db6ed0f00d73c5e3  bluez-5.78.tar.xz
+sha256  4164a5303a9f71c70f48c03ff60be34231b568d93a9ad5e79928d34e6aa0ea8a  bluez-5.79.tar.xz
 # Locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 717c10e870..1695aeb210 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils-headers
-BLUEZ5_UTILS_VERSION = 5.78
+BLUEZ5_UTILS_VERSION = 5.79
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
