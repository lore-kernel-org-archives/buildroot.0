Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67297C48BC1
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 20:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12389608F0;
	Mon, 12 Feb 2024 20:04:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UY9-DYuG-xU1; Mon, 12 Feb 2024 20:04:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D803608F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D803608F1;
	Mon, 12 Feb 2024 20:04:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D783C1BF284
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 20:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0F8D813D5
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 20:04:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t-Qz6UQIkoqC for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 20:04:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0EBEB813D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EBEB813D0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0EBEB813D0
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 20:04:46 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-411ab6dbcb5so2371885e9.0
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 12:04:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707768284; x=1708373084;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZvZ04vUMCA2lG5Lq8jdurLCzQoMLn83ACWCRZNIqkGM=;
 b=eOjcfEBZ97+nEE96tLCCPCEEn7GswUuv6hqeLUf3ooKVchNeDI7ey5Q9MTMAD/YboB
 AsB03HTOYBGiunmC3ixLFNh1Sn8MWWF/nKJejHEb1srRfXZRnKnexTFcB6trJ594pBX2
 3bnGtxwqQsANbSfUKKh3lALV6fl2xLpW/mr1HS5ECxHK0sV/lEUIR/EKyZOiojsdobdf
 p53UiYpcCLVEUGX8C5Pz5vXMKGK0q/UdnB3TH4l7+ez762S7xRJ8O2ZN8R4e+eHagUOQ
 VU6g02AmC9LDjHdP3bfJ9602kytq3w1QeT1qpsCC99VyPoeZO317eiI1WveAsrAWeYj+
 P/Jg==
X-Gm-Message-State: AOJu0YwDz3QtO6SLQUurQQiQKDpT4zYrdDeIbsYR+Ou1AP3hGfyaq+Xj
 ETTZIQf5hg3RffTu+rkaUEwrLNpCCn1hDWSJSqNsqL4Ht6haP3sGcpIFP+lAobQ=
X-Google-Smtp-Source: AGHT+IHkVXCK+VC0jQALcVfM9auR0wWhP9iOQUu/JqDqkmgW4hWq/aCW00jJT+gAmYOZakOLJV6o6Q==
X-Received: by 2002:a05:600c:548a:b0:410:709e:f223 with SMTP id
 iv10-20020a05600c548a00b00410709ef223mr444844wmb.9.1707768284037; 
 Mon, 12 Feb 2024 12:04:44 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 4-20020a05600c028400b00411a0477755sm1463991wmk.9.2024.02.12.12.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 12:04:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 21:04:42 +0100
Message-ID: <20240212200442.848248-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707768284; x=1708373084; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZvZ04vUMCA2lG5Lq8jdurLCzQoMLn83ACWCRZNIqkGM=;
 b=l02ek3f+f399Aet3xraMDnNnkHUbq8WjFHWnwUTLvtW+gdLBN212lV/wjXDw7eWAp8
 5qyxB38v7E9nj377KumHaVDXhvBcuUmVwdKSgSgnoz6yL2wyvEfUL3KJmTm6WzRwbUHz
 fXfcc005EarodkIcW8R7d90kyZKXTzAQD8w54p58UWCciQrP747zbY+VvaaOdMgXpTKH
 0B9tNSbffYT2CBglOiLQdolLzLDq9bsb7246eyt1HVa+QKXacr76/Ld9O2ebffWXU3Or
 BYCM53++/ISZUv/cweNkln+OSNETKli5F8e+Jppq0VCDfSkbIEWFpCdAUavMpTQ1C15S
 xZdQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=l02ek3f+
Subject: [Buildroot] [PATCH 1/1] package/elfutils: drop ELFUTILS_{C,
 CPP}FLAGS
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

ELFUTILS_CFLAGS and ELFUTILS_CPPFLAGS are empty since commit
7593aea519dee34cb25715296c1b03f471123ee2 so drop them to avoid setting
incorrect flags

Fixes: 7593aea519dee34cb25715296c1b03f471123ee2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/elfutils/elfutils.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index eb1b1794c3..6ba8db1370 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -29,10 +29,6 @@ HOST_ELFUTILS_CONF_OPTS = \
 	--without-zstd \
 	--disable-progs
 
-ELFUTILS_CONF_ENV += \
-	CFLAGS="$(ELFUTILS_CFLAGS)" \
-	CPPFLAGS="$(ELFUTILS_CPPFLAGS)"
-
 ELFUTILS_LDFLAGS = $(TARGET_LDFLAGS) \
 	$(TARGET_NLS_LIBS)
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
