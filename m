Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C18C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 20:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B24334012F;
	Mon,  5 Feb 2024 20:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B24334012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xUJZTVxt5ohQ; Mon,  5 Feb 2024 20:50:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A84EF40A8A;
	Mon,  5 Feb 2024 20:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A84EF40A8A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D73FB1BF35A
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 20:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF89540A8A
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 20:50:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF89540A8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AQTJFToPS2X6 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 20:49:59 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61A084012F
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 20:49:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61A084012F
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40fc22f372cso37944955e9.1
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 12:49:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707166196; x=1707770996;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+KFQpoAQkD5Tl4GCxN7plys0DEj0QXqatYzKpHJLbuQ=;
 b=Df95+CXWPrIoevvcf4iWR1Wo1gCHqs2E604zqHJ1fKnM0xtMHNvhZf0uj+NKd+UpBg
 6fvEAerdr+lv2Hx4neIoGUWyl1FE+G1BNNh6fO1RGcqi+b48vmtvof1lcwCjO+1xIk3q
 /SJmuDk4um5YKpqBtyJ0sNDXmXQsOYc0zG+2wneiSdA0PB4RIChkW3vwcWB4ybDhQ9WU
 Q7N6H8dl1ZO2yfvPBW/a+qPWjU45PLkTc2OLr0tHpkpI/lqlQMg+/ATbnqyjwCcTCF8h
 NMzCfdcYbXGH6HFdjup5kZWwoa9uMjXIw+MC/Q3RWPZFIF6x7jp7aqPBdAWB4eZCbLpE
 Imtg==
X-Gm-Message-State: AOJu0YysDf1Io6zfbBp1ANnzDhnIbZd5O2IWri+Ss8ZUG0BqfTR5YLTu
 4CM8+zRaziyVRTfHDvKXYoek2A6cRVa9P4Mh30OBN1Bd0esKOTgCLjWjVuSSn24=
X-Google-Smtp-Source: AGHT+IF57DbY05bZZL8b9yXMbfGOzWDe4K9tytR+eq5fm3BuKNW7X3f4DUyo+5v7TyBdSHHlOm9LWg==
X-Received: by 2002:a05:600c:4690:b0:40e:c047:9348 with SMTP id
 p16-20020a05600c469000b0040ec0479348mr93723wmo.15.1707166196590; 
 Mon, 05 Feb 2024 12:49:56 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWAzK4FrND7twM6VT7/q9TSysEDQsYtksBmshYGiC7uk/laPyyxq2RHLn+b6gI771444b7qmZJC1yeedDq9EQQ6YAJ6GX30NnykEw==
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 q18-20020a05600c46d200b0040ef3ae26cdsm915749wmo.37.2024.02.05.12.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 12:49:56 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Feb 2024 21:49:54 +0100
Message-ID: <20240205204954.297515-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707166196; x=1707770996; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+KFQpoAQkD5Tl4GCxN7plys0DEj0QXqatYzKpHJLbuQ=;
 b=DzBuQy65OobCY82gjjqL1tBY9bKBPEfyBKVW1hRK49patrN+yOmkN6xwMPBjEBo5RI
 cSOVcRrnypKGV8v+vax+NljW4/X2OJwuzf/lONcODcje23vl0njLmEuXAjW5WAQ57kDr
 PuamaIE9WCSKMSppzZtwA9w8ZqDO3Q67kWFaPH7N/8fxFt+lf7MU6FckFWCbTFP/1oD7
 Df0GyLq/hbq8YDlXgdmfkx2iK9hicPSlsHxPTdmxAskvZ423roEK2hLlhc45X9uGyxfA
 IoQV+BuXLSo8B5xjOgjLGLoQuMT14JUKehMrab8wU3bsWXnvJeEmi853/4AXRUUQh2Tu
 35yw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DzBuQy65
Subject: [Buildroot] [PATCH 1/1] package/cpio: bump to version 2.15
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://lists.gnu.org/archive/html/info-gnu/2024-01/msg00006.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cpio/cpio.hash | 6 +++---
 package/cpio/cpio.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/cpio/cpio.hash b/package/cpio/cpio.hash
index c67fbc1f61..e300a5f084 100644
--- a/package/cpio/cpio.hash
+++ b/package/cpio/cpio.hash
@@ -1,6 +1,6 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2023-05/msg00001.html
-sha1  cbac50a61079b6f3bdcf9ffe42171d9257cfe877  cpio-2.14.tar.bz2
+# From https://lists.gnu.org/archive/html/info-gnu/2024-01/msg00006.html
+sha1  db5e3845eb5475ddcb7e8915c3a1458a0c13d787  cpio-2.15.tar.bz2
 # Locally calculated after checking pgp signature
-sha256  fcdc15d60f7267a6fc7efcd6b9db7b6c8966c4f2fbbb964c24d41336fd3f2c12  cpio-2.14.tar.bz2
+sha256  937610b97c329a1ec9268553fb780037bcfff0dcffe9725ebc4fd9c1aa9075db  cpio-2.15.tar.bz2
 # Locally calculated
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
index 911d16822b..452271c8f1 100644
--- a/package/cpio/cpio.mk
+++ b/package/cpio/cpio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPIO_VERSION = 2.14
+CPIO_VERSION = 2.15
 CPIO_SOURCE = cpio-$(CPIO_VERSION).tar.bz2
 CPIO_SITE = $(BR2_GNU_MIRROR)/cpio
 CPIO_CONF_OPTS = --bindir=/bin
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
