Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CBFC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 19:56:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2E0961139
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 19:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2E0961139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4F20405F3;
	Tue, 28 Sep 2021 19:56:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L7SLCrMwUYfd; Tue, 28 Sep 2021 19:56:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFC3040175;
	Tue, 28 Sep 2021 19:56:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0672F1BF404
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 19:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9F2741598
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 19:56:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=broadcom.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p3wQRAvm1wcm for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 19:56:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6056741586
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 19:56:01 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id g184so227605pgc.6
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 12:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8kcmNoCXeIYfz1WDts/E0z+uM2HOtnzs6KadbzelSVU=;
 b=ZsafY95oC42GZFbCmVkOpC4uWuafsnjEXKSI9ORM3BThdbYdOmsBoPwrxCBicKnWEO
 aMuej33zLTBiXp8OzLZlQ9gARJcNnJRaGUmfvGpHHGrQ10EAUXWK2O7TrKCAkkHn9Mo2
 fqqo5GUt3tms7O3IYMl4Qi3ytRn6uHq1voqlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8kcmNoCXeIYfz1WDts/E0z+uM2HOtnzs6KadbzelSVU=;
 b=qX/qOk9kqXElPrukRO4ZRQNaEVKwPTtKU5NBfhO9+uGZLGHliKSq4zcRl80/satYI2
 ExFdbmrnjUgJGL5jY7GfkZDIGb2f2PxrxvJzE4C3MdyDyOVXn9UVocciBuFOmvnxwj4s
 AkK6Pp+VMCbZxBvVxBhllgXO8gwStTPlZnZkcozHLbrDNH/gBfDs0qcPg4/sRHPBZU1A
 8MLdvonADdOXxazSr/qZc6bn9qjz2LiL/SiF55rOqUs73sn06z/o2oupQ0bAoRs+sTS4
 4PV9EXC6PshPanE0XI3mZTo4LXYB6csUFFpdqYAbq+tcoXMLYwbd4dyKyDwpToEFZW1A
 y3rw==
X-Gm-Message-State: AOAM533eZq07UlTbsjBG5PnTU1wmgVhWy94oh3I/nSMs/bjjuIqcAcNE
 1KiLsmXc4qv14aKlrzLcO/WyMA==
X-Google-Smtp-Source: ABdhPJyePfudly/s6aZiRczWbID/YTgkwPt1t2GBFJHcinKAXLJ7kBmLKef2oh+Sdq9NUPziS5f97g==
X-Received: by 2002:a62:770d:0:b0:43d:aff0:dbec with SMTP id
 s13-20020a62770d000000b0043daff0dbecmr7363738pfc.79.1632858960642; 
 Tue, 28 Sep 2021 12:56:00 -0700 (PDT)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.228.250])
 by smtp.gmail.com with ESMTPSA id w7sm7907645pfj.189.2021.09.28.12.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 12:56:00 -0700 (PDT)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
 id 9299C2A1134B; Tue, 28 Sep 2021 12:55:58 -0700 (PDT)
To: Arnout Vandecappelle <arnout@mind.be>,
	Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 28 Sep 2021 12:55:33 -0700
Message-Id: <20210928195533.1736944-2-mmayer@broadcom.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928195533.1736944-1-mmayer@broadcom.com>
References: <20210928195533.1736944-1-mmayer@broadcom.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] Makefile: set HOST*_NOCCACHE variables only
 if unset
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: Markus Mayer <mmayer@broadcom.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set HOSTCC_NOCCACHE and HOSTCXX_NOCCACHE only if they are not set. This
allows recursive calls to "make" to work as intended in the presence of
ccache.

Without guarding these variables, a recursive invocation of make would
re-define
    HOSTCC_NOCCACHE := $(HOSTCC)
and
    HOSTCXX_NOCCACHE := $(HOSTCXX)
at a point in time when HOSTCC and HOSTCXX already point to ccache.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index d248bd76b2..71c0577030 100644
--- a/Makefile
+++ b/Makefile
@@ -286,12 +286,16 @@ ifndef HOSTCC
 HOSTCC := gcc
 HOSTCC := $(shell command -v $(HOSTCC) || type -p $(HOSTCC) || echo gcc)
 endif
+ifndef HOSTCC_NOCCACHE
 HOSTCC_NOCCACHE := $(HOSTCC)
+endif
 ifndef HOSTCXX
 HOSTCXX := g++
 HOSTCXX := $(shell command -v $(HOSTCXX) || type -p $(HOSTCXX) || echo g++)
 endif
+ifndef HOSTCXX_NOCCACHE
 HOSTCXX_NOCCACHE := $(HOSTCXX)
+endif
 ifndef HOSTCPP
 HOSTCPP := cpp
 endif
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
