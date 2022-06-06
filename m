Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB44DC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 08:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B435417AB;
	Mon,  6 Jun 2022 08:51:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IdLKvUnplseI; Mon,  6 Jun 2022 08:51:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DE8141620;
	Mon,  6 Jun 2022 08:51:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E0091BF39C
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 08:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CB8440546
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 08:51:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WSSs9wiU840n for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 08:51:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9F514010C
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 08:51:20 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id e11so12190827pfj.5
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 01:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Cm8jpbqDIpEVfRiBO+yex5BQFMgKfyGlguXQxTDxLs=;
 b=SzqfdIdX5kvSGoA/vdsILn+B1JjH5Kb+GcfetQy6WkV9br6TaFkjALmcwMOGjkGsBg
 iZ6w65LzCupKeGUPm6ySzknjOarmsPKcerF+52l7WZ6oQ0skyplDUzK3z+773tzC8gyd
 VBm/YiRBVcfyQI0gECn92HZHYex8h2A6NE7XMxS23801vOz7Y1Xco+UsFc3lEH8aV74A
 imfhEmYZTIhu4AtZFkgKg0N6bkRu0x361rE3/n92bHMxusNBpURR4g+Sh1K+TGn9MnOg
 jUITZYwnRsfRz9CvBc1Bs9Y6/kzpfrwcg4R9/rhHl5HjXB4OvSdNf+D+KaX410jW593p
 lZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0Cm8jpbqDIpEVfRiBO+yex5BQFMgKfyGlguXQxTDxLs=;
 b=3Yg3sGhuMw/3OFbO5xeGTH1Kqh776Bcfuta1lLLGgw9QzyoBNQshB2xi1TuPC2dBDT
 t26P6Hovp2cekODek6wIXts0mqFMT4oGATDxYX9D0q9mNUrr3edeKZl3nzZwt6+y7eRB
 Duygwqrqc/2CM5MCelGEqkc2TD2aG3LJJ8GgsbuJtsquzhmUl/pMCkhWki1uU0F7e0/r
 eH9sAI9oNVgMHMszD+65d23KtkfZZDm7MbZTkcmq1JslmRrGdz63Hu/A9Cyrjk3Oy0fk
 vrD4Qk/779OdWj4aOclDv2RdAgRojUENAyTPDMghCSwn7hfB6ZtmnWuqZ5FiT8xkKmjO
 EHGQ==
X-Gm-Message-State: AOAM533HkvFDcRmVvV40trWamMFZAjwsNAsDJh7zWLYQ2PDvIrfDaI07
 ayhqs+bdvjrsYFtgV0SExQEzEvfynUk=
X-Google-Smtp-Source: ABdhPJxGxs/FBuKEmEmT4D90eKtYX58aMhbg8M5K48Bs+amiqf67rNsrpbV2/6t6tjqwxefijuWgpA==
X-Received: by 2002:a65:6bc2:0:b0:3fd:e6a4:a3b6 with SMTP id
 e2-20020a656bc2000000b003fde6a4a3b6mr664757pgw.196.1654505479613; 
 Mon, 06 Jun 2022 01:51:19 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a170903020200b0015e8d4eb1f6sm9975253plh.64.2022.06.06.01.51.17
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 01:51:18 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org
Date: Mon,  6 Jun 2022 18:21:07 +0930
Message-Id: <20220606085108.1628288-2-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220606085108.1628288-1-joel@jms.id.au>
References: <20220606085108.1628288-1-joel@jms.id.au>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/librtas: Bump to v2.0.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Includes build fixes for musl, so remove the glibc restriction.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 package/librtas/Config.in    | 5 -----
 package/librtas/librtas.hash | 2 +-
 package/librtas/librtas.mk   | 2 +-
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/librtas/Config.in b/package/librtas/Config.in
index 11660eb2817a..2f8219ee98ee 100644
--- a/package/librtas/Config.in
+++ b/package/librtas/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBRTAS
 	bool "librtas"
 	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
-	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  The librtas package provides an interface for Run-Time
 	  Abstraction Services (RTAS) calls on PAPR platforms.
@@ -9,7 +8,3 @@ config BR2_PACKAGE_LIBRTAS
 	  and parse RTAS events.
 
 	  http://librtas.sourceforge.net/
-
-comment "librtas needs a glibc toolchain"
-	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/librtas/librtas.hash b/package/librtas/librtas.hash
index de0c0a476cac..8d4c4e191235 100644
--- a/package/librtas/librtas.hash
+++ b/package/librtas/librtas.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b47b2a6f140347ac265e2c66ddf68293f6cdcc7c0c9a78c6e21ff52846465415  librtas-2.0.2.tar.gz
+sha256  1b951422ec9553fa9d5e5e158fd8e298f867f561189fff6817a9540d5661f145  librtas-2.0.3.tar.gz
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING.LESSER
diff --git a/package/librtas/librtas.mk b/package/librtas/librtas.mk
index c92a9e2fa494..458d7a0e478e 100644
--- a/package/librtas/librtas.mk
+++ b/package/librtas/librtas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRTAS_VERSION = 2.0.2
+LIBRTAS_VERSION = 2.0.3
 LIBRTAS_SITE = $(call github,ibm-power-utilities,librtas,v$(LIBRTAS_VERSION))
 LIBRTAS_LICENSE = LGPL-2.1+
 LIBRTAS_LICENSE_FILES = COPYING.LESSER
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
