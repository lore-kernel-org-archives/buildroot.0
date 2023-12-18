Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D824BC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 08:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85B8D403C9;
	Mon, 18 Dec 2023 08:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85B8D403C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cjNRFEt76omZ; Mon, 18 Dec 2023 08:21:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3523F405D9;
	Mon, 18 Dec 2023 08:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3523F405D9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D84381BF3BC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B124880BE4
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B124880BE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1QBOvuNVQKYe for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 08:20:23 +0000 (UTC)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1E6780B8C
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 08:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1E6780B8C
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a233354c74aso226830766b.1
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 00:20:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702887621; x=1703492421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bejtaCBgkTjUStrv7s+hiFIc5r1BIDNyLakX4pIeho8=;
 b=m109EXY1We24fsVslXE6nZZ6NhzyY1YY6iHe3h18472mGYeLo11qmkdSOlK2wW+vDF
 fvcSZUDV21O4w67NVHvMlV9No3Jf88kNlVj03hgIevEdpaJJB74n0ce0BnFI2wjLncc6
 nBCmJkzcT6pe3+1egHHpUx4vpw7LJgVgCnzgAllHCnka9PJgO0ft7KvwFiH4xh+QNbFA
 g1qs1WGa3UFvzFI95osDRZRjSCytwif7TxRA0kFQbAmTpihyTnZi0/6UbIdx3fRREgJf
 L3KDeUzhCxR4gJVJyjJ7dXeUJYHh9N/qxvgFdgz0Auh5ck6hfAXvxZltkIGWNztApPms
 zaVQ==
X-Gm-Message-State: AOJu0Yy0CESAqfyk+XnlyfB+8Jzw6DXSL4/sry74e3CBNslSYKZ7pB/k
 +J2MOW84p99+nfFo8DZ7531+EqhVOtDcQH2Pj1u6cw==
X-Google-Smtp-Source: AGHT+IEJDikZv9K18DNyAJv67YSLoUaosejC3LdbmfHI8rS7067kd9HYFVUxbeYc419iQKT39lITCQ==
X-Received: by 2002:a17:907:360d:b0:a20:6e5:e034 with SMTP id
 bk13-20020a170907360d00b00a2006e5e034mr15947649ejc.50.1702887620911; 
 Mon, 18 Dec 2023 00:20:20 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.retail.telecomitalia.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 lm11-20020a17090718cb00b00a1cf3fce937sm13807835ejc.162.2023.12.18.00.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 00:20:20 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 09:19:54 +0100
Message-ID: <20231218081958.506691-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
References: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702887621; x=1703492421;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bejtaCBgkTjUStrv7s+hiFIc5r1BIDNyLakX4pIeho8=;
 b=gOsvRO2NqqU+ClUbDo09rBhYVoEmhirC39Fnk40yRTA1EgXqxgB619hdTK34GR+MSZ
 cqWypvhk+e7A3i2dRX9k5sR6d3T0ij5JBAW6FqKBOgpLvcRjlZoHhs7wzAk2CfSh78Pt
 t1r1zVo2eCM2RW6h6FwDLKo1x0xhJZslk01WA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=gOsvRO2N
Subject: [Buildroot] [PATCH v3 07/11]
 package/python-jsonschema-specifications: add host variant
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Recent version of U-Boot use binman to provide a mechanism for building
images, from simple SPL + U-Boot combinations, to more complex
arrangements with many parts. This package is required by binman.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Drop Config.in.host

 .../python-jsonschema-specifications.mk                      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
index 7a19eee4236f..a20045f316b2 100644
--- a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
+++ b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
@@ -14,4 +14,9 @@ PYTHON_JSONSCHEMA_SPECIFICATIONS_DEPENDENCIES = \
 	host-python-hatchling \
 	host-python-hatch-vcs
 
+HOST_PYTHON_JSONSCHEMA_SPECIFICATIONS_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-vcs
+
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
