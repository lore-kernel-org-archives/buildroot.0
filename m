Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF98C4828F
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C808841FA3;
	Sat,  3 Feb 2024 18:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C808841FA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nHhGppoCal1d; Sat,  3 Feb 2024 18:01:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1856641F3A;
	Sat,  3 Feb 2024 18:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1856641F3A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 604E61BF29D
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 10:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DD3B60B06
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 10:35:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CxkIDPUjskpt for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 10:35:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 213D560A7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 213D560A7A
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 213D560A7A
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 10:35:07 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33b130f605eso1763377f8f.1
 for <buildroot@buildroot.org>; Sat, 03 Feb 2024 02:35:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706956505; x=1707561305;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W8EHDrFQ5QJev/VjmoDEcMnLdT88mh8p0DHPcshpjDk=;
 b=rvWv+SWfL5qJJir8wAxIw1mvz2qDqoMluTJJOygAJkT0YxKE618tmzrDcCB4Mmm3bl
 nBiRu2+gmw203UlO2Glgq8jvENIf5TWBiZ+jIgfNTUnEvUBBNca16ViInWcwTKBLukqp
 IQh917qRByJ7ZG5L8ayF99bNxxi4Mf5L62NfZhAnNkSpY6nzuNOd81gpFV1Hcypp0FLO
 Ykn8Ixdm6YgGavG3iBCCeHTYAdXyqEGsw5WIUDb/r1GEQVNCsJXdA0JUH9XaA1+HEpD8
 rvTwUmjzo5x43qfmBxn2Cv77fYZ3dLsg0hDbNRn5S+kTcEkf0maSgYuBCC57k30DiE6b
 KSaQ==
X-Gm-Message-State: AOJu0YyruG0PgWaDm7nO+MXakdYp6AIlmQDt5V74Peh8o0+C1PBBxHQf
 ily9mKR90QTIWWZg7/O4ebElJQnfz8O+1GqZkD9qxmC41f5xZA9TNl9MEg2ImLw=
X-Google-Smtp-Source: AGHT+IHUd9A9u/3zSk3WBTrDcQBwg08IsOBzAyZ1PIrPngkuPUL206FCBRz/7QNV86EX86TbeIpFPQ==
X-Received: by 2002:adf:e3c2:0:b0:33b:304d:36b7 with SMTP id
 k2-20020adfe3c2000000b0033b304d36b7mr448719wrm.56.1706956504883; 
 Sat, 03 Feb 2024 02:35:04 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCV2h0MKmJ/HXOmDv45zlUWrIjOIuhC4geuXAen/I7q/DZQ6TgZPr3IoJhcVcHYxkGzuesS2ERCJyW5yTkhaWjjCnGvaZNvIUfZgUg==
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 b1-20020a5d45c1000000b0033b28a784dcsm1762506wrs.114.2024.02.03.02.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 02:35:04 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Feb 2024 11:35:01 +0100
Message-ID: <20240203103501.41738-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706956505; x=1707561305; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W8EHDrFQ5QJev/VjmoDEcMnLdT88mh8p0DHPcshpjDk=;
 b=ktTc7GSamv0nE/06t1/1A4Sy0g0+KVzLNxAj+6J45dh0AdXIxvyydWmrCGt+LEXdcb
 Ul5djYyHhZo1o1rNGBXF6Qz8fUu/CDtl//ZL5iMWdQhIKmjIdNhXAedYb4vERSi6KsCp
 RwUJ93CAILc0dj9bjsGq+/rlKV0ZhFG6sRYsclyCfugSldozQ2QlzqNtCSSX+k47NH6W
 w1KckpUU1j6iToYFbEdVZ4p2wSkNEuKAp8WvInF2Z04yQkuM6hW1i0b2hUagOjNJCuv0
 ck0rHXhlWZxrz2tTlDX0FQeaW1HQnC5/G/TrPijXGpLRzmXFoXuZdPzxkTjKCn91yyqa
 JcTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ktTc7GSa
Subject: [Buildroot] [PATCH 1/1] package/rauc-hawkbit-updater: drop
 RAUC_HAWKBIT_UPDATER_CPE_ID_VENDOR
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Colin Foster <colin.foster@in-advantage.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:pengutronix:rauc-hawkbit-updater added by commit
928b7219cd7079864eadadc66dbff21c5cd72804 has never been a valid CPE ID
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:pengutronix:rauc-hawkbit-updater

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
index 10ba91abbb..a453f75a28 100644
--- a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
+++ b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
@@ -9,7 +9,6 @@ RAUC_HAWKBIT_UPDATER_SITE = https://github.com/rauc/rauc-hawkbit-updater/release
 RAUC_HAWKBIT_UPDATER_SOURCE = rauc-hawkbit-updater-$(RAUC_HAWKBIT_UPDATER_VERSION).tar.xz
 RAUC_HAWKBIT_UPDATER_LICENSE = LGPL-2.1
 RAUC_HAWKBIT_UPDATER_LICENSE_FILES = LICENSE
-RAUC_HAWKBIT_UPDATER_CPE_ID_VENDOR = pengutronix
 RAUC_HAWKBIT_UPDATER_DEPENDENCIES = json-glib libcurl
 
 $(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
