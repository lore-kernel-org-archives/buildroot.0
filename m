Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B64606A31C
	for <buildroot@archiver.kernel.org>; Sun,  8 Nov 2026 16:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LimflTrZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzN28Wvw
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20F4280E15;
	Sun,  8 Nov 2026 16:12:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iUF5HhdWWWy7; Sun,  8 Nov 2026 16:12:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2AE8880DE9
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794154326;
	b=MrAFlT+/3WT0BV8DvKsRV8Y73V5E3K7aGNWNikingCfUE8X/dXcaTVadumPTPg3PZV3o
	 OKvUoNEx59016JZWrZQeJ9bWtrGa3RkO4ps6UkeyKUdsL+TBXvxJrhpqvhbcLp6DhCsV3
	 KouZLKWU0ldhu5UpKZpDsXFKdO6dULTq+qEjferDdrFRaIvVc0uHQ7oC2tubmKgEuLRIj
	 G7r45jLyGD/x7zu3pBVH/NX1VRS3OTWhCNGG3uQb0x+k5piSs8Dry3aSWMQFdhRPMqSkH
	 ojPviyC/l5uwfuR+543Zd3CWBw2JB8c9iHxVENBhrbZ3sFTYHyb+KPjHmLMq587Gz6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794154326;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=spozD8oxpyC19ASyI9AjBt8JsiPFtEBiQI09jlG97Yk=;
	b=GVdzoMqPMyJHLSRscAfm1bmWdt0/UAvPj9301HTzaoi7n3PFELLbiHwqjAx9kaVk9/CJ
	 WhVVWkFdFo/n9AHPM2mzdRHgOhj1XlYkMjkAF5//wHTBZ6rY0txAcuYXeg9Z//LKSOMhj
	 OHfABqOc6gJm5EobfsxasPGqyMrghkSnCCWA9lhzftNKC19p164xMAKkfHUrGSURUkJ09
	 ePYLghSK8qOC0Ey9roPxPz3a0NGuH2Fcgbvt4G31nW3+jiNNO7b94obOJApDf8thw7zNV
	 ccIJtMU2rspJe0k2O0rwxotafQvc3n57eQttjkbWLjACPFXuiKq3Tb+iOI/UfiMs02Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794154326;
	bh=spozD8oxpyC19ASyI9AjBt8JsiPFtEBiQI09jlG97Yk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LimflTrZC5+hZ/ggstVsu85Cwg3Nn+XG70ap5ZeTfprznZKezi1guRhcM4EcYHuKo
	 m26pt+Q3J8ZODTIpOXppNJYs0vEwRdrhKLmUHhdsDXVb/XVc3uGc83zn1du2i1/mXs
	 yln8Du+Ve+uFJBNYIPENfpEp+xibG/NV5SteFolzP5I+izqyJi15rOoJ8u+Rl4Rizn
	 zHRbE92z10VcUUiVYVB2BFeGrmI1Z8jXBL2X5TTXNZXEgqgbKw0VTySa5KTNqnLtjS
	 kqyYd4fQgnTkqIlyorpvosHhgNcP/tfd6DwYXfksdsJ5Jkpi79ooT8eaMv6oIg59e9
	 Z07MRCE7nEuiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AE8880DE9;
	Sun,  8 Nov 2026 16:12:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D37B932
 for <buildroot@buildroot.org>; Sun,  8 Nov 2026 16:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AAF74005E
 for <buildroot@buildroot.org>; Sun,  8 Nov 2026 16:12:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TmUPFbQ-gY9N for <buildroot@buildroot.org>;
 Sun,  8 Nov 2026 16:12:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 70649400A8
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=fzN28Wvw
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 70649400A8
 for <buildroot@buildroot.org>; Sun,  8 Nov 2026 16:12:03 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a3517554f7so1274505e9.2
 for <buildroot@buildroot.org>; Sun, 08 Nov 2026 08:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794154322; x=1794759122; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=I8uQsxnEItvFrhAMitYmtO/3NY4g7A+EwOCWQCOu7C8=;
 b=fzN28WvwKVpeIw9rA6RbEHA28A6byDdN2vl8alN4zA+kFNV5eQp7BJ74uBx/0Fw1Ut
 x+cnEfztp5Q2Y0PtsdW53b70bpQGz5MsWE4Yb4cwmhKQtQmiW6p0Mc6h72nuNTZV/DGf
 o2rQsrv60RZK2ALGb91YZxQrkE/rgQxQauOkGbJlf/DDkgGPScoH7tE/RKQXZK9rjv3R
 C4SSVTA4H5UJiG6dKw5VYcHVgwwUiBHC1llBRvOavl6PLp8fujEHhZqgVvAdsYnRs8jx
 N8aNZi8WSkXX0BmB5tWv3ExoS8+iZy8e9fWoigXg8lrFw0ruBLiCYH7J6dkj2vsD9yAW
 3YCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794154322; x=1794759122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=I8uQsxnEItvFrhAMitYmtO/3NY4g7A+EwOCWQCOu7C8=;
 b=y23+dhBzq+i4P7qC93CIZTb+RK99Xu7BJPLQGx4iPmEPdtkkjbsa2c5m3+oHIUOcTz
 Y7+UddG9hAVZQjJDNUgglSMIMi7ufwqYwZKmZs+EOWZfmeKwKg5yu4QrX7BByNcxrQ0+
 1we5VTgv+DvO+BhQetVDrE2mjrSYtwMYawVO6IDJkfaW3n3iDlVIEy+p8qF5jL4UUsif
 WAtaavRMZ5H/LCuXQqNitAm4X68B5tEMYM35efeLR1aP4ML8fjq0WlsVPY+nT9Qxl1c2
 +gC377FchiIG8GfJmDdQh2XhJboyRiKg1nryq0wzOtVWczgMuttgg6Wz6C47v+IOlUAl
 bieA==
X-Gm-Message-State: APuU4Z/b+KnTaxx/Rocuw1ci1fLftHBoyyPYULleJapTEl8VaHfLGaZA
 HghZoIn6b+q+x6nHWugKoXNFipABGYXOV4mkL1iRg6MGzSkgpKaetuScq0lC
X-Gm-Gg: AYBFou0mtIOYindT+wQGsRZ7RpkZ2RQNCsL3EEILGtWaZfxAtoiaZfkcmWT5YZQdnUU
 oky+4TlzTUh9RstbVKVlc+SI9awoaKOlRDrmNC5pqmEI7S+4IUPJw5/gDIoAwe3T0AuOcOidGVH
 pE2Z9vFa448Na+MhqEiSEKtesV4lx/lkl9w54v533GW//G8HRvc9Y0oHeuMWmO2xK9JWcYVfLfS
 4CjbPLK2B4oz/dKkgvC/RV8bQppgMODNzdW8WI4TU688X61NQ6LWxlgcWWA2DFyIGwJFEiqcYjz
 q3Gbf8BBl214WGr+Pqti1cKbnq7C24impTVjCow6GA+JVfP4S1v2oGgG+PRpKzD9dfaIXMN9xGC
 rxx2VwF8tlam0fsk9/mH7SWuIHisbqHlvqN0BOCzeZ+AZzYJdXZp3YFtin+P+iyBfR4KXvahVlg
 /UcSlItErhYKdvZd298HsBSCqtm5rMo6wH6cgVi+whKnXpPAvSNYnP3jT91JErnsaTKS7wX9ChZ
 ETKV7eeFP2BvspFl8gog3nGiFzozOqJYnZYGPVgvVHQ6ZhgX6qksXOIpRauJuqd3vQJNp9aK4Qp
 kS87f9eWjn0UVM8Ho7C0PVIQVqALsEgjdzYndbtBJuObY3fJ5HQ=
X-Received: by 2002:a05:600c:1c22:b0:4a2:1a:a129 with SMTP id
 5b1f17b1804b1-4b963c88be3mr38677265e9.35.1794154321475; 
 Sun, 08 Nov 2026 08:12:01 -0800 (PST)
Received: from devhost1 (77-236-0-65.static.play.pl. [77.236.0.65])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49597d09e20sm4681733f8f.54.2026.11.08.08.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Nov 2026 08:12:00 -0800 (PST)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: shirokovalexs@gmail.com,
	thomas.petazzoni@bootlin.com
Date: Sun,  8 Nov 2026 17:11:58 +0100
Message-ID: <20261108161158.1825211-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <as3ldlJ2YEh4QmpF@windsurf>
References: <as3ldlJ2YEh4QmpF@windsurf>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/2] package/aichat: require SSE2 on i386
 target
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Thomas,

Sorry for the delayed response.

According to my findings, this was broken from the very beginning
(commit 2e1d51533cc0c28d5fd86edd90adce250ade5b18).

The problem happens on BR2_ARCH="i586", which does not support
SSE2 instructions. So, it was my fault. I didn't add the precise
architecture requirements, which allowed the package to be selected on
an architecture where the build will 100% fail.

Regards,
Alexander
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
