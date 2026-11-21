Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC272606A320
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 17:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OuomtGLM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N0kRvoGu
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A9FA606EA;
	Sat, 21 Nov 2026 17:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yH8K78MwczER; Sat, 21 Nov 2026 17:18:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org ACEF060642
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795281480;
	b=jl242KswUAzsrH2ldrWAROt4IJGn7vKDFC4mWTThp5ycEze6GQXJ76AdKpYXQop1Dwaq
	 2vE+QPKbhIYY9acLK3wPrwQNLVE7lT7z0YF4XTSq+cvuoghG1dWYEIeoLXeKm2XA6c0CH
	 8G4n0j1I9iwKTkln7s1t1+Nbr2MxM3a+20LhQ5/v/Ehk+4Kul3B1ar/rLJrsX3j0rXZ9D
	 +uOGRh/YMJu/V8lnI4mkv/6u/RmdlBGifcklUBz5lsoc2CDiFeoOkwa9ai5Y3eWyqFtId
	 gHwSisEO7h4buTifvr+3e/c4MrnyegFJyqSfZaaknBQjcEeIqoZ9nLcxcUkqxSGbvTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795281480;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=KGwDkR9MfoO4e6EyZ1xCwRrPnarneQXyiiO7s3QOtw8=;
	b=njOsYOU4Dy8rsP70WdWBIdehROrGnmIevBrVggC0D7IkD+rwnPMOcIkYPiA7QgdbasdD
	 3L9X92IWmHl1MPhTHA+sPqjomOzS21SuGYQa5h+/6c+k1MwZPaixh8nAOztyGn1wO8QeG
	 H3thHA0wOj7sjVBmX1/A6gKydOtWRJc9T9sL+sZ5+LF3LAo+kFTCMhUuJAj81tqLIRb0C
	 XNGgP2qn8C1Z0mYjMbIsLo+xPJETusqM1qyEWDH5b9KeJPbrzhnNqbjbDiXTdoM7JVLun
	 6A58u8HHM+zstQlOdQG+ZJnpTOq+bF58Vd/S4ABtUoCsO2BrHlYCm68CBvO57ioKVqQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795281480;
	bh=KGwDkR9MfoO4e6EyZ1xCwRrPnarneQXyiiO7s3QOtw8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OuomtGLMvjUxy39uJdYnTnrxgA4blKT7KiPq31JDPepsRW2uL2/QhdMgc0N/+6pBh
	 FlyT0xLRmIU+37JUPAoQh2b92/IqxltXL/cqa1hcPbR2K9ijYIJd+l8Piohf0EERAO
	 eibppbgQqbAskPSrUK2oHWQ1Kpw2CY6zC1Bf7FE2Osr3dYNEi0XwrW77YA9Y6ajeg2
	 krAO9S2rwL7YHkzknorYdzcU6PZ1UhQ1dmj84Mlim373Bgh9T1D5s5TMm9VqkZwuyJ
	 mypg6LIxvnk1a3Cg0ZOfVljLVuyODJeTvtI7RULPad8EQZqSg8Doz3dXNSRro2XbOv
	 ioQdS+SlWPKXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACEF060642;
	Sat, 21 Nov 2026 17:18:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DCA0215D
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 17:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2B5E40081
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 17:17:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QnYnzaM7hx5a for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 17:17:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org DF6CC40012
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=N0kRvoGu
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF6CC40012
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 17:17:58 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4bb61185057so12730395e9.1
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 09:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795281476; x=1795886276; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=G9smoLJdIRlbWtBgKga1SnUBsnTkh6maGm+YNT5lyKI=;
 b=N0kRvoGuCZQm9vrn6ry0DarvgES7hjL7/mLZp1B22cjXYaW5J3/9TWlTj/EeNikZaZ
 9VZX+7MEfF5VZDsTEZjQvigMxgNqxSf9fr0xsa43LPM+42mrFVj+bJXOUhO6TAHVRz7x
 4TmOdAF4wJ8NtqAKBk5dqWeilB2+hK+oEHaO/xohqSYsBE60+h1Ygd/yRbam6NZD8ntF
 HrRD2gBsHFk+Jc/sH6q+aUtsLBnt+X0Etgcmj1+W9RiFJuM1lAhA0usl9ZwErhVQMufX
 j3comgUUh2gW5Ns8H2dx82QLWkxA1NzG9Epv18/4VGCbIRymjAIjIM5Y4QLhD8dNsB5W
 WOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795281476; x=1795886276;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=G9smoLJdIRlbWtBgKga1SnUBsnTkh6maGm+YNT5lyKI=;
 b=1+AZkObCQvQsmQD/a+5XS7+WS/V6FufjNr8Cuhtrphx9z7m/2jBvrU0nIiQsTM7+ns
 cJiueuHuc2SR3XnDze1tIg0xiEUUoCC7NJadzwLAlIeqv1MvD2HBOzfvqJdJbncikBXe
 vwlr7G6N6OBxNV+i0CnSrepNxY7x2f8d/mpyef85M68ZyZbGdDO9v0HDtsNVeKeEyKAY
 LvrD+FvwiHZo+zD1ijK3aD6d5dtBdJonnTCD7i3DUVXB8BqInQxk7lXDpY/kger/fiL8
 dLn7B3UetK3EVwFwJtDmA/fIuVCfCrLhHOuIM/6jifTF47t7vPKPRK37ED+F0kZXKzZ+
 Zh3g==
X-Gm-Message-State: APuU4Z8cMRuJ1JcPusnOslhd/TYGKQGNVveFeNDd0NoFRZXQWiL+oxxY
 xyKDasv/tm237c0f5KMMzQ6S3CHtpUiWLuEkJww9YgT6rJiKtz93TWE+obRU8CVx
X-Gm-Gg: AZFdTZcAfwnY1NmD1HPWEu0xerukSr/k6kJrVuSasP/3491N1CNHjHpS6qHTIob16QA
 3VUNDhuAS6/dJqf5PkTlw8bl9C2WepEot9z6a31n2k8DBuF6OkitZ7QsXqBFRgNEX6naA5Knq/8
 I1oAdU7gkMaDzq/MAIGhufDz2W5hBILriXO2qxY+9Ectjj/kZpq9GB1CDuylvEDcncDr1QR9K+q
 TweRznI0gf3jAkDuToxKfInjuJZ8YI8cErY9TIOD6Elu5kmO5KepJUJ+QOkF3mRU5RtY2h2dNAQ
 gNzCzas2AtOo7z7pro63RmyM1IJZ7QaKazgZyNZxsyDHLlhV9IiyJyLAcp5NwB4b9nMpKUEGD0V
 RtmmAXoTiS1wn6ELcadcZmZM4FL+afy5d5qzXW4/N30/goYRSkj5Ee5ywz+daRwie0wy8x+1TYS
 Lzj7c/TkjGcPS3wXcW1llNWCp41qxb5n/WYaqGMm3cGeWVzV/nInfL3lDEcuudkRBe+ZcldNPAU
 BhdgqsQfOr8exwyX6uONn50YcEZgyRDZwbhYix1bb7aVGraRtQafiRrrle3nIdEyfhMmklydx47
 94t1xYcSfSPQ8Y0YQDapyEu3RfKPufF3EH8rh/Ja7JlGg+eIf0g=
X-Received: by 2002:a05:600c:1d29:b0:4a9:2a92:231f with SMTP id
 5b1f17b1804b1-4bb88804d4dmr158846415e9.7.1795281476178; 
 Sat, 21 Nov 2026 09:17:56 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853a9846sm247419785e9.11.2026.11.21.09.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 09:17:55 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Nicolas Carrier <carrier.nicolas0@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 21 Nov 2026 18:17:54 +0100
Message-ID: <20261121171754.3354509-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] DEVELOPERS: update e-mail for Nicolas Carrier
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

nicolas.carrier@orolia.com is rejected by the mail server:

  550 5.4.1 Recipient address rejected: Access denied

Use carrier.nicolas0@gmail.com instead, the address of his commits
such as aacca7f0639b ("package/pkg-generic.mk: local and override
support in legal-info").

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1d2960f9b3..1cfa212f15 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2581,7 +2581,7 @@ F:	toolchain/toolchain-bare-metal-buildroot/
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
 F:	package/uacme/
 
-N:	Nicolas Carrier <nicolas.carrier@orolia.com>
+N:	Nicolas Carrier <carrier.nicolas0@gmail.com>
 F:	package/bmap-tools/
 F:	package/composer/
 F:	package/libdbi/
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
