Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D67DC3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 19:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1CC381D5A;
	Sat, 20 Jul 2024 19:01:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KXX0Na44go4u; Sat, 20 Jul 2024 19:01:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7F9D81DEB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7F9D81DEB;
	Sat, 20 Jul 2024 19:01:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 138141BF331
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 19:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D7A0402B8
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 19:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HyqlfAncDdYg for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 19:01:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B96F84031F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B96F84031F
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B96F84031F
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 19:01:51 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3683329f787so1387559f8f.1
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 12:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721502109; x=1722106909;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+UM2Vl5OH8OT2wM6+CX9Wa519QJvJQJOGdszgsfUk0k=;
 b=mcHAz25gst5AZbag2iY4ZiVkCyIXqf4WR9Za6MaxwByfWqZTIxDAI0gvL+DIqjs0tu
 tXCTh43ZC2g4JsoPF+AOMPHmyYVeqEYFqqLHZovQC+z2rILTQjFI3OttRugr+S3U7Yuk
 xMkDL5BVFNaCFRxa1D1xlq86dSGhyhbDjtcIjI8RJYV5W4SkMV+oqmgrK/4dEDnrOFdq
 9ZMLobwMRLBwo09FwKsPNm+N23CQ9IwZbgBztsh4/VjO+QiAwnND15RfWDCWHPFBPnGg
 a4NHveSi8YRLIFPi8TenExeoD6Gn1eyJG2m+w/FjWfesQ1tQboahY2Mce4EASSKlPfzn
 bgUg==
X-Gm-Message-State: AOJu0YxNEluZf2HpNwWl71lZKraJipwAxVyKMR1UGp5SGpb6S813QCj3
 wQH2hgqss5MJY71DXmb/aqAqvgUZPhb+AA17pCufxv2IBPPst+u/WWJcog==
X-Google-Smtp-Source: AGHT+IGMMmKbKXko7korUjzPe/nKQGFwQmHpAoPpgQGfNS1+/+QT3DaiL2n7yzM+4eMG2KWNmgU+4w==
X-Received: by 2002:adf:e6c9:0:b0:369:b7e3:4983 with SMTP id
 ffacd0b85a97d-369bae01bdemr1420140f8f.1.1721502109040; 
 Sat, 20 Jul 2024 12:01:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3687868b7d9sm4421306f8f.42.2024.07.20.12.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jul 2024 12:01:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 21:01:40 +0200
Message-ID: <20240720190140.342416-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721502109; x=1722106909; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+UM2Vl5OH8OT2wM6+CX9Wa519QJvJQJOGdszgsfUk0k=;
 b=Lp5GWt9N1xHJyRtNbJzIzGw5ZvAZrKpPW6+UqgWvXr4OF6tq8mS8ICRG4Cq05CgGn7
 DAmvOpH46HeMyPBBw+Glqu/WnRtr0uZTltQ2QYgQvcajSickidRM4GHVa+k9gA76OTOJ
 8YnHYPpIL6+5kUUF8IxYYQ9IFxabSORVjBZ998fQQTTrH628QpaD0YwE7Tf+wQjtBTOi
 POoWO14OHy2SjYGmp2dswNCnzOtud6p3RZC5pW9gdoTtRjMFN/y3rWcZYxWmXJ+v0og2
 gVGjR7CqXiHMVlzZEnmOB5LD/zMkYkgu8iPWy3RclcXdUR+YJP5/qlwDljTw6ydOUQ1o
 jYrA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Lp5GWt9N
Subject: [Buildroot] [PATCH 1/1] package/libcoap: enable required libopenssl
 options
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
 Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libcoap unconditionally calls the (deprecated) ENGINE_* logic in
libopenssl resulting in a build failure when
!BR2_PACKAGE_LIBOPENSSL_ENGINES since commit
623d3bbe43e9193aa8e3395367d01af59071b859

libcoap also unconditionally uses PSK

Fixes: 623d3bbe43e9193aa8e3395367d01af59071b859
 - http://autobuild.buildroot.org/results/6bd3e1390cbbc59b9b3d030c2a401e45e9d173da
 - http://autobuild.buildroot.org/results/f243209454feed4f33f759786c2023c576a2cd3d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcoap/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libcoap/Config.in b/package/libcoap/Config.in
index 6e0c1905bc..950aee5279 100644
--- a/package/libcoap/Config.in
+++ b/package/libcoap/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBCOAP
 	bool "libcoap"
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  libcoap is a C implementation of a lightweight
 	  application-protocol for devices that are constrained their
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
