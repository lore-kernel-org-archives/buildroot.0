Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1B9C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 10:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA58D82B34;
	Sat,  1 Jan 2022 10:07:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JDXKUHHH-GnL; Sat,  1 Jan 2022 10:07:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F73D81402;
	Sat,  1 Jan 2022 10:07:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F1C01BF5A4
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C5574017A
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:07:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S1sa6owz9gPz for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 10:07:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A593400B6
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 10:07:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b440:9a6c:7abd:86f8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 81DB95FFA5;
 Sat,  1 Jan 2022 11:07:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641031651;
 bh=UOsy2mCAUrKLoYOucoBtjyWdS8EwMKY+ZgBRJJ5r6Qo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MzGgSihu5iIgUSmVA1rSZTds/VXm9NRokx//Joi+Hwt0pFfHUl/mE5gSESrLLJ9mZ
 icvN4m81OhmRQXT3kov+iQdKafXQ4y9OtWJDniJ9JaEDrYT1x+lSaZ6bDqIBK8j9le
 k7JHln6jJg0PMPZwSVqHrnroVry5FExRRvXwsK2kf0TZZVELYvWdOTBw5Kywb3LubT
 8IjWRD57G0j5rjkZhJ0RP3UBfU1SQB7IFFyQM1toVEfG1ru1kilVSDP01HhbKXOYSk
 25Dci+j/ZS3ZkvOsfLfJRWpHjLZHGZf/XTRSjqqXse7E3lZd7ZKt8gxzBnpHWJHTiJ
 KaeP0DScUps5w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jan 2022 11:07:23 +0100
Date: Sat, 1 Jan 2022 11:07:23 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220101100723.GV3390456@scaer>
References: <20211231092425.3550185-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211231092425.3550185-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: requires blake2
 support in openssl
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-12-31 10:24 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump to version 3.10.1 in
> commit 25b1fc2898d68ddf2674b14c738045875fc5a2dc:
> 
> /home/buildroot/autobuild/instance-3/output-1/build/python3-3.10.1/Modules/_hashopenssl.c:244:22: error: implicit declaration of function 'EVP_blake2s256'; did you mean 'LN_blake2s256'? [-Werror=implicit-function-declaration]
>   244 |             digest = EVP_blake2s256();
>       |                      ^~~~~~~~~~~~~~
>       |                      LN_blake2s256
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9112571b75aebb0ba5032ef1b16226d9848f5184
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python3/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/python3/Config.in b/package/python3/Config.in
> index efc4dbb3d4..7714518edc 100644
> --- a/package/python3/Config.in
> +++ b/package/python3/Config.in
> @@ -90,6 +90,7 @@ config BR2_PACKAGE_PYTHON3_READLINE
>  config BR2_PACKAGE_PYTHON3_SSL
>  	bool "ssl"
>  	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLAKE2 if BR2_PACKAGE_LIBOPENSSL
>  	help
>  	  _ssl module for Python3 (required for https in urllib etc).
>  
> -- 
> 2.33.0
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
