Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE78606A326
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 13:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Dj/0XhZL
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47C4D40ACD;
	Thu, 19 Nov 2026 13:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x1BE4IqrwTjH; Thu, 19 Nov 2026 13:37:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3A5C140AC8
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795095461;
	b=PTIyxNdug65d+39BWn8V89KpOdOxNufLBiKWbbU7gvsX2piR3r8V0rM2JXPxAZn/fjH3
	 xT+9icEdINNzIrGGnnqprmZB5jIf6avFBs2UtSDMPDp0BI955jctsr92gPHRNOUGy76b0
	 DfBQ6jLn/pi+U3FN73k7Xf7EhLk4gjwL19i1iXRTyvWBsyD8VKqOh+r6JuggXzmstYeOY
	 HkuQzZ8Sci8bosMFPuc8Pw9Cz7MEabKOoTBEqC9m0NctF/ZwSWfJdQO9AhkgZ3AxVnKdl
	 PgJedD5r913XSHd7AmIhAZVxuN/z//Ck16sGAfY2jwWXSdQJrGVi94Eqd0agK2EyD2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795095461;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=t8/mdn0sAD6cRDZUBi3e+Ak5llm62V6kEhv21V3cRz8=;
	b=kgdQXcIVXefA77w71V1YjR121dhszJpe+EwayE2GZJ3LgSKfIAS0ZnbDV43PQJh6NQWn
	 YHAskm0cEjCulbxO7emmmsXUu1vEGyD12RwfUyXAsQkUEG3GAJXbaonqgXhjH2J89v/yt
	 RFIweG6s2nIAnQeEMsVa4nL6VwfcMNpXnHMNUxgssReXKIXQz8MPbzHIF7ca2dL+4vVff
	 257xZPjGN+lXuAN/GyFZXu/zwrkJw+KlNu2CZCyYWYVLjJGKcF8dUEZp+AD6v111WDccs
	 4nORBY2rGC3jGSOord5DCyRP+wqWSZcEpkUOduMnlB3qOOgvM+/umu25GRXRbJ2Igzw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795095461;
	bh=t8/mdn0sAD6cRDZUBi3e+Ak5llm62V6kEhv21V3cRz8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Dj/0XhZL+LrZY1b3Ujt7k6Fs6XLJTAogYIxWpAxaiEtaiEyZaNxypOvar/ZlzjEvq
	 kOc9H+psaDJgcjznfZr35qn2CjK8vSe/UDnCIdVbI4/tBYqMl48trg/KdmHO+wqzN/
	 /RsByNWdmCukeCVaOhAKvDgPWk2yF6kXrK6al5xzVRcM9vb65B0IAogEvSjKTELAQk
	 CywfgOkHpz5IZCySjpJArnGqlbgNEtSgD+uk4Im/pqas7dX4pHVpk6cvvxzDCaO4eH
	 G9jKS19U7yroaMfY7U4qN/yS0WGSABLg1A194xzbbbK+jyONK/BIi5fui28PwqsS+s
	 yde07+RZoz2og==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A5C140AC8;
	Thu, 19 Nov 2026 13:37:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 051321E7
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 13:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAD848131F
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 13:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AWHaTpR2cM7D for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 13:37:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1D2598130C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D2598130C
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 13:37:36 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id D205F2C81C59;
 Thu, 19 Nov 2026 14:37:34 +0100 (CET)
Message-ID: <989c3589-4183-41b8-913c-a0c1f0513730@bubu1.eu>
Date: Thu, 19 Nov 2026 14:37:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yegor Yefremov <yegorslists@googlemail.com>, buildroot@buildroot.org
References: <20261115084103.1439197-1-yegorslists@googlemail.com>
Content-Language: en-US
In-Reply-To: <20261115084103.1439197-1-yegorslists@googlemail.com>
Subject: Re: [Buildroot] [PATCH] package/prboom: remove package
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
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/15/26 09:41, Yegor Yefremov via buildroot wrote:
> prboom is dead upstream: its last release, 2.5.0, dates from November
> 2008, and it only keeps building in Buildroot thanks to a growing set
> of local fixes (libpng, autoconf 2.72, GCC 14/15, C23). Its users have
> long moved to maintained forks.
> 
> Remove the package and add a legacy option for it.
> 
> http://prboom.sourceforge.net/
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
Thanks for the patch. I removed two left-over references here when 
applying. One was in the manual -> known issue, the other was a leftover 
depends on the removed BR2_PACKAGE_PRBOOM symbol from BR2_PACKAGE_DOOM_WAD.

With that applied to master, thanks!
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
