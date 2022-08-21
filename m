Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E94AC00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 09:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E67A1404C4;
	Sun, 21 Aug 2022 09:49:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E67A1404C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eIuxuGvv0pmV; Sun, 21 Aug 2022 09:49:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E664740488;
	Sun, 21 Aug 2022 09:49:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E664740488
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A1DC1BF25B
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 09:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 657A260B96
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 09:49:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 657A260B96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eh8lwpqTElCe for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 09:49:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 880BD60B86
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 880BD60B86
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 09:49:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b8e6:fe51:1cfa:c9c2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 22B9713F8AE;
 Sun, 21 Aug 2022 11:49:12 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Aug 2022 11:49:11 +0200
Date: Sun, 21 Aug 2022 11:49:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220821094911.GR2775145@scaer>
References: <20220820113352.4976-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220820113352.4976-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661075354;
 bh=bCYCWfmUGi7aULQPpE+H3Y/bLV7idrCmd4OLjUWth0Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BgrMyqbBTCRp2Apdyr/CheElwGikE/wiLjQkfEuFBaE/iMwww7oNaQStnx3udhdp3
 If5BmxWFQ1n7wdoncqkpB34wpqAdy6lfLid60e2vffx/ipiUNcCFloGJOSpvoREzSm
 7qLaEP62jv8k34a0nbd1Dsr9uS5M6KhtpTzCgDmBcOTOhs/PbtJ7FaiKECy5tV/0qR
 3sJXVoS/yLTLbS5CVCi17t4xeGxc3mT0aIFbkbzExt+fpVsXwYnNvBdzFeYwJaxWlG
 1Lmj4FWBaQb7BG+ILxqhgmNmIWzo0XqoQG6n94pEBVT4SBOjUDPhSVTxkr5jZ/e33v
 RY1SyLyxjP9Hg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BgrMyqbB
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: add
 jquery-ui-themes handling
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

On 2022-08-20 13:33 +0200, Fabrice Fontaine spake thusly:
> Add a custom case to make sure that a random configuration with an empty
> theme for jquery-ui-themes doesn't fail. It reverts to
> BR2_PACKAGE_JQUERY_UI_THEMES_BLACK_TIE in that case.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b38f605795b1c60d8253313ce9478c4b1991d390
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  utils/genrandconfig | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index 85db7ed1e9..9d2ed3f244 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -547,6 +547,11 @@ def fixup_config(sysinfo, configfile):
>          if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
>              return False
>  
> +    if 'BR2_PACKAGE_JQUERY_UI_THEMES=y\n' in configlines and \
> +       'BR2_PACKAGE_JQUERY_UI_THEMES_THEME=""\n' in configlines:

I am not sure how we can end up with an empty BR2_PACKAGE_JQUERY_UI_THEMES_THEME.
Indeed, it is filled from a choice, and unless there is a typo in one of
the config options, there are as many defaults for it as there are
entries in the choice...

And if you look at the .config file, there is actually something
selected in that choice, BR2_PACKAGE_JQUERY_UI_THEMES_VADER=y, but
indeed BR2_PACKAGE_JQUERY_UI_THEMES_THEME is not even set. It's not that
it is empty, it is not set at all!

So, the .config file is not correct.

So, I think the issue is about fixing genrandconfig to generate .config
files that are correct to begin with. Priobably, running "make
olddefconfig" before checking the configuration is required? At least,
when I do that localy, the .config now properly contains
BR2_PACKAGE_JQUERY_UI_THEMES_THEME="vader".

But wait, wait... We already run 'make olddefconfig'! What's going on
here?

Regards,
Yann E. MORIN.

> +        configlines.append('BR2_PACKAGE_JQUERY_UI_THEMES_BLACK_TIE=y\n')
> +        configlines.remove('BR2_PACKAGE_JQUERY_UI_THEMES_THEME=""\n')
> +
>      if 'BR2_TARGET_OPENSBI=y\n' in configlines and \
>         'BR2_TARGET_OPENSBI_CUSTOM_GIT=y\n' in configlines and \
>         'BR2_TARGET_OPENSBI_CUSTOM_REPO_URL=""\n' in configlines:
> -- 
> 2.35.1
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
