Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4BDC4332F
	for <buildroot@archiver.kernel.org>; Wed, 13 Dec 2023 16:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 757C160D8E;
	Wed, 13 Dec 2023 16:44:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 757C160D8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NE1ee1NBiCdk; Wed, 13 Dec 2023 16:44:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B02C2615C8;
	Wed, 13 Dec 2023 16:44:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B02C2615C8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AEA321BF97D
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 16:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F42B40935
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 16:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F42B40935
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qoA6LxMEirvJ for <buildroot@lists.busybox.net>;
 Wed, 13 Dec 2023 16:43:23 +0000 (UTC)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 581D9408BD
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 16:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 581D9408BD
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50bf37fd2bbso9639432e87.0
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 08:43:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702485801; x=1703090601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iKG8I4XzO6UezuRdYQuzUs6qzO6FluWw5vcfw20zu9Y=;
 b=ezuWKv+Z6dKibKc3VWC2ZO0ywavvKmTjwX5NaCg8VtuOE6fWui3nCJrMY1ztuQ8Qiz
 pc4EZ9FOvVbLWczPfZqsf1s5NIqw7KZoi6RCPyQ6tIV4+YMsLTRlc/8vPcbiJ/nGhfZd
 wxXj1Pnc5Bggmm4xoqIJ+Ru8W5KXTLPxDRr/wgjqjO1FZUf/GxwcT/q3doud7JVyTvog
 SQaa9t/68b442AIeX2OnSs4R4wX4tY0MD784iR9qJqev/G0tuWh7L3ZvQ+tR67ZnNdvX
 ExZHAWXlWgoi78d7jXZARWzPY7jlV+9nhZzmuO1vJ47xGjEcfqpR4UWTx/ZJnMl8vUdZ
 f1qQ==
X-Gm-Message-State: AOJu0YyvAkSV1raMCShnYXs/fq3dYn2bbDtWMEQZEFWPY4PYXbaJDDB8
 v9ktXCxeh9zzqCMQyjJMSZJw9bwcEd3yinRrBExSzA==
X-Google-Smtp-Source: AGHT+IGaW1c/ULiRY9dKUtljOjRawthI1ucmULhu1m4gEPLIpLHD9rkUlAyfUrgX30aqSvp2aBWNAA==
X-Received: by 2002:a05:6512:3743:b0:50c:be5:ffc with SMTP id
 a3-20020a056512374300b0050c0be50ffcmr3863999lfs.113.1702485800905; 
 Wed, 13 Dec 2023 08:43:20 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.pool80182.interbusiness.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 rl19-20020a1709076c1300b00a1f8bae93d3sm6017326ejc.215.2023.12.13.08.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 08:43:20 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 13 Dec 2023 17:43:06 +0100
Message-ID: <20231213164311.4180059-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
References: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702485801; x=1703090601;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iKG8I4XzO6UezuRdYQuzUs6qzO6FluWw5vcfw20zu9Y=;
 b=Y1KNhE5lcgnUJmBCS1TPqyOKBukrGxZB/UClqSE1gR3Pyn2OzFglgfzZGio7DIILUH
 s158uVUp/ZcIm/Zme+prFnJeaeZmIMloS/YaOPOnQzslz4xS8fWYUZn2e4ijAXzanQf/
 mjUQOwQjlt/rzXUn9PAgbpT8Gf19/r2UP2N+0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Y1KNhE5l
Subject: [Buildroot] [PATCH v2 06/11] package/python-rpds-py: add host
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
arrangements with many parts. This package is required by binman

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/Config.in.host                   | 1 +
 package/python-rpds-py/Config.in.host    | 8 ++++++++
 package/python-rpds-py/python-rpds-py.mk | 1 +
 3 files changed, 10 insertions(+)
 create mode 100644 package/python-rpds-py/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 56299184eb40..1b2af6cbf0f2 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -91,6 +91,7 @@ menu "Host utilities"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-pyyaml/Config.in.host"
 	source "package/python-referencing/Config.in.host"
+	source "package/python-rpds-py/Config.in.host"
 	source "package/python-six/Config.in.host"
 	source "package/python-xlrd/Config.in.host"
 	source "package/python3/Config.in.host"
diff --git a/package/python-rpds-py/Config.in.host b/package/python-rpds-py/Config.in.host
new file mode 100644
index 000000000000..2c11019fe997
--- /dev/null
+++ b/package/python-rpds-py/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_PYTHON_RPDS_PY
+	bool "host python-rpds-py"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	help
+	  Python bindings to the Rust rpds crate for persistent
+	  data structures.
+
+	  https://github.com/crate-py/rpds
diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
index 6f71d0204704..f426bddff3d6 100644
--- a/package/python-rpds-py/python-rpds-py.mk
+++ b/package/python-rpds-py/python-rpds-py.mk
@@ -12,3 +12,4 @@ PYTHON_RPDS_PY_LICENSE = MIT
 PYTHON_RPDS_PY_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
