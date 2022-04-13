Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48ED6C433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 20:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB36083E12;
	Wed, 13 Apr 2022 20:50:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yBWg28AqmZJ5; Wed, 13 Apr 2022 20:50:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E04B82D04;
	Wed, 13 Apr 2022 20:50:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9ACA1BF38D
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 20:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8F8482D04
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 20:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eEsDKAUKJCod for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 20:50:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F4E682512
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 20:50:40 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id u3so4330057wrg.3
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 13:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IS0kgajO9ZIvv+WtLQgRoVUsTMHHyvNTuPzY0w3P5fo=;
 b=e7K0ybQxEma0y0bCr8CpWMspqIVHMVhTD7f9OQ1m0gXUo/jgjBFP4UGUwyMXwit20E
 WOQbAuaGRu/e7BwoVoJ3TtBqr4mN9QGDjOfUa5Ux/bNoY6WYKnzYHk5QM9TEEGqrWiqv
 W1KdEV+eXEq4f2PtxXaVcwP6i0ZSoiDQ7C/ydFpj++WlvZvWLpsFJ6dFCpQ+kkW3Q8Ew
 o1ijyOnZ8cqkWZGLMmnJVeSwP6qjtpQO7ze658JP5rtFt+sVyTTKqjncH3hTdedew3t/
 9HlkJKKhuyo+DwCbsQLLVHv/VcGjIZWT+97YC1msHwhdWUHFJj11RYr25I5mXhQ/hf6h
 jJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IS0kgajO9ZIvv+WtLQgRoVUsTMHHyvNTuPzY0w3P5fo=;
 b=m3LpgKiAaEMcmEVXr420+h8sw2emcxwL8ULGXVxvQzfX2rTQabTPq/fWUmjp4thfD9
 ot0G5m50QAkt/rH9/hTHUjwNypKYhgyiYUQtVww8VsLSuH9WYW2AbY0y1ncVgnaVakOt
 buR4Blt8AWU3lt4FpquxCu+20aYr6tkTeQtJQbLBHKwzimuQIbBmmNujgC8gWUZkOEtk
 ksvwz++u9nT1hmuBObPYkJcTLp7fhgQp+ivUvuwApSFw8CnWA/mR0s52rgXAqUoz4Nw0
 PGVakkZv2p+fmkDxFm8uN0npk4216HNSMJjgJXODsF8FrIHaxnKtCt3RXQN7sUZjcewb
 jlJw==
X-Gm-Message-State: AOAM532D1By7RsIdjZJEwWsWoFdVrOpMH3rKwF+CD+AxalD1Q1UBFb01
 tz6MQ1q/XCSU3VXgrrtFGpNi9SbhFrc=
X-Google-Smtp-Source: ABdhPJyqB6n10gcrqLZ/Z181oVH0tPBb3iZ7QHeAe8WI3kj60eM7gmzI7Ha/xfTaL/rnTYxWVEQ52Q==
X-Received: by 2002:adf:908e:0:b0:1e7:bea7:3486 with SMTP id
 i14-20020adf908e000000b001e7bea73486mr423725wri.401.1649883038308; 
 Wed, 13 Apr 2022 13:50:38 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n65-20020a1c2744000000b003862bfb509bsm3414866wmn.46.2022.04.13.13.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 13:50:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 13 Apr 2022 22:48:38 +0200
Message-Id: <20220413204838.1172927-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libwebsockets: add mbedtls optional
 dependency
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

mbedtls is an optional dependency since version 2.4.0 and
https://github.com/warmcat/libwebsockets/commit/3aaf38d3d89d0436301fe66d9a5c097ea4fb1064

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libwebsockets/libwebsockets.mk | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 152659cee6..f8093b92fa 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -27,9 +27,18 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBWEBSOCKETS_DEPENDENCIES += openssl host-openssl
-LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SSL=ON
+LIBWEBSOCKETS_CONF_OPTS += \
+	-DLWS_WITH_SSL=ON \
+	-DLWS_WITH_MBEDTLS=OFF
+else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+LIBWEBSOCKETS_DEPENDENCIES += mbedtls
+LIBWEBSOCKETS_CONF_OPTS += \
+	-DLWS_WITH_SSL=ON \
+	-DLWS_WITH_MBEDTLS=ON
 else
-LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SSL=OFF
+LIBWEBSOCKETS_CONF_OPTS += \
+	-DLWS_WITH_SSL=OFF \
+	-DLWS_WITH_MBEDTLS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEV),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
