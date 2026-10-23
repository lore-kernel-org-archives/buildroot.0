Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF37606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GyclAWTe
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA026408EE;
	Fri, 23 Oct 2026 13:21:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7qCNSbm0NI3; Fri, 23 Oct 2026 13:21:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DF53940992
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761706;
	b=VTcqwL9nqyxGMy35waJ64SFW2V9mD6ezWSW5lVnS/jClf26c7/hIGLQH5BzlIqleJXrj
	 zXpNrQaAIIaucQAIf6hyo0AR3c9R4eYGixgbOmOmuqutBVA/iI0Xxbnf2yR8/9isoXCtY
	 7uw8Luh70JrqF3aMJkktmnUmCBkjKMjZYcMxIYmnXFwiIGUYni1U9JQZGxt0LRxg2EIWj
	 URTmsoPMejEouWddO/gFbWmrjUQmnx2ACCOWpRvkjLz2j8b29Hw8wTBORLSFDB8705UFI
	 YWzi9IF71Zj4eeNfE2SACygsYoVsYvA4FeKpDiZOnlhPyCvNcfLY3U45tNSmcntHYLQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761706;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=WGFyebLdCxSBEqVWpZBZkXP8gJbsfOT2LrtT0VA+5Zg=;
	b=jklqmI7uI++PPK3O/pk0rJw5p46J4J21f9xAe/f/zBAPzydXt8skU5MzqaPpHenl7IcP
	 670t/K2Oh6KJeC9aRdFSS4SkB3c2o41LY4DWqXTIbLx7s7zCdUfznAmhWjKjHRiSN9tmU
	 2oOPJqyn3jh5qAcDCTGWKZbHjoI8QhFbYIXS6Gdzm4P7x0fAQ/Ew8okA0FNTaLoR4XkfY
	 rnt/yjgnYbMocB8TSmFMr76Fb2qTTnUUfqSL1hRUl61InitG+DioloGmDdI1UN6uyY106
	 agwslvwDK2fzFuzXqDy5vEMGLb8khfJdCRrVoUw38JmZ/DnFyfzEJzmPsNU1JttaoJg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761706;
	bh=WGFyebLdCxSBEqVWpZBZkXP8gJbsfOT2LrtT0VA+5Zg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GyclAWTeo5qL0GsfVVTkjhoumshu8R8p+JQP3YSr1lJjEslCW/lBTykflgPkmgUFU
	 2mEpasBGxkUYJhRGxswH+oQWXNqqU7fNOKoZ/9T0/5mVmgL58EF4EvFBtcIXHbTWgy
	 d3U0YHacPhvSmywwLnxObsqovCXRjpYrAAhi8cexJ+sf1I+5kxFf5+J6awU5AjemsI
	 WwrLABm20cul4F0ityFdxaJgNjJhYsb7lr5kH4cBHeSAIWpgiDZ1pPp9VOp75HD/3E
	 7kNiJVUsayx4LM/n2O66lxipkBeCTYyBkF6r6OW2LBjF+Eug5/U9WMQ/LvTv5X+5O5
	 CypqDvZGCyoPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF53940992;
	Fri, 23 Oct 2026 13:21:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC7F03C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DEFB401CC
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDxN0F2Akbez for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:21:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 74279400DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761701;
 b=kDxxomFu9Uvcs4amJEB8apRGJtFUO7yT49AeatbOIEjEiuuufc8ZESSXgZ+Wnp+nyRo+
 g0zUKRjS5UV8keqAf0UF/UxtNP12wZrGDJrJUWcrNCiA2tRd0IH8MiEL3SGpanMzRgSD+
 2dnNYOyzfRYhiQmRgD5hk+uj+3CXXDEMhJCmM4+wdcDAfiC3Fhc/CU6KrFGTyp+zjuBlM
 HKjinRP4vqJj3hJMc7zmbUUjKEOfWEIi9y0kVm3yzOzWklrvflBf9ABve1EMf0hwkPtdE
 3QhjNecjyaWaxt1SFvZ8kBPxQQVtWAPDYuSFor8TXe6T1tWliS55AnKI5uC1bstQavg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761701;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=3RZBJzDOlzVWngkdxCW7Gf2gAs+Jgy6vgwtZSFuAgm8=;
 b=LqZNe/r/4Ev1l/oxyHgSsRVxhxYIXD7j+nMGhWdE36vlWEbEYB/PjkAjZZcM4EvZNBYw
 bzo05fSPVGfIY95SgiazrRtLmM/HYIFLRe1q2N/Qms5udFyu6BWyL2+YgmAb/DXY1In+c
 dT+GlyPoBewGZCHC+tvvLQGk+O7LqjUt1i2bTyFsv5bVFNW7ywhs302jiwExKmXPHccvP
 acfl2SDL1ePr4rOKpQAmpQMs5ctxeo3NRHA0Fv7mYy7pFNsTeSuiAij/rR6/sa59RCgkl
 LBgAbVcMLP1Npbx7LZUHTTa90iSSPsQr/YHcYrNe7Ht8GaE9+JcsPrKPBv3R2eltmFg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bqn1Qfos; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74279400DB
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:41 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-487049569b6so509294f8f.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761699; x=1793366499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3RZBJzDOlzVWngkdxCW7Gf2gAs+Jgy6vgwtZSFuAgm8=;
 b=2xJghqZE880gGHFVISPODtz+wDjUmj4gBTVY1knHbpJqreBrA7zUJ5Sgm8lZx0odbg
 qsxFqkfNrab/w8Wqj8mOmxbshGxxwcbH58MbWho9VKo80+CCpvIRpk1oDCUciGzFN13D
 AKrt17bbZWeh55r0O1IyNLg4NtbrCbvfxcv+SFlmXYHcAoZ7+DlZgB6kRrOL1vgEtVts
 5CmzSRZCk0EMEt9z7F0UwClX548GSvyewcayRs2V/DD4q0BHL7gHrRPVuUj34WVMprTR
 KVnWaL8urXNrdso/ktwXK8L0BdACMAnHgqBaL34xMIDhWkvKxRrIWSWQb6sIcM1ebwrs
 Qmdg==
X-Gm-Message-State: AFq9FYK/5895WVwMrVZFa+Cdzv/xt3H1+YgC4DLBziyVuHZmEBVWO1Eg
 XZtbfkIueKIwnEAMk3t4YxSUPSlHoosYTU9cE0jVUchxCo5L34bZX6QQrexQaae2Dc6FfCdeomo
 3YmmCj70=
X-Gm-Gg: AYBFou17CbeBt6a2vB8Qor7Rsj7XIzQdfh6r4I1NjRdUIWEStmMiojsJyI1rWHwRb4a
 q8mXNPLYcHNQJQzFjTdQhbamy3cDQ5GI0JaCEW64TpKk5F0vo/gq0oUQfU7FIIpvGnEosiPFF0Q
 MOMRZyo20I0W1lqRw8qFovywVg3Z+6+rKgPoEaHuV4vHxjMciHdSyLvsMsiXKG6wix8ILdfktam
 Vv1yM73MscQSQuyM/rPbauzV+qKvXHEAtPR35i2oxrcvTHQ0iNVUS6Yc32oawhbrJZ8ZOL3Hhwi
 cYhP/nNZvoLHyLnxtHyBdRETlaSu9e0AIo86+ekWhkivI/ARB73kI1ng6JB3tnAR6uLKbM1jJzf
 4uwioYIY11lpiLTHzFA81MvYsdsMwMNEWQsDBZ6jguNU1M8gDT6iAsP0AjqsNsOsAY5r5hI289E
 J/aKcvAgQQ8cBXgy2xb8AGggOhT5CyPXoXInRRbXp17ZxXWc3iNGi7oMXlnYcDVwOme7UC876q2
 g0zu9NX0xWYjEOY61U83oe+GYKprbEXwXv4dB+h68keFLd0ui0NiZLUJA==
X-Received: by 2002:a05:6000:41cb:b0:485:8c17:9764 with SMTP id
 ffacd0b85a97d-48e385aee25mr3803745f8f.38.1792761699193; 
 Fri, 23 Oct 2026 06:21:39 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e380636bcsm5037260f8f.58.2026.10.23.06.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:21:38 -0700 (PDT)
To: buildroot@buildroot.org,
	Florian Larysch <fl@n621.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:21:36 +0200
Message-ID: <20261023132137.1608068-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261021223000.26513-1-fl@n621.de>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/ca-certificates: security bump
 to 20260816+nmu1
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
> This invalidates the compromised eMudhra intermediates by blacklisting
> the roots that signed them[1][2].
> 
> Changelog: https://salsa.debian.org/debian/ca-certificates/-/blob/5bee010adca85eb867534f6445735ad5cc0dc6f3/debian/changelog
> 
> [1] https://emudhra.we-have-a-problem.com/
> [2] https://groups.google.com/a/mozilla.org/g/dev-security-policy/c/0R3XLJL6FuE
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> This is an alternative to the v2 of "ca-certificates: remove roots
> chaining to eMudhra intermediates" which manually adds the patch that is
> part of the nmu.
> 
> Note that this does also include some other changes since we're bumping
> across multiple versions of this package (which might be a good thing
> though).
> ---
>  package/ca-certificates/ca-certificates.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
> index 0f88df3eec..cccac113e4 100644
> --- a/package/ca-certificates/ca-certificates.mk
> +++ b/package/ca-certificates/ca-certificates.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CA_CERTIFICATES_VERSION = 20260223
> +CA_CERTIFICATES_VERSION = 20260816+nmu1
>  CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
>  CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20260223T202245Z/pool/main/c/ca-certificates
>  CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
