Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4741C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 22:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FC2681EE1;
	Mon,  5 Feb 2024 22:55:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FC2681EE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CFbsKQ2u0MQE; Mon,  5 Feb 2024 22:55:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1B7281F0F;
	Mon,  5 Feb 2024 22:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1B7281F0F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DBE791BF319
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C04F940589
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C04F940589
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 09zS0N1YQtKF for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 22:55:50 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D13540B5B
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 22:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D13540B5B
Received: from ymorin.is-a-geek.org (unknown [194.78.211.220])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 778EC19F593;
 Mon,  5 Feb 2024 23:55:46 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 05 Feb 2024 23:55:44 +0100
Date: Mon, 5 Feb 2024 23:55:44 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: ~bubu <buildroot@bubu1.eu>
Message-ID: <ZcFncBvyMFjNZe7U@landeda>
References: <170717267442.23753.14671176069067053494-0@git.sr.ht>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <170717267442.23753.14671176069067053494-0@git.sr.ht>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707173748;
 bh=lg9naDudsc+QASh+wmyW6zP7NQbNpPAXEQqDYRj8ZG0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=py+IOyApaOoHBEG9a7NJRo+T0NzmHvvsOQU5Oymlu0Gjbdlr2pUVm2zUCvNGh5Wb/
 8dqR9M75GpqxvhV+5quLHYeMZjDu+9M0oHqdvT5EcpL4pZGz6sP0W1jg+o2Ijfu293
 OGji8/SSpa/czK9hen0oS2NfMzm+6QZsJj8VTOyaUCnBmHtSNhAoHj/nA2HqGmJLux
 R3HbzoAV3oQUEXDrVFrGG5rdl668hE8y7SYPGu2d1kIn+O6iKTNRVUi+CFHrKOJjiN
 qb++rmyCGpjx3dciQZeqX0OEKsRGmXl0koAUmYcrWgT49gl3zQpmBsVNiU72KqzHDY
 Hxth2aIOHdjNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=py+IOyAp
Subject: Re: [Buildroot] [PATCH buildroot] support/testing: remove unused
 import from sample_python_crossbar
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marcus, All,

On 2024-02-05 23:28 +0100, ~bubu spake thusly:
> From: Marcus Hoffmann <buildroot@bubu1.eu>
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/package/sample_python_crossbar.py | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/sample_python_crossbar.py b/support/testing/tests/package/sample_python_crossbar.py
> index 8160a37219..3695fe92c0 100644
> --- a/support/testing/tests/package/sample_python_crossbar.py
> +++ b/support/testing/tests/package/sample_python_crossbar.py
> @@ -1,4 +1,3 @@
> -import os
>  import crossbar
>  
>  crossbar.run(["version"])
> -- 
> 2.38.5
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
