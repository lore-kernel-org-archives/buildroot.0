Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84049C4332F
	for <buildroot@archiver.kernel.org>; Wed, 13 Dec 2023 16:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2423D60F35;
	Wed, 13 Dec 2023 16:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2423D60F35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xIxKV5yRazmK; Wed, 13 Dec 2023 16:44:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F36E60F1A;
	Wed, 13 Dec 2023 16:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F36E60F1A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 79EAA1BF285
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 16:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 538F68331B
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 16:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 538F68331B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hf3ewHHuEflK for <buildroot@lists.busybox.net>;
 Wed, 13 Dec 2023 16:43:20 +0000 (UTC)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EEDCA832D8
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 16:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEDCA832D8
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-54bf9a54fe3so9950296a12.3
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 08:43:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702485798; x=1703090598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dc+pYYBT+157aUpsh4EzXATMY/zKSp6u2yxAIqC+0ts=;
 b=APFmtVBASj7dY/n0+mfJOe2tPOw6mTv/a8KcnGEWMQJWC6qL7I9cciOe8jM82dKJxK
 yY+3kW8cuqh+xwpCE+QJSuvK/sZwPpO8pt2UrNgTHc/v38J6tr66mdbYYzwACn0f/za/
 9wBPqGLSFsZ78mUD8wmF+OuCRLSqm94VfgbyyzEnrb9fwVVNEtU0XNQxGAHumCuFcuJB
 4jZyWy3B53oFeRMhNMxDhmV0hJPg4emMWvG/KRuUtSIt+/xuTM7vYe0T8iUSK0QmcjQE
 zD4pXVQt8q6dO/4JCSE3RIwLdHHD0H33Ksfh1/W0HIcFPSeKSXpmauuApTAwHqsgLhpD
 Q11Q==
X-Gm-Message-State: AOJu0YwLfhPiX+q0q0Jj6PQ9ugxZDyFh/POaRWkZXkFP1tgTgSs8KL3O
 YOCH/4GVA0JLIM3Kb3cpNuxjYv9n4cGGriOZ/rwHng==
X-Google-Smtp-Source: AGHT+IEBHnQmgBN6udns5le5Iw/4xoK3vlr/Uq/jgoCYcQvE/2PG1WSrbuzQz/Tb1+023yXy1N+PRA==
X-Received: by 2002:a17:906:7304:b0:a1d:2e13:f0f3 with SMTP id
 di4-20020a170906730400b00a1d2e13f0f3mr4208790ejc.70.1702485797945; 
 Wed, 13 Dec 2023 08:43:17 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.pool80182.interbusiness.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 rl19-20020a1709076c1300b00a1f8bae93d3sm6017326ejc.215.2023.12.13.08.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 08:43:17 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 13 Dec 2023 17:43:03 +0100
Message-ID: <20231213164311.4180059-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
References: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702485798; x=1703090598;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dc+pYYBT+157aUpsh4EzXATMY/zKSp6u2yxAIqC+0ts=;
 b=ZVdZp+WV98HS7gwye36OLcfSbZslKs+EbqdPnbI4Z8flYOBUzbcSZP2bi34IP218DA
 7R1QdO8sHGikd3CXTnMv+AyF7nly/Tuv5b/QqnHvZbxKwkZRqBzXjY/fN7W3bpBMGhq4
 SJja52NyO0auloGu8SGDCZV/AZ/rjJcysq7oI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ZVdZp+WV
Subject: [Buildroot] [PATCH v2 03/11] package/python-jsonschema: add host
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
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
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
 package/Config.in.host                         | 1 +
 package/python-jsonschema/Config.in.host       | 6 ++++++
 package/python-jsonschema/python-jsonschema.mk | 6 ++++++
 3 files changed, 13 insertions(+)
 create mode 100644 package/python-jsonschema/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index c80842c33a2f..5d2121de02a4 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -85,6 +85,7 @@ menu "Host utilities"
 	source "package/python-cython/Config.in.host"
 	source "package/python-greenlet/Config.in.host"
 	source "package/python-iniparse/Config.in.host"
+	source "package/python-jsonschema/Config.in.host"
 	source "package/python-kflash/Config.in.host"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-pyyaml/Config.in.host"
diff --git a/package/python-jsonschema/Config.in.host b/package/python-jsonschema/Config.in.host
new file mode 100644
index 000000000000..fd275a41b200
--- /dev/null
+++ b/package/python-jsonschema/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_PYTHON_JSONSCHEMA
+	bool "host python-jsonschema"
+	help
+	  The host implementation of JSON Schema validation for Python.
+
+	  https://github.com/python-jsonschema/jsonschema
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
