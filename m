Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54257C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 08:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 092B2840FE;
	Sat,  4 Jun 2022 08:05:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LXH7DBVsxlGT; Sat,  4 Jun 2022 08:05:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B3A6840C5;
	Sat,  4 Jun 2022 08:05:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9DDB91BF41F
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 08:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D57E41A0F
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 08:05:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XRf_0wnDkfRo for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 08:04:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6380241A0D
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 08:04:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e086:bc2a:8b9d:c22])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 4C8C25FF96;
 Sat,  4 Jun 2022 10:04:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1654329896;
 bh=zRo+27z5usua7Rc4lso0rpsFkp/TBf7L0ANDQjdbMLc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i1WvoikEdFJee6G0peWvMyP4L42Ci/QAfY9R7gRt/RCZUedyFNAGHha6x+zsQQmKu
 L4Tjq3y+x60WGSB3R8NTFqtvccCiOTHtLiNa+kKOKsFlUFSsJovc2zz8lvAEFA86Ap
 CpxW3lQ70wekZh5w+OW+S1bcqmr/WBcplQnHb/HVyJKsC4eoFZjyCySs6/2PCfQy40
 k6U8T7C+oGe7+8wg1/jHzIXH+6XrwYB71n6B568gL5yzwXPwC0OLRWJFdWq+u7y9cX
 DN33PgDGy33es5nvM4CtvBur1NMybbexTZrC9eB/J2JpNXibqkgQy1pt2d3Rr13n2x
 36irk8EgpTjzw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Jun 2022 10:04:52 +0200
Date: Sat, 4 Jun 2022 10:04:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <20220604080452.GC427639@scaer>
References: <20220603123506.1219339-1-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220603123506.1219339-1-luca@lucaceresoli.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: update my e-mail address
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Luca, Al,

On 2022-06-03 14:35 +0200, Luca Ceresoli spake thusly:
> My Bootlin address is preferred from now on.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 71cc3da6d70b..aa18de83bcb6 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1729,7 +1729,7 @@ F:	package/intel-gmmlib/
>  F:	package/intel-mediadriver/
>  F:	package/intel-mediasdk/
>  
> -N:	Luca Ceresoli <luca@lucaceresoli.net>
> +N:	Luca Ceresoli <luca.ceresoli@bootlin.com>
>  F:	board/olimex/a20_olinuxino/
>  F:	board/zynq/
>  F:	board/zynqmp/
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
