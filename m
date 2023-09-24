Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B533CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 10:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEFC441A04;
	Sun, 24 Sep 2023 10:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEFC441A04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MMPi7UWCSjIS; Sun, 24 Sep 2023 10:37:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A766E41991;
	Sun, 24 Sep 2023 10:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A766E41991
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 88D551BF909
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 10:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60F2E418E3
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 10:36:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60F2E418E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WOAsov7DLjcm for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 10:36:40 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25A834193E
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 10:36:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25A834193E
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:bf8d:df06:37bc:41df])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id BC42D780368;
 Sun, 24 Sep 2023 12:36:35 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Sep 2023 12:36:35 +0200
Date: Sun, 24 Sep 2023 12:36:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230924103635.GN1469982@scaer>
References: <20230923113131.772390-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230923113131.772390-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695551797;
 bh=7YcCSbN4yznvDQeBkzx3EE4yzfPcZa7df0P99d4/+ZU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T12YD/nyU57JP/OtenLlhFzgWz2ffMXHMYf/YI1RiRyI3W+U1PlFLvej3nu27hF10
 fyp/M7GSqFdR5w4NgC/DXNnnKnd1Y5e1nFxin9Bunz4FJD8ZgaOufv3ahwb4p27PQH
 dmy0sj14PYx4qGfzOhOaZDcS3oZcHyTYg0Q1LYvzfiIV5W4pxkNZOaWxPbQGmN9Xkz
 bw3frK8Gm1JHtPLnZd21Hg+SmT6Lcq9cFcuXK9p3kwsDeEuf1OyLjPFNoMxT1zmN5H
 YjnJtFw8JdOk09YtczVE/fImRzsKAkdzoh5nLJIo5Zs8bsORMneT43IxjVa8E/ehL8
 2nrXE/A0S5pmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=T12YD/ny
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: bump version to
 3.1.3
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

Bernd, All,

On 2023-09-23 13:31 +0200, Bernd Kuhls spake thusly:
> Fixes CVE-2023-4807 (Windows-only):
> https://www.openssl.org/news/vulnerabilities.html
> 
> Changelog: https://www.openssl.org/news/cl31.txt
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libopenssl/libopenssl.hash | 4 ++--
>  package/libopenssl/libopenssl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
> index 1c82cd7cf8..9126175977 100644
> --- a/package/libopenssl/libopenssl.hash
> +++ b/package/libopenssl/libopenssl.hash
> @@ -1,5 +1,5 @@
> -# From https://www.openssl.org/source/openssl-3.1.2.tar.gz.sha256
> -sha256  a0ce69b8b97ea6a35b96875235aa453b966ba3cba8af2de23657d8b6767d6539  openssl-3.1.2.tar.gz
> +# From https://www.openssl.org/source/openssl-3.1.3.tar.gz.sha256
> +sha256  f0316a2ebd89e7f2352976445458689f80302093788c466692fb2a188b2eacf6  openssl-3.1.3.tar.gz
>  
>  # License files
>  sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index 9c1dbe8694..b69ef032f2 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBOPENSSL_VERSION = 3.1.2
> +LIBOPENSSL_VERSION = 3.1.3
>  LIBOPENSSL_SITE = https://www.openssl.org/source
>  LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
>  LIBOPENSSL_LICENSE = Apache-2.0
> -- 
> 2.39.2
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
