Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350AAC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 08:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEEE84044D;
	Mon, 18 Dec 2023 08:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEEE84044D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UIu4ZQQ9fImX; Mon, 18 Dec 2023 08:21:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8969405AF;
	Mon, 18 Dec 2023 08:21:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8969405AF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 283D21BF3BC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EA9681F4E
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EA9681F4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EXbDyLKlOI2m for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 08:20:18 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A26B81EBE
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 08:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A26B81EBE
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a2366012348so7783366b.0
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 00:20:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702887616; x=1703492416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=39vOPGNR2SPxOAjGebK+dQH3xAP3X7U8AYKMZDuwQWQ=;
 b=t1GsgFiHysyRRleKoIXCrV1HjWxm9MGlqswtvFEdNt0koL50X/MWdqwmw1QfB/R8VJ
 iVSZeUeg47BTP4Fz98w1ykZpoDh09X5binJ/HT99aRPcTltmD+4sOF7cOnjzzFnujD+6
 dFfrv+R/pa3SHxNrRlWegLZHl4nZ/AaPvj7tsGpxZXc3Ed4YuYz7FqvLkufzSKUDJPvH
 1e8sN4S2oSTrA+Raz5mkiL2XOHyyjrFxQgQC8ZOXnMn7GExkmHC5JC5mGbofNiNvSHys
 82F64DXOeZJEGB0klLupzOPFpYIKPNLPjMSxA1PpLc6JhouSzS5TCSnwkpRWJBibXU7m
 A8SQ==
X-Gm-Message-State: AOJu0Yymlcx5fXYzqKBNhG/gJ7gttYUNEdSwyLpgpk/Z6x7xmkVs4ACs
 Kbdfz2s7ljVxC45CiWSfykJzeXL04WPlFgWgG5Llmw==
X-Google-Smtp-Source: AGHT+IGtfskpxoUcnngx7i6yL/Nm775dsQZ4K4qcgrY65bRJYDEg4ZOySOI29+JylzbxDacW0W2OBg==
X-Received: by 2002:a17:906:7392:b0:a00:773c:3f09 with SMTP id
 f18-20020a170906739200b00a00773c3f09mr8655545ejl.17.1702887616393; 
 Mon, 18 Dec 2023 00:20:16 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.retail.telecomitalia.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 lm11-20020a17090718cb00b00a1cf3fce937sm13807835ejc.162.2023.12.18.00.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 00:20:16 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 09:19:50 +0100
Message-ID: <20231218081958.506691-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
References: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702887616; x=1703492416;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=39vOPGNR2SPxOAjGebK+dQH3xAP3X7U8AYKMZDuwQWQ=;
 b=KC49NuLXlkPCfuc5aYVtlhBNq3saW3tbtM2+mNreBYyGqFwhopqVz3522SjXWJWR48
 vft7VlP4rSRA23wWYFbPaXcRFjDiC+drqDXH/aqYx9qrAHxCg8n7b+MM8VruagvDRz/5
 rt3wynlJCkrZBKMi1/uuMrC1sfHa2V9+MoSYk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=KC49NuLX
Subject: [Buildroot] [PATCH v3 03/11] package/python-jsonschema: add host
 variant
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

 package/python-jsonschema/python-jsonschema.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/python-jsonschema/python-jsonschema.mk b/package/python-jsonschema/python-jsonschema.mk
index dee87e8f9d9b..6f2206f3a03c 100644
--- a/package/python-jsonschema/python-jsonschema.mk
+++ b/package/python-jsonschema/python-jsonschema.mk
@@ -15,4 +15,10 @@ PYTHON_JSONSCHEMA_DEPENDENCIES = \
 	host-python-hatch-fancy-pypi-readme \
 	host-python-hatch-vcs
 
+HOST_PYTHON_JSONSCHEMA_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-fancy-pypi-readme \
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
