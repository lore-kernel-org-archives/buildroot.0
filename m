Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3383BF8FA86
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 14:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3F4241E3E;
	Tue, 21 Apr 2026 14:43:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KwBQQyxaDOhP; Tue, 21 Apr 2026 14:43:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 357DC412FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776782613;
	bh=/3Vf8dQ2Eme9Z6xh+z5SUV8egD/Ov+t+wj66Kx597D8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Skxk6HxRv+0GFRjiXrrsPr60NsPpjOzpMvVACXdrBZNxYAwvNPitul/MiDeOVZBmK
	 YeHJcJHSHmrf/Ct0oj2IpS/gMf/QowmdL5wrHWC2I200t4BCqfFhK/3EwfMydQMFmb
	 09iR7vru3jT+WEyK1xCLc9Yg/jAsV3KeWFOX3k7mn6hfmalvXSjmzKWbNZLf1RKn7q
	 8QQedG+r+KruMrpmNxjKu0kpFk7XtxSeXhiwki3ocqvuAlSZAJWnKOIS5QVhWuUJ7Z
	 3g0F0B5VkbWjVodakBex4RsETD6nYFaGF+gJkDJGIY4dZAsJzT/lOzYtAs3IZ85djg
	 0j+bc3yxzrNlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 357DC412FC;
	Tue, 21 Apr 2026 14:43:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9164B24D
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 14:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83A6B412FC
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 14:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JR-q-QpxA--F for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 14:43:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BE85A412F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE85A412F5
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE85A412F5
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 14:43:29 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id E23392C80CC9;
 Tue, 21 Apr 2026 16:43:26 +0200 (CEST)
Message-ID: <e313fc41-67f2-4630-befe-3b5aea5c2d21@bubu1.eu>
Date: Tue, 21 Apr 2026 16:43:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20260418150841.947385-1-ju.o@free.fr>
Content-Language: en-US
In-Reply-To: <20260418150841.947385-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1776782607; bh=FYEviFocZEFUax3bCkGuK6g4MYHYY16D85VUNMS4yzg=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=VeyPB1OC7DDrphqyKKCI90PTFF2kpjuy5sRcNfoqyQMKGjgovCFwp/uoIGwoUhj3j
 jMoYeyrdLTQ3XcXiawIF5rIraNjy7jg2TNW254yfejH1bsmCBsa0CKWn/1tz2sROn5
 hYSIItoQxBYck3zz4bS5Tk5ZwZ907Xi91qSRkVJ79iBFglQ2UvPan9Gd3HGGj55b2o
 /HZSQnVPf8niF/8k7cBSCz40QllpC4LZ2NLwKvbE8Aa+VF9MeK5QHzz9nPsCA224l4
 4RYtPRl7I2urr5jJFxWHceaG8eRP/l/6jJenl8Hr7YxBwdzNRrpznHLFjGWoEt74/8
 tlrNZVmKVn5FQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=VeyPB1OC
Subject: Re: [Buildroot] [PATCH 1/1] package/octave: bump to version 11.1.0
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

Hi Julien

On 4/18/26 17:08, Julien Olivain via buildroot wrote:
> See release announce:
> https://octave.org/news/release/2026/02/20/octave-1.1.0-released.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---

(This didn't built for me initially, but this was unrelated to the 
version bump. I'll send a patch for addressing that.)

Applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
