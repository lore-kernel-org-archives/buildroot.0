Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D13C48286
	for <buildroot@archiver.kernel.org>; Thu,  1 Feb 2024 17:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 761234223B;
	Thu,  1 Feb 2024 17:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 761234223B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pR7qvLW_Da4U; Thu,  1 Feb 2024 17:42:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7B6342234;
	Thu,  1 Feb 2024 17:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7B6342234
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C50AA1BF4E5
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 17:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB07E846C5
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 17:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB07E846C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1uZtdV5cET1H for <buildroot@lists.busybox.net>;
 Thu,  1 Feb 2024 17:42:12 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5902D846C8
 for <buildroot@buildroot.org>; Thu,  1 Feb 2024 17:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5902D846C8
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40e800461baso10664275e9.3
 for <buildroot@buildroot.org>; Thu, 01 Feb 2024 09:42:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706809330; x=1707414130;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uUmC+YdSZD4Ex+VrILgenzaqFVCil6OwfmSzRNdFytc=;
 b=nOTVxEF9scN6Ncxr2h3NmAOkGT+1CAN+KHjpwv28iphL15+yaqm94DzFPYx+mtH3rp
 IGFLs9d0Keg1SsAFwhLF8Ubeu8P0q/BmrfJ/hoHFgf5VjsTMT0muuvSG6jpiKL814bOF
 1ITdKpIjj8EkuokH+ra9eQv2NIEy99DsSY9sQxJr45k3Tif7NcZD8jEPJuEZIfjl7Ygf
 sMLJnZ1YMug2TAt2FqSPE4r5/mT8R0m+LH6W2ZA9GIu64DnIcBFltvOndEnHefi81myt
 5lXwzx6F5IsJHm131FqHzbKUr0pgn7xrkUbuIAHn/6ip9+lsLAQ22TtAEgVIiVsEHV44
 pb9g==
X-Gm-Message-State: AOJu0YwrM6spgTS0SxPjoNuoRK9JwYmAtehdM5oGCYogIsKn0tveIe6P
 F61EhlvTTluQsOvvAZRdQaGQYLyZgJFlNRD2Qh01K9+q29rQgsra4AzhE2Q2pDQ=
X-Google-Smtp-Source: AGHT+IGknwbXQVYB2CXGjTJrJF8uZ0d2VDGUdyqKQGWEn1eQbvCffCOZ6gOGlarUOB+9O8xizo6z+w==
X-Received: by 2002:a05:600c:190b:b0:40f:bef8:2c87 with SMTP id
 j11-20020a05600c190b00b0040fbef82c87mr1631631wmq.39.1706809330017; 
 Thu, 01 Feb 2024 09:42:10 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCV/IxsPpiENXSUJYqt57/Vm2OBgIaulSwFFTPgztO9sT8L81utyduQNpjYS9BZtD/OvQS93GVu6XHKxb/ID97sVrY/3rCXYYFF8l+FgGyo8TeOKTefByUrJ6LgC
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 s12-20020a05600c45cc00b0040e813f1f31sm238636wmo.25.2024.02.01.09.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 09:42:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  1 Feb 2024 18:42:05 +0100
Message-ID: <20240201174205.180556-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706809330; x=1707414130; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uUmC+YdSZD4Ex+VrILgenzaqFVCil6OwfmSzRNdFytc=;
 b=NMPBKaYaWr8wk2zxUmSIHWjmbwpDgxt7yt4NDfxBP+0j5DIw5AqfKVWjjfvIFNBDsS
 O2JZG5cAWejubsdTQeuwB5vgExdxIuVfqYEq0vlG41v4Hq55ON7LGWwXttoDiwfMGmAy
 Lmkq6qj4p4hP13J+q95O6fzBO3aWG7Jf7zNywqCVMjIw2nAjPA0zfONjuF2FScGbvXzE
 UDAKDjhacXeWAefwTidvB/JnYg5MqKqTQELZ2AU2jFm8/pxuvg5l46O9wGwJGtPfFsV5
 jyMm3liTAoDiD/Tg6lKxyuTvTf0rsWrQm6qymN6swcQZUdL8215yrrepOz7yYJTrmK46
 FXKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NMPBKaYa
Subject: [Buildroot] [PATCH 1/1] package/wireless-regdb: drop
 WIRELESS_REGDB_CPE_ID_VENDOR
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
Cc: Dimitrios Siganos <dimitris@siganos.org>, Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:kernel:wireless-regdb added by commit
63332c33aa0771532807fd2684d4eee4eb952435 has never been a valid CPE ID
for this package:

  https://nvd.nist.gov/products/cpe/search/results?keyword=cpe:2.3:a:kernel:wireless-regdb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireless-regdb/wireless-regdb.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index e9003ce2e6..5c8ef96398 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -9,7 +9,6 @@ WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
 WIRELESS_REGDB_LICENSE_FILES = LICENSE
-WIRELESS_REGDB_CPE_ID_VENDOR = kernel
 
 ifeq ($(BR2_PACKAGE_CRDA),y)
 define WIRELESS_REGDB_INSTALL_CRDA_TARGET_CMDS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
