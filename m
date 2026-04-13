Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1884CE64007
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 11:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAD6F8468D;
	Mon, 13 Apr 2026 11:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kpVJjFEeWE_9; Mon, 13 Apr 2026 11:28:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7F3C8457F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776079719;
	bh=wQk9Gk8hUVqhekAXWB5LOIwpk0EXWbTpFPJSI32R41w=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=hU9/WNWpYj/RsB5i342gDL9AJKiJvzWLpmy5Du+Of/WFvNcQDXKyP9Oen2IkA7oMm
	 i7HUH1eUDZWEU9t+PNdKisxpicVws1hhGePyWiyCwn6LkHBjxvtj7are9p9q2MD+th
	 nR0SILOSNs80VO86tT36deE/dNmT0PiNW5jAK4R2SQUCN0W67csxYFP7IJFKJp6nqY
	 sk4CkMeVxntHk3df778S+OHUNqCoECJ0HaHnby5L0G3eGKQUNyFZWW2Lga6zPceh/S
	 ULW6K/Y+juPixNA/HOdDqLfH9it9Z3px1hIFaCs6413jHeMRORgo5y5hfx5VSI5c+E
	 Iuv6imsqODvfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7F3C8457F;
	Mon, 13 Apr 2026 11:28:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EF696194
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 11:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECC8860EAD
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 11:28:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dd6uHo0lUz5D for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 11:28:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9DF7060EA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DF7060EA1
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DF7060EA1
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 11:28:35 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 832762C80CDB;
 Mon, 13 Apr 2026 13:28:32 +0200 (CEST)
Message-ID: <d1cf1792-fa3a-4143-b95b-749e3522320c@bubu1.eu>
Date: Mon, 13 Apr 2026 13:28:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 buildroot@buildroot.org
References: <20260220192301.119525-1-chakrabortyshubham66@gmail.com>
Content-Language: en-US
In-Reply-To: <20260220192301.119525-1-chakrabortyshubham66@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1776079712; bh=L7y+QoIAXHsLvd9WnpUCPmOHBAyubnt7Mjuirsq+QPU=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=cT0X0cei2Z4g40QwJz7DtPBPP/dUEiAZeuzLTc1FbEfgPf2eHevCWUZ+l899RVWqL
 7bFSknpbKmcHWD6kMSZzGKZWkurCAo3SG870jLgp20uNiKrD7xt6SWqLzebTwOI61Y
 Is3yivrFMORCMer0SnV4UbS2ZKwDInTi/tVVCoXUbv2dPItoZvXPlagofpGTujFOYO
 x6AXuTE+bEzy0C11LIh+WXHDS8DED1R38qAfs1P+kZrJEQDcqAPyolmbEVPry1G2dW
 B52dqxRNBvK/BQrpoe1I9tvW6FdCbG3ooiWeGHstVObtZRZqB42sPoml9gWZrraZ4D
 EFqMFU8ubTpew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=cT0X0cei
Subject: Re: [Buildroot] [PATCH] package/make: fix conflicting prototypes
 for getenv and getopt
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

for context: Bernd sent a different solution for this problem a while ago.

https://patchwork.ozlabs.org/project/buildroot/patch/20260209195320.368734-1-bernd@kuhls.net/

On 2/20/26 20:23, Shubham Chakraborty wrote:
> GCC 15 defaults to C23, which rejects old-style K&R empty parameter
> list declarations that conflict with typed prototypes in system headers.
> 
> Fix getenv() declarations in lib/fnmatch.c and src/getopt.c, and
> fix getopt() declarations in src/getopt.h to match the prototypes
> in <stdlib.h> and <unistd.h>.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>   ...ing-prototypes-for-getenv-and-getopt.patch | 60 +++++++++++++++++++
>   1 file changed, 60 insertions(+)
>   create mode 100644 package/make/0001-fix-conflicting-prototypes-for-getenv-and-getopt.patch
> 
> diff --git a/package/make/0001-fix-conflicting-prototypes-for-getenv-and-getopt.patch b/package/make/0001-fix-conflicting-prototypes-for-getenv-and-getopt.patch
> new file mode 100644
> index 0000000000..b64b62d00c
> --- /dev/null
> +++ b/package/make/0001-fix-conflicting-prototypes-for-getenv-and-getopt.patch
> @@ -0,0 +1,60 @@
> +From: Buildroot Maintainer <buildroot@buildroot.org>
 > +Date: Sat, 21 Feb 2026 12:00:00 +0000> +Subject: [PATCH] fix 
conflicting prototypes for getenv and getopt
> +
> +Fixes build error with GCC 15 and musl libc.
> +
> +Signed-off-by: Buildroot Maintainer <buildroot@buildroot.org>

This is not a correct signoff, you'll need to add your personal 
signed-off-by.

The patch is also missing an Upstream: tag, describing where this has 
been submitted upstream, or why that is not applicable/feasible.

A variation of this is carried by alpine [1] and another one has 
actually been posted to the make ML [2].

Can you maybe follow up on the upstream submission and resubmit the 
patch with correct signoff and upstream tag?

I've marked the patch as Changes Requested in patchwork.

[...]

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
