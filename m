Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA427C61DA4
	for <buildroot@archiver.kernel.org>; Sat,  4 Feb 2023 14:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80FB360F49;
	Sat,  4 Feb 2023 14:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80FB360F49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IHMFs0QTnBcJ; Sat,  4 Feb 2023 14:39:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 686A560F45;
	Sat,  4 Feb 2023 14:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 686A560F45
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0068C1BF425
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 14:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAC7141A56
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 14:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAC7141A56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KbVoKUb4jRDo for <buildroot@lists.busybox.net>;
 Sat,  4 Feb 2023 14:39:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4283F41A4C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4283F41A4C
 for <buildroot@buildroot.org>; Sat,  4 Feb 2023 14:39:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.102.219])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id B9D5519F5AB;
 Sat,  4 Feb 2023 15:39:49 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Feb 2023 15:39:48 +0100
Date: Sat, 4 Feb 2023 15:39:48 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Sergey Organov <sorganov@gmail.com>
Message-ID: <20230204143948.GB24755@scaer>
References: <20230204134709.4160596-1-sorganov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230204134709.4160596-1-sorganov@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675521592;
 bh=jBJMAz6jyZYTBhqAen8Kr3qTNbDQyz39Ek77+SJbQ0k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C0fQvdK1vvTODi/l2vsWrIv3MBLjA8XeO0oaVOV8qwozUBVn5l80Z7cNEcLao+6em
 BRpni0Wic8Wz1VyoaYwwgvs5ZhDXzpYy410OIoSxB7oaa121KhQJholJfck4rlXXev
 X/KoDxhdKa83UdqFQxJ8A6o0H+32kJl3WoFCx7b6K2suNp1Y3p3mYifIHgULlczOzg
 P5h72IqNYKP0KXka2/rA//JNjKRiMprtqsfMHFkzxrxqZudFtL0smVkRaap1rENcHR
 WMAG7FrpvxB1u7RmUPKLGxNaFR7o3Mas/aLOIbe5rByomhCQswrs/d5cjwnL8d9NIL
 1TJVTYyJs9SEg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=C0fQvdK1
Subject: Re: [Buildroot] [PATCH] package/openvpn: get rid of -e in
 S60openvpn shebang
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

Sergey, All,

On 2023-02-04 16:47 +0300, Sergey Organov spake thusly:
> The -e switch makes the script terminate on error from
> start-stop-daemon, rendering unreachable the code that checks the exit
> status.
> 
> There is no need in the -e switch in the first place either, as the
> script takes care of errors handling.
> 
> Signed-off-by: Sergey Organov <sorganov@gmail.com>

Applied to master, thanks.

However, this script has a lot of coding style issues:

    $ ./utils/check-package 
    package/openvpn/S60openvpn:14: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)
    package/openvpn/S60openvpn:15: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)
    package/openvpn/S60openvpn:16: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)
    package/openvpn/S60openvpn:17: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)
    package/openvpn/S60openvpn:18: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)
    package/openvpn/S60openvpn:21: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)
    [...]
    package/openvpn/S60openvpn:0: DAEMON variable not defined (http://nightly.buildroot.org/#adding-packages-start-script)

Could you look into bringing this old script up to today's standards,
please?

Regards,
Yann E. MORIN.

> ---
>  package/openvpn/S60openvpn | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/openvpn/S60openvpn b/package/openvpn/S60openvpn
> index f097cf11ec..00156c80db 100644
> --- a/package/openvpn/S60openvpn
> +++ b/package/openvpn/S60openvpn
> @@ -1,4 +1,4 @@
> -#!/bin/sh -e
> +#!/bin/sh
>  #
>  # Original version by Robert Leslie
>  # <rob@mars.org>, edited by iwj and cs
> 
> base-commit: c7ea83dd2df315ba4f492a9ef6b24152ba4cc4f3
> -- 
> 2.30.1
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
