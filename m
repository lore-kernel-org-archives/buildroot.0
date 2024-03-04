Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382D7C5478C
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 15:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6E82414FF;
	Mon,  4 Mar 2024 15:34:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yarU59gYsOdK; Mon,  4 Mar 2024 15:34:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BB2A41573
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BB2A41573;
	Mon,  4 Mar 2024 15:34:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B33C1BF3B0
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32CEE414A0
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HGyRSF1NBVEP for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 15:34:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9926541500
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9926541500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9926541500
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 15:34:22 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5649c25369aso6593111a12.2
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 07:34:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709566460; x=1710171260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3mZYCxmE8DoOuJy8yEJQnV4MCdjdtYGW6ltxuAr4t+M=;
 b=Bhq3jYjrnpBr8NkVBc29ZfpmCqiUhlQXrTNEmkeKKsA5pjzgVMkwZiv83lxC99k54s
 q7shYAmE85yWtwsHwTFs0qXet+SzQ0fTUTbcW11mUCm6lYAR68J9/7zWejE0BqOd6+ad
 507/kAFokYIfcCzc6Bn0+tQZYHOalnitG00CzpygpjSy6dzDE7+zOo0BmN2yjz7+ckLg
 G4mG0U3hM3IPmV6doh/s3prLn8QFgp1XRF9VKrSl7VAk9cWusny5/YFtzWV27zeB6E+c
 DV+1dHj8rT5RlPrTVI0qoR+F50zz+aV45SLT6r9o/OElONNKMmYUHS7Fq7f+Q6qJ6qje
 5qVA==
X-Gm-Message-State: AOJu0Yzt5ztrw9VaFSbu9EQlCAH/8fq84A8WzdgJUXXxxy1aAKFDuZA9
 n4RrzyZXCGr/D0R5ZReQZsfxV9HaHt2+NUAC2bTdpxmUDvBqU8tacfey8SZozdD3GnReJ3ctDMq
 ZsE0=
X-Google-Smtp-Source: AGHT+IF39XVuXGzW/4aWJ9izG5bva+4LD4u0R7bz0prYsRRlCBz+NEFvza+C/xupozkPEdU0bEdETQ==
X-Received: by 2002:a17:906:d20a:b0:a44:505f:bfa9 with SMTP id
 w10-20020a170906d20a00b00a44505fbfa9mr5746410ejz.58.1709566460208; 
 Mon, 04 Mar 2024 07:34:20 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:72fe:558f:d55e:d423])
 by smtp.gmail.com with ESMTPSA id
 sa20-20020a1709076d1400b00a4432543b21sm4936082ejc.198.2024.03.04.07.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 07:34:19 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 16:32:41 +0100
Message-ID: <20240304153253.732708-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709566460; x=1710171260;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3mZYCxmE8DoOuJy8yEJQnV4MCdjdtYGW6ltxuAr4t+M=;
 b=MGTviABjCK1Vq2zGY7m86b6VlH+6jpXulkl7CDvpMPxg2f2OStOkj8CVakkVSGFpYo
 IN2ekBDItUzGtkjpbcypgO9AMg10Och3RRtlc3Mgx+DIOGHWUx1nZIGbnYmL8zutWFYF
 RX8Rzsmx9A8IAT1wMZ7bNiW7vYItEohNRc/v0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=MGTviABj
Subject: [Buildroot] [PATCH v9 10/22] package/python-jsonschema: add host
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
