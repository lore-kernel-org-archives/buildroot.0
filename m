Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48322C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 15:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB9254058E;
	Sun,  3 Apr 2022 15:48:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fyu9soZ8x64M; Sun,  3 Apr 2022 15:48:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D68B440571;
	Sun,  3 Apr 2022 15:48:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E9301BF2AF
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 15:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CACB80C50
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 15:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A3MMoneodYQF for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 15:48:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8326827C9
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 15:48:01 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id j12so3364074wrb.5
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 08:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O1MOh09F23qiikuSK2OKedjov/0zXPI6/I1yLftYgfQ=;
 b=LAKl1XisoVJAU56mYTMxUHOU3D4YmsJddeLqIUHlGlpCuFPJkCrIbrYsu4ZuDF91G+
 TgI2tN6OjJqJj6dOCFrhkZXOFwbWfBq2lCMD7aWqn3vXJM2hQwgywTTzj30+p2/HrA6Q
 od7kMUUc5/4+t0Szf4scvVH9SllZtTEMnerLJiGY95ZQFNZQbjaINDWoFSo6fzxhphcE
 imACNfGfgvAeyoz1n8abxw70Ntjz5f9YLN4yvcFF1WkGE5QEQcDmiVwJ1SptYxbih4E1
 A92jnvvuxfOJwPAQcO3CRh+1qFC71obZE1inOY7WL2CFHySh8tPDqR4+qxk3B1SJPEi/
 aWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O1MOh09F23qiikuSK2OKedjov/0zXPI6/I1yLftYgfQ=;
 b=D7zChus1vkETYjhD+q9SLNk32RHl5UamFa00X9SF7YLNVlsdLzRjkDRHMsdhXVDScM
 ifveuz7oT73NspL6gAV0/L7kH7QAj5X15H0pJXznhCC58yohWHIQNlqEz1DaA+uzbCL+
 EYDI+Rk45WAPc+SPauXydz1vmAYXPIkp5rcGFtEXYhCB4eftg4CA+q+8j/dwxMgcIRkB
 BB2nYPzG2iAl42riNzHozM2ujDcXoZTkSiWs3Fy0d3Ek/jQ2tdlECAxudwRPsfSuVmV2
 4ZL4kBT2r2Tc2Ofk3wmDLYTNioPV1LYMKEOgmfRjIdpzDp9XjdiA8cOSSF3Kf/m5oNL6
 8OQQ==
X-Gm-Message-State: AOAM532hYGCziS6qN/B27Pp6JLD/nkcIMk/jGmXylet6WLE54BemO9et
 jhGTNmOLl6X2GSIEDsD7HwweNj2Gdng=
X-Google-Smtp-Source: ABdhPJwnUNuTD/5gryeePm5DSOS21dJrBL4hh088MD84vFnH1KGaD6qtzNhbc1131ilJiOxO7liXRA==
X-Received: by 2002:a5d:64e5:0:b0:205:9cf8:b552 with SMTP id
 g5-20020a5d64e5000000b002059cf8b552mr13569559wri.52.1649000879770; 
 Sun, 03 Apr 2022 08:47:59 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f13-20020adff58d000000b002060e84bcc9sm1406573wro.44.2022.04.03.08.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 08:47:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 17:46:11 +0200
Message-Id: <20220403154612.4158174-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220403154612.4158174-1-fontaine.fabrice@gmail.com>
References: <20220403154612.4158174-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] package/cppcms: add openssl optional
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

openssl is an optional dependency since version 1.0.5 and
https://github.com/artyom-beilis/cppcms/commit/7cfdc9f703a35c42f7168573ffcc92eaa37e4ab6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cppcms/cppcms.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
index 357909f31d..c560b5d0fa 100644
--- a/package/cppcms/cppcms.mk
+++ b/package/cppcms/cppcms.mk
@@ -35,6 +35,13 @@ else
 CPPCMS_CONF_OPTS += -DDISABLE_GCRYPT=ON
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+CPPCMS_CONF_OPTS += -DDISABLE_OPENSSL=OFF
+CPPCMS_DEPENDENCIES += openssl
+else
+CPPCMS_CONF_OPTS += -DDISABLE_OPENSSL=ON
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 CPPCMS_CONF_OPTS += -DDISABLE_GZIP=OFF
 CPPCMS_DEPENDENCIES += zlib
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
