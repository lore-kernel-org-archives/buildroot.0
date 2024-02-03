Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DB9C4828F
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94C7C41EC3;
	Sat,  3 Feb 2024 18:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94C7C41EC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GAcjgVs4gN-V; Sat,  3 Feb 2024 18:15:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E138A41E47;
	Sat,  3 Feb 2024 18:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E138A41E47
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BBF31BF285
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 18:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14C8783935
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 18:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14C8783935
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QoQGrJSUYtGC for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 18:15:14 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3D6A83925
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 18:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3D6A83925
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40fb020de65so27253685e9.2
 for <buildroot@buildroot.org>; Sat, 03 Feb 2024 10:15:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706984112; x=1707588912;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PWB5BkdeMeL2UvvmlklzEkhbuadWxl4GGM7oUWHok+8=;
 b=jl7l44YqOmphZCj/aUMIHGyIMsIt3kuMCjMsZG3lblnxCD37gJhiha42eK/ZaC++1H
 8ZNWYP5z1TMzR/8c/8MRd3R3g2EHUy9llzkx1eb8iHutl5+B1ZiZiGMFlnotcvYQSlQc
 BjSlL+QMm1lGyqsi46Jw6Tz3pXwa2vnY1p/46bGeDnltNO2Hefffp2zbhinjLIZUw+SU
 e5TscyDEXC5cNGkIUv8Cbn68VOBiKXFRsfqg6N3M/GwwZz/Jlellkxg1mW1ce33SbgCK
 txaZZ6NZ8bZLniZhHNTwHJ617kVM/3ZzWwyjyxQ5vjtwvwieVL6YwV/USVejvBsdeUyu
 8Qow==
X-Gm-Message-State: AOJu0YzCEJp2BBFxS4opqtMy88VVCvnW8SeTEwaDOJ8xEufraonbkk3f
 D9fuT20T+PAIJHcuy1jmaiThILX1BHgWvzNhPUKjz4wlJkKfNyBUXGE38sb4kr4=
X-Google-Smtp-Source: AGHT+IFwhFPaDwg/PS5KZLI2h0ddICMZfa65g0v0tkWUt9AcArkwdSUn89AwiyxhYKVFzR9fqAarpQ==
X-Received: by 2002:a05:600c:4e8c:b0:40f:b772:c37c with SMTP id
 f12-20020a05600c4e8c00b0040fb772c37cmr1473058wmq.31.1706984112036; 
 Sat, 03 Feb 2024 10:15:12 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f15-20020a05600c154f00b0040fc771c864sm3562811wmg.14.2024.02.03.10.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 10:15:11 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Feb 2024 19:15:07 +0100
Message-ID: <20240203181507.150528-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706984112; x=1707588912; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PWB5BkdeMeL2UvvmlklzEkhbuadWxl4GGM7oUWHok+8=;
 b=PTepkc3mMmHCpRgKAN2iG3k3f6FhH6oHl0aibxsYjooBr8ct/NRcyZnnw8J6DbxR5J
 svgdAQ8hfq10f8HDcoixb3cbWUdgAzVhZ9DkKt2lX0w6fg0axYUn6/rO8yyUdtWEvaX+
 cWovI4l1FjOE381W5qMctTqOodygVxieXgEmD1Kam5Z+91xSqEqm2skmsoYfLt13orQb
 JQfJ8ol7mbrJKIH0y8KA1vtDpHoetV0M/fEAg+ZvH61wzeQVnDAT59CPl5JAnoaqIVwW
 JmJjcyRkE6cmg/XTCe+9T1G55wxUeXkzqgVpwJGuOXmYooGrKjqWkOHpK+Hy9Kit5ABu
 2Riw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PTepkc3m
Subject: [Buildroot] [PATCH 1/1] package/json-c: update JSON_C_CPE_ID_VENDOR
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

cpe:2.3:a:json-c_project:json-c has been deprecated in favor of
cpe:2.3:a:json-c:json-c in September 2023:

  <cpe-item name="cpe:/a:json-c_project:json-c:0.14" deprecated="true" deprecation_date="2023-09-16T13:05:58.643Z">
    <title xml:lang="en-US">JSON-C Project JSON-C 0.14</title>
      <reference href="https://github.com/json-c/json-c/releases">Version</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:json-c_project:json-c:0.14:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:json-c:json-c:0.14-20200419:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/json-c/json-c.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 517acee4db..68401433b4 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -9,7 +9,7 @@ JSON_C_SITE = https://s3.amazonaws.com/json-c_releases/releases
 JSON_C_INSTALL_STAGING = YES
 JSON_C_LICENSE = MIT
 JSON_C_LICENSE_FILES = COPYING
-JSON_C_CPE_ID_VENDOR = json-c_project
+JSON_C_CPE_ID_VENDOR = json-c
 JSON_C_CONF_OPTS = -DBUILD_APPS=OFF -DDISABLE_EXTRA_LIBS=ON
 
 $(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
