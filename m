Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4597EC4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 11:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E055E40164;
	Sun, 29 Oct 2023 11:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E055E40164
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f_S4_eT7zkRv; Sun, 29 Oct 2023 11:33:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D97F943204;
	Sun, 29 Oct 2023 11:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D97F943204
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F2E41BF59A
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 11:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 357D14EDF1
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 11:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 357D14EDF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HXJNnda1Z0-a for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 11:33:31 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31C5B4EDF0
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 11:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31C5B4EDF0
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 459EB2003EE;
 Sun, 29 Oct 2023 12:33:26 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Oct 2023 12:33:26 +0100
Date: Sun, 29 Oct 2023 12:33:26 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231029113325.GX687180@scaer>
References: <20231026155754.1637976-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231026155754.1637976-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698579208;
 bh=jtdd1UPxriPY/z6YpRy4FrTYAGX6WGJ3RwDqb2UU5RY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QfSL42L5EqMi2DRdUd5IUMnSl+z0vced9Zh3pKq4k5XCBD4icZjcBk6u9h9DLgsQ9
 wQQLsGxLJe2yhGDlkaG0fbBtgxv3CasTgShQkHb/yWbWyCe5DjrOg5rUV9HZa9wtZ4
 X0FEV3kT6dY9B2bh68UI7sJ0ccGQSyUSevf+RvO3WrzzqkJ82LBA/SyuE5AgFfUNnM
 rvqbHfX4WCU6bjpxuhjfGH+DdQLqKHrfKpIg0bfrKKD6swCYf+8c85Dt+omy3IkqRe
 vcezX2fVS8qjDDOdZt0O0GXOZ/FTFTtkLwKBXDytaIlksxGYXkCmEvo6apmhE66fnK
 AN4ldnzv/FWig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QfSL42L5
Subject: Re: [Buildroot] [PATCH] package/libnvme: needs host-swig
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

Giulio, All,

On 2023-10-26 17:57 +0200, Giulio Benetti spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/a63d18fd318783d7e3d1cede062c9c7cacb10282/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/libnvme/libnvme.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
> index 38394b9931..3b622839fa 100644
> --- a/package/libnvme/libnvme.mk
> +++ b/package/libnvme/libnvme.mk
> @@ -10,6 +10,8 @@ LIBNVME_LICENSE = LGPL-2.1
>  LIBNVME_LICENSE_FILES = COPYING
>  LIBNVME_INSTALL_STAGING = YES
>  
> +LIBNVME_DEPENDENCIES += host-swig

swig is only needed to build the python bindings, no?
In which case it should be in the python conditional block, right?

Regards,
Yann E. MORIN.

>  LIBNVME_CONF_OPTS += \
>  	-Dtests=false
>  
> -- 
> 2.34.1
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
