Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2487DC48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 21:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9208405A9;
	Sun,  4 Feb 2024 21:37:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9208405A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TRI6S9C0uPlG; Sun,  4 Feb 2024 21:37:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B580E405B7;
	Sun,  4 Feb 2024 21:37:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B580E405B7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7AE2B1BF909
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51D27405B7
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51D27405B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RRcFw0W10Mv6 for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 21:37:46 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24285405A9
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 21:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24285405A9
Received: from ymorin.is-a-geek.org (unknown [194.78.211.220])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 0DDA819F58A;
 Sun,  4 Feb 2024 22:37:40 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Feb 2024 22:37:39 +0100
Date: Sun, 4 Feb 2024 22:37:39 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZcADo-2-H0FsNICb@landeda>
References: <20240130222138.136539-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240130222138.136539-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707082664;
 bh=vOsD687tA2EIy+zFSycMaq5ywvZCYAonmCLPWbb6I+8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FQi7LE4cGN8zR+e8Gad0KjPw+uq0JVGW+1c7bjoia2qkiSMoDrMm/By+bYXhYobw2
 eyH5HZDtjG7p64wkTxCYnsBMjockRUmJnThb1Uwn/whyS0TjNfYEGtrpBoUzZ2zBXN
 ykh4YZ3VAC9DedfRGMAhyUCxrZfgZYXFtGfkzhys/2uEOcpeZmhuxB7QiC40tQuSFV
 nVNW4Ndb/PPUgKTd3ZcOTqntCWtpxyQXznnmps6XKc1706Ra1YoNHXjBqBrZffv16G
 odJLIKsDDvE6Da+xEEIXZ1GAIb9j7Frh9KhppmIQoo90wf7a9GH7F0mZxL0QZ/bU6P
 bEoyOYC2gDK5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FQi7LE4c
Subject: Re: [Buildroot] [PATCH 1/1] package/axel: fix openssl build
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
Cc: Ismael Luceno <ismael@iodev.co.uk>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-01-30 23:21 +0100, Fabrice Fontaine spake thusly:
> Replace --with-ssl by --with-ssl=openssl to avoid the following build
> failure raised since bump to version 2.17.12 in commit
> 50ba0b0a40187b695740a2fce2d2f3ed7cbf58c5 and
> https://github.com/axel-download-accelerator/axel/commit/21ccacd0c3bb415c550d590cd64aaa9bf08997a8:
> 
> configure: error: Invalid argument: --with-ssl=yes
> 
> While at it, also add wolfssl support available since
> https://github.com/axel-download-accelerator/axel/commit/0759374239acaeac4105f4851cfabc28433f3bcd
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a8c00442bc296353c75e393896abe9883b093a57
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/axel/axel.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/axel/axel.mk b/package/axel/axel.mk
> index b3896e86e3..d3a2f4d42c 100644
> --- a/package/axel/axel.mk
> +++ b/package/axel/axel.mk
> @@ -19,8 +19,11 @@ AXEL_CONF_OPTS = \
>  	CFLAGS="$(TARGET_CFLAGS)"
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
> -AXEL_CONF_OPTS += --with-ssl
> +AXEL_CONF_OPTS += --with-ssl=openssl
>  AXEL_DEPENDENCIES += openssl
> +else ifeq ($(BR2_PACKAGE_WOLFSSL_ALL),y)
> +AXEL_CONF_OPTS += --with-ssl=wolfssl
> +AXEL_DEPENDENCIES += wolfssl
>  else
>  AXEL_CONF_OPTS += --without-ssl
>  endif
> -- 
> 2.43.0
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
