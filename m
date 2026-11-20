Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBD9606A511
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 06:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=r2uMwB+z;
	dkim=temperror header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256 header.s=2022 header.b=vYScvaPn
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C41F40DD8;
	Fri, 20 Nov 2026 06:17:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E4UPsbcAWGM2; Fri, 20 Nov 2026 06:17:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A5F4940DDA
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795155459;
	b=JOpegNpr2q01xVrnY4Dly5Q4vIFOHnp/HKRuhGpQy2rcX8yOuIT1dZnxc37NNMu8Y0Ft
	 naby1QAPKgCh1g/+7YltvN4mEXdqyk7mnA3yzyeF8Dqglyiz31BRF+As3iXxb4bo+BDEB
	 /+mG04UQwlj83CjBCDzwbG8ntNScvLpEMuykRSgNuO+d5Sx6Uiwr0dwzSFqQDlAwsX7LO
	 ZsH5gyyN3GjkRpZUd1bUmePWbYghz02SAdpGZpKx9NknGqiWA54lET+4dClMHpYcTT2Vt
	 PJIbm8q9OAv6du49bEBLOJ8QGgrk3LOy5zLscK6OamTn4bhvJBRrwhmgu23L7lGdz2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795155459;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Cc:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:X-Operating-System:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=DZhBFYvyc4ZII2JupBu999oJRBRRRG8++/oVDgZfwiE=;
	b=bN4Uv3vOvhjPl+zI3jzD33TMnGnduLCMOzPSG4kQ1PJCmGIGHUd5KZOcqtTU1TsIIuML
	 i59+ESFPBKDluMh2Qww2kcomgiRO/iYWhUa4nB9RFNOlms7gX2HS+zK5Lc11YrSueBOnK
	 akoVjt4Qm9Kz0rJRsxr5tFCBpsS5br2VBUjk+qSjQhtfsxXZWwWfM9Al7kdom2sMIhwkg
	 YvTFznUNSi4VlPIUU16967TgDSVNvM/P7VnWXRorQYepMw0mZaaCLbhei4owER8Z8zqE+
	 zSmx31Q+d8vG6QgZkbOYbGDtiwqnz6A4CJvcLmNxLfn5ZwJhS7iiaQoSTcdjWQNSHuw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795155459;
	bh=DZhBFYvyc4ZII2JupBu999oJRBRRRG8++/oVDgZfwiE=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r2uMwB+zlOWPXw3yjahwNUYNT1QU/Xvln2Fk58LZTdFHSj1ANy4PoPCDcPLdJCRL9
	 mcKHDojUBA04u96/ubTU7rGYFr3s7+idfjnTxfgf+xEZ8MUEUihVVoyEEByTRRQCiw
	 6LVpNpQfBFVQ3i3qhib2JsUPe0q/TGb7FEhEbhBCR/ZaPDaSEaWXwBGjv8F3fmPSfp
	 OZOna9ywzdwsHOAj3lnIi8M4NbxJgnmBLuXhr2o5dVQnZa6NziKq8h5zbDuTxIjcJ5
	 E3/SqoQ4BrXoC65ev7LVEkBqsKIsTeyBMEP6Cb/Qia8jsVqMSVT+LAdapkNaQOy9Lz
	 t3+ajgsgGOEpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5F4940DDA;
	Fri, 20 Nov 2026 06:17:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 339C51C9
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 06:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A6E9401FD
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 06:17:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jkCOEiHIh8PI for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 06:17:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 650D240122
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 650D240122
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 06:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1795155454; bh=LmsTCxWTutikbgPRDlJLVVmqPvWvJ05JrrisxsuRYlc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vYScvaPnEvnUxa1v6/3mt2Z54+pXSQuFSJ4z4IaYi3khcwATf1pCtnrxEZ1urBiF7
 DK05z8UtcGmz6JSQpcV0ycYgo0DKVTtQZUI+KUlXW+fnOQGYeqU5Esk0b0SBO4+die
 hgCeb//xhZTC3ORr9xRB3LpFMj/PvNDs8mlS/ObeBUBKK8iWoCPoxVUa2rJxZThAxe
 m77lgxbg/sJNN4YuXBKwM2iVYBfphkCupFddn7xFB+Uz96ifEXdiAG5pyPRH3558sV
 s+RQlT7oLK8M7oj8Tor1T6sw28CU+Sjsbf+Akstcw3oHeBTpI/JT0f3kKqzQG40Xsk
 vuFc98xlC0vOQ==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id AB83931E0B5A; Fri, 20 Nov 2026 07:17:34 +0100 (CET)
Date: Fri, 20 Nov 2026 07:17:34 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org,
	Etienne Carriere <etienne.carriere@foss.st.com>
Message-ID: <av_l_rKpCCtYRads@waldemar-brodkorb.de>
References: <20261119080856.2471644-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261119080856.2471644-1-yegorslists@googlemail.com>
X-Operating-System: Linux 6.12.113+deb13-amd64 x86_64
Subject: Re: [Buildroot] [PATCH] package/optee-client: needs glibc or musl
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Yegor, all,
Yegor Yefremov wrote,

> Since version 4.8.0 [1], tee-supplicant uses renameat2(), which
> uClibc-ng doesn't provide (glibc has it since 2.28, musl since 1.2.6):
> 
>   tee_supp_fs.c:491:25: error: 'RENAME_NOREPLACE' undeclared (first use in this function)
>   tee_supp_fs.c:493:13: error: implicit declaration of function 'renameat2'; did you mean 'renameat'? [-Wimplicit-function-declaration]

Instead of disabling the package, I will propose a small uClibc-ng
patch providing the syscall wrapper for renameat2.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
