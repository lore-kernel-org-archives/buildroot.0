Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C81CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 480D961658;
	Fri, 29 May 2026 18:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CLjPI7xqIqQY; Fri, 29 May 2026 18:30:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0182F61651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780079438;
	bh=9OPrtk4UqORWdVJ+7TncImPFyjMMqVgCb6gYHgc92RI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sLu/vVyLnEPhJ6KleH2MUCVjmw+TVZvFBI0M2XQ60xtqtwxElrXSXCYb8/dD8HIfO
	 0ZJKSmqbNufuegxAqvoSfpW0LUjR1I1YOkIlydE3vwNXCHeGniFf8xrVFSgrCXGqqQ
	 ABPtFO8BbWL/MhaolVukGE38dvp/z6YUqmzCCDaEu7esiIHzyaqjhBVoQ9T6jnadD6
	 439D6SQns0STQsegKcjFzQkRVfb54dHfNcMK9+FFdMmS/7NAsIJlzW/RHZNq/2x/e0
	 lHgQYIvkLdTF/rmScZAFkzIcZZIQ/prQx4XNKlQEoOHW2PugOYzv11iGruM52sP1za
	 S30Ut5AtAXpow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0182F61651;
	Fri, 29 May 2026 18:30:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CEEED3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAAB840449
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:30:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ztenL2BSPpii for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:30:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0BE7F40468
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BE7F40468
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0BE7F40468
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:30:34 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-84229481d44so4788b3a.0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 11:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780079434; x=1780684234;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YWMtgmjDUHgmdZD0Qe+upveVRUSxf5WBtO4LWH3sbM8=;
 b=jmj621eGJNrmLWtyl0WeJLOVfWD+6e7J1/jrbm6gwfJFJ6HI1vJGjrShKUCdNuMTMP
 Es/rsJVdPayj0pX5sReIjG8ElGKhn0Wg6pUvC3rU0u5FzjYoYfktRQwh88KDNngg0R9/
 cY5UjZdgnBOCp0NDuCLE7c8fsm51ZW3HGZtwsA1uf/ieV09eH1TAaX2GhVMXsIxnhla4
 /j15hshVlLkTumAhP0cxFQK6/p2AYxUKMrWKjlbdSFG5giWhoehwayKxdlzly0/wvB26
 /gzDJKEJXGnUL+gk6sDMf6qQaiBpnp8lyABLijunAW74Xmk1mb9S9W7bVg4G3/LC8BYt
 fOdg==
X-Gm-Message-State: AOJu0Ywg2X9OH/VNp/sH0JNnieN2JtowBeOwajVnU1WyuN1wtMvjqgcv
 k4mNd7bJI6bu9iOvSpYAD2QFNMmoLb1I4e1wPbg6juLbPuiJadDfiWpADhmQqA==
X-Gm-Gg: Acq92OE0j8JWJ5eKmzl77y5gP+Zdcj+aK+kBHvvANrvKkvrkeJROtOSACA1X2+Trxag
 pYoBqZU4R3S4QdWEloCazLzDqPeDEHuHovhMKwVZxc/SAFSa3zM3uhXwqllDK+0LLsUoEl4rfTE
 /JKth3c01dbxafGbmnWtCRtn99pm51DRBzPvNkGkb+JE8TvqFJG4PqH7ZK2D09fw8iTd5Kxj6IV
 ONjIY/rWSXPKdsWbOETK2/Y6qqLXifj7PW5pz2qIFi9doc24SZzebwBK5PDbasqlGmXRS61G485
 2oX2ji6gwM6cgO9Mw6jw4F6peXu0gzLdWN1qasbVqM+Z6t+xGC5EuDzBPJz2ylE4Nl7SU0bVQvG
 VFrY/Dv6QZoNGssEmRjl3ehkCsLcpQRZ5IsUo5JGTwN+cxdkASG+4/DsdJqwfctc+8TStN+nKJ8
 AEnO8PhmA1ktkgP5rAJnr14Tiv79cYffOlY6ZoHD6qKuK2csi7RdMWe2yfF0BgRTDqQMD3
X-Received: by 2002:a05:6a00:3904:b0:82f:de7:d29 with SMTP id
 d2e1a72fcca58-842256d563fmr667695b3a.31.1780079434075; 
 Fri, 29 May 2026 11:30:34 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2409:40e5:1179:dace:7e7f:2ecf:e3f8:e333])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84214cc0d1csm2807713b3a.42.2026.05.29.11.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 11:30:33 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sat, 30 May 2026 00:00:23 +0530
Message-ID: <20260529183024.42619-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260326113620.2433228-1-chakrabortyshubham66@gmail.com>
References: <20260326113620.2433228-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780079434; x=1780684234; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YWMtgmjDUHgmdZD0Qe+upveVRUSxf5WBtO4LWH3sbM8=;
 b=oUATGZIULEhfFygsWHVC5ZzGmv2fczwbrjbW54r21oNTeCA8b25oysOPyQyp64YZgc
 6XSE67VbvCaaWX+k/kxe9aceAOaW4eOreeR/rP1ehCKRJFCdJWcSmdHrDckIuZBjz6Xm
 UkKQd2qYAt3ip8BMMZ4XQvPeAFNw2TVrb1w5Gb7QqaDR3uqd+HvyS2+aKakxs3mszC4F
 KD1sjxzaAU3FBueBe/AmHLBGh7ochzTYY0pI2AeRdHUukgL9YKvcv36Wohps7Ue6MigR
 XgLqAUZAANKlnLRnSg/74Ucj3arIv02U4/2YP6CnP8LJYo/M0nQzhvxTtp0Qlbt+YgyG
 0dpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=oUATGZIU
Subject: [Buildroot] [PATCH] DEVELOPERS: add entry for Shubham Chakraborty
 (unrar)
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a00627b28c..0f47e5e80f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3049,6 +3049,7 @@ F:	package/dos2unix/
 F:	package/htop/
 F:	package/hyperfine/
 F:	package/pv/
+F:	package/unrar/
 
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
