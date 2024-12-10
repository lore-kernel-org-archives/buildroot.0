Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D44AE77180
	for <buildroot@archiver.kernel.org>; Tue, 10 Dec 2024 16:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4195F80B95;
	Tue, 10 Dec 2024 16:23:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id muil4hQ02NuG; Tue, 10 Dec 2024 16:23:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A44780C00
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A44780C00;
	Tue, 10 Dec 2024 16:23:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D9D9DED2
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 16:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA6F9403B9
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 16:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMA_Fjo_fPmg for <buildroot@buildroot.org>;
 Tue, 10 Dec 2024 16:23:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8663F403B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8663F403B5
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8663F403B5
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 16:23:12 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.124.199]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mo6qp-1txNdI0jCV-00qNqx; Tue, 10
 Dec 2024 17:22:59 +0100
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Grzegorz Blach <grzegorz@blach.pl>,
 Marcin Bis <marcin@bis.org.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Dec 2024 17:22:39 +0100
Message-ID: <20241210162243.1541113-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:yOuaSuOKYdxJUhVNqwoNy5g7fqHUf+EBs0L7XaQux4/3DykqRpZ
 hRimTHHLkb5741ewIGvdtHAh+IjXthdngJPZLtgcFMVk1BvqzQyYfvKm9cH4yPYOzlva6vD
 jvj1Dl2zREk8vGgU0uEYM4ozu3cCs163Zg6ZL8HoYEqgbWyB7jCmZxnFi+nwBE2V8P5X0jT
 atvKgevv8ddd1G0TzPKPw==
UI-OutboundReport: notjunk:1;M01:P0:NOaPMaofvc8=;ovn4IsE6jbID/lEUOqELzAxIKrT
 TXOUva9QWobn05gxYvYAvZ5IdfDUkler4FVMi5iGH0tIuorSVueT4QQ7h1HM6sKmNsIujmKaU
 DM2YOTpGUPZq3yw3m97pZwMrDVzTDUBRjVz/OkqcS09MiksduDyV6Uzbk8zdu963hvxJ/PPGp
 nGZeC9DDzxDsUHwFTdozmIpXorhXQIMgZAQaxKBtdBr4WZTEhpAsmI03uYrLA9SWzv2tmjqa/
 nTl4EX8GI/Jnkhgq7Vtj9ursBkxycz6ZgC+iD0UXq3Y1x5TUpgZdd3B8uQA4eqDvY5BA+aLHL
 5zG1ucdjA+ofPyl4NZWOnUQXh5C62BjIzCIkmE8qAb8lLI3YGhJGU3eRCh2AIZoUZgY5LcgBU
 ZHY3LL5ygrERRc0NeTG6pL13ukF8JHmoBHKl4ioqUNRG5WFktm5TDXovXDs//SwAino31JGZ7
 QPrDyJ1Ui+MsI0M7iHTL+wmOYzIznEXyn9lUlHQz203OyyqdHa9W3MNgDAVejBmKtb4xi62ns
 BlZK77pnmWrPXibGWj4/LguPAAvp8GTpz6dWu1SNugpGGEhgzoSA9BbNq/7jbHCRFaqaIJhpL
 zC3mojuIqqhh7F0PvnBjB9G3QxRrKgZDVH7oD+n4vX9kt/TJcTSJG+0YRoE2ekFr6HXlpQ8uu
 JfYsIn2g/3mNQoRIEiK3OknZj5K92AequwBNH9G4NXwcjKKqOv6mqnm/BKfgPla/8raNZXfOM
 DAIP9/BCueQHum7ToAB3n8d/9cKbbz30pLTSVird92gbcaTXuLzTaBOhz4SSjtHPrPEbjaBhM
 m7uegXq/ZYd3bw2gcBgBUBt6qWgQMbTwWTBm3lxPflPZIJKyFZR3VWiQppbkHZiE/nGQNgAZq
 gAJWfmUrJC6mPXWxSRcit9kprDrPop+DrkZIrgtGIWjvhPuSlPGucNjZ5MDIo1dzrE9Js1nXo
 JIMz/LaTvPwuT035+2er4fukQhJunI9rZvDTR+Onmr1FjIsWVhUKhX1CcC8RHQwjN4DxcS8fv
 ThIGAP0LCx7t/n6kTLjaL39aqho7VF3XhzBFyVsZkGSLmsZtTHLIZbWQKQFxYh5LEbv8iHYEW
 BwNzvuB5LCDXqi1UsQ4XYIXplfXfZ1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1733847779; x=1734452579; i=fiona.klute@gmx.de;
 bh=wfJkzcR/fFB0RMGQUzSD6ZCHYuFVh3Zg+xdJz8hmJpI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=rhFjqMkp8lNcZ59dp3OHSKqFCjdN24UFwNpcIvYFwVHgTMRq3HsGh5nfUTR6HOR3
 WzEc3pX1xHXQ4KTWsPq21nVIrnLW42JS2iiGE8+Q5/Kb+pKxFnRR2TcfzeTFlu9mU
 XVFPkGhxeQWUP7PPRvIYqBA3jF5xHAQwYn/mT2XLaxRAla7wNyLt3KUEc7Tuzs87e
 STbiaQD1saY8c86ku7DIQszxRPnXqg5dvr1MdF2mb8hPuxiTAJURzERncDGcZFJe6
 w3Nowl+Khrfq/J4f7avZQ3BNwILmmak4vc5GRZeK0RgrUKby9XdHnrIRaiyfGcGgJ
 u+aeQura/dgJnTYU/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=rhFjqMkp
Subject: [Buildroot] [PATCH v2 1/4] package/bluez5_utils{,
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
