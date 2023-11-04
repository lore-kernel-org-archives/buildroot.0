Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8A3C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 14:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E1968231D;
	Sat,  4 Nov 2023 14:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E1968231D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EwZtm4wzbtH1; Sat,  4 Nov 2023 14:05:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C48882313;
	Sat,  4 Nov 2023 14:05:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C48882313
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B6B651BF2AB
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 14:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E59B40A46
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 14:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E59B40A46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R0S2L9tgir4s for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 14:05:32 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68D8B40127
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 14:05:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68D8B40127
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40907b82ab9so23640545e9.1
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 07:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699106729; x=1699711529;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LMUkezUbWdNJPH2Dync7yNX90Zj4XPF4YG/1TFIr0O0=;
 b=hLjsW9Y8vJTdrqJE4LF0oUZuUwNg7a061UESmwySi5WQnuTVDrg+qEXhMoIR/3quCW
 026QporRXIsCJO0YK7oVnIFCoST0yP37nF5GDKKvEjlvsEahI82Tv+9Zk4sjBCAXMwV1
 0ugNvJAWlPH7EUTMceK2DMIMl/wXhBUlfLoV4p9eV4cb4djKmqn7vm8MA4eODrdmZMl0
 MwxHbW8xBp8TIpjuMNBoA4hPm7p05CFtTY+ylSxoq8Z0UZHt+x6oeJxuTklx/3qN8+Fm
 rGfjhulHunKu4JfeDl6vFolX3Lz+nXF7gs2+ZYEeXQ8e77byjyqxBKkySq9NDBKmyx7+
 yciA==
X-Gm-Message-State: AOJu0YwVHjoFMBNNsD4LYK+VUHFcBEyeQFJ9rU2cSWX/Jb6nwZb/lTAH
 r5mU8sQw2lSM7ka+M2q283ZtjOGwWl8=
X-Google-Smtp-Source: AGHT+IFrzKR0tjvZwtmYaHJVYjkeOSjkUKWUTgJfp9Rb4GMkyVk8sTJ9iogjj9FTjDyR+KSe0bS5RQ==
X-Received: by 2002:a05:6000:18a1:b0:32f:811c:dfc4 with SMTP id
 b1-20020a05600018a100b0032f811cdfc4mr6149698wri.4.1699106729137; 
 Sat, 04 Nov 2023 07:05:29 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t9-20020adff609000000b0032d8034724esm4480349wrp.94.2023.11.04.07.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 07:05:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 15:05:23 +0100
Message-ID: <20231104140524.46968-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699106729; x=1699711529; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LMUkezUbWdNJPH2Dync7yNX90Zj4XPF4YG/1TFIr0O0=;
 b=f80S6WVElcPVf8P9OPxsRjGMfzhJHU0VP02IjwpHEs9DNmIvkwlElzEJt9x4O/HaXw
 kBUsuLjaQmh5HPU30PAz9vPPBc/Gs6zfJwSW4dy7/cma2/zCD5Z9ytW/71VegSOgoOty
 AEtvE7636mks4qXyTiD4zgm6QaqTciW+OoU0olzIkAEYAxJrQeEmNKHUIcdHlvEOMCQ+
 zEVujdt76Vxvg5/7bdmg7bOYigu0khMT3NiMNz708annDF0oHTc3ZfSsnduE1hPbyFWw
 47UblV6+ZUezHItixLjQL8mqSqc4KDwu22s5UCWdxUKR5HME89ZTc36y9iVbgBUv/hOq
 GLhw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=f80S6WVE
Subject: [Buildroot] [PATCH v2,
 1/2] package/freeradius-server: fix redis handling
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
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

redis handling is wrong since the addition of the package in commit
736c4c1655d93652a9a7e79235bbe726b3d46176. Indeed, freeradius-server
needs hiredis, not redis

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Drop rlm_cache_redis

 package/freeradius-server/freeradius-server.mk | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index af3320eb44..5a560d9153 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -71,6 +71,17 @@ FREERADIUS_SERVER_CONF_OPTS += \
 	--without-rlm_ippool
 endif
 
+ifeq ($(BR2_PACKAGE_HIREDIS),y)
+FREERADIUS_SERVER_CONF_OPTS += \
+	--with-rlm_redis \
+	--with-rlm_rediswho
+FREERADIUS_SERVER_DEPENDENCIES += hiredis
+else
+FREERADIUS_SERVER_CONF_OPTS += \
+	--without-rlm_redis \
+	--without-rlm_rediswho
+endif
+
 ifeq ($(BR2_PACKAGE_JSON_C)$(BR2_PACKAGE_LIBCURL),yy)
 FREERADIUS_SERVER_CONF_OPTS += --with-rlm_rest
 FREERADIUS_SERVER_DEPENDENCIES += json-c libcurl
@@ -150,13 +161,6 @@ else
 FREERADIUS_SERVER_CONF_OPTS += --without-readline
 endif
 
-ifeq ($(BR2_PACKAGE_REDIS),y)
-FREERADIUS_SERVER_CONF_OPTS += --with-rlm_redis --with-rlm_rediswho
-FREERADIUS_SERVER_DEPENDENCIES += redis
-else
-FREERADIUS_SERVER_CONF_OPTS += --without-rlm_redis --without-rlm_rediswho
-endif
-
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 FREERADIUS_SERVER_CONF_OPTS += --with-rlm_sql_sqlite
 FREERADIUS_SERVER_DEPENDENCIES += sqlite
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
