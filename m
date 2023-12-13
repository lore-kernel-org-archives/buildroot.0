Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7F3C4332F
	for <buildroot@archiver.kernel.org>; Wed, 13 Dec 2023 16:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 083A9607C7;
	Wed, 13 Dec 2023 16:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 083A9607C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RDrV22Jji6_7; Wed, 13 Dec 2023 16:44:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3074260BF3;
	Wed, 13 Dec 2023 16:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3074260BF3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D9801BF285
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 16:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66DBB8331B
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 16:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66DBB8331B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GPQ_4TQjoify for <buildroot@lists.busybox.net>;
 Wed, 13 Dec 2023 16:43:24 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9DCD832D8
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 16:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9DCD832D8
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a22f59c6ae6so149638566b.1
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 08:43:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702485802; x=1703090602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nI/BEu019BM18nMLF0zIVPhMK/Y+yo/p7gYH5Je3T1Y=;
 b=qM+XtJr025G2GSZyizLSNn/D9yoc7FPgsD7E/RBLEgyLGAvvif7/A9O9mkO5CFflI+
 /gZCWK+to/WDqi3j1uKwXsh5u7BRtlBiJbnX0LsEn3Kz/KGTdUpsWoH/j1OFCzIvWUxS
 k6ndHQMKi/+cacTehqAWhJP4Yp0UnE+0BeYlKxo66GQ0Wv/Uz9HwqLmxgRu/nfrIASJ1
 cL0fnPMoUilX7tvziizoY4hzUa0FTxGkEMbcv+ME1sPyiwHnEjv77QoRyiXFjD3fB5Pq
 S9n12iFQbWn/LOo/kjfUlu6HZRENaoR0J0pke202nfEnF/HohXwVnYocoUF0vCfVOgjv
 ExhQ==
X-Gm-Message-State: AOJu0YyOPL3q9zYPbo8tMrOqjsrWP7EMekR4FLTmjq3sICZgYg/xeTHB
 5wNaWugjqt5RmPxdiifsrKTsDFXqLCFJOTbajo/1bg==
X-Google-Smtp-Source: AGHT+IEKyBh/Kd28eW5ujYIINjeuXucP/JtPe2cN3dR/Lj8qzx63YIEeZC85yICZaAavyxJw1PYTbQ==
X-Received: by 2002:a17:907:940b:b0:a19:d40a:d1ed with SMTP id
 dk11-20020a170907940b00b00a19d40ad1edmr2398526ejc.185.1702485801885; 
 Wed, 13 Dec 2023 08:43:21 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.pool80182.interbusiness.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 rl19-20020a1709076c1300b00a1f8bae93d3sm6017326ejc.215.2023.12.13.08.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 08:43:21 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 13 Dec 2023 17:43:07 +0100
Message-ID: <20231213164311.4180059-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
References: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702485802; x=1703090602;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nI/BEu019BM18nMLF0zIVPhMK/Y+yo/p7gYH5Je3T1Y=;
 b=akslmSFqfe+HhrXfk/fBB4/TnP6C+nHqz5gyX/5VkjjSskOSpDgOZuPqqj2wazOpi+
 Au7fYCNImUZN1HqwQT9a0KCnuJGgjl3qzXt+cy+bYTUbVXA+y1ZHmv1HWipmF8wQhcXU
 s51ohG75bPwG/zKpIOxCxDSRG41TSJ5GaJzfA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=akslmSFq
Subject: [Buildroot] [PATCH v2 07/11]
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
 package/Config.in.host                                     | 1 +
 package/python-jsonschema-specifications/Config.in.host    | 7 +++++++
 .../python-jsonschema-specifications.mk                    | 5 +++++
 3 files changed, 13 insertions(+)
 create mode 100644 package/python-jsonschema-specifications/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 1b2af6cbf0f2..27237639ada1 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -87,6 +87,7 @@ menu "Host utilities"
 	source "package/python-greenlet/Config.in.host"
 	source "package/python-iniparse/Config.in.host"
 	source "package/python-jsonschema/Config.in.host"
+	source "package/python-jsonschema-specifications/Config.in.host"
 	source "package/python-kflash/Config.in.host"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-pyyaml/Config.in.host"
diff --git a/package/python-jsonschema-specifications/Config.in.host b/package/python-jsonschema-specifications/Config.in.host
new file mode 100644
index 000000000000..903b4c4d98a2
--- /dev/null
+++ b/package/python-jsonschema-specifications/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_PYTHON_JSONSCHEMA_SPECIFICATIONS
+	bool "host python-jsonschema-specifications"
+	help
+	  The JSON Schema meta-schemas and vocabularies, exposed as a
+	  Registry.
+
+	  https://github.com/python-jsonschema/jsonschema-specifications
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
