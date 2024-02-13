Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494ABC4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 04:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE6714047D;
	Tue, 13 Feb 2024 04:44:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Lgwg__UV9Wf; Tue, 13 Feb 2024 04:44:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95D1A40AE2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95D1A40AE2;
	Tue, 13 Feb 2024 04:44:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 077421BF284
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 04:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E806240AE2
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 04:44:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PuawBRUxMKA9 for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 04:44:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 859C44047D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 859C44047D
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 859C44047D
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 04:44:26 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1d99c5f6bfeso29628495ad.1
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 20:44:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707799465; x=1708404265;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FoppT4UZMStvx00f/lkLr5jV+KEJ0xygEZhzUyn5mWE=;
 b=J+KrodHtlkt2NjVvgGYj103eJIuSi6rJYs9qehSOhPr5xCf3qzJ7NQhdmMVX1VFyDq
 CACf73YaFHZzs6J75CBh9I26QPnISSkzBiiJQhekRWiybIoURC7ZgdzNoMnUtQHzX/aY
 y8Tm2tXbw6jZpS4kzE9xlbatwWU0ynZkqI3hOSmzKTJvCEi78mipMmj1KcirMTgjI7/3
 MuZqyIBkh60ct0MaNlvkVCR/e3NfQmKW8cxe0LWhwKweShr7jsjPsoysQOl5Ho/6qsus
 e1jhbHZrgm7UmtSSeloxd3tcGwp2oDLbmSUOhHn7/8FQbyakNvFjVKWAyIWwAQxecQ5V
 HYCA==
X-Gm-Message-State: AOJu0YypvfjZUJ6Vg62ShFj1cw/9HJjbM4jRdK2pzBFUf6tT4Vum5IgC
 6UZfYvBJvS4IpatmylLGkqmuw5T/VD8a+OtSl52hIlXGhYMmuDVpH4CCx722bE4=
X-Google-Smtp-Source: AGHT+IHOogc59uHkR4fA0dAuxX9CNOif51/ZNBe4YIPpTcS9//ZgXpD2bFPLTxb6xf5NeDhff8/0jw==
X-Received: by 2002:a17:902:d2cc:b0:1da:16b1:ac93 with SMTP id
 n12-20020a170902d2cc00b001da16b1ac93mr1970347plc.29.1707799465062; 
 Mon, 12 Feb 2024 20:44:25 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d4-20020a170902c18400b001d916995423sm1142654pld.99.2024.02.12.20.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 20:44:24 -0800 (PST)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 20:42:19 -0800
Message-Id: <20240213044219.1368954-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707799465; x=1708404265; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FoppT4UZMStvx00f/lkLr5jV+KEJ0xygEZhzUyn5mWE=;
 b=NQBRln7HQtbxXAN5PwS4J9eiMVGIX7FPwGImlPGvbvMHO4t63DVcMcW7Up8xHozYAq
 bkUbYCygDIFMOC4PJFQDgsBGfrrtWN72NJ57aLCNQCC4fDXcUlmxnC2oOz/RgGn2qeOM
 qlfDxI9rNicEbQ/M9oHgj216qVebb1gtjFTU3v0FgmYjkr4aDIGDPvjfZnFqFeB9cH4D
 q1BGAuYSqVvZV//DO8nWU0MoAS5EWKV65+FVactk+cylhjmr5dhIhK5LfyZm7CWNJ/Nj
 ADDSaJSLVCH4PUhOEEkwxuKmXzNv39p2IAWMBtoltw4dmDctLZ9918VlW0xG/TuPArXf
 cOmg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NQBRln7H
Subject: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.379
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index 6915e04e46..92b7eaab6d 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  0db28dc635d5059ad23d068d2e56ef5dc540f95bc813ea5a3c0f5d63b03d20d6  hwdata-0.373.tar.gz
+sha256  b98ef646d530d5fd3afa3180efbf7c8e22d3da0088f5836f41ee25380d87b092  hwdata-0.379.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 025f5b4969..555fb58f14 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.373
+HWDATA_VERSION = 0.379
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
