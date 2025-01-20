Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE77C02182
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 21:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B11A36084E;
	Mon, 20 Jan 2025 21:17:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CiKT31Ikzl8M; Mon, 20 Jan 2025 21:17:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B24DC60B0C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B24DC60B0C;
	Mon, 20 Jan 2025 21:17:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E5644D7
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 21:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6DD380BDB
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 21:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4i5PQLi00X96 for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 21:17:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7266580B93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7266580B93
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7266580B93
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 21:17:35 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.125]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MzhnH-1tMyTd1rnd-014dlE; Mon, 20
 Jan 2025 22:17:32 +0100
To: buildroot@buildroot.org
Date: Mon, 20 Jan 2025 22:17:06 +0100
Message-ID: <20250120211707.2381182-6-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250120211707.2381182-1-fiona.klute@gmx.de>
References: <20250120211707.2381182-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:u67QYdaUCdlTtaJDT9BYYZkLVDHk6kUKsBi+SxyPhDXNYOg5cFP
 w+EX/yaSzsMP8yzHcQy9ow2sXoD99rLKU2lxAqYrKd94Migo5GJw1QgpMMVRQNQluOEzcPZ
 wsLJtMJ8aV07AdwQYoFGuoKmJSONe4AfK+Gv4f30JLWkNHwoWOU+fHAdJkc8vbiAv8FPEmN
 eHVqd+qhoU6va6GC/4TMA==
UI-OutboundReport: notjunk:1;M01:P0:j1ZU77E71Ak=;c3R8TaTU0t2lUzjcq0IYwHKwdZF
 VtEm6OcFNpjeSEcoq58dZwmNp3U5zaRnf4fsXjZrdm21oJBZKk2BSpbzl4zL6GOiMovXZV7tS
 1tP5m495tzunMrY7bwZqxvTdv7CPj+ATZrcj00BN5WNMJQ1PLoxu7v4+NxXUVmziuxbqHxHAR
 cwtIlQUYrqygk2qWIrK6BBmdm5SOUYjErU/cbuteQVbuBOvkbLf2mP9gDMpuhLPbF7MgnDACm
 Sq7BckLjA+FN9xXhd9308Vqy+DbaO9VrpyRG/b7miFvzOvgKgNRvCpvyrnWPsVVG5rasp2sEy
 aizviyLhKTu38+ZrvHMScCAQhGuE7Yk0n5h9ZzGDf0G/7Df/DLd8c1ntVUX9/7+rmZePUmaqq
 FDYGxddcfDa5yd/8ictKm5AMQjegv+coW/p8OsSNmZ83hcyNEH/LAYWBpRH2jKkK6fI1TrIXY
 NuC4xqaaWPO7Uqm6/O3aKBYVDiyARz1YQ15p0OHg4jpU9wvUTukYiA5uCcrvK6eNk/7J9NOBU
 ivAPaHNDpl6PTo2SCEw0o2gXAAnb/XFpsXRnybsE1ud93ijCBtR0JREcQ5ct4xS2D+5DJjyI2
 588VbzOAp0ByASIQhHfKRfsOOk+NwTugPTw7RSa4Ov1esDOW/eEtAIBXH5UxPBaR8vyxZaEQX
 h4pzgGDHsPd2j915bqFEMVYrI43bThA5F3sviNCI9YYS5qtM5eY8n6c5NEQdsmfQdqtGbwO6I
 y6z2e59j4vRiZDsKMCNuXh3qZUJLtVX05aeEEfzs2xZ/L/wwUH39WOwh/HEQtXyPZEbgGj7vD
 PMO8YZIbmYf+iVsCyAXQQ68UFMdpG7wQtEObNIT6CpmmYS3mEuldfEtQQPaH5vKHhQZtMy9gu
 PVfejV2GbCyyqR5NE4/GrF3qijK15D3+Ywfccnwe197Oz1nasxxc5AUM9eA+Hw66uXv5sNWgL
 ZLv74ocqzNss3piEt2mZ0AdrE9BfO3lZ+OT+Xve5u/LoFypbdghnBEX4w/FpzA7Hk7B0AUe3e
 xl9dOTytwaHly7ftMLj1EAo2RTcrtdi9OQEiC1lrbbkw4eRyaL8DefO1kUwBMoKhl2Am4NyEW
 mPhaj+l/o4sZy4fInikftwtBaTVeQFxOIeFOCK3u/XGNX06NCDxA8wAirMzBX9aQ/6vUQ2imX
 9m+F/5LZ8IgaWfbhE4zT7GopG6JmzVmdMSC3S3RhuUA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1737407852; x=1738012652; i=fiona.klute@gmx.de;
 bh=h67VZGey/jDkwSRcOqELsXALZNRR8dvvWYgrZOhoVbU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=WopUKnZ3qf6Ufxk667OQU9/zbgycxgUdYdXfRwhXHVQFsqAp4pJGVRrqwgLE/+KC
 l2ptjXZKVbLAkpiSbGqOZqu18g5RaIeFtFnAfHsJs29UtUd7v1J3q8FTH7qvGTGeq
 D07OWIyFNFW+YVqh+uxoCsUinYzGxT4guLumBqyn07JdPfNnyQupVC/TU0epu1Dcg
 4pSxiVEhGojM3yxvxRHpoCouiuLqbQtvgPoZQlzTB7bVoIuDiXY8P7nWlrQoSKpBm
 qTfp7D4A0Lt80jiIb+JCzvUN7WGwtLC0YjldiaIMEm5z136d6gf7zudsZrPUh1vLI
 ZkqtiyyfgTacaA0yUQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=WopUKnZ3
Subject: [Buildroot] [PATCH v9 5/6] package/python-gobject: bump to version
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
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
