Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D070E606D4C1
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Pz1ELN4H;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yUlIlurQ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5980F408CD;
	Wed,  4 Nov 2026 21:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nmA3qFi9IDdA; Wed,  4 Nov 2026 21:00:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 031AD408E6
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793826035;
	b=MJjS25TZUxYsjl1+GPPM6P4NgnxKARnq5hYP/4rHDNaxE9IwIsvHu0CLeLb9Uv2ODe9Y
	 tvgF0CJBoJh7G6OKy5h8YFzUU9K7xcuYcQRDPoOXPoJQnmi1DZ6wOs6WbNjHdAm+36SRU
	 u5ifaMWM+rgL4Eei7y0H/syfYPjE4MjP/qEBzmWm0nFBXTAnn05cIwfFRYuu219Fba6Il
	 xAjg3t4/TZOuHpjZr+VmM4oR6B6ucDtEIRLMXyI+y/+nj1nziT17bcM4xEpkhvbgsTLIX
	 ix3toWK3uCfYNYgHWHiTh9LI+WgXgPdJJJR4DwGh1AzYlcj3ox6YB6NONh2epTWmv+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793826035;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=q+K9wiV1U51LnZYBqJbK+D1R3fduy+zR/Dcv57eO7Bw=;
	b=RMRXw0jQnqohQUDH/UOUJR+TssF9feZoWfMHp6Mfd+ki42OAUmpQDjdDudIe3jxA1P/9
	 2dUNRfx8zCu0Bv+5FW8ibkZem0GkSjOEjiwtHaDei1Wd2MWARi3xCeMfdGw/GSdQqH/C0
	 NbydQPltjTfj8ri+KWZmD0Oot2cVOPQu0VChRnPSM4m5d8i73qbWxqIe7zxI+G9lqKJ/q
	 C5kQ5sOyDwzT5XuheS6UbY3juOMBqoKMs9oCK2IKh0mrTYj10S2NfJiBw3kt9MXapvTiv
	 CZFb26nhElCjCSkEp6xBbG2dTx1+73pKvUuy/6E3EGCZgfULxbD1d2/tsHCWxl84u1A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yUlIlurQ;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793826035;
	bh=q+K9wiV1U51LnZYBqJbK+D1R3fduy+zR/Dcv57eO7Bw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pz1ELN4HOufQP+kHBYhBXSuk3/Md9PuqatLJiY67wpg4sSpdvO6B7v0IO0+yX7dMQ
	 +BvPj3tgdzVhJrXia+yVeHAc+x3aKrMbWfYqTl91ODbVGiyAJVUw4Re9AYHw/v0o3T
	 r9rTmk3fBHzKkgEydUOH+vMMMMokIoZ6k6to7PAGcP0k4hXx2W1kKF28K7l5vTrQg/
	 2IQSUrEQsXVJQO1d+sc897c6smJBNM0GkdhOHaL4+I9hM8gdKsPZjcK7g6YDTZ8z5o
	 ZVC0sCj1P8CrUbuZRqQdYqld7PpMUI3mGZ3ZaDw75d7gSIUc1y6LmR7VcPQuRzSena
	 HKtXExtUoHJ6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 031AD408E6;
	Wed,  4 Nov 2026 21:00:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4799DB00
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E87E408CD
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:00:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U9gCT-gX9ZP3 for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:00:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AE4C8408C7
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::429"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=yUlIlurQ
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE4C8408C7
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:00:31 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-48e47347279so704779f8f.1
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 13:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793826029; x=1794430829; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2we+VBexKoPhjICDbaRLc2epaLqZ2CNCpb2TC5Xw+7s=;
 b=yUlIlurQCo9on+G/ERXpr0Bvwqo1AXgBZ/xZVCFh7pWrsaVBMDLgA/26uPV+cr+7/w
 xYYM+BdHqtIgHheFfttOT05ncmgH3YseBOt0wZvCmgqlyDJEfHB9GkJZ06JZLcaA41np
 o0bUIW4cC1R3hEcj4Ky7ig9OZql6E+/n7z8NpDi1dyVzT6+xmPjLd9AJiqR76O2oQv9e
 2Yctmhv8HsxkalLR/HrjPGlkXzJn8BlYRJzAOOuKSZVw+flQ+6C7vVgbWtCrjj5vVBpS
 cQUrQvY2fDRxOiDhBLVmzgxV2etz8KuseYO10cvDaSYtpe2nGTUUDUc7vE16RdaPXBh0
 jBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793826029; x=1794430829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2we+VBexKoPhjICDbaRLc2epaLqZ2CNCpb2TC5Xw+7s=;
 b=pkYszEIzudhrOMfrxs4Gd3hBW0b3OCUvIJomFWUoc6uUoNdusI6Cxr47NaL6JNqF0D
 t2VVGUhwwX7/toH0wROoMTXtoSZ4F0kZ+A7N1ag22PxW8/jj7ofsw/2nqmyFVViXkJyd
 SicmK/Se3oNzVaReeerJ++fxwEovd9zwzdYb4/EE4+k5yMp+arjDym+PQyLMbbRt8/JP
 oMiX8zLJnkABrRg4axF097xTFfoAVEE1xgGkNHQQlxLH3TVtJRtXlp5qr75LqliQ1Pqi
 upqhGN+Uv6dUW1Ha8i0+cMzoLCqllxMmbC/IMJy+1oRLVCEvrYAoiK5SSCPGObo6bn0B
 Av0g==
X-Gm-Message-State: APuU4Z96yaV63AD7XGUbEIpfn7EnoIED9/ROU/KamtOeqYwciDh3eOm2
 Dd6+0FEl/wIdV2cGWNtiV0opF45HKaFrlAXXUcdx9fetD2yaCDW1r4+GRJ/6sw==
X-Gm-Gg: AYBFou1VtlOc7mY0CZubF5WnCTqelTlBq3TO57aDxUBUozMV+b3tuzrStcpJrXucJ/J
 y0Nfra/+rhm2T15z2srtBFI3yyCh3oPmuNx/PWtnSZdmir0MkIPoWu+hyH7Vdkt3NnR+5uT+12I
 RMDnZ1NZF04a//lQp1njUXFwbnFc7YLEV1XU+MNnw8941lc5xRD7E4No9wFPYSYFbOv4ab4oT2C
 MevWUEylLJtgSbVnjPM9DiPTsZZPTrH9ikwX4NNlcBm2FzMz6Ixua4lFi477g8MDlhERJd5cfK5
 ZHsvwzHNxU7/aZNAOA1Ssn4yjeeCvj9iDaOUSd17KGyIc2H4iFoa+bJ8nvmBFsy5TAMJBKU4gcE
 KTd5qKz22aO5ADwUmWCUn2QZb0KzxF8WZbHb2C9I7SVZxY1AQ+CdGUWq/njb+KhNf0tu4JuIc6X
 oPz46dXPLOUbrDOuqQErtt/XX1wN8SH4lFT70FU4nwaFf26qAJW9jRnktD8dt+pI/0goBITsBTS
 JTB0n03S6DDqc7GPjaPFpRJ/YMLxvlD5+RkyTfgQ6AQal2USVC0gIr1rl0LnKooZj3kxp1eoqjO
 xc5ieTHePlH1hueS9JoDGAQ4b/W2e600NX/XS4NcrdU9Cts1NzL8AQ==
X-Received: by 2002:a5d:59c3:0:b0:48e:3b48:6f1 with SMTP id
 ffacd0b85a97d-48e6e50b5e9mr37468664f8f.54.1793826029033; 
 Wed, 04 Nov 2026 13:00:29 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fec8d8734sm6100414f8f.20.2026.11.04.13.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 13:00:27 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed,  4 Nov 2026 22:00:15 +0100
Message-Id: <20261104210019.3509258-5-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104210019.3509258-1-angelo.compagnucci@gmail.com>
References: <20261104210019.3509258-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/8] website: version the CSS and JS URLs
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The web server sends no caching headers, so browsers decide on their
own how long to keep main.css and buildroot.js. Browsers which cached
buildroot.js before commit 445fb0d067 ("website: fix the recent
activity in buildroot.js") keep running the old script, which needs
the x2js library that is not loaded anymore: both the recent commits
and the recent discussions stay empty until a forced reload.

Add a version to the URLs of both files, so that browsers fetch the new
ones. The version has to be bumped each time one of them changes.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/website/footer.html | 2 +-
 docs/website/header.html | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/website/footer.html b/docs/website/footer.html
index ee0a6d0c20..323c6944e8 100644
--- a/docs/website/footer.html
+++ b/docs/website/footer.html
@@ -1,7 +1,7 @@
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/4.0.0/jquery.min.js" integrity="sha512-8LENNbXmzI/Gbj+OwXmqR6V4QaUAw0/porPzy1+dQoJqC0JPHedWoe0DDOTL2uHA5XXJyIsPtiMHH86pVlay6A==" crossorigin="anonymous"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.8/js/bootstrap.bundle.min.js" integrity="sha512-HvOjJrdwNpDbkGJIG2ZNqDlVqMo77qbs4Me4cah0HoDrfhrbA+8SBlZn1KrvAQw7cILLPFJvdwIgphzQmMm+Pw==" crossorigin="anonymous"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.7.1/clipboard.min.js" integrity="sha256-Daf8GuI2eLKHJlOWLRR/zRy9Clqcj4TUSumbxYH9kGI=" crossorigin="anonymous"></script>
-	<script type="text/javascript" src="js/buildroot.js"></script>
+	<script type="text/javascript" src="js/buildroot.js?v=2"></script>
 
 	<div style="text-align: center">
 		<a href="https://www.bestpractices.dev/projects/12245">
diff --git a/docs/website/header.html b/docs/website/header.html
index b64d091a01..406d4d545b 100644
--- a/docs/website/header.html
+++ b/docs/website/header.html
@@ -19,7 +19,7 @@
 
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.3.8/materia/bootstrap.min.css" integrity="sha512-lR3pptsOFflVTuIszkLNcibNkPReN2dEA/t1U1++B3/wPEZL4pysMdYsQfaMefLI/X2fjvk5AeaHVBcFoVO2mA==" crossorigin="anonymous">
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.13.1/font/bootstrap-icons.min.css" integrity="sha512-t7Few9xlddEmgd3oKZQahkNI4dS6l80+eGEzFQiqtyVYdvcSG2D3Iub77R20BdotfRPA9caaRkg1tyaJiPmO0g==" crossorigin="anonymous">
-	<link href="css/main.css" rel="stylesheet">
+	<link href="css/main.css?v=2" rel="stylesheet">
 </head>
 
 <body class="bg-body-tertiary">
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
