Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325B4C77B61
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 17:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94EBC4175F;
	Mon, 10 Apr 2023 17:44:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94EBC4175F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oEYgYYEwh1zK; Mon, 10 Apr 2023 17:44:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A9F041528;
	Mon, 10 Apr 2023 17:44:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A9F041528
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 68FE11BF380
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 17:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F8AA81CE7
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 17:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F8AA81CE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LHHdAGcsBJv3 for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 17:44:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0973B8142A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0973B8142A
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 17:44:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 94ECD5FFA1;
 Mon, 10 Apr 2023 19:44:28 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 10 Apr 2023 19:44:28 +0200
Date: Mon, 10 Apr 2023 19:44:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vincent Fazio <vfazio@gmail.com>
Message-ID: <20230410174428.GH2819@scaer>
References: <20230403013530.3502-1-vfazio@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230403013530.3502-1-vfazio@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681148672;
 bh=faq3WN0orVbL7WHw6W63866BhVmkSgl9udubnqElDNs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AgjWbGFfsQWzyRm2TY020sYsReHALrHDfGwiDr1NhVxEFuXE2+MlUQ18Idcoy/2Xk
 4K+mW0WDXGPRXw1m6q0HIzJI3eTJY1qWTqBQ6VNXjEhxmjivL6iHgdLRMfuaD0r40F
 fkqRunUQOfFBVygx6x4N1LEj/x+4ctf7oE8xHHMgLK+1WmqSlofJpgCSXWYP2GHqeW
 a7pHjm3aGl1lMg9oecGig5Hp3JCCMYzx3TLVhGGRFiI4b2LydG8U1wrOj4Jt4GUb2L
 borPVYom0RLE3BiRKEHeEKnw9IiyeaGBuiF2YhfEke0GY3A9bbS0nBnxssF+X4GEgC
 LO9Gk4nHWhnmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AgjWbGFf
Subject: Re: [Buildroot] [PATCH] utils/check-package: drop six usage
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2023-04-02 20:35 -0500, Vincent Fazio spake thusly:
> The shebang in check-package now defines python3. There is no longer a
> need to maintain support with python 2.x.
> 
> See-also: 02b165dc71 (check-package: fix Python3 support)
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
>  utils/check-package | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/utils/check-package b/utils/check-package
> index 98a25bd0b2..46f2897b51 100755
> --- a/utils/check-package
> +++ b/utils/check-package
> @@ -6,7 +6,6 @@ import inspect
>  import magic
>  import os
>  import re
> -import six
>  import sys
>  
>  import checkpackagelib.base
> @@ -218,12 +217,9 @@ def check_file_using_lib(fname):
>          if fail > 0:
>              failed.add(name)
>          nwarnings += warn
> -    if six.PY3:
> -        f = open(fname, "r", errors="surrogateescape")
> -    else:
> -        f = open(fname, "r")
> +
>      lastline = ""
> -    for lineno, text in enumerate(f.readlines()):
> +    for lineno, text in enumerate(open(fname, "r", errors="surrogateescape").readlines()):

Err.. This leaks a file object, no?

Even if the script is short-lived, it is better to properly close()
files once they are unused.

Here, I believe using a context manager is adequate (and relatively easy
now that we do no longer have to deal with two ways if opening the
file):

    with open(fname, "r", errors="surrogateescape") as f:
        for lineno, text in enumerate(f.readlines()):
            ...

Regards,
Yann E. MORIN.

>          nlines += 1
>          for name, cf in objects:
>              if cf.disable.search(lastline):
> @@ -233,7 +229,7 @@ def check_file_using_lib(fname):
>                  failed.add(name)
>              nwarnings += warn
>          lastline = text
> -    f.close()
> +
>      for name, cf in objects:
>          warn, fail = print_warnings(cf.after(), name in xfail)
>          if fail > 0:
> -- 
> 2.25.1
> 
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
