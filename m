Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AE4CD98F2
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 14:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61AF1411C4;
	Thu, 18 Jun 2026 14:04:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vX4YlNZY5Opp; Thu, 18 Jun 2026 14:04:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6600141118
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781791492;
	bh=47SAgOAhETTN40Gf1YN5bddLz0QbH6Ip6eUxJV5ZEHI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=tEaV9xXP00wqUiea7wgcmwu3whZv+YD2cQh/rMKAYFntYx92ObBNfWlLlP5njMMII
	 CeQ3qExmUKh2YVFsINftZWM6g/Et6WN72txmOjhTxexGdm34EnKvxBE6w/o/dGRk47
	 tUCMid5GJnBEPprXoPjTFOOmAJScJ8l1zrgLZtl5WU8ppy8RRaWLlyT3dC3AYgS6ZG
	 tnYM49f+ldM4Xl2kfk0RDI8Qq70b6EAjMazrsVqo1zOE0vd+HXOWl5E+xjsxyEOw/5
	 hzPoNbwkNrR32kWXk2HeT4yJ6JYodyioLH+2vN3PlXFy8K9wnfouJOAPOt2lzLtYtt
	 NPLk74TuDAfGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6600141118;
	Thu, 18 Jun 2026 14:04:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 301CC183
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 14:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21BA083B1B
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 14:04:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u4jUZ9h8wEiL for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 14:04:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ACA6983ADC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACA6983ADC
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ACA6983ADC
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 14:04:49 +0000 (UTC)
Received: from [10.14.240.133] (unknown [45.156.240.98])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id BBEFE2C88EF4;
 Thu, 18 Jun 2026 16:04:45 +0200 (CEST)
Message-ID: <9b0c655b-ff65-4841-9390-43515fb06d56@bubu1.eu>
Date: Thu, 18 Jun 2026 16:04:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com, James Hilliard <james.hilliard1@gmail.com>,
 Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Thomas Perale <thomas.perale@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20260617174208.3968183-1-james.hilliard1@gmail.com>
 <ajOHeaIobPebbK+f@yd-6wlzhs3>
Content-Language: en-US
In-Reply-To: <ajOHeaIobPebbK+f@yd-6wlzhs3>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1781791486; bh=za17xVBJc0fLVlgkwz5FD0ivFsGT68gm3Gkxmkqp8NY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=n9w5vhi/Hy3Eg2fnauCQ8aUd9Y+qUmOe7Et1RDcfRgbg01erm9+nDubnvuyCnvQe0
 JNQ2+kTk8FSs/KW/nFUUn3M9xJESEB8ULfwTkizL1q8Y9CIFm6j2tF4q76QBnkeEIT
 tkP5I9BwO+gvtDSB2UzbAIfX8k74Bgr4aXdBY00wY/3SSOQdDnChiSH+v0G4UqdcQ2
 E9GLFJQ9JfjNLucITVoPtuIcZjKIAaTc2sNAYDUHvQkCqJZ2UJjiWD7qQup4xtsrdn
 P4a8B5hcfiDexGO1qss+P2Hin9SmAk1mesKpzPyZslZSio2bZxyhT+itEVy9gIUgyj
 Az096xD0pSeOg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=n9w5vhi/
Subject: [Buildroot] minimum system/coreutils requirements (was:
 support/download: add blake2b-256 hash support)
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

Hi Yann, James, (Peter et. all),

I wondered about the b2sum dependency as well but the conclusion was "a 
version from 10 years ago is probably fine".

Some discussion on this below.

On 6/18/26 07:51, yann.morin@orange.com wrote:
> James, All,
> 
> On 2026-06-17 11:42 -0600, James Hilliard spake thusly:
> [--SNIP--]
>> Teach the download hash checker to validate blake2b-256 entries using
>> b2sum -l 256, and update check-package so the new hash type and length
>> are accepted. Also add the CycloneDX hash spelling so generated SBOMs
>> can include blake2b-256 hashes from .hash files.
> [--SNIP--]
>> +    if [ "${_h}" = "blake2b-256" ]; then
>> +        _hash="$( b2sum -l 256 "${_file}" |cut -d ' ' -f 1 )"
> 
> b2sum was only introduced with coreutils 8.26, but we support running on
> systems that have an older version: we already check that ln supports
> --relative (introduced in 8.16) and that realpath exists (introduced in
> 8.15).

Coreutils 8.26 was released almost 10 years ago, 8.15 was released 
(slightly) over 14 years ago. I wonder at what point we can assume that 
having a version with the required functionality is a given. 10 years is 
not thaaat long ago in lts distro terms, I suppose, but even debian 
old-old-stable has b2sum already. I also wonder if buildroot actually 
fully works on a 10 or 15 year old system. Without known users or actual 
automatic tests being run it feels kind of weird to assume it does.

Anyway, thoughts about this? Anyone got actual experience on running 
buildroot on these old systems? (I'm more on the side of running into 
breakage on the newest stuff on archlinux)

> 
> So, we probably want to add b2sum to the list of tools to check in
> support/dependencies/check-host-coreutils.s and then add
> $(BR2_COREUTILS_HOST_DEPENDENCY) to the dependencies of packages that
> have a blake2 hash (the python infra can do so, for example).

James already sent a version which does that and it seems okay to merge 
if anyone actually needs this on old versions.

It's not super great though because if someone where to add a blake2b 
hash for a non-python package which then someone would try to build on 
an old distro it would still break, I think?

I guess I'd mostly like to know if this complexity is actually worth it 
and if we would want to at least define a minimum supported coreutils 
version which we could bump at some point to get rid of these checks again.

Opinions?

> 
> Regards,
> Yann E. MORIN.
> 

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
