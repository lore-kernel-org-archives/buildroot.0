Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85155C5478C
	for <buildroot@archiver.kernel.org>; Tue, 27 Feb 2024 16:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54D6A4148B;
	Tue, 27 Feb 2024 16:30:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ASz4U99fsb9; Tue, 27 Feb 2024 16:30:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 432FE41497
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 432FE41497;
	Tue, 27 Feb 2024 16:30:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F2341BF30A
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79343405EC
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:30:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dCCgY6YfMx8T for <buildroot@lists.busybox.net>;
 Tue, 27 Feb 2024 16:30:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AFEB040508
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFEB040508
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AFEB040508
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 16:30:37 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-512f7332252so3846304e87.0
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 08:30:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709051435; x=1709656235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yI6EI4PLyOwb5Mbfb+U9aDSReebynjCbXzyzR7HAgKs=;
 b=l5kTop511C3CUofgJAoZRAGtbWRakDYyFDvZOp7TEjA21b3n4G7xPd6I5LDUNgrR1m
 ETbEQQFEmNIpAD1lLlsvL9s4nUh0Pdqtv0i/1o2bqgK9C77ga3TNd8ek1z8m3kj98fjq
 lBE0EfLSmFphNoLr8oEe862J07RBHxaQ9zblg9sZg5Ua47r5UxoPrkl+T9xOdBd+UrLa
 r35otYQECgd+QBou3jBMZFJ0ZDolBIlNePS9Q1PutgSzrIXj+AQeSMl1pG0Lnivu80dw
 zZepgJyI4IQ5aNKGhoJHR4PAof3jQ6nfYPRpdHySPmGrxna8lPf1eZAX0jdR+RSgibnQ
 5G5w==
X-Gm-Message-State: AOJu0Yx3kB0dCJuVG6BuK1Ij3qdpecmknMBiFRS9HojnmCKVVURj0y5G
 1jBdRf3Cti6wOfeSS0OSR1JDFeaukPFhApfh7lyn+hjdP4dtNZ3P7GcVQAuXcPtOG+D9KqQdIOR
 9UAs=
X-Google-Smtp-Source: AGHT+IGLJr90UrGfHvEW1EbXEvRF2P5puuGMSo61gxTnNvfEMJoOdtKTAlys3QErcvfywpxV+uS51A==
X-Received: by 2002:a05:6512:39d1:b0:513:147c:2457 with SMTP id
 k17-20020a05651239d100b00513147c2457mr1063961lfu.58.1709051435337; 
 Tue, 27 Feb 2024 08:30:35 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i..
 ([2001:b07:6474:ebbf:e567:9129:29c8:388f])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a056402045000b0055edfb81384sm898404edw.60.2024.02.27.08.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 08:30:35 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 27 Feb 2024 17:30:08 +0100
Message-ID: <20240227163019.2876942-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
References: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709051435; x=1709656235;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yI6EI4PLyOwb5Mbfb+U9aDSReebynjCbXzyzR7HAgKs=;
 b=mgF0glPPWBGD5xp8maHOg9sBSsDdyeugT97/fCNK0Ncqgv+pWlobgMXX0z4P8snZX5
 YVsyQO+nM7zj6+4ld5EYSYTjvFXQjV9r/C88gURvegEwpr17mDmAb0nFojnrpM6nrJ9Y
 rz1H+W1BkYm3/RX7RDFCzy/b9F4wbK5lLKfwE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=mgF0glPP
Subject: [Buildroot] [PATCH v7 06/17] package/python-attrs: add host variant
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

 package/python-attrs/python-attrs.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index 8a1236cc4402..fb1729e62fa2 100644
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
