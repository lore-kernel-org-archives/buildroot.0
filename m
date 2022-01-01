Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF8BC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 09:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 527ED60E1B;
	Sat,  1 Jan 2022 09:50:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3GEUfpbk_0LW; Sat,  1 Jan 2022 09:50:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B870C60E02;
	Sat,  1 Jan 2022 09:50:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B947B1BF5A8
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 09:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A688940259
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 09:50:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8GMYjEozdSbu for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 09:50:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97E1B401ED
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 09:50:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b440:9a6c:7abd:86f8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id BC6185FF7A;
 Sat,  1 Jan 2022 10:49:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641030599;
 bh=0MBWxi8+KX3+7gHmPt9eP8594+1UcG0yRMo1ODejxsE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eva5xqAzRFFEbO8ydAi9ei0G5GqCuESK5bj9W+peVqDzilSJM2zu0Q/uQbw9q+IQ1
 zExtlmgEjGZ53z2TBquD/uaYOjpR6hd1DOpns2x0LACbWoEYy4H+Y4cf4hHGFaaiP2
 5rB8vA4Ap+01gAQ5zkld/XRAYdOPzPFMwJaCrTJoND5o/RpjeSTU9lVXQgrQpWBv0Q
 uUPcyl16wrOsIFEu3Ya5BuTCVwqu/ujuECRheVWj9yA7UhojKHRXyMfllg/Bm+0e6A
 /AbROX+1KPK8bAdwaVG9a+99ZUv6VzRWFsFodi2GbEa6MUIeQxR1i0RzYhOQgxvinI
 6dZWF7KCidvcg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jan 2022 10:49:52 +0100
Date: Sat, 1 Jan 2022 10:49:52 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220101094952.GR3390456@scaer>
References: <20220101000408.1538099-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220101000408.1538099-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohttp: add aiosignal
 runtime dependency
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2021-12-31 17:04 -0700, James Hilliard spake thusly:
> Fixes:
>   File "/usr/lib/python3.10/site-packages/aiohttp/__init__.py", line 6, in <module>
>   File "/usr/lib/python3.10/site-packages/aiohttp/client.py", line 88, in <module>
>   File "/usr/lib/python3.10/site-packages/aiohttp/tracing.py", line 5, in <module>
> ModuleNotFoundError: No module named 'aiosignal'

What about a small runtime test to ensure we no longer miss any such
dependency in the future? ;-)

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-aiohttp/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-aiohttp/Config.in b/package/python-aiohttp/Config.in
> index 9ffea088e4..85a6862141 100644
> --- a/package/python-aiohttp/Config.in
> +++ b/package/python-aiohttp/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_AIOHTTP
>  	bool "python-aiohttp"
>  	depends on BR2_PACKAGE_PYTHON3
>  	select BR2_PACKAGE_PYTHON_AIODNS # runtime
> +	select BR2_PACKAGE_PYTHON_AIOSIGNAL # runtime
>  	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
>  	select BR2_PACKAGE_PYTHON_ATTRS # runtime
>  	select BR2_PACKAGE_PYTHON_CCHARDET if BR2_INSTALL_LIBSTDCPP # runtime
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
