Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16560FF886F
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 13:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB05C8454D;
	Mon,  4 May 2026 13:01:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d2CT214PUG1E; Mon,  4 May 2026 13:01:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE1278454F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777899684;
	bh=QNjvJPdaMmXxJwUGB8LW/03T7qm1udezRFuYLmpZJOI=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=l8PLJ/XJ/isLADKBSPsy/TvyGQT0xSEXz6YvKszfclojrxhrCsgYnok+XKRQuH9wi
	 X3rGWNsfrLUf4H9vlezGdK32v8P00zG0kfvOmS5rYtec0DSNNTbwmu59HKSSsGAtb2
	 Y7WbNsds0x3vT44W2W5V2XQKjGDcgAqusyBQE/YKGorFegYHToPR/o+6KDiQZT5xzq
	 sf85uPUrj4b4U31Acxx8FIJPFDkYepzJv18W3eUkF+uO2FZ/yLGKT/84skHJsU2JoN
	 RUVWXzcuBZrmFZu0KxJnCiGO4Moeumy27ccKmVPUZM6B/qEtjaz7RE1WAyeXDXxmhd
	 2DHHBMm8QN9tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE1278454F;
	Mon,  4 May 2026 13:01:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D7F8190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 13:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E45A8454F
 for <buildroot@buildroot.org>; Mon,  4 May 2026 13:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X1CAnBMnPByX for <buildroot@buildroot.org>;
 Mon,  4 May 2026 13:01:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E88CC8454D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E88CC8454D
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E88CC8454D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 13:01:22 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id AFB222C833E6;
 Mon, 04 May 2026 15:01:20 +0200 (CEST)
Message-ID: <1204c482-ce3c-4eee-ac5d-a50f9e12c5f5@bubu1.eu>
Date: Mon, 4 May 2026 15:01:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 buildroot@buildroot.org
References: <20260220192301.119525-1-chakrabortyshubham66@gmail.com>
 <20260417171046.12548-1-chakrabortyshubham66@gmail.com>
Content-Language: en-US
In-Reply-To: <20260417171046.12548-1-chakrabortyshubham66@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777899680; bh=aRK5CavrOtTZO/PIc3hCRQ/5L5pI0eepPAmIOoHFQWg=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=SA4ovdGpuhcWui/jZMy9TLxjLqTBUSxD00oP4UG0FTqDnYPENMYhvZMVkcTXWylqn
 ItT5HWNWvQa5gOMxmILdMiNt+1HZZnI0brqHHQTr/AQKhmhojAod43xrc/O0WYSzNP
 C+oZyjKSqZBPby+U1r7GOSbqxGSC+iWJoUl9pCNneq0CjMhMg9uBT2HHJleydFO7s1
 tDTCLwWzRZJxsogMZQZ6dtk1kLGtnFCbPRrAQ6qzDiNRCdqNP4X7WW8dhyyucbaK3s
 DZCVkfBdgOML8O6/0voFKaKbON1Y8frq7fEs/Zpq+OX+2JuJ4G0SDxZVCLBqt7SucM
 SWVDfTSOufT3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=SA4ovdGp
Subject: Re: [Buildroot] [PATCH v2] package/make: fix conflicting prototypes
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

Hi Shubham

On 4/17/26 19:10, Shubham Chakraborty wrote:
> GCC 15 defaults to C23, which rejects old-style K&R empty parameter
> list declarations that conflict with typed prototypes in system headers.
> This is particularly visible when using non-glibc C libraries (e.g. musl).
> 
> Fixes:
> lib/fnmatch.c:124:14: error: conflicting types for 'getenv'; have 'char *(void)'
> |   124 | extern char *getenv ();
> |       |              ^~~~~~
> 
> Fix getenv() declarations in lib/fnmatch.c and src/getopt.c, and
> fix getopt() declarations in src/getopt.h to match the prototypes
> in <stdlib.h> and <unistd.h>.
> 
> Upstream: https://lists.gnu.org/archive/html/bug-make/2025-03/msg00032.html
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> 
> ---
> v1 -> v2:
>    - Add Upstream: tag with link to bug-make mailing list (Marcus)
>    - Include specific GCC 15 error log in commit message
>    - Improve commit description with more technical context
>    - Update patch headers to standard format
> ---
>   ...ing-prototypes-for-getenv-and-getopt.patch | 70 +++++++++++++++++++
>   1 file changed, 70 insertions(+)
>   create mode 100644 package/make/0001-fix-conflicting-prototypes-for-getenv-and-getopt.patch
> 
> diff --git a/package/make/0001-fix-conflicting-prototypes-for-getenv-and-getopt.patch b/package/make/0001-fix-conflicting-prototypes-for-getenv-and-getopt.patch
> new file mode 100644
> index 0000000000..70f2dc2886
> --- /dev/null
> +++ b/package/make/0001-fix-conflicting-prototypes-for-getenv-and-getopt.patch
> @@ -0,0 +1,70 @@
> +From b64b62d00cb64b62d00cb64b62d00cb64b62d00c Mon Sep 17 00:00:00:00 2001
> +From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> +Date: Sat, 21 Feb 2026 12:00:00 +0000
> +Subject: [PATCH] fix conflicting prototypes for getenv and getopt
> +
> +GCC 15 defaults to C23, which rejects old-style K&R empty parameter
> +list declarations that conflict with typed prototypes in system headers.
> +
> +Fix getenv() declarations in lib/fnmatch.c and src/getopt.c, and
> +fix getopt() declarations in src/getopt.h to match the prototypes
> +in <stdlib.h> and <unistd.h>.
> +
> +This fixes build errors like:
> +error: conflicting types for 'getenv'; have 'char *(void)'
> +
> +Upstream: https://lists.gnu.org/archive/html/bug-make/2025-03/msg00032.html

You cannot use the upstream tag for a submission that's different from 
what was submitted upstream, including the authorship of the submission. 
At least not without any explanation of the differences.

If you adapted/expanded the upstream patch, the authorship of the 
original submission needs to be kept and reason for the changes 
explained. If this is your own patch, the authorship is correct but the 
upstream tag cannot be used. (You could still link to the submission in 
the commit message) As-is, it's really not clear what should happen if 
the upstream patch gets applied, could this patch be dropped or would 
the problem then not be fully fixed?

I cannot apply this as-is, even if it fixes the underlying problem. The 
patch origin authorship and upstream status need to be clear.

> +Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> +---
Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
