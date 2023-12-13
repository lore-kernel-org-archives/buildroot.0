Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E43AC4167B
	for <buildroot@archiver.kernel.org>; Wed, 13 Dec 2023 16:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18FD460F26;
	Wed, 13 Dec 2023 16:44:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18FD460F26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ott-UH4JpYS3; Wed, 13 Dec 2023 16:44:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39F8560F1A;
	Wed, 13 Dec 2023 16:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39F8560F1A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 78E571BF285
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 16:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D007400AB
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 16:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D007400AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sBbxXx6kSkga for <buildroot@lists.busybox.net>;
 Wed, 13 Dec 2023 16:43:22 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0140A4064E
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 16:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0140A4064E
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9fa45e75ed9so831886966b.1
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 08:43:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702485800; x=1703090600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HWawlexnHiTp6b9J5WiHhSLNOsnjH3AEIgwU8QXA0kE=;
 b=ReUdxzwj6NThteYDDOCmAt9Doc8urEnWMSTILU3/E4Xm9cpsK4pjHkxnuAxcixTLu6
 +xH85TthLpPjep4X5BWDPL9Y+Xo3y4DWMf+u9GE8zpF5siD09JN3EYHUDaBz9etSSo6k
 ZNV3IOEpPpamzpiwDroMoiFeBEuQrgV4kVa7VA/Mb3bLiK37QIQQE6WJH4TE9wprLoPW
 q782/MNiPfI8y67Qlyj7qfB0H4jtlClwYGouVoSFMRAZCrP985DMK8LukosNWNGvseF4
 8jxD8gW5zxFmIbhL7aQc2aNBwjchMHa77KXSQzgciNcxKjRog/GcGkJ4ruEro7rkXnbI
 yaiw==
X-Gm-Message-State: AOJu0Yy8XknBHlVv3YVaufiXNWvjTIsEbLHDflyrZILc1bOJ+CDecIKb
 MBh7QE4FsaTRMIcpU055K12vxnm4vknycY5wGDvcYQ==
X-Google-Smtp-Source: AGHT+IERwECtHXpBsciChekV4bIw4a364NWzgHXTzQtrCPlzSco2iTqfZwvgNUs2MxTLMeZqGC7Yuw==
X-Received: by 2002:a17:906:105:b0:a1e:437c:6a6a with SMTP id
 5-20020a170906010500b00a1e437c6a6amr3638839eje.78.1702485799884; 
 Wed, 13 Dec 2023 08:43:19 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.pool80182.interbusiness.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 rl19-20020a1709076c1300b00a1f8bae93d3sm6017326ejc.215.2023.12.13.08.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 08:43:19 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 13 Dec 2023 17:43:05 +0100
Message-ID: <20231213164311.4180059-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
References: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702485800; x=1703090600;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HWawlexnHiTp6b9J5WiHhSLNOsnjH3AEIgwU8QXA0kE=;
 b=CiETbhaXIWe8pt8VRRU2LGsuXCCdVZfYwlmUU4gOif/fOaCj57cinJvWN5v0GcfmEw
 V9bzEN6xbJf3MSBLaEEcO2/+WMG1i3+Us+DRRo0fJTmjrHmkxPPngTX+/l71jz+3c7vv
 6Q7p0k8ccaPC7p99UjFUSODn+eUrWZDYOkOG0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=CiETbhaX
Subject: [Buildroot] [PATCH v2 05/11] package/python-referencing: add host
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
 package/Config.in.host                           | 1 +
 package/python-referencing/Config.in.host        | 6 ++++++
 package/python-referencing/python-referencing.mk | 7 +++++++
 3 files changed, 14 insertions(+)
 create mode 100644 package/python-referencing/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 5f9dbd3c71be..56299184eb40 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -90,6 +90,7 @@ menu "Host utilities"
 	source "package/python-kflash/Config.in.host"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-pyyaml/Config.in.host"
+	source "package/python-referencing/Config.in.host"
 	source "package/python-six/Config.in.host"
 	source "package/python-xlrd/Config.in.host"
 	source "package/python3/Config.in.host"
diff --git a/package/python-referencing/Config.in.host b/package/python-referencing/Config.in.host
new file mode 100644
index 000000000000..78fc8294f2a5
--- /dev/null
+++ b/package/python-referencing/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_PYTHON_REFERENCING
+	bool "host python-referencing"
+	help
+	  JSON Referencing + Python.
+
+	  https://github.com/python-jsonschema/referencing
diff --git a/package/python-referencing/python-referencing.mk b/package/python-referencing/python-referencing.mk
index 4d11c99deb3b..9d8fc5a2f541 100644
--- a/package/python-referencing/python-referencing.mk
+++ b/package/python-referencing/python-referencing.mk
@@ -11,7 +11,14 @@ PYTHON_REFERENCING_SETUP_TYPE = pep517
 PYTHON_REFERENCING_LICENSE = MIT
 PYTHON_REFERENCING_LICENSE_FILES = COPYING
 PYTHON_REFERENCING_DEPENDENCIES = \
+	host-python-attrs \
+	host-python-hatchling \
+	host-python-hatch-vcs
+
+HOST_PYTHON_REFERENCING_DEPENDENCIES = \
+	host-python-attrs \
 	host-python-hatchling \
 	host-python-hatch-vcs
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
