Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBCBEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 13 Aug 2023 13:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91A858195D;
	Sun, 13 Aug 2023 13:16:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91A858195D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gjINrayDhq_N; Sun, 13 Aug 2023 13:16:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC0728191E;
	Sun, 13 Aug 2023 13:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC0728191E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12F9B1BF418
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 13:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E082281947
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 13:16:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E082281947
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vmD3sYEsoAqq for <buildroot@lists.busybox.net>;
 Sun, 13 Aug 2023 13:16:40 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C2E28191E
 for <buildroot@buildroot.org>; Sun, 13 Aug 2023 13:16:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C2E28191E
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:13dc:fe9:8e15:e643])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id DB2E4780368;
 Sun, 13 Aug 2023 15:16:35 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 13 Aug 2023 15:16:35 +0200
Date: Sun, 13 Aug 2023 15:16:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230813131635.GY421096@scaer>
References: <ZNituOHmh8/+1QYr@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZNituOHmh8/+1QYr@waldemar-brodkorb.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691932598;
 bh=m0s3Vo91czxEt+Gz80fmjyWayuXIydLGoRiNKaM4+GY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WBEWJwtlUA8zPZcKsYHDgpCUGW/gYJQnUKjzfFWDA0A8V3XpUNpY5sWRBwHk/L13B
 YnOYe3Cy9kuI03frl9A5eOTruimu2RZftCQ0XQeRAalvo2+uqcX/8ZzawMqp1aZsun
 jhDcgOlGYKmGHxqatoSXSBEXQkyUgqb6j5NEwk+A0vf668I2yycHwmUirRVAO80sL/
 8HOcm9iQz9KgdzYQA2fwbRzqbcXVSGmYpCm33iaqoo+fXk+yUnf0gEa0Tv0cDMWBNh
 pnC98cQ9M6Nqp44MKpekJikP2FYAtMwbdWKhzzU4EeZrkKwLwn95U6TdwBEgXeJFfO
 WRPOESOHbp5Aw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WBEWJwtl
Subject: Re: [Buildroot] [PATCH] package/util-linux: add missing autoreconf
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

Waldemar, All,

On 2023-08-13 12:17 +0200, Waldemar Brodkorb spake thusly:
> In commit 898bdbca1f11fe81e8be7924371326f85f466a27 we added a patch
> for configure.ac and missed to run autoreconf.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/06f/06f2e368982a620b3e810eccfdc307ae99271e22
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/util-linux/util-linux.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index bdb4fd6b90..18315ea659 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -31,6 +31,8 @@ UTIL_LINUX_LICENSE_FILES = README.licensing \
>  
>  UTIL_LINUX_CPE_ID_VENDOR = kernel
>  UTIL_LINUX_INSTALL_STAGING = YES
> +# We're patching configure.ac

I prefer we get the filename of the patch ere, so that it is easier,
when one removes a patch, to hunt its filename and see if there was
something special with this patch...

Applied to master, with the filename of the patch in the comment,
thanks.

Regards,
Yann E. MORIN.

> +UTIL_LINUX_AUTORECONF = YES
>  UTIL_LINUX_DEPENDENCIES = \
>  	host-pkgconf \
>  	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs) \
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
