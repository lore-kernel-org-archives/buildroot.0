Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAC1C4332F
	for <buildroot@archiver.kernel.org>; Fri,  2 Dec 2022 19:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6337F82212;
	Fri,  2 Dec 2022 19:42:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6337F82212
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZMdKu1B2EUHm; Fri,  2 Dec 2022 19:42:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF05681FF8;
	Fri,  2 Dec 2022 19:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF05681FF8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF0421BF319
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 19:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D675B41C61
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 19:42:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D675B41C61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nlZP9ezML7bC for <buildroot@lists.busybox.net>;
 Fri,  2 Dec 2022 19:42:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C340841C5D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C340841C5D
 for <buildroot@buildroot.org>; Fri,  2 Dec 2022 19:42:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c0ba:9ce3:3496:4e04])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 756EDB0052C;
 Fri,  2 Dec 2022 20:42:17 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 02 Dec 2022 20:42:16 +0100
Date: Fri, 2 Dec 2022 20:42:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Zikui Zhao <zhaozikui@eswincomputing.com>
Message-ID: <20221202194216.GB3302@scaer>
References: <20221202034841.1172-1-zhaozikui@eswincomputing.com>
 <20221202034841.1172-2-zhaozikui@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221202034841.1172-2-zhaozikui@eswincomputing.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670010143;
 bh=fU0bXgnbeojI1etzQlmr60Kzn5UHXhubr97q3qd8pNo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bB2+l8HdS+zek/dViby7jEbGEz4b49jgKt6aC99pqFIHNcPbnbmJRrxN3OvdU1T40
 iuS5UaKXsVO6h+gtSLVG6mmiNdQiOI2jFB/BBDQOv6Aa/Tj4p+svb2fHXLjNhlPY6/
 MSt3arwZY1RdwHEti8kPLM2vqEtwACbaTIaPuD0I79MpPdk8EBzfcxHqvo6UHPfRIy
 SD9RMIJBOQt/ytTSpN1M3TAML+/mKgeUuDheiZQXP0Dt5HxgL0TNwZU7GgnV9ZuJ6P
 ZShaINgJgc0RRehgXoAhQvyHuFRbqq9QJPhldPTnE2L8A9rwOe9RN6gJ1UqxOwAkC4
 UI0vGD8Lspepw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bB2+l8Hd
Subject: Re: [Buildroot] [PATCH v2 1/1] docs/manual: fixed some spelling
 mistakes
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
Cc: jinyanjiang@eswincomputing.com, zhuwenjun@eswincomputing.com,
 zhengyu@eswincomputing.com, zhangdongdong@eswincomputing.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Zhao, All,

On 2022-12-02 11:48 +0800, Zikui Zhao spake thusly:
> Fixed some spelling mistakes of countable nouns.
> 
> Signed-off-by: Zikui Zhao <zhaozikui@eswincomputing.com>
> Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Actually, I did not provide my Reviewed-by tag; you can't add such a tag
unless explicitly provided by the reviewer. It's not because I did a
review of your previous patch that this implicitly grants the tag on a
respin.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  docs/manual/customize-directory-structure.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/manual/customize-directory-structure.txt b/docs/manual/customize-directory-structure.txt
> index a3a7ad4cb9..1249421da2 100644
> --- a/docs/manual/customize-directory-structure.txt
> +++ b/docs/manual/customize-directory-structure.txt
> @@ -27,10 +27,10 @@ to you.
>  |           +-- post_image.sh
>  |           +-- rootfs_overlay/
>  |           |   +-- etc/
> -|           |   +-- <some file>
> +|           |   +-- <some files>
>  |           +-- patches/
>  |               +-- foo/
> -|               |   +-- <some patch>
> +|               |   +-- <some patches>
>  |               +-- libbar/
>  |                   +-- <some other patches>
>  |
> -- 
> 2.31.1.windows.1
> 

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
