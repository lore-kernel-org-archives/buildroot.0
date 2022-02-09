Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06742C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 20:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A76D440880;
	Wed,  9 Feb 2022 20:33:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T3zZGNDDg0MQ; Wed,  9 Feb 2022 20:33:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA1C34067F;
	Wed,  9 Feb 2022 20:33:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBC331BF42C
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 20:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA36B60A93
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 20:33:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UZCsxhlkfxyS for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 20:33:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 641DC60009
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 20:33:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d4bd:3395:fce0:5749])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D72CC7802C2;
 Wed,  9 Feb 2022 21:33:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1644438821;
 bh=aJw0YEn14gTVm4UfpHRak8tbUo8yN/J+amS15URb3lo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZTlr6noK/nZX3Yj8T/fPw9U+7PRf/EWbA2hWjr2kZtI+pb2+HZr7FkufFSGx+1OSO
 gJQ8INy+ENT6ETjUOko1GwGczf1Uue/VyG7wiFtV/F77Yj6aY64dPz/F2/bz8J5OUf
 0wEXbsIJM5juTJ9ar4ORfH31ZAp/Z9FseEVFt2Hog+cF0mIICAcfMlQYgUaMB9eNvP
 OobabOq1Sw2dXZn+nCveyit0Fb0t22aTVZMSOykjSKlu1hL6BekQJ3dsGk03uH2af/
 bwr/M9HTwGmGROTQGbBdWTHn1Qc7V9YFU5n7HQH4JKVItRs7G6ukSX8JO6pHOVNoqX
 +QEM2Td3IyEEA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 09 Feb 2022 21:33:36 +0100
Date: Wed, 9 Feb 2022 21:33:36 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220209203336.GC2249818@scaer>
References: <20220209152606.20762-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220209152606.20762-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/python-pyzmq: drop python2
 dependency for comment
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
Cc: Michael Rommel <rommel@layer-7.net>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2022-02-09 16:26 +0100, Peter Korsgaard spake thusly:
> The package was updated to support python3 in commit 4a8bedc51d9
> (python-pyzmq: enable PyZMQ for Python 3), but the comment dependency was
> missed.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-pyzmq/Config.in | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/python-pyzmq/Config.in b/package/python-pyzmq/Config.in
> index 8f33a635c8..f8ce52f844 100644
> --- a/package/python-pyzmq/Config.in
> +++ b/package/python-pyzmq/Config.in
> @@ -9,5 +9,4 @@ config BR2_PACKAGE_PYTHON_PYZMQ
>  	  http://zeromq.org/bindings:python
>  
>  comment "python-pyzmq needs a toolchain w/ C++, threads"
> -	depends on BR2_PACKAGE_PYTHON
>  	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
> -- 
> 2.20.1
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
