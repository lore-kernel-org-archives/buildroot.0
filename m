Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8694BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 11:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EB5260AE4;
	Sat, 15 Jan 2022 11:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GxtTvD6_O9NQ; Sat, 15 Jan 2022 11:00:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8160B60AC0;
	Sat, 15 Jan 2022 11:00:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBA801BF5DD
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D91958280E
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f_LvXavo61G0 for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 11:00:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC1C5818C2
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 11:00:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:edb9:18:17ad:29d4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id D3AD419F59F;
 Sat, 15 Jan 2022 12:00:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642244414;
 bh=bLFo6A2W2Vo89KN2vApycXoyhpfUrVUR0393hY8EZ20=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VRY7xdLe16kWkICWNgv0pTrG3tJRD0G+TCz6LYne7hxv9WED82qNVFoBn4lGU+OJ3
 D80PXIkxBNL6joYzril/uuLimUt6WYZk7VvBCbqAOLi8NvtTTemSSUeH6FxaqOXTdg
 xLBDJ5SwdX2B+//edfXHcmyYSLa6bzW1ovX4kpVa7LaONN8k20BzygXzANwovsCRd9
 pUrtb+36vEwiGxFCABP3gxWk5KdeJsXS8B2VMJQmnHsmbdOYOmKqOV1wbzISFwcV/f
 TDw4PbE2f+LJDDxyURM5xebsnZF0HJzkV3rEpaHoKRaMgt0a79SU8NnSpoMp3lVj65
 rP18oQVn1CERA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jan 2022 12:00:11 +0100
Date: Sat, 15 Jan 2022 12:00:11 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: rainbox2k12 <rainbox2k12@msgsafe.io>
Message-ID: <20220115110011.GK1945846@scaer>
References: <20220115101415.986123F41E@exit1-us.msgsafe.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220115101415.986123F41E@exit1-us.msgsafe.io>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] package/vte: add libvte to buildroot toolchain
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

rainbox2k12, All,

On 2022-01-15 10:14 +0000, rainbox2k12 via buildroot spake thusly:
> This patch is needed in order to use libvte in the buildroot toolchain.

Thanks for your contribution; it definitely makes sense.

To accept patches in Buildroot, we need them to be properly authored to
a real name. Additionally, patches should have a sign-off that matches
the author of the patch.

Patches should also be properly formatted with a title and a
description.

In this case, a appropriate commit-log should probably look like:

    package/vte: install to staging

    vte also provides libvte, a library that can be linked to by other
    programs, so install it in staging.

    Signed-off-by: Your Real NAME <your-email>

See the manual for more details:
    https://buildroot.org/downloads/manual/manual.html#submitting-patches

> diff --git a/package/vte/vte.mk b/package/vte/vte.mk
> 
> index 07e8136..ceb2f09 100644
> 
> --- a/package/vte/vte.mk
> 
> +++ b/package/vte/vte.mk
> 
> @@ -11,6 +11,7 @@ VTE_SITE = http://ftp.gnome.org/pub/gnome/sources/vte/$(VTE_VERSION_MAJOR)
> 
>  VTE_DEPENDENCIES = host-pkgconf libgtk3 pcre2 $(TARGET_NLS_DEPENDENCIES)
> 
>  VTE_LICENSE = LGPL-3.0+
> 
>  VTE_LICENSE_FILES = COPYING.LGPL3
> 
> +VTE_INSTALL_STAGING = YES

This patch is heavily mangled by your mailer. Please use 'git send-email'
to send patches; this ensures that patches are properly formatted in a
mail ready to be applied by maintainers.

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_PACKAGE_ICU),y)
> 
>  VTE_CONF_OPTS += -Dicu=true
> 
> --
> Sent using [1]MsgSafe.io's Free Plan
> Private, encrypted, online communication
> For everyone. [2]www.msgsafe.io
> 
> Links:
> 1. file:///tmp/mail-html2txt.2089315.NQ2C0Z/https:/www.msgsafe.io/?utm_source=msgsafe&utm_medium=email&utm_campaign=freemailsignature
> 2. file:///tmp/mail-html2txt.2089315.NQ2C0Z/https:/www.msgsafe.io/?utm_source=msgsafe&utm_medium=email&utm_campaign=freemailsignature

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
