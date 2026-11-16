Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50375606A329
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=j2khljk4
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 278FD40812;
	Mon, 16 Nov 2026 15:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U20T8gxpkE1k; Mon, 16 Nov 2026 15:40:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B84AC407D6
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843613;
	b=Q3zC5W1EdWcQLmDhaYJftbEVeSzEi7o0JzDv669vUi5LC9jKcVmlN7nqtHFtBAjPYh5t
	 9vFEzDciQEFVWvMHBfcEi9RfbjopLVskCIhxrzJq3+pdoo8UKacfFQBz5hrz+VWDaAUlK
	 VMtUGjg2JruIFtSm+65p2WCPG2jz8H8UYcNvmcW7y4EMtbToYGxlrSLMCr8CdTZCKaI68
	 EeAqJnmpF7E82Yg8z+2QLsIRGCRvAgRtsdbzHrKA/W+0D1ohnnFCJxBgnt9As2lK3sMNw
	 YbnntOm+wvCSAc4QhgKMWO8wcW7l8vesAoeZO8lywi9A1Y3P+3jgcwu4T4ZXtEMB37g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843613;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=v4dE0pXrnH71s4aHk9qrDc4L6y5n/yorqdgF+3Aj46c=;
	b=RM/ClHNEfyHslSRXnmXGnveFbaY2/ARAVDqY4k9E58UjwtFnaBwl+lJe3pUfUCiVqvI/
	 +Y9G+rns3zMJH2KOftPOVgVMn4SVoit1tQHd9AjHy8biRt3Xj+xqVgVXi1eHSny+3iHAg
	 cDiH61D0ZphmARsRIYL7+gIp/Yv+4yCU9vR/X2z1sOxaW7cJn++Q1zKSoTNGd9ccW7gsE
	 BkJfHk50LVj4QJiufnl5cOQrs6HH+K9tjdVcSZ8VzakUq2HgJ5WLBQp/sWe/8XzpFrGRw
	 6sHdRWntx0dJfxkArQiczTJs5DVy8GQaEjSE9VgyhZL+k7ALUS5qf6xyq/d+ytfE3fw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843613;
	bh=v4dE0pXrnH71s4aHk9qrDc4L6y5n/yorqdgF+3Aj46c=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j2khljk4C5iQA/YEfeOTgePu7B9zKGOnj1aiPqn0oPcgTJOcjqa9a6C88H0KSWlDn
	 vDu29ui7OCK0BXadMKvUeVjDehetSWq+yyM55yaL8Q65GFEFRlf/LsxoCEhqBScsWG
	 ktwx00WpN0nTPNr/kOsg7yNJsrQUR/WXoSPs8CK9lOFoCpV0kfO/zMFSQhS01U1Pc3
	 JHhdGSn8sKjQQoB9cIwTC6Exrueq82wJX1lMsXlN9Hp4/p+/2wJ0xdsA/2nMHkiGR4
	 aJPBNqV0mXwv8MveGYr/57W3eFpqdU+gz+93i1LXSEKYafJoZeSMxuwq3rqXzq7xjz
	 TFIoqlXoU5Vww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B84AC407D6;
	Mon, 16 Nov 2026 15:40:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 91E0D109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83DB84009E
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wrGjDsuOyPF3 for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:40:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9694D402B0
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9694D402B0
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:09 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a1b07c3c5fso41137085e9.1
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:40:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843608; x=1795448408;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=la/B9xNrAF2irE22F6hbaCdFIWTHkibq8YAs6xzfYfk=;
 b=kVQZRL74fvyVRpcZ5nOVkJgXBZpq0g1DVALgfTZ45mXvsC/dFtGaM7x3t2UCBkYXyE
 jun5jYrwy2N6/9qGBeJysvuCCTDjlv6imXwa8rvImHLCYUKpxMQYXB47R9KulXv2eT+M
 S4X3S3RfupJJF2olwMLrtjICJMShDGXkRDwRIemV3MOZmKwaMy/sufbRqNysPgJxPiQv
 kUW/WEje864Qlj1l/heRjUsP/+vtHuE2ILw5TV2wXrizBKIfmVe0UjslTzIDQA8b5NQu
 keVER0UGNnRZlhzUf+4XdO7m2hwxFPgTRBGVJP5z0BWzyL0zsy3K1SgIgH7TPYthdOiv
 aTRg==
X-Gm-Message-State: APuU4Z8VdZ6vbR8k47/vWZ+FfPyFRKJUD86uAIkKdGZiq4XZUV8epkm4
 Vi6juzkrIR1l10eHIWmw0iMYEL8WZxmeskEfTVldCLp2bNfJ9egRgEci7zmNQPNVlBPLmK9W+VY
 QM0Wbs8w=
X-Gm-Gg: AYBFou3eR8ogo3+PHg/THOhaNuNve1a00kcgPaRQgfjQ3uLN1RBDV3AdUioq+zqyNnU
 X33kp+UJijMneoYelkFKyQ5u/MS2y7NOKIqa7d+1hV+2b6LXyxNPi1IxwzJRjvkoDC3KfoJ2dEl
 NisX5JIggZHKvDcdfIzS7m/xeHcrVGgoI1+PMyX12eZGh0NaxqVmHMyUztdDzK7kiU2YidJujrA
 eym4i9qFOA40ioxi6tNYcgzlncJLwHbGBuDl4W8as9km0To6BCvSoLGb1mGaJdB8m7afTIMt1K1
 hs5TZCTMQgXFdJ/QphydwDht+A2ZeDZ+TY3obZ3KvL2LJHdf2t8QWjQnOQhBIFw5beMPHBexObj
 rNpC7XwXUM5tdkZkeQ0n1vb1lNmbsn31S9XlXmlhEdC7KiFfS23loXVepxK1NF4ifF/7O7fxBue
 YsrG4FB3iXL/PT2N+3HHywN2QFLxQRcQOamiu+86uRmCtHxLCwlIV3HWU+a3an4stwQp/rEy5uv
 1+XSk4H1JVDOmKmDoh2gZ38wP/t9/FwcUIARIGK9oymnZ93li5oqB0ANK3Z6PYaNhyeM/9gzh7J
 e0WiydphLhzGFvrKKGQ69D9wZ1PPutLb7Mq91/f5pnfA+yFWA3qnOA==
X-Received: by 2002:a05:600c:8b34:b0:4a2:1364:252a with SMTP id
 5b1f17b1804b1-4bb559f7039mr229665975e9.3.1794843608210; 
 Mon, 16 Nov 2026 07:40:08 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e47sm18996147f8f.14.2026.11.16.07.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:40:07 -0800 (PST)
To: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:40:05 +0100
Message-ID: <20261116154006.725773-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104211902.3623831-1-angelo.compagnucci@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: remove Jesse Van Gavere from qt6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Jesse asked to be removed from the qt6 package, his only entry.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  DEVELOPERS | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 7ce992a683..1f86c777c3 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1663,9 +1663,6 @@ N:	Jesse Taube <Mr.Bossman075@gmail.com>
>  F:	board/freescale/imxrt1050evk/
>  F:	configs/imxrt1050-evk_defconfig
>  
> -N:	Jesse Van Gavere <jesseevg@gmail.com>
> -F:	package/qt6/
> -
>  N:	Jianhui Zhao <zhaojh329@gmail.com>
>  F:	package/libuhttpd/
>  F:	package/rtty/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
