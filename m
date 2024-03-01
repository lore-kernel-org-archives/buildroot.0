Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C4DC5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 13:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69E6583546;
	Fri,  1 Mar 2024 13:37:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aRsnXlBTGdvm; Fri,  1 Mar 2024 13:37:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 581FC8354B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 581FC8354B;
	Fri,  1 Mar 2024 13:37:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32DF61BF2C1
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CE4840644
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kd5CUebr67R1 for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 13:36:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E4D774016D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4D774016D
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4D774016D
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 13:36:38 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-56694fdec74so2732967a12.1
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 05:36:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709300197; x=1709904997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=puGFVjhFI6sZrTHV6hSYvkg3j41TTx8u99zIOJPa7YU=;
 b=SOqMWnWunhozlgo7DqnD+7mtUFpqlHuo1nuELnkUC1ANAK8Ji2Bxii2nuzybfZdCLV
 5QmCECfCkjWTjvkmg3GEWpWayN2cGVGEIuM9ZWS4l071qBcZEnML+39/GfQyNRpk4b46
 6BfGMEYY4tbJc4FwVgHev/51l8vy59QOMKyuHQLOnTAQgBCgDsY3dVxPqXabbaxS45D/
 pD9DfEkxzSO7p4lAZi29sMqK2ul3mCg5yX83cevUS3z40rsqBaZVJQWDeShf8+i3I8R+
 l8nOiqnRg6NYWVpu+KTY9l752JZrPDnEk+M3ujIe10A8fWnHUxJfBE/Gu9agLDtUlHLm
 B11w==
X-Gm-Message-State: AOJu0YxEdCmiHpO4KtnlXM0u3ip21FrsEV36TzQuXvoz5Kb/c15e4aTw
 mRzeVdDywX5aW6qskCupm+9ioJdxczyR7+jrH+DXaFX/cdoBWv/8ZDjsboi32asuLZL6dNvG0DH
 JHXw=
X-Google-Smtp-Source: AGHT+IHzIZzWg10UDiUCJl7jahEhH4AA5xBfkTYMAuxsT8BgIJBE4pNUNqZGLfbdNmcjVKNHJ8TSCw==
X-Received: by 2002:a05:6402:609:b0:566:bf00:4e25 with SMTP id
 n9-20020a056402060900b00566bf004e25mr1315956edv.33.1709300196806; 
 Fri, 01 Mar 2024 05:36:36 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:5260:58bc:42cc:9d46])
 by smtp.gmail.com with ESMTPSA id
 q28-20020a056402033c00b005659ea1caf0sm1566608edw.6.2024.03.01.05.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 05:36:36 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 14:36:07 +0100
Message-ID: <20240301133620.3547430-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
References: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709300197; x=1709904997;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=puGFVjhFI6sZrTHV6hSYvkg3j41TTx8u99zIOJPa7YU=;
 b=IaQoRUoIIhimUfiqBocttmVctivq7zz7guapzgpCT7HnSAw3AaxAxEDaP91Qm0cOrT
 KNBdqbPQ7SzEdyXr1leC9xAFqiLgSYwNQr6xUu+mhwnVVeQkjtcsrV7YbGdvGT6yrxvh
 g43G/uKWWWC43x8l17i6RV/d+B1m4/VJGrsYE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=IaQoRUoI
Subject: [Buildroot] [PATCH v8 10/23] package/python-jsonschema: add host
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
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
Co-developed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v5:
- Add runtime dependencies
- Add SOB and COB tags of Romain Naour

no changes in v4

Changes in v3:
- Drop Config.in.host

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/python-jsonschema/python-jsonschema.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/python-jsonschema/python-jsonschema.mk b/package/python-jsonschema/python-jsonschema.mk
index 512c92aa7752..9e8b6e18b876 100644
--- a/package/python-jsonschema/python-jsonschema.mk
+++ b/package/python-jsonschema/python-jsonschema.mk
@@ -15,4 +15,18 @@ PYTHON_JSONSCHEMA_DEPENDENCIES = \
 	host-python-hatch-fancy-pypi-readme \
 	host-python-hatch-vcs
 
+HOST_PYTHON_JSONSCHEMA_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-hatch-vcs
+
+# This is a runtime dependency, but we don't have the concept of
+# runtime dependencies for host packages.
+HOST_PYTHON_JSONSCHEMA_DEPENDENCIES += \
+	host-python-attrs \
+	host-python-jsonschema-specifications \
+	host-python-referencing \
+	host-python-rpds-py
+
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
