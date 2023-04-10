Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B54C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B94960F3F;
	Mon, 10 Apr 2023 19:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B94960F3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id laUhoglP_RSJ; Mon, 10 Apr 2023 19:04:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 021A960E92;
	Mon, 10 Apr 2023 19:04:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 021A960E92
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 680E81C3AE9
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E59760071
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:04:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E59760071
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wnvHzePdIKZV for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:04:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF66060E92
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF66060E92
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:04:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id DC9695FF27;
 Mon, 10 Apr 2023 21:04:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 10 Apr 2023 21:04:01 +0200
Date: Mon, 10 Apr 2023 21:04:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vincent Fazio <vfazio@gmail.com>
Message-ID: <20230410190401.GI2819@scaer>
References: <20230403013530.3502-1-vfazio@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230403013530.3502-1-vfazio@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681153445;
 bh=qH3qrMakfmEeoSeyCF42VnX3+9aC+lebrvdld1EHnPk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KF4eIA3xRtIWzSJG30d5mQh/MJKfMUHxZ316o1w7Z3bth3WgsZwP7+p0mIkqpMrru
 wPQ+UhSidv4cV6RPgl5icTSp6TUxQ3xoqWrUPeipQ7rxz8Qj8doESyGFb/n/454rD+
 QNVrzvys/lI28nE/3xltE+AuWpU97MgfiLtmzFFohGBewnGZ8S9ygN8tyQkkyOD9UZ
 KKMWiJs8hlTy4XT4ue7tVK/87V7kvPQcCTuH74z0mgiXRTBtfqUGl1ROAp4NZO7UMl
 magu6dyBp10SQKsZmhJfP72+Wa2h6B+ZwVMNyhRR2vK/gGkhoaE29aytyQDQAxLMjj
 kv3mrEux+Miow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KF4eIA3x
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

Vincent, All,

On 2023-04-02 20:35 -0500, Vincent Fazio spake thusly:
> The shebang in check-package now defines python3. There is no longer a
> need to maintain support with python 2.x.
> 
> See-also: 02b165dc71 (check-package: fix Python3 support)
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>

Applied to master, thanks.

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

As seen on IRC: it does not leak a fileobject: it is not bound to a
variable, so the object is garbage-collected as soon as it is no longer
referenced, i.e. right after the function call ends.

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
