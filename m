Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95A5C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 04:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13609402D8;
	Thu,  2 May 2024 04:56:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vto4G6ecg7Ic; Thu,  2 May 2024 04:56:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDC9340777
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDC9340777;
	Thu,  2 May 2024 04:56:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 81D231BF2C5
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 04:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EF6460BE9
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 04:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SnzI7yhlT9GR for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 04:56:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=dm.chestnykh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 04E8460BBA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04E8460BBA
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04E8460BBA
 for <buildroot@buildroot.org>; Thu,  2 May 2024 04:56:02 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2e1e8c880ffso446031fa.2
 for <buildroot@buildroot.org>; Wed, 01 May 2024 21:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714625760; x=1715230560;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Je/iNOF6mV6aNE9yrIdFV1aIunDJ/CyXfd5Y2aa3AYk=;
 b=IapUPWWso3THz5Y6csbf/XyY2l8uvZbuGCcUr7Lvk9BbpbtJ5I2uYcBNjSXTUALl27
 WYxej13DLYyQclZzuRc9nIwWbazaxIr8CM9yoK+xNaZgJ4E6ukkFGemeLcsJWh2StLf+
 OwqA4/12EuD2E3gGYWfXJh86Cg+24x0oNqyOclj7k1M+gy+ymcPTXcQPwcv1TpTyhL5E
 U8I4ijNLD02DXw3jVtDxm5qgbBPEdQExwewxwTapwAbMOUWRlfhPsHC3zqDlqkSBZQpX
 deTE3LBVYKXXuyhup+qnIa0aw5Jc1KHIarePbFIBuZzTG2fUp3O5chom9NaxSILFzuPc
 WF2Q==
X-Gm-Message-State: AOJu0YwfiXwO9hYrm8AGrAY/dZDG74T4lWBZ7VuwsSuUQ2WQpsKiPxSv
 6UK0EozPhehcdRxKN3lPCt3PI5Ra47S5tZkAfDccPgR7IMQpIH4VqrGB8Q==
X-Google-Smtp-Source: AGHT+IHP+AUmgdvq1LXeTGVRysskJLOU8mAK4/1xLz0d51mkShsqYL7CU2r0n2HqTyUzvkH6B+O54A==
X-Received: by 2002:a2e:2a46:0:b0:2e1:b159:fb14 with SMTP id
 q67-20020a2e2a46000000b002e1b159fb14mr1179336ljq.1.1714625760074; 
 Wed, 01 May 2024 21:56:00 -0700 (PDT)
Received: from localhost.localdomain (109-252-38-243.nat.spd-mgts.ru.
 [109.252.38.243]) by smtp.gmail.com with ESMTPSA id
 i8-20020a2e8648000000b002d8744903ebsm35466ljj.68.2024.05.01.21.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 21:55:59 -0700 (PDT)
From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  2 May 2024 07:55:16 +0300
Message-ID: <20240502045518.4875-1-dm.chestnykh@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714625760; x=1715230560; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Je/iNOF6mV6aNE9yrIdFV1aIunDJ/CyXfd5Y2aa3AYk=;
 b=lk3/iXgkIJn+gVrl2FrtbjW4VRTkfrgA+B7IT/dmNhv0OY4RP0XKmKVHYslgVdahbG
 JsZW0I2yeINsi7TgI++NLZ9sptUHErVHJ2htz5l6Hi6tPvG9pQut4ohdg3e1YjHB/G4E
 FLNH7s3KZ1JNsPr0YJ/JttHg7Q+LR7a608iMs7+ArmGrsyZNG70riq/74JrLQW1GU0RY
 QZCD4EF5MCXnOpm/OWVF0yXBH5GqeuViF1AmSAVgXUaAvMsEXjLnO7N3VVUjl1z4/Bma
 ZOI6FnU7NF36YFVF/GQ/Ht7346IUWUz/HRCdphJzVVJAYFMky4vBTBb/gZTeeTV6yZPS
 tqdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lk3/iXgk
Subject: [Buildroot] [PATCH v2 1/3] package/uclibc: Bump to 1.0.48.
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
Cc: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- In 1.0.48 release uClibc-ng has provided the fix
for SPARC related to https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
- The hash for COPYING.LIB was changed because '^L' (0x0C) characters
were removed from COPYING.LIB in uClibc-ng repo.

Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
---
v1 -> v2:
- Describe the change of COPYING.LIB hash.
---
 package/uclibc/uclibc.hash | 6 +++---
 package/uclibc/uclibc.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index a10ceab54c..7097bbf99a 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.47/uClibc-ng-1.0.47.tar.xz.sha256
-sha256  29a4d684a06da344ee3ee09acc2ca7649d592ae3ff848f698145c46def05efcb  uClibc-ng-1.0.47.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.47/uClibc-ng-1.0.48.tar.xz.sha256
+sha256  3bf5fc6cc5cbc454b6c478424755c6f71e7c15578a2c966f02606aa5c5596e21  uClibc-ng-1.0.48.tar.xz
 # Locally calculated
-sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
+sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index a7b18133ff..9593e18d45 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.47
+UCLIBC_VERSION = 1.0.48
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
