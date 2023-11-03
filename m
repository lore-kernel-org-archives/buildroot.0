Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4B6C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 21:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0E5682161;
	Fri,  3 Nov 2023 21:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0E5682161
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WPA2-m2b_PYM; Fri,  3 Nov 2023 21:31:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C47788215F;
	Fri,  3 Nov 2023 21:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C47788215F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 027241BF616
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 21:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFEE960B58
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 21:31:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFEE960B58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JcKGSzt40_hb for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 21:31:31 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B5A160B29
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 21:31:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B5A160B29
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:207e:5629:5034:6d7b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D9E0AB0053D;
 Fri,  3 Nov 2023 22:31:25 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 03 Nov 2023 22:31:25 +0100
Date: Fri, 3 Nov 2023 22:31:25 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231103213125.GB2875@scaer>
References: <20231103182745.903344-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231103182745.903344-1-adam.duskett@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699047089;
 bh=3kdRs+FDuauN5EF1m1lgUqlek/4Gu+cd/+tW/xyL+XM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pWGrT7UnXFVmGw/zCf+3pZzVYwq3cz1qGlGY4TijwYx8y810EJi3C5zKODyCVra6c
 kwSOR6W3K5kfefxS4oS+E5tg3YJNKAIPPWiB3k2sjHemtZjdgunWBpn8VgS7Ow54h2
 gAVvFz+k7QpTtDA9b+fSemoPvCoocUuy5Ucy/FcAZM9bfq8Bufml3DxGtczRzK9aE0
 jCtFOMTjkwBJwI+DShEbgB9t92Gj+Vq2XILI09wM0+POgNoAq61Zfa/7rR7Q82PpjH
 B/FKLFJL12ygTqrofdooBVkLpP7iC+x2UJiUYD1q1OyJCuDzR6dywT/or6G8hv+SKZ
 1OR3IAkKkzJRg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pWGrT7Un
Subject: Re: [Buildroot] [PATCH 0/3] Add tainting support
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-11-03 12:27 -0600, Adam Duskett spake thusly:
> Originally taken from Angelo Compagnucci's patch series:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=64340
> 
> When the original patch series was submitted, Buildroot was quite a bit
> smaller! With almost 1,000 packages added since then and more and more external
> package managers being available for various languages, it is not possible to
> package every single dependency needed for some packages.
> 
> Indeed, looking at NPM, for example, some packages rely on tens, if not
> hundreds, of others. While this could be better and is indeed quite bad, it is,
> unfortunately, the reality we must deal with.
> 
> With this patch series, we add initial tainting support to Buildroot with the
> added option to turn the support off by way of the BR2_DISABLE_TAINT_CHECKING
> option. This option gives us the best of both worlds: A sane default and an
> option for advanced users to turn off the check if they understand the risks
> and can guarantee their build is reproducible.

It does not require any such thing as tainted, and is just as simple as
this:

    diff --git a/package/nodejs/nodejs-src/nodejs-src.mk b/package/nodejs/nodejs-src/nodejs-src.mk
    index 3452c93728..2d716d8547 100644
    --- a/package/nodejs/nodejs-src/nodejs-src.mk
    +++ b/package/nodejs/nodejs-src/nodejs-src.mk
    @@ -241,6 +241,7 @@ NODEJS_SRC_MODULES_LIST= $(call qstrip,\
     # We can only call NPM if there's something to install.
     #
     ifneq ($(NODEJS_SRC_MODULES_LIST),)
    +NODEJS_SRC_LICENSE += , vendored dependencies licenses probably not listed
     NODEJS_SRC_DEPENDENCIES += host-nodejs
     define NODEJS_SRC_INSTALL_MODULES
        # If you're having trouble with module installation, adding -d
        # to the

As for reproducibility: if the package is not reproducible, either it is
fixed so that it is reproducible, or if that is not possible, then the
package should be hidden away behind depends on !BR2_REPRODUCIBLE

That's as simple as that, I would say.

Regards,
Yann E. MORIN.

> 
> This patch series has two significant benefits:
>   - Taint checking paves the way for additional package managers to be
>     incorporated into Buildroot while maintaining reproducible integrity for
>     packages provided by Buildroot.
> 
>   - It tells the user their build is tainted and what packages they
>     have selected are causing the taint.
> 
>   - It makes support easier. If a user has a build that is tainted and the
>     the problem they are experiencing is with a tainted package; it is
>     more straightforward to tell the user they are on their own.
> 
> Adam Duskett (3):
>   Makefile: add tainting support
>   docs/manual: add information about tainting
>   package/nodejs: taint the build when using external modules
> 
>  Config.in                                |  9 +++++++++
>  Makefile                                 | 17 +++++++++++++++++
>  docs/manual/adding-packages-generic.adoc |  9 +++++++++
>  docs/manual/legal-notice.adoc            | 24 ++++++++++++++++++++++++
>  package/nodejs/Config.in                 |  3 +++
>  package/nodejs/nodejs-src/nodejs-src.mk  |  1 +
>  package/pkg-generic.mk                   | 19 +++++++++++++++++++
>  7 files changed, 82 insertions(+)
> 
> -- 
> 2.41.0
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
