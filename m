Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E90CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 205FF845E7;
	Fri, 29 May 2026 18:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id muGDhDj0JyTE; Fri, 29 May 2026 18:35:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ED33845B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780079717;
	bh=Og/rNe0Klaai6sfn43EJnFdRvYl0i1K70Ly5CnEEKu8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qS45Ll7aqdBCn4ib4w5rVsJsrIMSfbwRhbH+sV4p2vTrI4tvAAiA3h4DGucbP0DiI
	 Lhj4fYA27gl+cPGcgN5EE7k8K72x5SmMxFuno8mfolriQntRYqGKbzBxA1kAqgaY6z
	 VsUC4hzuW6kkU160SLyA9bzyrjHV4/uBoarhBgnw4WZGwlyxNX6nERsynxf2cm2u8u
	 rrEZB0oauNIH0lskTtFOqRlPoS88SJe7nwr48EsULq/lrhWzLlShYBFc3lre+6d5Uk
	 +dZ9nEEg+LPlvqcL9UU+izimIxkeISZ4b/vriXdqtX915Pc3Vit0rkQ91EVa+FjrbH
	 s/lWDZ6zFOSJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ED33845B4;
	Fri, 29 May 2026 18:35:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2125AD3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B8BE845B4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lD7tHShugM96 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:35:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 73D32845AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73D32845AA
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73D32845AA
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:35:15 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2bf77d4a4e2so594935ad.1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 11:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780079714; x=1780684514;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rLKTXeZTPOpsQgs8dnWz/rH8OeDD/SC20WAE/GbPlvE=;
 b=HXh28ZwovT2+2tPQ/0S5eBTCBsbtRZKszzAPTkbwRKZacurANm/ygraMidB6VjH0LL
 xjIPGSEHiN4lY9EHzbe2oRid014YvejIoGTcFkeGfBYWwK0efiHg2DbPfmc/IsNs+zb4
 yjMxnRGKVl6tb5KqvEeI6X8q6gcFM98aJFaN4ZqAzSitqqUVLup/iGM3H3r7Z8uuUpLn
 NVJuNkphAhJYUWaQUdY1K9g3fd147BADULI+PGReutPAO9+ENxNCHL589XHEJOT6KwEz
 Xwd3TzgHcni3tDYHMa1NGfmPA4Q7GF9o+ETF7oixnCYmc9Exvvdte3FYfFyArikC9zfb
 ECoQ==
X-Gm-Message-State: AOJu0YxtlNK8XXjobyxhMvhObQq+/J1fuiimQL8FduktvNh+bLprDafr
 hCaVTPIjOgcbZ6d+o/f72ASJwf0GxFpxzcKkgJtgR8T4SJo3JPnhlvdAVXfJeQ==
X-Gm-Gg: Acq92OHXo4TR8UdqgfApHNIbZlnZr4oEigWhLDgOD4hE33LfVX0PW8NhPPAXvO0NjxH
 0ClEzJ6oafQ6ibOM6YGvYHJLHwzQb4jkOlit0Pt2AQBPhcVaXMpagdwN/bU4iM/VE0AoLKLBcdD
 KY21hIMs8HzuFglAQsdaTf4eGXj6B8/XlNV0WgpQj52nSPzPxZT2FucZfE2W30NOnL5wOLyGx5r
 NYGjoh1ElYKRjoMyfyn6v4Cj/XiBrwzkd49qu4f/6ieBhxmPmAQIYQXenbYIdb34tf2Q1ZfhdAL
 cLhXkeoJuIs2gizRq+/NK1Rko4226OURQ+NqGRHG9x0pGk6baeK/Tq1vLJtIkf86tG42JuZLkmU
 EuMXFODfWy9H8I59yzDtJ8ovwARhKhapGyTh+kErEifL6IgF6Sx9Sr0fml1v94rSbOHMelTiu+O
 jibsnbFzGpRjcxfht/ZEp9WRsJ2mzjWHgk72lzEldYo2/36sJQszT6uRSLE0jvR7hj4+wP
X-Received: by 2002:a17:903:181:b0:2bd:5ae4:26d1 with SMTP id
 d9443c01a7336-2bf2050f5a8mr45310785ad.17.1780079714489; 
 Fri, 29 May 2026 11:35:14 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2409:40e5:1179:dace:7e7f:2ecf:e3f8:e333])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bf239fd85dsm25762195ad.25.2026.05.29.11.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 11:35:13 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sat, 30 May 2026 00:05:00 +0530
Message-ID: <20260529183501.43524-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525185212.40430-1-chakrabortyshubham66@gmail.com>
References: <20260525185212.40430-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780079714; x=1780684514; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rLKTXeZTPOpsQgs8dnWz/rH8OeDD/SC20WAE/GbPlvE=;
 b=f1ZFp1PGy2zjNZpNHHqp3j6xAQX00q9ZGiKJ4mG9IURk5EFUa7W8RZKEI8KxQtdBVN
 3JmNuoFMwkqAUMzVkv6B5sXZ/uJ/b9PFBm1DjrqBmI9mac4jfWjCMb6OuwgyhU0u8Ki/
 gCQODxJhTicGsFSu/DJQF+aCMjytxk+4Nl8v4J5M1CBbf96yTCMEKEgHD0BUmvn8eej9
 p2tjwwZp+0ifjN2472W8ycqUsMbi5GIIlLISt5TVxOGeBBDNlL2V6RoAT/2HXmsuXo6D
 +35tX635oH3bipmQCQAmpHhTetI75tDvyWqtl1UK8Z8eQ86TMBaU3Q6cdQPrI9fz73DG
 r2Mg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=f1ZFp1PG
Subject: [Buildroot] [PATCH] DEVELOPERS: add entry for Shubham Chakraborty
 (xterm)
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
index a00627b28c..dc8be7fa9a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3049,6 +3049,7 @@ F:	package/dos2unix/
 F:	package/htop/
 F:	package/hyperfine/
 F:	package/pv/
+F:	package/xterm/
 
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
