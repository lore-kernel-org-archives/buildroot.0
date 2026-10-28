Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD966606A31E
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 21:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Pw7TpBW+
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD2E040665;
	Wed, 28 Oct 2026 21:38:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b6mAIlOT5219; Wed, 28 Oct 2026 21:38:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C54E5404F4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793223526;
	b=HpMh+8Z+D1VFoZWRRrUmxBJLBMZ3mnScHWIgkqkCv2B/NbQ2P9Id0V+ztIzTLy8whJAG
	 GoG8N7NEj72tg1+CoLaeCAB3heGYKbHqflv2tUWqlFIwBB8wOwoNdWnSInDhO5892rmm5
	 3BcEp8z2lbI5H3mMtnkKx3X7jPLn/ewHVJ81wc3j7PIBOlXCMK4CYLIHR3Skx7x7bbFU/
	 D/Mwh/osaO84G5pgeym1wYr98ywkKa3GESOkdJDjw2vPmohIJ7HD8JRAqooGK7OAWL7B/
	 ifloDQ1PAYa9351DnxkZUrl8wyH/AGAXDHrjgP2IGe9vixtcA6oC+aawSuABIPg1GKQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793223526;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Relaying-Domain:X-CFilter-Loop:Received:X-Received:
	 X-Received:Received:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-DetectorID-Processed:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Jcm7I27wuyHtg0ht+hSH9FlhHch12a1IRDRu8exWZJ4=;
	b=XwfVlKWkhM0uaSiZU4oYCSycJNg50Zkc7OKq37twGEfrycrOHIsDa6pQ1rGAhjMIFeK4
	 edqzfAcQapgtC3AksUhDT4CK4gdqWSFN5PzclFJOkUJlA6Wi4arxd9W7mrlUEmzu44Hlc
	 j+be0hiXm/NZv3TQiwEfuquaDN46qHV2gjOVV9xxyqAUdOEGLBtjP7Eh7n6Ks7uoCD1QM
	 fO33cFdAfm31Qf/U7u047mKFMNMQjgMuDXetEn7GGA98i8tmVz/Mn+3JjGArnpUaEZykM
	 8Z+BB5XCSe0fnVe/JpQarrsfAZwLQGbm/tZaVw/bvzNvrhFKZuMwREGp9fXzmEzdcMw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793223526;
	bh=Jcm7I27wuyHtg0ht+hSH9FlhHch12a1IRDRu8exWZJ4=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Pw7TpBW+UEe2cAv5p6cP69/OmlivZZboyVaOP0IyoPS9T46sPD8tdCGj5GalLz7yE
	 AK6lJO/EY5GpcxMrByY4+5CgHke8auQdoz5TAGJDKz1jwYPRPC+sUT/0/S6lla8MiC
	 FurgOVFqdnUCsN0XrP85lZdBcLdt76vFyT43xksf6vCx26UTGUGsQDeF77m1pYFsWa
	 f75QbvjlymE7zZf/KEfZg0MGb67061WL+cxyMw25asqxsG4151GCw81UCNW2lcvdw6
	 3vUGVmZoN+eK1Uj0DiSEer7cUR8Y+R6WDoQv/vYPe84vBxkNpybfbRIK2T0vF6Mi7o
	 21JIX5rRkT+Zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C54E5404F4;
	Wed, 28 Oct 2026 21:38:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 09BED235
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF3C2809B7
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:38:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w8sGtaO_kxFT for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 21:38:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E42E8808D3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793223524;
 b=hWj2kRjUf6/j07pnkvzitgyI/hda0BVBFiLbkXJvIqVpKG0T1AIWSCQzGMs/Mgk+LbSl
 t9F2lpiuUaphqyk02Q6cEcbYgoYPOku3d6CeaKFX1l6F4ED/bcVTb47ftUy5dBYuxyfnc
 /mwhPgHJvmfmB+9uHa0ucdA37ZT2K3VcbvBDki9wcXoIGrQZwADw1utHKlmeqHI0iy+bZ
 fPVKoF9vzvjMenBQoam8Dv40WZHRdJHngCXL9djoTGbnMedc3q5epPx/ea5xCbCiGFyMH
 +2/9id6E16cKc3Bp4eAfSOTWP0+1mKx1ZylgdW3SzA0eUx12xfEP7O2E6Yj/B5pvM0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793223524;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=h7tFvN0m6SnePsvzoN5sRt8FjLEuxKDeQQeKamwroyo=;
 b=mZ7aetYkxXO6/eVTaqvwnuiIVJCcFNEWVvtdk7B7ov7SKLN5NUj6f+FKdi5RmKCwPcIo
 Lggrp/7abRwXX9jYJ/raEgvHTssz5SwwUs61+hrRG60zP2bfnINT9l4HyuFkVa8bhJvSb
 +6qtxh0/JnJPGOmtKNKm1k3Pzp9nJmglYnlIz2NYJWodhZsRS7L3JmTKJNpXXKt1o3f7F
 zeuwj+4OfhT1pzJDkGpRyymLCZ+JrQhw8k5CpByRI9OKtU3U3J+UcZH/Dw5am/QJFCKy0
 KrmJWIJxI4b2YJNyv44j7N6zWK4v59UVT66MAgYYdPM4C7iRo8K1g7qDlOzxzrmJkaQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=MbomlWLu; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::562"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::562; helo=mail-pg1-x562.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pg1-x562.google.com (mail-pg1-x562.google.com
 [IPv6:2607:f8b0:4864:20::562])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E42E8808D3
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:38:43 +0000 (UTC)
Received: by mail-pg1-x562.google.com with SMTP id
 41be03b00d2f7-cd6028ff33fso819079a12.0
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:38:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793223523; x=1793828323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=h7tFvN0m6SnePsvzoN5sRt8FjLEuxKDeQQeKamwroyo=;
 b=2c/EqmXAibS9FbhiUgGLzmKEKqRWJiFBbWm/dSAOrd57ja8HEdPqgRJoTjcuuf2Ukv
 gIuB6+yzbVb/4Xvz58T1j+hP/PPf0PMzkIRq4O67X3cyxHVq82hve6NNY21U0q10WFk4
 fQQpDkskqt3UybDi2P83UrNuHTuwpAEwuhTCV6PcuQxKi32j0S72o9pQhC0JeXmpA3G0
 ZnudXqaO9J3/k3+oHBb8ZQ5pBgMxVati1yKqy4ruRKrQcz8zMD5XjWeHz7YtW72Jxofr
 1IFTkohNQLwmIU3N2BgTkhFEQuJdxYAqd6hDTRjuat6hKqH8IhmMMwwEoDgSLzlDJzwF
 knuw==
X-Gm-Message-State: AFq9FYKXDbqdU7CEMglWI9mSVYvxbQWoJe7Q7DtSRwOY+vlMLuDwN/Fq
 DCli+7UFVCbEzzTjGJYC2KsZps7fiCm2xo/rIqdt6z4SD8TOFKw2GY5KBtGazcfwzTIvZl31LrI
 1WShIqfMtqYnA/oPWbIZPdMedrqULV2KdGNLtoHDhlOhjaETHr0h+qEb/xj2uFB1NM8iytQr/QC
 dUd5awA2CXyEUZqXsl0ClZOTE/CeiBFLfy1dyWHe6LVnDy8ancRAGfUVpF3roafBj7qNmIDyu63
 +RWx/WH0gqHdOJZ3A==
X-Gm-Gg: AYBFou1ygy8jM6ir7aUnNf1q5QGaMzFvUy4Mo3RlTxkO7y8InL2yJL/LDgZmD2NvUXV
 +cAVol8iJI13+1Vm0XR24gdG2iQmqGSzad3H1dd9+QFKBA5GFBpWAOQ99yRRqYktIzpzOKYSzN/
 +vK99jM8+XuuN45lUJV+eBXj8uPFIxiDfebqFkFGdI7+j32OMWlkddeWMB4CqpVAqfiI/7YA+QS
 TuT66wWTAcnC9CTob9PRK6EySKh//T71LOrBydN9qE0+7VywBydf4Lniz459KEUqpwuo7Jul0rT
 1YKFE8Y0ZOxqJaJV7uVM3MCxO34QLfS3wSvUqBojjwhI1G808rea/uPkMGpzxoPAea/x3uvbyZB
 xgPV2yI/g/oBwHUbDlBHhfpYAkgo3CN28d/DrNT21xV6jFQkAw2yXn0qX6fvYEDwHaSyZBrxcPX
 e0JgxY1uRmUwPCi7Uk5lNW5wJXNHXLV1aeP7Plg4w5
X-Received: by 2002:a17:90b:224f:b0:3ac:8527:3fc5 with SMTP id
 98e67ed59e1d1-3ae57e2ed45mr2741156a91.3.1793223522610; 
 Wed, 28 Oct 2026 14:38:42 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3ae57ae6cb1sm840439a91.4.2026.10.28.14.38.42
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2026 14:38:42 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-5383d650f2dso30808171cf.0
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:38:41 -0700 (PDT)
X-Received: by 2002:a05:622a:888a:b0:535:cd9e:bfc8 with SMTP id
 d75a77b69052e-53fcd292bcfmr60225971cf.77.1793223521162; 
 Wed, 28 Oct 2026 14:38:41 -0700 (PDT)
X-Received: by 2002:a05:622a:888a:b0:535:cd9e:bfc8 with SMTP id
 d75a77b69052e-53fcd292bcfmr60225481cf.77.1793223520428; 
 Wed, 28 Oct 2026 14:38:40 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-538394c38easm114397821cf.7.2026.10.28.14.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 14:38:38 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 14:37:27 -0700
Message-Id: <20261028213744.511429-7-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028213744.511429-1-florian.fainelli@broadcom.com>
References: <20261028213744.511429-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH v2 06/23] linux/extensions: point to proper
 _SRCDIR and @D
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Florian Fainelli via buildroot <buildroot@buildroot.org>
Reply-To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Petr Vorel <petr.vorel@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Arnout Vandecappelle <arnout@rnout.be>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 David Lechner <david@lechnology.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Bernd Kuhls <bernd@kuhls.net>, Refik Tuzakli <tuzakli.refik@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

In preparation for the split between the source and build directories,
make the linux extensions look in the correct locations.

The patches or scripts are located in the source direcotries of the
extensions, so look there.

Also, the externsions are run as part of the various infra hooks, so
they have access to @D, so use that instead of LINUX_DIR.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc Christian Stewart <christian@paral.in>
Cc: David Lechner <david@lechnology.com>
(cherry picked from commit 301dfb34380dfaeb5c32e71758aa1c3706140301)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 linux/linux-ext-rtai.mk    | 8 ++++----
 linux/linux-ext-xenomai.mk | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux/linux-ext-rtai.mk b/linux/linux-ext-rtai.mk
index 50f79f8d5047..d7f55cf55f41 100644
--- a/linux/linux-ext-rtai.mk
+++ b/linux/linux-ext-rtai.mk
@@ -18,10 +18,10 @@ endif
 
 # Prepare kernel patch
 define RTAI_PREPARE_KERNEL
-	kver=`$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelversion` ; \
-	if test -f $(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/hal-linux-$${kver}-*patch ; then \
-		$(APPLY_PATCHES) $(LINUX_DIR) \
-			$(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/ \
+	kver=`$(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) --no-print-directory -s kernelversion` ; \
+	if test -f $(RTAI_SRCDIR)/base/arch/$(RTAI_ARCH)/patches/hal-linux-$${kver}-*patch ; then \
+		$(APPLY_PATCHES) $(@D) \
+			$(RTAI_SRCDIR)/base/arch/$(RTAI_ARCH)/patches/ \
 			hal-linux-$${kver}-*patch ; \
 	else \
 		echo "No RTAI patch for your kernel version" ; \
diff --git a/linux/linux-ext-xenomai.mk b/linux/linux-ext-xenomai.mk
index 5ec6891bbf20..0ebb771d8940 100644
--- a/linux/linux-ext-xenomai.mk
+++ b/linux/linux-ext-xenomai.mk
@@ -27,8 +27,8 @@ endif
 
 # Prepare kernel patch
 define XENOMAI_PREPARE_KERNEL
-	$(XENOMAI_DIR)/scripts/prepare-kernel.sh \
-		--linux=$(LINUX_DIR) \
+	$(XENOMAI_SRCDIR)/scripts/prepare-kernel.sh \
+		--linux=$(@D) \
 		--arch=$(KERNEL_ARCH) \
 		$(XENOMAI_ADEOS_OPTS) \
 		--verbose
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
