Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97682606A331
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Fw0MM+Lk
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72BF840801;
	Mon, 16 Nov 2026 15:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eHe-x9ZogX8E; Mon, 16 Nov 2026 15:40:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A01A140828
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843637;
	b=fALHZ/S2kFyIlAHqSvIuu0EZqKM06KMMMiIQGqpDoPzskg6lI4m3cnbTgJZalZSy2bEW
	 fVyTIExUUF91xXc/6GZvOlgGnECL/pCAUjXc6/Qp3Mv8+1QLJAi8eS/bx8d8h5nj9NO+9
	 q36Kqi8c3eaealXgqwv1y2dX190C2whHyQmzp7E69NKI6j+kVCV0/tnHY0ZJxOC4ho6lI
	 toLpEudh7SBignjC2BthuaVafdFmSe48qycCVU173C7Yso4jL78lmV8AqMGTPJf4iQfXH
	 HotcsesDi6jrYZX2cbLN4TGv5ukShsPRuFP+FwVvnuKPyq+zHLUQnsQ3TBslKGKHMkw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843637;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Aga54KLxgfbwqtIQv3RAx7JcGeu4xsdYkffwSkURgH4=;
	b=aVZggJ8NsdZVxuOzxzm0+W1R+IvaFzNA09+byYgUOFz6EW6pe1HHfSZ2cx/bJp2xwent
	 3sLXzyMKD3OwD3i0V6JgG5mzCZMS3/RcLOdegBvwACKZsp4DXv7hMGC08jxrm664Xdt6A
	 K7sorpdnhFLg9KpAjGvqt44ZPvao/P4VZUoGjqlQMt2zWXvI1weyE2NkMXR9PkMK9aIPE
	 Xe8cm4r1mMKlUqtKNp9ywTqi3njCB2Nt3Sl/qMWt5wg8AkBQZPMLSW1+R8dKDYUn/sq9I
	 xjmu0tew0U3LE4zlwC0NMZecSFmxqi7rpVE3bwv9gl0P9hPvRTmMcA1O+QBQ3kmXD7Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843637;
	bh=Aga54KLxgfbwqtIQv3RAx7JcGeu4xsdYkffwSkURgH4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Fw0MM+LkNZFUCBkazE0wgkrRdSQvpF2D9nhnLungowwM5xoV9ZEWZOixE1VZwrEO5
	 zRxqOAI0TXrNIeP8JCTkZfhsvs25R6ghIoXOR97suESHcLXop4DjmzrAtWZzQY4da9
	 cT6vvwOTgoTW/huZr46l5itcZ7Xw2w6XCSBmsj8rnYYXERXgjfcdCXcFUB6CkC+mXE
	 BXxtwFXuLrf73jFmpBbS0hQmfhjDiefwkBFxSauPevLmXuDinJJOj/nlOVZMnok9QK
	 khQXL5urfEATneQQlTXHo615OZW9XBoTWj68aZny7VQ/pO73adpnxOw9D4WQtrmOMY
	 sZC8D41aN5WJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A01A140828;
	Mon, 16 Nov 2026 15:40:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 652432FE
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56D3580ED8
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BWP53J-yf2DB for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:40:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1434680F0C
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1434680F0C
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:33 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-497614c95f0so1720483f8f.1
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:40:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843632; x=1795448432;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qjSkJIiKND7At3bdI4/uQ3Sv3/AxBbpG+dd/5q6ESkc=;
 b=fM627pyOpr3Q1XqP1LiI1gSKKMyY6+cDhIOkYdizZHBkkz07JstMhLb29o4D/82reN
 acLiSclq8EuWLFpUDWqcb3n2dwDcApX6B9AWI6cb6frGzSYfdCjMuOVVQdBuD5wUtOUt
 Zg/jXlOr9reQspQTzq724YzB35K1LiK80GRL3z0CS5Nd9tEKwNFQryr3fvVBiduLUysE
 fu5RBRkwPZPdAdTaxIM/Eo6331c1hXcU59dIJdTuEsOBvIBNvLfxH2SlVt3kDmog86Cm
 kqs6n6SSujId7epyhwbSqWJHRESiTkM/8peWSEYGuQaCIbqUW11rR0xIsRQDH8iEECur
 Xdnw==
X-Gm-Message-State: APuU4Z/xOWqYJx5QFiBsQdajfz7yX/qDGpKeeWN4lWPacDaXNWjaWknE
 8f4UPXMFv6YLjKFHNwM+WFtakEhQ60WQ0TYgTiQtRt8isgDEph4HYj1ov+Y4+dvT3kKhCZ2jmc1
 uJtKIMR8=
X-Gm-Gg: AZFdTZemKLjrDC9vNA8BP3q48PzNfzc7dpkC4EHtvTxn9CGmUgKnBTb+u5AoAhweuXp
 7BQ5EsfNC390vtJxU/T+Hlp/HyqoTLkOKUaS0Uxio3+UPmAArwKSEKEiX/XcUsQ6sIfA2Kp7/OJ
 LTgEd2b1eZ1kYpeMkAqaFCFKNn6KzyppkW0hF8c8rI2vLR1Jil0WboyjKezXW0dnzqnETW/q3L6
 5xElqZnkFkGBd+awbbf+2mQng/Itt2DrBgIb4H4/pbuPYJKzhYThjmBVQ630/ptvWFQgacncUsu
 lsiOCRCcmuJ3SZ1XJNbNteXBR19IPTOTeVdDl+Bfc3wCoDYBQXeLaAbuf7/6gC791tTjyyJ3qkO
 t7iizDgDSu0KdPu51b9yBtqKLipKFHbrMhQh++dsO+Yw4El4v60oBELzPmyIpWX14TxMmhzZilq
 NE4aS5HGgOHCTsPIIIUie/J3ziAR1LQIxq9g6b0e6B/aHoZwB4aE1b8st0tXU/ClnL45mwoDghj
 pwfhDzQhN9PMpB01TvyOlzlsSKd9QhHyDtxETqyOOSlE0qEFCWu93UIMIvPP3Ggsyd3cT5hapfF
 voLHB0yib3Y1km9d6hYS/bmFRcg+XwE=
X-Received: by 2002:a05:6000:2c04:b0:48e:d36:77 with SMTP id
 ffacd0b85a97d-49c6fc9db5bmr25988334f8f.4.1794843631895; 
 Mon, 16 Nov 2026 07:40:31 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c608cf46dsm24660660f8f.43.2026.11.16.07.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:40:31 -0800 (PST)
To: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:40:28 +0100
Message-ID: <20261116154030.725979-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105215744.3511081-2-angelo.compagnucci@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] DEVELOPERS: add Angelo Compagnucci for
 imagemagick
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1f86c777c3..febf03773c 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -236,6 +236,7 @@ F:	package/grep/
>  F:	package/gtkiostream/
>  F:	package/httpdate/
>  F:	package/i2c-tools/
> +F:	package/imagemagick/
>  F:	package/jq/
>  F:	package/libapparmor/
>  F:	package/libb64/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
