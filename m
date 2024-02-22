Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD20C48BEB
	for <buildroot@archiver.kernel.org>; Thu, 22 Feb 2024 10:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4685E41936;
	Thu, 22 Feb 2024 10:17:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wosewnM0zEWk; Thu, 22 Feb 2024 10:17:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBB1F41BE0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBB1F41BE0;
	Thu, 22 Feb 2024 10:17:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 68E961BF3FF
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 10:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6347D41850
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 10:17:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ULwcs1S8XpG for <buildroot@lists.busybox.net>;
 Thu, 22 Feb 2024 10:17:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2FD4541851
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FD4541851
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FD4541851
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 10:17:00 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4128d15ae89so1024745e9.2
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 02:16:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708597018; x=1709201818;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8e4KLtCZ4D0sH9xQZE6pHI7FNk8el7Q/F6dzbY1ln3I=;
 b=oHWRiDtL9eMjEeELwydY9DHbSWQotTNx9+/hf4hcFzDJ81mVIVaxKYF/PhZ/l3RdpO
 keyptdMz9WkeHpgSc89KAXpsjymGB2ExtKPK9m79c6/sg0LgVXCbANe2haTrHG3oVu+i
 7UpHn1Y7I3AQAM3yb1row52v+f4klJ/qJXNXtx97LuYMmRqLVxGPyHhZNwov+GYd+Q9y
 I7Cg7XgquW/pRKwmifLd/l2B1/HiVwrx+MNXuJ9+UqFOl819mu04hXNgnesF8SDkzFum
 5PBbEqzwbKgv7VBXTAsQO6otahIv4yfpvNnwzPmKgFSGR3BT2hSh3o2MwMdeiGZpWmFr
 GLcQ==
X-Gm-Message-State: AOJu0YzkFLQdTK46I5o8RqFz9jvaE5+I2IDL5Z+eczjX8ufshvS0Lj8e
 2gRuIE1im5EMKg3FIlJ/yqI7YKWiwA4YqZrbOHwQ7p6NyGmAFEXffYSXYXjCMhcQth+yflPCnwu
 0Nk8=
X-Google-Smtp-Source: AGHT+IGL2ZdLD482W5nq+2a4fMO4KcHnAD7y8TXcAJ+x7zxM6oq+NHfCZyyI4FMAsrZu5YDCxYJ/6A==
X-Received: by 2002:a05:600c:19cf:b0:412:5e41:6f35 with SMTP id
 u15-20020a05600c19cf00b004125e416f35mr9860226wmq.10.1708597017841; 
 Thu, 22 Feb 2024 02:16:57 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4f68:2b3f:b15d:b5a9])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a05600c365100b004126101915esm5619349wmq.4.2024.02.22.02.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 02:16:57 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 22 Feb 2024 11:16:10 +0100
Message-ID: <20240222101617.18422-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
References: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708597018; x=1709201818;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8e4KLtCZ4D0sH9xQZE6pHI7FNk8el7Q/F6dzbY1ln3I=;
 b=haIwXGOvJ4jWExd9vxt3TNIRj+/ZdBLUMmxh2GOmwtDfRCGWVy0iJ+qOWjQ3scKj5N
 Yg+z9E4QNzJjeSjyALehuhqg20tY4kTDmwniXqtaQFmWThahSF8clRQs8RhSqcxfE1KA
 x/3cRVr4X073rL9UwL5Xl/ZxndvMOSBsO/oMs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=haIwXGOv
Subject: [Buildroot] [PATCH v5 09/16]
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
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

no changes since v3

Changes in v3:
- Drop Config.in.host

 package/python-jsonschema-specifications.mk                      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
index 40879898c9d4..b6e309ab2bc9 100644
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
