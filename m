Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0150C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 20:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34B9A408CF;
	Mon, 18 Dec 2023 20:24:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34B9A408CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gHcRpTA2BvZi; Mon, 18 Dec 2023 20:24:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC81A408D9;
	Mon, 18 Dec 2023 20:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC81A408D9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F0FB81BF3AD
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 20:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D52F7408D7
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 20:24:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D52F7408D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cFOAgK-OSgHd for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 20:24:23 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F325408CF
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 20:24:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F325408CF
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A3568B0053D;
 Mon, 18 Dec 2023 21:24:17 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 18 Dec 2023 21:24:17 +0100
Date: Mon, 18 Dec 2023 21:24:17 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZYCqcSy3JwOixUCp@landeda>
References: <20231218195406.553072-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231218195406.553072-1-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702931060;
 bh=NBTm0oRMzq25Vu4nV+IEVeG7Jngdp7yvsQfFbM87tik=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VIumRyj8phpedyOLSwuOQbrf3PqjIx23QXM0BMpi1YVvoUb7c8NHZGuulX1zhUVD/
 aMuIVAsuz1AYjPFY1Pdlw3DxnP3+9SP0zyjrNoKMSDVBC6rG45pg3DopmNvjMe0VhV
 ifU4RpF+f678Qy3Y1mHnT7Btr5enq5p1lPDsrK+5CN1n2d9KJRBDdvYFYPf7nlGZcM
 nMB1VVUClKBBtzS7WwhEn4o2VLcHOMSECiirDGKAF0IzbYcsz0p8yzlSFuMwT5J2xT
 WquV26RCElgisab1yLY4rgf4H2QSyv/gxz/NpPlutc/iDQ9S1imnWti6qNfU+9NIBI
 Zn2eA6uT0e6Kg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VIumRyj8
Subject: Re: [Buildroot] [PATCH v3 1/3] package/itstool: new host-package
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

Adam, All,

On 2023-12-18 12:54 -0700, Adam Duskett spake thusly:
> Translate XML with PO files using W3C Internationalization Tag Set rules.
> This is needed for the zenity package.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

    $ cat my_defconfig
    BR2_PER_PACKAGE_DIRECTORIES=y

    $ make BR2_DEFCONFIG=$(pwd)/my_defconfig defconfig
    [...]

    $ make host-itstool
    [...]
    checking for a Python interpreter with version >= 2.6... python
    checking for python...  /home/ymorin/dev/buildroot/O/master/per-package/host-itstool/host/bin/python
    checking for python version... 3.11
    checking for python platform... linux
    checking for GNU default python prefix... ${prefix}
    checking for GNU default python exec_prefix... ${exec_prefix}
    checking for python script directory (pythondir)...  ${PYTHON_PREFIX}/lib/python3.11/site-packages
    checking for python extension module directory (pyexecdir)...  ${PYTHON_EXEC_PREFIX}/lib/python3.11/site-packages
    checking for python module libxml2... not found
    configure: error: Python module libxml2 is needed to run this package
    make[1]: *** [package/pkg-generic.mk:273: /home/ymorin/dev/buildroot/O/master/build/host-itstool-2.0.7/.stamp_configured] Error 1
    make: *** [Makefile:23: _all] Error 2

However, the situation is going to be a bit complicated: the python3
libxml2 bindings are provided by host-libxml2, which only installs those
when BR2_PACKAGE_HOST_PYTHON3=y.

Since you introduced host-itstool as a promptless host package [0],
there is no way to ensure tht host-python3 will be enabled, so there is
no way to ensure the python3 libxml2 bindings will be installed.

So, the solution is for itstool to have a prompt, which does select
BR2_PACKAGE_HOST_PYTHON3. Also, host-libxml2 must be added as a
dependency to host-itstool.

Later in the series, zenity will have to select host itstool (as well as
get a _DEPENDENCIES on it of course).

[0] on principle, there is nothing wrong with a prompt-less host
package; just in this case does it get problematic.

Also, see below...

[--SNIP--]
> diff --git a/package/itstool/itstool.mk b/package/itstool/itstool.mk
> new file mode 100644
> index 0000000000..d9aa016f50
> --- /dev/null
> +++ b/package/itstool/itstool.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# itstool
> +#
> +################################################################################
> +
> +ITSTOOL_VERSION = 2.0.7
> +ITSTOOL_SITE = $(call github,itstool,itstool,$(ITSTOOL_VERSION))
> +ITSTOOL_LICENSE = GPL-3.0+
> +ITSTOOL_LICENSE_FILES = COPYING.GPL3
> +HOST_ITSTOOL_AUTORECONF = YES

It is customary that the need for autoreconf be explained; in this case,
it's just:

    # Straight our of git, no ./configure

If that had been the only issue, I'd have fixed when applying, but it
needs more changes as explained above.

Can you look into that, please?

Regards,
Yann E. MORIN.

> +HOST_ITSTOOL_DEPENDENCIES = host-python3
> +
> +$(eval $(host-autotools-package))
> -- 
> 2.43.0
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
