Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02340606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 15:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lgbN1FKy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fqVI7Y/5
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D524181232;
	Fri, 27 Nov 2026 15:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLvzj5nmb2Pa; Fri, 27 Nov 2026 15:17:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2B4CF811F6
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795792640;
	b=E9d8iJ6pCxNODiM4tUs/yMy1iOrboO1wv98YjJ8D5i+HR3itb4urC0xJPG8JxqmpeAJS
	 i4W+rSCtTIMi6vAiKmW/fhxgVD0Gf7NdmSkaDbxh5Hi0cDSDV+7yBM4+ODuxvL9EC73az
	 V3DxlqONOx7OJWIf2avOmXex4N8gEzZYIMkvKIVXz5ZYGlnbINHljY0lJ78iwcs4cEH62
	 tWjWNFqj6AKFbOGckSiRMDjkvh1A6rvRRjJrYierhK0wEwVtQbbxwhI9doML4mw7L9ZvQ
	 bh+ESnadP1c+oTCUGW3g3NLFY2fmGly00Cwamh9EJE4f95Yh/P5n/o9/URaYW/9bwAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795792640;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ioqtWnyCsRpKdaKYNJXjcZJqaRmhjn9syKGMSmsE+Q0=;
	b=LvwALKq7aqeMLikzIgo8Q2DxkvZqMKjB0gzK9BkYHjrr7cNMFlOhCnw0j7daiz6VuwMB
	 yHgqqPR9iPtSBSNIkKKJ58RZKfV5eapv1WXtZXw+YsyTUnOYc7hS7i5sfgjVOl/Gl8vpa
	 f41wO3WQTZJwBRZv4iM2cZy4c9gFbjAgvbajrgxRAoTNmmoOj/27t5KjQnZWTg6AaDvLI
	 LIkbtB07PVNIvr968BSzuTlwpXnJAHDEaKXH6uYgboEZpcJqrdeWQPKRq352CM14rxZPX
	 1uywwNSBMN2AEGJufK+9Nq3lvo7eZ7dAcRKdG/lQEO6w+qRNo21k0it7SnhKyzz+bdg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795792640;
	bh=ioqtWnyCsRpKdaKYNJXjcZJqaRmhjn9syKGMSmsE+Q0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lgbN1FKyizMcvAcKA+/pNQ48ZuYozi0tA07P2U69c3/eK4AYHmOg2xe9TLNb8ckYV
	 GgSiLUx0XqtXUIN0uUE2htR4eFVgAlV2nIlAr3Nwr0+q0KugV308RDdJK8nzC9Ufvp
	 /YhOb4Zbcv4Aqt0zWc6vJV5vg+UcrXIhYXxLBItdNQyEa4/ldzMFv8AfXe1DsF0mrh
	 ewbPSNFwuE1V0G3OJIISlvS9sFIHhDz8pKHTKL4chzDukCk+gfAKixzuOgCJuZtIqg
	 WnCipt9VLMKVW2XSC2Es6StRe/p+Sb3qr//yD43TY29u54cy2dhtjsMa11a628zGMl
	 GL5sM+4dflT/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B4CF811F6;
	Fri, 27 Nov 2026 15:17:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F3150373
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4A714091F
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:17:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2aIWKfQrahS for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 15:17:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 22EA440836
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::132e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132e; helo=mail-dy1-x132e.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=fqVI7Y/5
Received: from mail-dy1-x132e.google.com (mail-dy1-x132e.google.com
 [IPv6:2607:f8b0:4864:20::132e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22EA440836
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:17:17 +0000 (UTC)
Received: by mail-dy1-x132e.google.com with SMTP id
 5a478bee46e88-386cf1041cdso5384640eec.0
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 07:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795792637; x=1796397437; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qofE55jDVc2nsHtEDDEdg0VLpWax3aPYPga1NoeEeok=;
 b=fqVI7Y/5JfG1XOVR7Jf3K3eVJ6iMTzQY7Xa5/FN1sykEfylCMu5CMljuauL8/Ufvm3
 6BLJHujiFLymSPmm9UD5hCElNaAAG4xYCTwuqvQnPySfoOGzz4wvg3T58+CjK9BkMG4F
 Fn4LudVwAfev5ljVEHgJwo6/vjo0XRrb4UqRZRlFtBDoqYlEkeU9WGA3laGplURwTu4e
 j2bU6YH3NGefWfOHPgrIdqr/TyPRgponLezvA/AclJXIQtWX/j2B033iQKGnZ7BmJeKK
 8uHdk9yeH8/mEFubWzwRwG/Ub+rhZ5fKV8JXSEXPr3GaMJx9BohbxpfnJaD19x0TfN5s
 glzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795792637; x=1796397437;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qofE55jDVc2nsHtEDDEdg0VLpWax3aPYPga1NoeEeok=;
 b=Unrm/VeLC0KlBRmzRHJs84j8PX1aIfg3e6LkQ/DsO3O5vCJsKUFaNPDwqhHZ7jvWLp
 OVs2gVsHjE/VTuMX4IbtXKNCNs2jg4C3FVBYhaQIVf7w3xpncZY4VG7hNyfdRwt7JnzW
 o5wMgnSGwotZdtxUu0t3eS/3O5Ca9Y8TleUrIyzxDlNwJXro30jo4kBZI9wYJZMFiWg3
 Dm263eu3y2uM5OX2OfYpvDUVsSKZzheWRZsGA6Lf6E4+XWhTCYP9+EumUXFEcC3wWTYt
 pHCrFJLGQw3+g5+s9UMUekj0/Kq61tLhCv4qCavl74sxJ+0oOJv5o4LyO2y15w3FEsda
 287g==
X-Gm-Message-State: APuU4Z+IenWZaTp0aJc6bCIljhA14Y9iwA2qEctw/44DUzEIi+CNiZQV
 VnwjNZLkrKUuv+JPtEETFGODV7881FKf8zXT0a41fPqCrBXLDhLMkF7UjpaTRw==
X-Gm-Gg: AZFdTZe+dUiU3gXISGPpyVEJKbX9n/d6nzM0eiGEZUetCOg2unnOWt5X2uC9YPd/h4c
 6BQrkhNKig/IGV7SkjinhHCxm9oA6++1u0/HrLHQR3E0l7GdPY8vWS4lYu5nY+tk/slrzmHWlTq
 uQYSED5PipepeWJTUQJM1Dsxf7CLFESjLHD3FHqa3Ltb0VV3yNmCC2+tqcIxA6zqbsAD2WOc5Wp
 BqXD7mLZlcTE57fGWzLdhvKrvkpxDE3taLS5CZXBY25pPU1p5X1ssynYi6b4F+8kTCveyD1Qc34
 RszEV9aH9mcNs7YjFu+c6DjLpj4RmzWD8oCcaTa/j03LaV8ozfKNpZdmC67NcMDmR9As32KZ/Q+
 7QKidmUWUrL/dkkq6jhiFkDUT9ZiSt8dy5510M5R6yQ76CVNTxDcS6txFPbQ4StGfTCo78fO3Ki
 DhxRF7ObQAWZKMYat9S/J7qIT36cVX/uMpPPW1hXti5kiDswavfhLhmrPx6Aa3Zi44rlDTzqSOW
 hjC2ma/kIk34E2W+AmxDY8q2dRimRBkQoIqaPzvDYOWbBAPctL5ilY10UIYRyVC5CKyaOhIXe5S
 tI3j7W3IBjFTJ2kZPCRP9UNXFGNEOUqE0euM9VHPi7oQ4B6TLEP+B1nhk9g=
X-Received: by 2002:a05:693c:37c8:b0:386:a0d1:1b41 with SMTP id
 5a478bee46e88-386a0d136aemr27257643eec.34.1795792636703; 
 Fri, 27 Nov 2026 07:17:16 -0800 (PST)
Received: from fedora.taildae27b.ts.net
 ([2409:40e5:9a:8d55:be15:fb2f:b58:26f1])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-385672ce402sm69496564eec.16.2026.11.27.07.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2026 07:17:16 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Fri, 27 Nov 2026 20:47:06 +0530
Message-ID: <20261127151708.2263407-2-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127151708.2263407-1-chakrabortyshubham66@gmail.com>
References: <20261127151708.2263407-1-chakrabortyshubham66@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Shubham Chakraborty for
 lzma-alone
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 59fad7f26b..314733164f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3124,6 +3124,7 @@ F:	package/font-awesome/
 F:	package/htop/
 F:	package/hyperfine/
 F:	package/libenca/
+F:	package/lzma-alone/
 F:	package/pv/
 F:	package/screenfetch/
 F:	package/unrar/
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
