Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA91C606A321
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 23:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OOxV2zJn
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54A74819F5;
	Thu, 12 Nov 2026 23:09:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mARv5B8fW3sd; Thu, 12 Nov 2026 23:09:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A58DF8199D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794524954;
	b=ZlkmggcRcJY4fWyF4he3+4yIrGZaXxf6m/pioF3FEPV2LmBE02twmfPqPsdCu2tBRKwz
	 om3oMFEcRdr3x7mJX1wnMniLd4DJs0Tm2lpzmL8iE6iTxnteB2bEG8rUbWEohHlHxoHmb
	 ZptuVSUq9PTAYgvVv73gp/3aSe7S+d07aOt2tRzLB2+m1yaC4b5bQE9RRyFA2RPzGv5JK
	 qtVxccIIKDib4Tfal4cE2VBIlHtV5OxHqyh68K/CbpL5OcxDQBIuY7JmNVamR/3tqPvCP
	 mVHIWYraz3BZIl3RucczqNvaZx61Ns81Ha+D0MQy48xbTcivTKzXvaU7kyHvIKNueoA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794524954;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=0EFQxxYHHatg36X+sPgeo10GyAkox/Ah3H1qsrHftNY=;
	b=Y7q54bGHgzqnmJ5a5iJCcwdJeCyP6bOn260fCpPPu3IFYsz26T+1WlQjzaT3b35i6FRL
	 Gcr7dR1XxgXWiCs2qOLQuADgxAIdBqc6fgZugdkRpt8QaAratejMFZwSzCtUYV493qBlE
	 JzUnrwX/5HfBAcWXG262ucKXt37pbNR42e4Zu8ZpqeJGJrliGB+dZXHjdspPIWBkJ7Zfx
	 uotf9/MdvBeylEEnx38Jmn/6V1DYHlzIjaOA1AN0jziWhEgm2wg9uD1pIiSeD1X2uRJRP
	 RInuniVBagsutJvM8CekrUmJQNLzSD3E8vxnRDgwXu7cMieY3cN9vB/CUW+/Suqc5dQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794524954;
	bh=0EFQxxYHHatg36X+sPgeo10GyAkox/Ah3H1qsrHftNY=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=OOxV2zJn+sJpX1Q99gZWHjSfr/HHn4gq98fLXr247Yq63B3DKh7tWGJPofIQh06QQ
	 W3YeGAiy/X7XQIqmgnPbMC6sCP7dbzuzxfPf5quKN4F8Gses1Hg4reEYjO3JMbBUsp
	 9yCcsUBMk1iop83ru3/UVSdwDg4ag4WqNss3oLk93BfYEkuWS3+GfAcUUEfH1y7v7P
	 B9PTHDk70UwRJOCJsco4w/e8BlFxnY/UiQZfF+XzcUlazQlTy2PqV+usIXTgY3vp6l
	 4Qxi57xPWOtycw+ZIH9BzMtKx4Yog/5uCBWvfvxg62JxKPlcdX1KfYjqRlWBCvURY0
	 MhonDX+rjWzqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A58DF8199D;
	Thu, 12 Nov 2026 23:09:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EA2B2E5
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 23:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F8F640336
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 23:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zu0EXS3C7Vur for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 23:09:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org CBDA8401BE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CBDA8401BE
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 23:09:09 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 94CC22C84DB7;
 Fri, 13 Nov 2026 00:09:07 +0100 (CET)
Message-ID: <89e14d5b-51af-4589-9b06-3cf17761b9ef@bubu1.eu>
Date: Fri, 13 Nov 2026 00:09:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20261112145909.505297-1-ju.o@free.fr>
Content-Language: en-US
In-Reply-To: <20261112145909.505297-1-ju.o@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: postgis: new runtime
 test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/12/26 15:59, Julien Olivain via buildroot wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/17971315092
> ---
Applied to master, thanks!
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
