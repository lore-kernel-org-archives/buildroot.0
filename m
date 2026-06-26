Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78AAC43638
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B68641253;
	Fri, 26 Jun 2026 14:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7xav3murjPm7; Fri, 26 Jun 2026 14:56:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E8E441246
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485803;
	bh=3/gP+MmxeM+bm9O7ZfIGRYxh8BszbNI0jpqYosqfLvs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s9GGHBlbnI3odwzgtuXNe5J5aK1kt4OOuw7FOxS6Nn7Wl/HAJQ0WX3+8I5w9cAUiM
	 U0ud23fpZotMgA1z691HrbpaSi4LzQmFbm67M30784KQoXcEIZul5tOa6RsTapa/FJ
	 zd9sIKxytMIzIi79wAO0uVASEMdys3Pcdx9uJ2IfZrQuDYIVi1Ud47sEihWxKSJCT1
	 k965Q6USHFx4dDD7jTeGotqJr+C1G83viPO52eiI4w1RJPG1f7Xq2veI77+0xuOSat
	 n0Du+7y5x3ZCeG+ixQGK3soMoETRUtR77AVxqsuK2uFQfMOExz40P5GdpfB4d0FYqa
	 gnrUFCcIIY3bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E8E441246;
	Fri, 26 Jun 2026 14:56:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A523F3A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AA254094C
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id upMZ1TNOlrQr for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 760EB41203
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 760EB41203
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 760EB41203
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:25 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4926bd21aa1so7177865e9.3
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485783; x=1783090583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hmcdDIbsTnoUzjtseJNAUVD6HOkUVlsa/BLqEYW0J+U=;
 b=T5dhLembeT4+MfugP3JHqsGDeKPa+r1QX//vEG+cJLw8UXptn2umGYLG8sgkE01Nrg
 v5xLfTcKg+fYeLds/GIkNAmnreTMLyS3nSJfRz675g300nbxnQYsQsbkm1WoKkdMoMPA
 hszooJ+JjI2HmLD4wcpAM9xZCc0yXwB9S6zBNOF5QzHzKR4dxBPC1V+b3UdPy4Sv0k7P
 pGz0tqIPjCQUUjBNEGT9IFgf9y3x1ynFOFoMnPAkl9wr5MpyaTIClLDIn5WDyqWFJnW+
 Uj4BfawMT/giiBrpw0bs2mkNurFI4vhSluYguTGEbvBiJx61wXezh/r4lGFQw/atCM3k
 VECg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9EZ2arGTtlQosW05H1ELDwePo4XWLTqHg26Lu44F2SCrx1yT8hEskJrx50OFn4Vembd/2EaCcd2ns=@buildroot.org
X-Gm-Message-State: AOJu0Yw5NKvjZ+Ijxmt2xmhNMYzJ3EvOjxeiPH8zDOCzP4hTmrwXoBKP
 hWnXbnId3q8pYaaMPlGgcRoVabBES/xwsTUuSx8NAUYTgqBRduA3VUlr+P3NyBsd2mNtho7ZYLC
 wy+WZ
X-Gm-Gg: AfdE7cn7Gk6dHCwFInxdQRiJN13RTGuC2jGdbp+4a9tw/XVR6QgSAtphEWQurL+edkf
 ZaF7wIIN1kH4npsFA7j2bY3xOMMfJGv1wDXX78vgFcBaE/5Pxu6PCnUImDE8lgSQyimXC5hnFph
 i7j1OQmKbughRyO8ylZmK78u3HnW7K7hQDjH0CB4/agmANdIfyIOXHmYexqLcmtqv620hrVexmr
 eNvy3DHh6AV10bB03y2FuHEwcEDVf/PTdmFAUNsill57zINaLu2Botz91wjcLXK3J2yDwS4AGEl
 pBdrhQrFYUavmOXB0iqufvkLMzEQ7Q9Mk3E6ysEXVVlTd1g5FNiR/OLXdLp/OAQt0P4gi0PZQ7V
 c548UzoUrrIZaUUMo9BvfCV2/0byK8HSJCPYL8AB209gRcmGl3ErE48DFEyuKcjrEM8ikXu43b0
 UmpqgV
X-Received: by 2002:a05:600c:138e:b0:490:d38c:7836 with SMTP id
 5b1f17b1804b1-49266832313mr106947605e9.3.1782485783594; 
 Fri, 26 Jun 2026 07:56:23 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268fd9f2esm75064025e9.5.2026.06.26.07.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:23 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:22 +0200
Message-ID: <20260626145622.344949-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-26-peter@korsgaard.com>
References: <20260618124835.2935850-26-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485783; x=1783090583; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hmcdDIbsTnoUzjtseJNAUVD6HOkUVlsa/BLqEYW0J+U=;
 b=PFN3xFQOnGlx0h64fwQ9+whXb3xCh/kobk30AxXnGpXLIdAIS+1hGjAFn+oK2kLlQo
 7v4ES9RqD3S9J5adR50Ew5txVLUsJgMtC9QaKdl3NBZFP8klD7g4ozw6bkFh4/wGgZ4z
 lq+82jDLt9vn5nReVhaybPt2WeRcXKy7ptQpmj4HZbSQYZR3dkJSXBOXmLUywBJBB8Ol
 qulBq8uTjMs7wvv1fYT6IyxFRvqAX6h1c7oqJvbwYar17zE4j1SBcEYwPg3bYta51LnS
 z/TvkxRMU0lbyFJOgZNc9LIV5jtJwKRkovux4phENArgk2Aqjr+4jR/ppQqeChUBZ6PP
 0+CA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PFN3xFQO
Subject: Re: [Buildroot] [PATCH 26/29] support/testing: test_swipl.py: use
 assertRunNotOk()
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Use the helper to simplify the test.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  support/testing/tests/package/test_swipl.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_swipl.py b/support/testing/tests/package/test_swipl.py
> index 0f317bb617..4005e02e5b 100644
> --- a/support/testing/tests/package/test_swipl.py
> +++ b/support/testing/tests/package/test_swipl.py
> @@ -27,8 +27,7 @@ class TestSWIPL(infra.basetest.BRTest):
>  
>          # Check swipl fails when goal is false.
>          cmd = "swipl -g false"
> -        _, exit_code = self.emulator.run(cmd)
> -        self.assertNotEqual(exit_code, 0)
> +        self.assertRunNotOk(cmd)
>  
>          # Test output.
>          string = "Hello Buildroot !"
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
