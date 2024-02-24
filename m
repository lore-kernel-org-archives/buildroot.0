Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78688C54E41
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 20:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49BF440640;
	Sat, 24 Feb 2024 20:57:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EA5UOpxEHoaR; Sat, 24 Feb 2024 20:57:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CDCD40609
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CDCD40609;
	Sat, 24 Feb 2024 20:57:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFBB11BF276
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 20:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E298405C4
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 20:57:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gUQ46MNXBLF8 for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 20:57:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9B068405BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B068405BD
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B068405BD
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 20:57:39 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-563c0f13cabso2166141a12.3
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 12:57:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708808257; x=1709413057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RS3ECtSJzaHRCDrqxc250sI2LSawEH+EipWYB1NjYZA=;
 b=nXBzXIW+LIHeX7Mm6nVDsyscb55IDHCU/jOUnHLzVdvq60LfMjvUOi8CvM0jkuRi+L
 69mjCZeYEmUie50ePlTNZDu/AFfJga5HNaualUwByO0EElPee9aBitKCtGgkH0apvoQC
 fzzXdXDiTJnEPWsl7q1A78T0msFmQZeghKhbttig9Dlk9Pwsp8DlDDKfGtrhWvQWcOQb
 uijLoQWEaN342IW21mQ997LM+Iq06+KChUS+BduBX29hEUe340ON7GBClhQNyRl+zAbT
 POLm2wJso3xArnd5AGMVN2inSnmf7JiCJh71RNLGsDtZ7BcQk1se6Pn6Mj4MfQKdTqcA
 Vrnw==
X-Gm-Message-State: AOJu0YxodTA8c2S1CERfO0VaU7zRUlG31ZNScD3Cf9zawHgcjIB5rmnz
 1YI27Anjd8pPGYY70Ov3Zq2w/wadorKe8HOblGLYUB+OWUUpXinsrVRnCqyCZjv6IOyH+yMGfFU
 Lduo=
X-Google-Smtp-Source: AGHT+IEW3dJnEWI47LqTyo3vQTdm3mWVIZrRdneO1CtfC+jp2hQyQ1XjCh0k7T+ZXFWq2KFFsUWXSw==
X-Received: by 2002:a17:907:118e:b0:a3f:9c9b:2037 with SMTP id
 uz14-20020a170907118e00b00a3f9c9b2037mr2012594ejb.67.1708808257308; 
 Sat, 24 Feb 2024 12:57:37 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 tk6-20020a170907c28600b00a4306ac4c77sm425506ejc.197.2024.02.24.12.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Feb 2024 12:57:36 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 21:56:45 +0100
Message-ID: <20240224205654.1546744-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
References: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708808257; x=1709413057;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RS3ECtSJzaHRCDrqxc250sI2LSawEH+EipWYB1NjYZA=;
 b=L34tK+kLg9D852mMXrrtCjVkjaG24OolZOyDXjwMLilEaZoHMcB8WGmK4k7a+Km+7G
 yVnDQfdAAF3opPzXdQKBq6eBMR736vrj+hpnLTdS2IU9v52byt6Fp44cHCB47tL/gem1
 NvXCvAAFzgjLK8SrKmV5FwevT9CelLg7BJBPA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=L34tK+kL
Subject: [Buildroot] [PATCH v6 08/16] package/python-referencing: add host
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

 package/python-referencing/python-referencing.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/python-referencing/python-referencing.mk b/package/python-referencing/python-referencing.mk
index 27d1452e913a..66d59ed8091a 100644
--- a/package/python-referencing/python-referencing.mk
+++ b/package/python-referencing/python-referencing.mk
@@ -14,4 +14,15 @@ PYTHON_REFERENCING_DEPENDENCIES = \
 	host-python-hatchling \
 	host-python-hatch-vcs
 
+HOST_PYTHON_REFERENCING_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-vcs
+
+# This is a runtime dependency, but we don't have the concept of
+# runtime dependencies for host packages.
+HOST_PYTHON_REFERENCING_DEPENDENCIES += \
+	host-python-attrs \
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
