Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FF4CD6E4C
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 090F4845C2;
	Fri, 29 May 2026 18:31:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AFESbiCA8gEz; Fri, 29 May 2026 18:31:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0B8A845B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780079464;
	bh=Og/rNe0Klaai6sfn43EJnFdRvYl0i1K70Ly5CnEEKu8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OW/H2jF7jfAxab6bspc/t19F70h4AJIk5ZhUGwOhTEl55MR+Mkx0MeH4DMBQzRfcs
	 X09vo9PlmENzte7n9wuiZ5aey7lXc8t3BTw8ETIOsW5fnPq75zXrVi0dF0ZHAxoVZb
	 aik515FQczDX5Ios2flrb5X/qLAIQHO5cqpFxGmCwpNiyJOJ8W9XYgABFIBdbMsKht
	 cnASkFV6tqzSXv19EQ7OMr7WKjUk1d62k43RUY/327V6iHgFcCtbvb2d4uA15strl1
	 IWXLZNFfZp08QxeKKdnq+6f2bOSIsvbi1LrkQqS4NOx+RJ7/pGGctWjl6rqaFOBwnL
	 q/FFvnvTJCFuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0B8A845B9;
	Fri, 29 May 2026 18:31:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0853FD3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD26D845C2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z6TQVaU_Bn5p for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:31:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 32757845B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32757845B9
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32757845B9
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:31:01 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-36ba706ab46so1014930a91.1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 11:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780079460; x=1780684260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rLKTXeZTPOpsQgs8dnWz/rH8OeDD/SC20WAE/GbPlvE=;
 b=sQEd3oQcwtzS1dandL+pXxuOXP2KMEIKSDYO3uh+ERA3F7uznH0SNWumedafst0jq6
 766w69fz4HLKkWaMFLvb+PDsz2TkVlR25FeblEAJT/MiIm6mmfxkny9y44xNv0RAq+Iy
 DqARZqKvuxopYlivdQhtFQape1XK/Zz39jFRsBMkeNNXCICqme0C+82+mLpJ7RLL8Emk
 /GS3p9uKg/Ukzw76OileI1VFH5X+8H0W9UdwBNKiFaDF33+MWiwS5MEoweWg2a3jC48c
 Ca+9eDYRtEyxcXXK/9yp6PO7JbX5B5ZGBAeOHwJvoRNIzoo0YhxxFQ4Gnwc3Gf0D1XAS
 kLtw==
X-Gm-Message-State: AOJu0YxH8saC9FAtwbyHRvtjI1nuJoos5DLGXasIaYyQ3hNQ2DxdsSv3
 nXpf6SvkNI3xlsTnc7s1uZRF9I1abJA3BByMYBZWZOXe0cdNm9FeQoqGfJIHoA==
X-Gm-Gg: Acq92OE0AqVtWPNOniu6SUiesJYrNcEyTJbGPty1Vbn3AyvRc7SuT+F4Kh6w9jV7cxt
 IBW+dgTJcDKsQTwZ9mHLHz6+TGbJPHrNVpgv2TH/NIJ2QyeUxH81zquPJPXERQSjMiGIi1hRfFg
 kMYzP6uiVCAZVzwUf8CLO36FVF91HJOAN9svPZjCQitF7NQBKuOkT6UA/C20VHM4xI5QDOgRe0s
 8b4u0JwPmPoP35jF7WD/SQMD2Bgm6EilGppl2jCEO8bU3GNs/TeQxBhnRq1cf1557i/7RKXHSJ3
 SsrBEaoHLEPIEZ/rAFqzREpYyOzJAhwG3+scuKr3kCnOoKQL/JwoXvY0E0GsM0xayFyGcXeYWYJ
 AzExywwB6CBnkCSGbmIp21LP1eXYn8QWBx1kVZ/We//wK5eh2Ysnvotlx6z+0eZxmQLRDorOdOs
 oPPqVoAAFAqhIjN8L4w3D4gMb8Zt/4ZiWdJBa9Pit8pROv9KYaPPJTExuMk6TzcsoRiqXe
X-Received: by 2002:a17:90b:17ce:b0:368:ed92:6f6 with SMTP id
 98e67ed59e1d1-36c4fefb653mr302474a91.1.1780079460237; 
 Fri, 29 May 2026 11:31:00 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2409:40e5:1179:dace:7e7f:2ecf:e3f8:e333])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36bc6a340b7sm2666302a91.11.2026.05.29.11.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 11:30:59 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sat, 30 May 2026 00:00:51 +0530
Message-ID: <20260529183052.42728-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260326113620.2433228-1-chakrabortyshubham66@gmail.com>
References: <20260326113620.2433228-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780079460; x=1780684260; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rLKTXeZTPOpsQgs8dnWz/rH8OeDD/SC20WAE/GbPlvE=;
 b=Wht79op+nb3t2GpaRYoCun6jewdlW5rcAFnZRmkHsemIJFXRi1uYZR/yQ96K13WCgr
 UicBUwjRWu++y2KWfzzEw0TkH81yDvybPvSZV3CHqGB35IEyVglReo+mloFTQ3QeLS4E
 fkH11yOWNdno2NOWgkw+J6NbOhg0Ue6eCvssi3GYnsHOcI572EU0DcqM9fPzLbHFWU1X
 hj8N0LzM4JJTpGei6YvjnIYcJcWa3SYip4bymsvzmQR2+pLB5BJss9B8aGybKFnLBlpP
 4OriVmciZwUkg0kfznfz60YtoiZZEYlZJLBg8kRHJsgB0H97/8p3mmjHfbFKE0thLv2z
 2MiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Wht79op+
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
