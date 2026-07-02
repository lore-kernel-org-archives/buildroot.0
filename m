Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F39C43458
	for <buildroot@archiver.kernel.org>; Thu,  2 Jul 2026 08:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 442E860E92;
	Thu,  2 Jul 2026 08:46:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9cKz4zPv80Cc; Thu,  2 Jul 2026 08:46:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B6A160D5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782982011;
	bh=xbo5hQTBBMuQU0keIeaD84+KF60lGHUV+EMcLPnCIMI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sZrmEn3L4NUS5RVwzw/Uu0D+5EZWUq67Zo6spCTeIqmu1Zr3nkQOqqNmRFt3oh4K3
	 v7rbl0Gfx0dZjOxCXen5yDveIG8Go8cwEy8o1U3beySHMy6gqbgg4iaQuvmiwvzaGR
	 M0hbU4QJS/PYwmLqXy30/LpDSbPsQcUe2J6YiSzCX6EkYCHe7p9+Fykofo0lYbfR9d
	 TZX58UTMrDUMCF5y2Mc5H42KJ30FwDotapNWQGr+kQ3+MynI/aFXy6arv+7TdxZKtp
	 MNmQsadx9I7OCYmxA1FAmTP3HsJ4q8CIBmguyApc9188NoW6i75ddltahmh7xB/NEZ
	 PrdFmI8uLpqHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B6A160D5E;
	Thu,  2 Jul 2026 08:46:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DABCC4B5
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 08:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C008940248
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 08:46:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kmom_OIL7hjR for <buildroot@buildroot.org>;
 Thu,  2 Jul 2026 08:46:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB19040203
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB19040203
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB19040203
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 08:46:47 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-4629051c9d1so1009419f8f.2
 for <buildroot@buildroot.org>; Thu, 02 Jul 2026 01:46:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782982005; x=1783586805;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bFFGYlEnjNpODYp8bjXmmn8XihM3pckK8phwJcoHZ/o=;
 b=ss7ef0431V+mMTCD0vgJ/TSlokVM5srxRjd5hIbzZX1KsAc8AoQB1zxIuCNGVqgvyg
 oQNgxFR2ZYO1ESTFWs4ymBJaemRR0x+W2OoCBbxKT4uNmtIijVjevMkTnlRF6vMY2MQi
 wi716P3+8S0r4mmFbpGjzXGJ3QxrwvKBB38M8i8NICwpA/Mzbnjoi1phLcVuZuZS1pFQ
 URTNXqAi17kFYqQMYnnr74RdkBp9rR3ZwBfL546SHNQibT3yDReky1Ylpsyfl7dRMReW
 /3/TJfP8xxIhtxrHNNfK+bJDT5PGJaMSOVM7D2pZ59nET5g2QLGSs+inRoNzXu8tVqwP
 kgOQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrKqcc45OrxsuJTHyZ8Uo1J2THZuP4xFuA3jakFzC8pad3LKXse3oSpIz1rGZuDmrwvkV+WCTE0MMc=@buildroot.org
X-Gm-Message-State: AOJu0YyG+2rE3vtcYMzoiWiw8QapUSBaKKU/Ag0Fm688OE12PqCCxcyN
 5UnU3EEkyLz80Cbf5P35Y5j/rYRfM7Sn8QE85V+XHmmWBlLfnC7Lx4rB0pSUlKsyiGY=
X-Gm-Gg: AfdE7ckng7Uhqt+QIO2D06oL/P7Hrzqfj4iEd2jp0lJX3SZJzWqugVQZd7i8PYLC6Rx
 DEhdVH7hknbQcZXBDRb4pbcdjqROHP0wQ125d6vYG1T7ieDfEKaoUKRL8FkfoKS4CMd+UKhxNcQ
 CnJiA7cpsJnWAmZDrey0O6x0Td8vdcbSHHpybL1T5Amg/5dw9R8cNRv3nd0DuWdRRmwIC30c6+c
 xugtZ7xYQwPFO1l3qCrw7Jd7RP/wzysmh59My4/kIrZ6KZmvOgo7YjOofkQiSKcxgctWKCpWnWz
 r9eS0yE6w4Wn/pdvAsWaTEu6FSxOZXSjH2EfdM2JEueUrwtcjWJNQFZgW2ptc/Z+FzTrHWS/QrA
 DPHL+nBWIk2tJdVppBNl0JfhnlYP5OTI6Pd3hQLSurMAp4vmAx+N66zehAvRRM0/WpVrvimzEwt
 y4mPtn9vaWzmi/aV3esgDXuS5V8MdJ+CfEr3yCSeDgOF3BeyU7iEtp+b/u
X-Received: by 2002:a05:6000:18a7:b0:474:d7a5:4b6d with SMTP id
 ffacd0b85a97d-477b38897b8mr6059136f8f.21.1782982004975; 
 Thu, 02 Jul 2026 01:46:44 -0700 (PDT)
Received: from [10.0.8.112] (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db8a4a09sm7152547f8f.13.2026.07.02.01.46.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 01:46:44 -0700 (PDT)
Message-ID: <b21d3ec7-9201-409e-a922-255fef71b915@mind.be>
Date: Thu, 2 Jul 2026 10:46:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Danomi Manchego <danomimanchego123@gmail.com>
References: <20260630201512.283396-1-thomas.perale@mind.be>
 <20260630201512.283396-2-thomas.perale@mind.be>
 <87y0ftopqd.fsf@dell.be.48ers.dk>
Content-Language: en-US
In-Reply-To: <87y0ftopqd.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782982005; x=1783586805; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bFFGYlEnjNpODYp8bjXmmn8XihM3pckK8phwJcoHZ/o=;
 b=cxgLFtoEis+SBsowypuuUqxygplDHT0Zwm/OPYpqSTKULfAX22XhdLVZ/yavO2i9oV
 Udg8OnEWpoigPeACfzLUVTOOZZqKxZHxVU1eM+Ec/DkXwbtDLWOzg93pZdhE6t0Ybqe/
 iqIeGMGVQqxHN4pLgSZYbKLD/zA1xMDOqJvFwErlRmHqdadkAt4hHC5MbjybWIKLXjDZ
 +KKVYp9GJIC6qztntAXVox9/OCxANUc728GPwnxUgJlqfpRyX9Zr6l1vWIPKESJ+7wzH
 Bb3nLLUgVOcvGzndHa2euNe3I9wQf2LUpde7z9EHxqaDsnGF0ZcJoGC2udqkHxJX41os
 BK5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=cxgLFtoE
Subject: Re: [Buildroot] [PATCH 2/2] package/jq: security bump to v1.8.2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 7/2/26 8:44 AM, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:
>   > For more information about the release, see:
>   >  - https://github.com/jqlang/jq/releases/tag/jq-1.8.2
>
>   > All the CVEs were addressed by a patch but non-CVEs security fixes such
>   > as GHSA-gf4g-95wj-4q4r or GHSA-hj52-j2c9-r8r4 are fixed by this release.
>
>   > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
>
> I don't really think it makes a lot of sense to do this in two steps as
> you presumably want to backport the 1.8.2 bugfix bump to the stable
> series as well?
>
> But anyway, committed series - Thanks.

Yes it's unnecessary but it's to avoid having to send a different 
backport series for the LTS branch based on 1.7.1.

Thanks !
PERALE Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
