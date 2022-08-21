Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471AFC00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 12:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D495400E5;
	Sun, 21 Aug 2022 12:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D495400E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kji9kUqjXfTp; Sun, 21 Aug 2022 12:03:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C89140515;
	Sun, 21 Aug 2022 12:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C89140515
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 188EC1BF3A7
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 12:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1BDF818D0
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 12:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1BDF818D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0WAGFs934dIn for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 12:03:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B626181CEF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B626181CEF
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 12:03:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b8e6:fe51:1cfa:c9c2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B601C13FA3A;
 Sun, 21 Aug 2022 14:03:04 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Aug 2022 14:03:04 +0200
Date: Sun, 21 Aug 2022 14:03:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220821120304.GU2775145@scaer>
References: <20220820113352.4976-1-fontaine.fabrice@gmail.com>
 <20220821094911.GR2775145@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220821094911.GR2775145@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661083386;
 bh=0eIIQdnlDNijQ+58DWI3MaVlJ40MNU/Jf5UdwBKpBMo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cca1hgCLwb+akkoZ3pxqRNYUscrqNdYcU0XlDTU2p7Fpvc9Os2uIVsuOyCy7IoaE7
 rMeZ/mfc9hu/VPDnBmiUyAA0SkeA29iowZN/f5UekCt+WfJudtuyA3q0/oGtkPhxAq
 SIukSvsSdhjO8KfleASoAJkPIO7Dpt708LpbStoP2+AwCrGZjy2FpCjvlC8hkUoGJ6
 4OBEhb/zMcbIDjYlnEorjjUKuWv2fWb8HNO7S69be+w6+5B3qwbyxGBeCh6wdpa6jd
 T0M+NXjqKSsW4ydL/RkKjzrqJ2q3bcaQDGs+UD6HQ5HSh3+0UsbyzO3EVo/k0UBYcd
 ZDvVrWe0MzqUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cca1hgCL
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

Fabrice, All,

On 2022-08-21 11:49 +0200, Yann E. MORIN spake thusly:
> On 2022-08-20 13:33 +0200, Fabrice Fontaine spake thusly:
> > Add a custom case to make sure that a random configuration with an empty
> > theme for jquery-ui-themes doesn't fail. It reverts to
> > BR2_PACKAGE_JQUERY_UI_THEMES_BLACK_TIE in that case.
[--SNIP--]
> I am not sure how we can end up with an empty BR2_PACKAGE_JQUERY_UI_THEMES_THEME.
> Indeed, it is filled from a choice, and unless there is a typo in one of
> the config options, there are as many defaults for it as there are
> entries in the choice...
> 
> And if you look at the .config file, there is actually something
> selected in that choice, BR2_PACKAGE_JQUERY_UI_THEMES_VADER=y, but
> indeed BR2_PACKAGE_JQUERY_UI_THEMES_THEME is not even set. It's not that
> it is empty, it is not set at all!
> 
> So, the .config file is not correct.

Note: there is a known issue, where choices are not randomised when
starting of a existing config fragment, like we actually do with
randpackageconfig, in which case the first entry in the choice is always
selected. But that case still yie;ds a correct .config, where
BR2_PACKAGE_JQUERY_UI_THEMES_THEME is indeed set. E.g.:

    $ make randconfig  # jquery has no depenency, so whatever config we get is OK
    $ make randpackageconfig
    # after a few iterations, you will end up with:

    $ grep JQUERY_UI_THEMES .config
    BR2_PACKAGE_JQUERY_UI_THEMES=y
    BR2_PACKAGE_JQUERY_UI_THEMES_BLACK_TIE=y
    [...]
    BR2_PACKAGE_JQUERY_UI_THEMES_THEME="black-tie"

So, for fun, I had the following snippet run:

    while true; do
        ./utils/genrandconfig 2>&1 |grep KCONFIG_SEED=
        if grep -q BR2_PACKAGE_JQUERY_UI_THEMES=y .config; then
            echo 'Got JQuery UI themes...'
            grep BR2_PACKAGE_JQUERY_UI_THEMES_ .config
            grep -q BR2_PACKAGE_JQUERY_UI_THEMES_THEME= .config \
            || { echo 'Missing theme...'; break; }
        fi
    done

All I could eventually get was one instance of indeed non-randomised
choice:

    Got JQuery UI themes...
    BR2_PACKAGE_JQUERY_UI_THEMES_BLACK_TIE=y
    # BR2_PACKAGE_JQUERY_UI_THEMES_BLITZER is not set
    # BR2_PACKAGE_JQUERY_UI_THEMES_CUPERTINO is not set
    # BR2_PACKAGE_JQUERY_UI_THEMES_DARK_HIVE is not set
    # BR2_PACKAGE_JQUERY_UI_THEMES_DOT_LUV is not set
    # BR2_PACKAGE_JQUERY_UI_THEMES_EGGPLANT is not set
    # BR2_PACKAGE_JQUERY_UI_THEMES_EXCITE_BIKE is not set
    # BR2_PACKAGE_JQUERY_UI_THEMES_FLICK is not set
    # BR2_PACKAGE_JQUERY_UI_THEMES_HOT_SNEAKS is not set
    # BR2_PACKAGE_JQUERY_UI_THEMES_HUMANITY is not set
    # BR2_PACKAGE_JQUERY_UI_THEMES_LE_FROG is not set
    # BR2_PACKAGE_JQUERY_UI_THEMES_MINT_CHOC is not set
    # BR2_PACKAGE_JQUERY_UI_THEMES_OVERCAST is not set
    # BR2_PACKAGE_JQUERY_UI_THEMES_PEPPER_GRINDER is not set
    # BR2_PACKAGE_JQUERY_UI_THEMES_REDMOND is not set
    # BR2_PACKAGE_JQUERY_UI_THEMES_SMOOTHNESS is not set
    # BR2_PACKAGE_JQUERY_UI_THEMES_SOUTH_STREET is not set
    # BR2_PACKAGE_JQUERY_UI_THEMES_START is not set
    # BR2_PACKAGE_JQUERY_UI_THEMES_SUNNY is not set
    # BR2_PACKAGE_JQUERY_UI_THEMES_SWANKY_PURSE is not set
    # BR2_PACKAGE_JQUERY_UI_THEMES_TRONTASTIC is not set
    # BR2_PACKAGE_JQUERY_UI_THEMES_UI_DARKNESS is not set
    # BR2_PACKAGE_JQUERY_UI_THEMES_UI_LIGHTNESS is not set
    # BR2_PACKAGE_JQUERY_UI_THEMES_VADER is not set
    BR2_PACKAGE_JQUERY_UI_THEMES_THEME="black-tie"

Also, the script ran for more than two hours before I stopped it, and
jquery UI themes was seldom selectedonly two out of hundreds of
configurations had it... I've restarted it and will let it spin for a
while...

So, I am very puzzled as to why and how we would ever get an unset
BR2_PACKAGE_JQUERY_UI_THEMES_THEME...

Regards,
Yann E. MORIN.

> So, I think the issue is about fixing genrandconfig to generate .config
> files that are correct to begin with. Priobably, running "make
> olddefconfig" before checking the configuration is required? At least,
> when I do that localy, the .config now properly contains
> BR2_PACKAGE_JQUERY_UI_THEMES_THEME="vader".
> 
> But wait, wait... We already run 'make olddefconfig'! What's going on
> here?
> 
> Regards,
> Yann E. MORIN.
> 
> > +        configlines.append('BR2_PACKAGE_JQUERY_UI_THEMES_BLACK_TIE=y\n')
> > +        configlines.remove('BR2_PACKAGE_JQUERY_UI_THEMES_THEME=""\n')
> > +
> >      if 'BR2_TARGET_OPENSBI=y\n' in configlines and \
> >         'BR2_TARGET_OPENSBI_CUSTOM_GIT=y\n' in configlines and \
> >         'BR2_TARGET_OPENSBI_CUSTOM_REPO_URL=""\n' in configlines:
> > -- 
> > 2.35.1
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
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
