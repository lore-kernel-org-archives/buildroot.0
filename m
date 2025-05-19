Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD72EC3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 12:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A6416147C;
	Mon, 19 May 2025 12:14:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkGaf1t4ajPo; Mon, 19 May 2025 12:14:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B58F61039
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B58F61039;
	Mon, 19 May 2025 12:14:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 45B7FD4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 12:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31D554111F
 for <buildroot@buildroot.org>; Mon, 19 May 2025 12:14:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9akEIOCn1d8u for <buildroot@buildroot.org>;
 Mon, 19 May 2025 12:14:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E346E410FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E346E410FF
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E346E410FF
 for <buildroot@buildroot.org>; Mon, 19 May 2025 12:14:41 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.126.193]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N95iH-1v3rD60T6F-015aWT; Mon, 19
 May 2025 14:14:39 +0200
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 14:14:25 +0200
Message-ID: <20250519121425.1316837-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519121425.1316837-1-fiona.klute@gmx.de>
References: <20250519121425.1316837-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:5SftzXQo5revbVTEhR3IsR7RT4SomOvCWJF0x/6QQcSyhrypW0y
 /yXCzGWdMkkFbbBvc1sDKAsbs8u5R8HPR01GDqfhPpEvoimlBf5XgKP8M+Dosf/VRhRJ/jg
 QY1unO3vBqNv1Rz4erhWsCEHeuh5/1pAoYWRhViauOybnqfi94g80m4gKh6JqcybaD8PB93
 +NpJwAPKjXkveeQRG3ziA==
UI-OutboundReport: notjunk:1;M01:P0:cKfcS8khZGI=;bmQAzjbnqRm0QcI9CJh3FiCK8/L
 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
 pURhlL71oyVLed1QfRSw08=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1747656879; x=1748261679; i=fiona.klute@gmx.de;
 bh=UH5Zk4vgkZuK/ONBcU+/VHddlsZfdxj0qGv8jct/JSU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=BrGmEbZ74APILvrqWkxXk0sXBBsuuS9SLYUsy6IUhjXfpgNrbgxT0P5i9hnAhYrg
 H8NWam8vywih1rtGrcvipmfIEsUCdw975AbWhZHLH7ZezC6zYwfxAU6Ztm5HQ1z1u
 FRO7Q5Fps+eLSXhbyZIF/Cpjokxcgt25YFgzVO71Rz0IJ5dCltNk9vb3MY/GDhqZD
 lKal8hWlTEvWBe+LCurNVgbDN2NUUYdDJo74hjjw5bPXoMLlqF783krUPQ9kTjzor
 hocg6Ryn1H1z4RAAdGrwMP+XAxT72bKMnODOS0dy9uQatlBtI9fSgVfaug3HugPIm
 +dUZ+Jo5JMxb9i79Wg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=BrGmEbZ7
Subject: [Buildroot] [PATCH v5 4/4] package/libglib2: bump version to 2.84.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Bug fix release, upstream changelog:
https://gitlab.gnome.org/GNOME/glib/-/blob/2.84.1/NEWS?ref_type=tags

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Patch added in v3 (new upstream release).

 package/libglib2/libglib2.hash | 4 ++--
 package/libglib2/libglib2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 9bc244ff22..5985c82d8a 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.84/glib-2.84.0.sha256sum
-sha256  f8823600cb85425e2815cfad82ea20fdaa538482ab74e7293d58b3f64a5aff6a  glib-2.84.0.tar.xz
+# https://download.gnome.org/sources/glib/2.84/glib-2.84.1.sha256sum
+sha256  2b4bc2ec49611a5fc35f86aca855f2ed0196e69e53092bab6bb73396bf30789a  glib-2.84.1.tar.xz
 # License files, locally calculated
 sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index a1a3954914..baa75fd10b 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.84
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).1
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
