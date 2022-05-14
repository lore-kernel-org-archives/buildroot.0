Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EB1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 15:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF7F760EFE;
	Sat, 14 May 2022 15:05:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EpdJ4_xHiORK; Sat, 14 May 2022 15:05:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7F2B60E8E;
	Sat, 14 May 2022 15:05:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9849A1BF2F8
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 15:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86F6983F18
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 15:05:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qrWrkG2Z_M17 for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 15:05:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97AFF83F00
 for <buildroot@buildroot.org>; Sat, 14 May 2022 15:05:35 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 n6-20020a05600c3b8600b0039492b44ce7so6209922wms.5
 for <buildroot@buildroot.org>; Sat, 14 May 2022 08:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X6q++18VxmCGmnSH5972QUoEPxg3risjZlf9DpAFs8Q=;
 b=kAPpVf9vNYkkNMvljVFDz6pjl1VFhTaBvIJov6l+jOcTVsjIZMnqNPBPSAZj0+IC4j
 7Lcstik0hFbIu2F2KlIQ+v/qWMJDdKR5X0Ibs7n7QRBGpSlKlIN4oXmLWw7nC6/QYlwx
 3rGkQFSoOsW7ZR4iUJk4KeU73LFeezN+bbFvPjUpYPo65PnfykXtnaajeeZ5UWf7ZE1H
 Z4Du/nDo0GNln7m+RoiWOBnL/lDCMjg0sgqQ+31F8zE01x8td/pTqmDTmlvOvJ+LwDCy
 kI4I8PVssAE74glSmGa0h3YExxN1hBY7Db4D3396HCwC1DMTBrKki9nb32Ait9H8pkid
 KaBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X6q++18VxmCGmnSH5972QUoEPxg3risjZlf9DpAFs8Q=;
 b=aUeaEc096ngvXaBZv29qQXMTl4PPiNcGfSDUbqmjkVsv0XZGVa5+0OZeO6cBQ1Td+G
 1FMWGAdylbLG77/UhVX/1Kvl/SpE5I9EJwjQzaLjAVDgb5imhIIv2ZAqXAyQZsvem+wk
 vkeWBHwObIY71UWm9XX3iKMs6/H/mOnxsQ/TUU/t4pqwBiA94OwMf18DyLDygmtZrAqu
 ov+zobQugRziwM+BJt0HoUF8E4cPHA/JH1i1KrtbAgjj8iMS3Azs+WOYAWsv6S6HT0Za
 AUUbuBJ6vMD6RrkYP0CGFrnlp9YVL6ZxtoAFlGaNh8XUupalFYx0br16PqALyJ1DexXg
 POFA==
X-Gm-Message-State: AOAM533vPX+b8VnBd3dvROlg2SrlzRFn8WlhvUYRuVS4/hntjKRF/5DC
 s+l0E2x3EfA0N989aUfZHvMB//P3cyM=
X-Google-Smtp-Source: ABdhPJwnz2jk+vs9Vy3j+TlgLw8lMDhxUgIXnwoRxQDuMLcaHUgWcMa4i3Jyz1CNkeoNvqCaUyvtug==
X-Received: by 2002:a05:600c:4f95:b0:394:8919:7557 with SMTP id
 n21-20020a05600c4f9500b0039489197557mr9555409wmq.166.1652540733622; 
 Sat, 14 May 2022 08:05:33 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a05600c040400b003942a244f2esm8209350wmb.7.2022.05.14.08.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 08:05:32 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 17:05:28 +0200
Message-Id: <20220514150528.165356-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-avro: fix capitalizations of
 Parse
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-avro 1.11.0 deprecated schema.Parse [1] and actually error
out when used.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2429013770

[1] https://github.com/apache/avro/commit/3e79dfec8461fb0157f068cff7ba24be8cdfa9d8

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/package/sample_python_avro.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/sample_python_avro.py b/support/testing/tests/package/sample_python_avro.py
index 79d2dcdb22..46363ad2bf 100644
--- a/support/testing/tests/package/sample_python_avro.py
+++ b/support/testing/tests/package/sample_python_avro.py
@@ -1,8 +1,8 @@
 from io import BytesIO
-from avro.schema import Parse
+from avro.schema import parse
 from avro.io import DatumReader, BinaryDecoder
 
-schema = Parse("""{
+schema = parse("""{
 "namespace": "org.buildroot.package.python_avro",
 "type": "record",
 "name": "Developer",
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
