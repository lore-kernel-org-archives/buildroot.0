Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44AFC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 08:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64869405AF;
	Mon, 18 Dec 2023 08:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64869405AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hloFJ8J057Nt; Mon, 18 Dec 2023 08:21:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 508EC409C8;
	Mon, 18 Dec 2023 08:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 508EC409C8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0864C1BF3BC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCE8440603
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCE8440603
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vCWilhnSmxC2 for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 08:20:20 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8AAC40906
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 08:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8AAC40906
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a234dc0984fso87143966b.0
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 00:20:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702887618; x=1703492418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+j8tbYktxNgPtm63402ueJ1ePcp2VKD1Im6SItdOLc8=;
 b=jA+JUi9OwV9wW8Kop5wQ5xmlZPSZEJWmhBpc3EFXQvPskcxaP4nWXBCCCYieo1aHku
 FjlF6Phn31duqUl9w9PUPhQmxf8kzeTONsUX5c8cFvwj7H2OiONQf9Vy8QiWQe0pFwfg
 TEGBNkX3FVU+2Dc7thFGpSjjC5YMyaTPZgiuUsH1s3GN/Y1C4XBamoN8Q9Ctbm0jA+ue
 OXZrwlxm3qG83XIZWpTmCnsTn5caQVsF74hRaiDVf3EUlG5nf0t5bBEGxoy/gbr8/MPq
 SGm13lqUTbjzahX05P5+xd2TdJtRBiLiW5JbQHZCTprJx8E+QXJtkMfpnD0TMekCdUsO
 NmGw==
X-Gm-Message-State: AOJu0Yxuvm4xLNk+TUANSaK7QiVUxbIAXxOnNvEHRntkhwjdoc42rRvq
 O2Syfk96LjnBYByViz94dBp6RkorlJD66cxGsJL/mQ==
X-Google-Smtp-Source: AGHT+IGVHTqlxmc08RooykbaQLVwiaM+6QTj12PIu4lA6A9uUpGqlP+UuOEtBsknW49wli5BnsUteQ==
X-Received: by 2002:a17:906:26c6:b0:a1f:7298:aa25 with SMTP id
 u6-20020a17090626c600b00a1f7298aa25mr8556431ejc.45.1702887617501; 
 Mon, 18 Dec 2023 00:20:17 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.retail.telecomitalia.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 lm11-20020a17090718cb00b00a1cf3fce937sm13807835ejc.162.2023.12.18.00.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 00:20:17 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 09:19:51 +0100
Message-ID: <20231218081958.506691-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
References: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702887618; x=1703492418;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+j8tbYktxNgPtm63402ueJ1ePcp2VKD1Im6SItdOLc8=;
 b=Bq+rl51hcKir8DcnaJj5fMn7KLxSezw24SAnmiQFeGVQn1ngH0UK1sual/NbioBEbK
 ZsgqNYQe+Su5MXYxFxTMwJqjj5uo5RvXizV2rBm37cqV6P+mSxe8C8n7GmfnOUJyymNe
 wKuHFagepFlS1T6Va27bLoxs16rXSwvzx4RrE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Bq+rl51h
Subject: [Buildroot] [PATCH v3 04/11] package/python-attrs: add host variant
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

 package/python-attrs/python-attrs.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index 0d704ea11195..96d6b8ad7923 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -15,4 +15,10 @@ PYTHON_ATTRS_DEPENDENCIES = \
 	host-python-hatch-fancy-pypi-readme \
 	host-python-hatch-vcs
 
+HOST_PYTHON_ATTRS_DEPENDENCIES = \
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
