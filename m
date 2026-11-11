Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D508606A31C
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 18:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=R4ghMw4J;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kOQ60hD5
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6FFE60E78;
	Wed, 11 Nov 2026 18:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JcQ4WfIXRqmE; Wed, 11 Nov 2026 18:38:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A0E1160F77
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794422292;
	b=BprcWwIyXtX+L+Pa3XsG+vOF6RzwqKhhMuI+r5J5PrCmSIMv0nBgsq2tYH5b/sj0CiXK
	 SoqJjmDhislR5Ax4PuQiv33WRa+T8hNZv2ZBUISCPObbTH6DE44T4kCd//B0960ulTIZk
	 Z3Q9Ocr3uxadQOwq+VK0qq5/b5mCcxBFRqnujkdYNla6oORrU7smcXAQxbcFDlKN4H1/G
	 eAHTJv/dm/AQC7LsdbzwnZONA4I5lLzHezDcB37wR0NcK1vCn/Cm2qCjlmadRDV0yWblZ
	 E41f7ZX0p6eXBlawk6hG92752K7D8LUBL9t55P8G5nXPKtJ131CMooY1pMeo0OrRTXg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794422292;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=AfEf9jC/WO/ZE9ZqAkXfwPoH3QZg9hNTnecyqZ9tXfE=;
	b=iKuKHRWiKIWcbD/JbiQhaWJO12/JHxyh9cJToEDDaGDXohLyv7AU/Dqr3lluTsmsJRGT
	 APsowFWJzHdRVPz7IqGrph29bqmGUI0r7+M7DJHgpupwZ2qIosbghW/oo/xaYF0zY86qR
	 CDwkymNi2/R5klmx4mvvADx5mpdSn46nLDELiIiHgir6u1JmwJxj07hKhaMWKxHq21+gP
	 eBi9ruj2qL6biqv6t3As+G7hjKVm7DQtu1K2+5aWPegzQK0xp/0fNgFak0GoTf4LQlW02
	 qA/lvsBObEisF1yI7T3lzqZVtRksJd+43pe9UvyYrGq5DFlSAWVS+nF7hrasI6tRQag==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794422292;
	bh=AfEf9jC/WO/ZE9ZqAkXfwPoH3QZg9hNTnecyqZ9tXfE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R4ghMw4JJkCBxQlROrQg+SDRET0E8NaldIuld2wUBf2QM5PAGeAFgbH4OyvFJb2Le
	 WzxxA5OWh2YrS9eeXpBUyGUP3Ap3ZBzkeTN6HCZbTc9IKkPdCVmTkISG0/1ydKGa/X
	 U9IoKcon256PXgZ52SciJdqDJ2GPNqX3EY/kQUcMCOR9HMqcIJdjYxFxQszqFDEepU
	 jGJXXHWEl4KVksSKhAuaTesF+piA5Tm0Zw7UWNBFDxhEEf2MTQaumVuOL7Ujmpj11S
	 WTeFNoB96NgfMROnZkYexo9p+iQUqHs70/sLjIa+VIM48mtAjYQ57kRd9DtK9JziO6
	 i64UTihpdu3+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0E1160F77;
	Wed, 11 Nov 2026 18:38:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A4AD335
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 18:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FC47412B8
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 18:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TD7fvb-vkwyk for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 18:38:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7254F416C0
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=kOQ60hD5
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7254F416C0
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 18:38:08 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48b001cd92bso1877071f8f.2
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 10:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794422287; x=1795027087; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hUVRaKJ+wP68aAYFIEa9CquhZOavzfEpPHKCqud/WYQ=;
 b=kOQ60hD5oqMSisb39A8HJV5xKQfxdWCLvq0ht6XD2wDGAy2w9sjBqhlS1/1zVzLEUD
 xKboaVw+PR1Aq7Obw57mK5wdnyDou1ep8sRRHP2GTMQJIuqgaKwQL0fN1rixJRtrltxr
 pXI71V4UV11UJhsf8+necfeJFekronu7FhGHGiAYpiSRIIZmpTTxzzh1VhQTpYzwAIRF
 Sqlef3txW7M2txNrHY5uN3xr7megjRL+7XT8ZFsnUjzXZlp8ERV2+ztD4gHMYdYoWQWG
 T36GQkWCqESvBzWRb2+s+QWMlojoRl4BGrGnmYWFRy3WwW/XVc2T0vRtmCLlDGIoxZIh
 sJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794422287; x=1795027087;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hUVRaKJ+wP68aAYFIEa9CquhZOavzfEpPHKCqud/WYQ=;
 b=XBBxw+p/6652fQJN3td0Pp4hXwZ8onGNcaAts8yWEIeJRzsUK9xS51a36DUGwZA2QF
 fwgIXxFBScXfCylvH0ssqBYi/pOhB5fFwsmi8R6QQGYi6wCQDKAjIJfB0x7rzpBqNPds
 zBEsQ9qETh+oV6jb/NlYDEzBNgzIDI5UxngY/zSPt/blZ/LexteFzk5MzFcqxWZ0W0XP
 xD/WgD/xMrE9SXZU8xN0+ZEiwaPIpzhNSbzL8PN3i2jtY888mMeVBfGHPywSD218iq3V
 OkBzYKVPm34nrMIiJQmzoi18UbzWJ8kVfkaiqe0tNkLRc5lXn/nf89iBzmo2TKdWLjrS
 UgWg==
X-Gm-Message-State: APuU4Z9VWEd9aBDiT+XnaSKpbTbJngwE8YaHmm7jQj0hdR/mqk03h2QY
 grxSvo6I56EZK2lfXWZq3xC1e/kGei2MaZnt3NvJuvfiFxQeHN9k8UQuK5r9/ORT
X-Gm-Gg: AYBFou0jwWipy3GtHGSHgnJfKEJcdMjTuKdm3k2AWvYWgBftXmaAF1vI961hviWtMrz
 JaGmAEn2T3uaTGQOaN+PyyFK839Qt5DPhcPUfU6RSlpopEVQkeZ3o4tphRpcm+vutbW8/ONEB29
 0eBG1CaTfc5TKoPmpXe6fFa5xupaQ18JIe2CsyIYSBRjYJuddOkOXDAnztJ0PG04h3fA6rx+l8h
 DmoW33azhcCVQpaRTbO4H9ygYUpZC7w80OVwua6AZKqjgRp117UxyoVOPKxlIdQ32pPfma7HDH4
 qtAwS64rYDrM5p6m4XLhF1MLM7dBubXNvFt84lBvXDt+agv6EWHi4yndZDL02qrl/19KepGfRtr
 MBGGx7Vq278uWL/pPoTdxRpzha7PmYAu6OBuL6ZwCyRG61dN+Cu91l30yopUQ3UIM0r4RBbg2kM
 3CuwWhiA72psCaUl/sIuUyQgQ4HfJeX15IxAP8ObMn07XQmxtGa2C4fZFCbIymJ3f8xZ8sU/UCj
 QmbL2oHF/FrFCAvgrpyYA1Gw1Iv8vS893OEcdw0krUf2NPuTQoU+BlTSmPdYLHSf7CFAdEqXOwU
 McvGtSOMiU1iWyHxjbZmdtvuKR6VFQBXFkZv///cs1LUvTsHvhQf
X-Received: by 2002:a05:6000:470c:b0:48f:bf3c:1631 with SMTP id
 ffacd0b85a97d-499c8f48f94mr5443865f8f.21.1794422286669; 
 Wed, 11 Nov 2026 10:38:06 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4988bdef64dsm11007672f8f.20.2026.11.11.10.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 10:38:06 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Simon Dawson <spdawson@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 11 Nov 2026 19:37:56 +0100
Message-ID: <20261111183756.2235235-7-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111183756.2235235-1-angelo.compagnucci@gmail.com>
References: <20261111154553.673632-1-angelo.compagnucci@gmail.com>
 <20261111183756.2235235-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 7/7] DEVELOPERS: remove Biagio Montaruli
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

After being reached out, Biagio asked to be removed.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v2 -> v3:
  - new patch
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index e540154254..76361213ab 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -558,10 +558,6 @@ F:	package/zix/
 F:	package/znc/
 F:	support/testing/tests/package/test_perl_html_parser.py
 
-N:	Biagio Montaruli <biagio.hkr@gmail.com>
-F:	board/acmesystems/
-F:	configs/acmesystems_*
-
 N:	Bilal Wasim <bilalwasim676@gmail.com>
 F:	board/chromebook/elm/
 F:	configs/chromebook_elm_defconfig
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
