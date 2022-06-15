Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83853C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 16:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39BC8403A7;
	Wed, 15 Jun 2022 16:18:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I02YCN_aA1qY; Wed, 15 Jun 2022 16:18:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DAE84033A;
	Wed, 15 Jun 2022 16:18:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 162051BF4DB
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 16:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13DC782E19
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 16:18:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U6cpm5Lz8MJF for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 16:18:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58A2082DE6
 for <buildroot@busybox.net>; Wed, 15 Jun 2022 16:18:07 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 x6-20020a1c7c06000000b003972dfca96cso1402016wmc.4
 for <buildroot@busybox.net>; Wed, 15 Jun 2022 09:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=00ltzjgAiLoNg+qlu/LU/xaV9CeehH5Cwp63+O1WPzA=;
 b=ENd2CDWGPUvLcP9W4jOXELh/SZjI1TTtz4o6nq/PLMF+k4eBdZuBuZr23HfgRsf+xk
 kLsmjRop7+IQwAqIdqvok192MKuzOEL8K6TED1SyBd9Uu79p8V4Gtoc/YL9PlrMR1Rt1
 XVbone4uw38wsU9t3s7ZNCwDMH0sT8UNcnMn0JYJng1UG19Z35d3EJYBXcAvRLTudU4q
 tluGs2PrJTe5wXDwI0MTZTmyV3sVIefDZJ00PkYkwObNuTa7BtITw5V+B2aGIwFN1sQ3
 QlwTXncoYC7dIfIE1gh6DPNREcJ5oV4jg9ggJK9hzzUnjoGW5+7EG/gGUsOdANTjF2tM
 EtUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=00ltzjgAiLoNg+qlu/LU/xaV9CeehH5Cwp63+O1WPzA=;
 b=FHQd2lbe0jdCGKw7LH1AoIBbovEyzeI/8RTTI8KCByRl8wYd4ZSrDnR1ks68Ed4oWK
 VFbPq9GUoyv6rZooZOfCSpyYDZpyv/6hFMIseOYydsZkx00TzFsvGCOxANXnV2Dhv4+0
 7529y+j2767p9+NRsG4gHQza3tiqhHjXXbhTNiuuYlLuRDz6UL2XJA/5cKX2VPgVTXuQ
 vBxzkeNeHwOi9R6Ag9oqaCmEV+8GlESyEN34hxUUks1K9PDWj4fxMhlrTkOY+Q9GEZnp
 Yvooz/u8VLuo946yW+2BDJCPOfTQBlln2NC95BCJ+EdCq2MR7rBqSIgjmKL6eae66isl
 iM+Q==
X-Gm-Message-State: AJIora+aD5N2C+QwJuXTLznKscy7UrDXVh5nSpsQ0OPi58IJZ/vuDV+B
 f2gwaEW74hA18eAwuqaWDTa3i6nFJCAxlQ==
X-Google-Smtp-Source: AGRyM1thCCBYje4UNnUS9jNEHS68cE8CHKxIUm906bql1yKbrCo0OICtxz5f8KXhbTwXjp3qc/7FzA==
X-Received: by 2002:a7b:c1cf:0:b0:39c:4460:cfa8 with SMTP id
 a15-20020a7bc1cf000000b0039c4460cfa8mr207982wmj.21.1655309885542; 
 Wed, 15 Jun 2022 09:18:05 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 g13-20020adffc8d000000b002102f2fac37sm17723325wrr.51.2022.06.15.09.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 09:18:05 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 15 Jun 2022 18:17:50 +0200
Message-Id: <20220615161753.2580142-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220615161753.2580142-1-francois.perrad@gadz.org>
References: <20220615161753.2580142-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/5] package/open62541: more options
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/open62541/Config.in    | 12 ++++++++++++
 package/open62541/open62541.mk | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/package/open62541/Config.in b/package/open62541/Config.in
index 220fb3dfa..6045a5954 100644
--- a/package/open62541/Config.in
+++ b/package/open62541/Config.in
@@ -39,8 +39,20 @@ config BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_FULL
 
 endchoice
 
+config BR2_PACKAGE_OPEN62541_HISTORIZING
+	bool "historizing"
+	help
+	  Enable basic support for historical access (client and server)
+
+config BR2_PACKAGE_OPEN62541_DISCOVERY
+	bool "discovery"
+	help
+	  Enable Discovery Service (LDS)
+
 config BR2_PACKAGE_OPEN62541_JSON_ENCODING
 	bool "json encoding"
+	help
+	  Enable JSON encoding
 
 config BR2_PACKAGE_OPEN62541_PUBSUB
 	bool "publish/subscribe"
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 1958befae..00e7236c0 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -31,6 +31,18 @@ else ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_FULL),y)
 OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=FULL
 endif
 
+ifeq ($(BR2_PACKAGE_OPEN62541_HISTORIZING),y)
+OPEN62541_CONF_OPTS += -DUA_ENABLE_HISTORIZING=ON
+else
+OPEN62541_CONF_OPTS += -DUA_ENABLE_HISTORIZING=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPEN62541_DISCOVERY),y)
+OPEN62541_CONF_OPTS += -DUA_ENABLE_DISCOVERY=ON
+else
+OPEN62541_CONF_OPTS += -DUA_ENABLE_DISCOVERY=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPEN62541_JSON_ENCODING),y)
 OPEN62541_CONF_OPTS += -DUA_ENABLE_JSON_ENCODING=ON
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
