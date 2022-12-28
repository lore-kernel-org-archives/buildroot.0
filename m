Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A18C4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 19:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A373E401EF;
	Wed, 28 Dec 2022 19:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A373E401EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BYR2KGoFIGjk; Wed, 28 Dec 2022 19:32:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0FFB402EF;
	Wed, 28 Dec 2022 19:32:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0FFB402EF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D44F71BF59F
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACCF18149C
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACCF18149C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YeECs20oDRxH for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 19:32:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 505628149B
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 505628149B
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 19:32:50 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 6425F440F6D;
 Wed, 28 Dec 2022 21:29:26 +0200 (IST)
References: <20221228180800.3417009-1-giulio.benetti@benettiengineering.com>
User-agent: mu4e 1.8.10; emacs 28.2
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 28 Dec 2022 21:32:04 +0200
In-reply-to: <20221228180800.3417009-1-giulio.benetti@benettiengineering.com>
Message-ID: <87bknn4941.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1672255766;
 bh=WXgzY25OImmka8Hig/E9+oq1vSsFnMOKAn8J4OAYOvg=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=E8ApJjEveX6oKZYnsTys8/IFxfXygBqlSGg0VWCjcOmAuwL5tpaNoPQGNgSGI3K5J
 6ahyy4c4ibguWqxfwvkbIyoyIklWSHrTSow0DpzP9JyGIYbnKLX/knchPRxWH0zboR
 GOrygJbspB7ErbYG/yENdRWmm523af0OH/GbzECUS+Naf9fTTtawYQ7+0+pxUfvKd6
 CmCFGsMb07pl4u6W+wkJTRLtbXY11RQasa8Ha0FsOfZAxAVd9IzhVOD0gdBq5FMYPJ
 gCOmpyQS8k7x5xMMeAL1qyk9HtzkujCgPlYpg7Ln60XboNCRw8uoSWOvmFgihXH9Qh
 oD6q97T+ChzHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=E8ApJjEv
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: drop package/ucl entry
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

On Wed, Dec 28 2022, Giulio Benetti wrote:
> Package ucl has been dropped with commit
> 85c5af46ad6c18841576c0f7abe241a617a44cb7
> so let's drop it from DEVELOPERS since when calling utils/get-developers
> it throws:
> WARNING: 'package/ucl/' doesn't match any file

This duplicates
http://patchwork.ozlabs.org/project/buildroot/patch/20221228083918.3762-1-fontaine.fabrice@gmail.com/

baruch

> Fixes: 85c5af46ad ("package/ucl: drop package")
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  DEVELOPERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 7d19bae7a6..998bac935e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1091,7 +1091,6 @@ F:	package/libsodium/
>  F:	package/php-amqp/
>  F:	package/python-cherrypy/
>  F:	package/sane-backends/
> -F:	package/ucl/
>  F:	package/upx/
>  F:	package/zxing-cpp/


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
