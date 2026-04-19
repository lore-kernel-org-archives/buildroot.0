Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A4EEA71AA
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 21:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F05E6100A;
	Sun, 19 Apr 2026 21:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j04niHWEZDDj; Sun, 19 Apr 2026 21:59:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D23961003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776635961;
	bh=sWDK0f4TPDnhfL/zIhSj97ojfC7fyQsH3xfdAb1HAFo=;
	h=Date:To:References:Cc:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LrmA6/8CIpPXA9z4kHV7cZl11JIkEPgiKAeCIa4bSB7r7FiwVW7BUhc5wyOeMI+jL
	 kE4QQalRkB3pb5d/4yBMVrk5/KmHBkbSz7GRzme/0Vzupb2d10JHOAijag9PtXFRHJ
	 F/7MLXOh0Y0l+SbAPkuGvEfUHvDAhmfQvHeckYYhf36sasXz1s/MDRF9re8tFYGIeo
	 Qg7pYLAKgd1wCXzbmoOdSU2oU55Ldl1i2lefP6IrOZc6pljMXSG2rOe7MUEcIf7oPe
	 ENi93sBYk53RoHdSTtH/KJbXeDOdwq/33tXhXi1t1eBJpFKwjLHoiTgQIdcalt3ii6
	 d1O2fuZ40XKvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D23961003;
	Sun, 19 Apr 2026 21:59:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F34ED2B8
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 21:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D03BB82380
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 21:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fNPF6tOQN1yM for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 21:59:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1037C8237A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1037C8237A
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1037C8237A
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 21:59:18 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 5CD402C80C2A;
 Sun, 19 Apr 2026 23:59:16 +0200 (CEST)
Message-ID: <a6dbb42a-b990-4248-9caa-aaa9385e83ce@bubu1.eu>
Date: Sun, 19 Apr 2026 23:59:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
References: <20260403085152.511498-1-chakrabortyshubham66@gmail.com>
 <e4ee930e-02d7-4008-9c97-3c50319c561b@bubu1.eu>
 <CABvxksxUY9ZC=PPSXdrjs8Vq5p12YJxWLHKWWJJZF-X=UvaheQ@mail.gmail.com>
Content-Language: en-US
Cc: Buildroot List <buildroot@buildroot.org>
In-Reply-To: <CABvxksxUY9ZC=PPSXdrjs8Vq5p12YJxWLHKWWJJZF-X=UvaheQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1776635956; bh=gfhbkhmIctYGOgv8VsLOgpiamHp72BZ46buT/1sO7xw=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To;
 b=IPtR9Eh2kEFRVGcu/0ymyPivzQCLQt7EDBD/bI6klCi5bZjURwpyEP43/jctewIi4
 1f13Fmu7f4+I0cZ/WGJjSrvSCypOVWayATr3ukTIqonV41V87jB8RXKFTL7CkTQp8X
 EqhYkdIxE5RpXtINeaXjDdrQJV3MbFyQfAjxyXzn5NiOFJnsQGG53ojvZ20D1ewNXg
 9SjFiAfeXbV/zseE0gnC9Ltp8QpPV4E9lyLmJN5mxkU8EkKGMnRK6Qi04JocAmwROn
 v0DZqgbOFAdJCEFi1PIYBIE2MYOnjGVtSKy7jLMYUg14b8n84pUhNeuemfI4nAjur3
 AUmrTHZGiSLBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=IPtR9Eh2
Subject: Re: [Buildroot] [PATCH] package/python3: fix build in static-only
 configurations
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Shubham,

please keep the list in CC in your replies.

On 4/17/26 22:00, Shubham Chakraborty wrote:
> Hi Marcus,
> 
> I investigated the original reason for disabling static Python 3 support 
> (commit 54915af7). At the time, the issue was that the interpreter 
> attempted to load standard library modules dynamically, which fails in 
> static-only configurations.
> 
>  From my testing, this limitation can be partially addressed.
> 
> I was able to build and run a statically linked Python interpreter using 
> |--disable-shared| and |--with-static-libpython|. By configuring | 
> Modules/Setup.local|, several standard library extension modules (e.g. | 
> math|, |_json|, |_struct|, hashing modules) can be built-in, avoiding 
> the need for dynamic loading with musl libc.
> 
> I validated this on AArch64 using QEMU. The interpreter starts 
> correctly, and built-in modules work as expected. Basic operations and 
> selected imports succeed in this configuration.
> 
> However, this setup is not yet fully equivalent to a standard Python 
> environment. Some parts of the standard library and general script 
> execution still require further validation, and third-party C extensions 
> are not automatically supported (they would require manual inclusion in 
> |Setup.local|).
> 
> Based on this, it appears that partial support for static-only Python 3 
> may be feasible, but additional work is needed to determine whether it 
> is robust enough to re-enable in Buildroot.

I think the question here is: would anyone want this? Do you have a 
usecase for this?

> 
> If this direction is of interest, I can continue investigating and 
> prepare a patch series that:

I'm confused now. You tried to fix a static-only python3 build failure, 
which is not something that buildroot currently supports/allows. How did 
you even encounter that? What is your reason to work on that?

> 
>   * Re-enables python3 with |BR2_STATIC_LIBS=y| (if deemed acceptable)
>   * Adjusts module configuration to minimize reliance on dynamic loading
>   * Adds a runtime test to better assess static Python behavior
> 
> Please let me know how you would prefer to proceed.
> 
> Best regards,
> Shubham
>
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
