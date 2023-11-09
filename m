Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE57DC4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 21:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75C94409AD;
	Thu,  9 Nov 2023 21:35:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75C94409AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vJEldkFsyqDj; Thu,  9 Nov 2023 21:35:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC574414E5;
	Thu,  9 Nov 2023 21:35:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC574414E5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A6A41BF312
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73D928218A
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:35:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73D928218A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ng3EL20DZ77W for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 21:35:28 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F59582172
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 21:35:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F59582172
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:bf98:93a4:26f0:a873])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 84AF713F861;
 Thu,  9 Nov 2023 22:35:22 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 09 Nov 2023 22:35:22 +0100
Date: Thu, 9 Nov 2023 22:35:22 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231109213522.GD996011@scaer>
References: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
 <20231105202555.359391-23-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231105202555.359391-23-adam.duskett@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699565726;
 bh=vKFrQ8JH2tP0epcXi4aJsXWs1tSnmbMsy69EUFL+5IM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bAeSsBh4x67aL/nY8cuIHB7/Wmtge3+eq6sOIzCjYyKXskHibnqYXvj5a16SIRQDc
 +czIUPXbSDLfMlZqp5zmI6eHfBc4W4mNQgk4wshochCd80kKpk3d/ZWwmWblQA8nsT
 5zZlp/mcilWJh1QA4b63XbEw5nOgWiWKa6fGytud23kcA4ycmQly5PfsuEADAr/duC
 e/O/f+Hw1jPB9Y/vHhkr5dkJAX4DtTC9ohYraIQP9hXmQA5Vt7vwJwEbVEGsLk6p79
 dDX6cr7HdsIbcsP4xwVOY9SiUjqK2sZphwSHmbwSUppgflAKzDrZFrFPGLnZbPcvW0
 /+w7CyCtJcFyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bAeSsBh4
Subject: Re: [Buildroot] [PATCH v2 23/24] package/python-kmod: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-11-05 13:25 -0700, Adam Duskett spake thusly:
> This package is currently used in Fedora39 to provide python bindings for kmod,
> and it is Python 3.12.0 compatible.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
[--SNIP--]
> diff --git a/package/python-kmod/python-kmod.mk b/package/python-kmod/python-kmod.mk
> new file mode 100644
> index 0000000000..12df0fa413
> --- /dev/null
> +++ b/package/python-kmod/python-kmod.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# python-kmod
> +#
> +################################################################################
> +
> +# The python-kmod package listed at https://pypi.org/project/kmod/#description
> +# is not the same as the one listed below.
> +PYTHON_KMOD_VERSION = 0.9.2
> +PYTHON_KMOD_SITE = $(call github,maurizio-lombardi,python-kmod,v$(PYTHON_KMOD_VERSION))
> +PYTHON_KMOD_SETUP_TYPE = setuptools
> +PYTHON_KMOD_LICENSE = LGPL-2.1+

I missed that, but it is not LGPL-2.1+ (aka -or-later). It is just
LGPL-2.1-only, see this blurb in __init__.py for example;

    # python-kmod is free software: you can redistribute it and/or modify it under
    # the terms of the GNU Lesser General Public License version 2.1 as published
    # by the Free Software Foundation.

There is not mention of the usual "or, at your option, any later
version".

Unfortunately, I noticed just right after I pushed, so I fixed that in a
followup commit, sorry for the mess...

> +PYTHON_KMOD_LICENSE_FILES = COPYING

COPYING has the text of the GPL, while the license for python-kmod is
indeed LGPL-2.1, which text is in COPYING.LESSER.

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

> +PYTHON_KMOD_DEPENDENCIES = host-python-cython kmod
> +
> +$(eval $(python-package))
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
