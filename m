Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3C4C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 21:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD6A740877;
	Sun,  9 Jan 2022 21:00:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1oxuxhebjdk8; Sun,  9 Jan 2022 21:00:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3647A402D7;
	Sun,  9 Jan 2022 21:00:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5BE771BF44C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55D35402D7
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:00:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NnghGxmyLFS9 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 21:00:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 670A7402D3
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 21:00:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:884e:4989:9dec:67ee])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id BC3005FF93;
 Sun,  9 Jan 2022 22:00:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641762025;
 bh=kvpsCZl+a7hNVdX895qVx1aBj1eQ6QL7UQ5dSFCuKXE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QFuL9saO33TjVhjv0CW8hPU2vUvJSzkEuoePd2B9oAut3QjeKFUjqcBjMi7+lF8tS
 XMdQwLDKjX0ahCGhXuanaxQG2XMyiQXiJRwqfSTrxTj1m+XCTu34eDP3XY0UfroyBb
 ZsUWFebqViIEGOwB/2NwLjtesqV9h/9wbM/9mbW+A70lD0Glc6FYtMxMYdPXNtNCh1
 5AuhPNgRrHP928vqrjdFQTUUh5B4FhlOCjd+2W5RDOHLdTSQfIcSx53FqQsOc+YLSM
 eHvFj7ZIDKaOx0Ugbj13xw2erSeG+X8J+M8CBMBQRgtXIjAJDXu3tuO3+l095fVTKR
 8t0gdxbwdtsZA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 09 Jan 2022 22:00:20 +0100
Date: Sun, 9 Jan 2022 22:00:20 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Paul Soucy <paul.soucy@sense.com>
Message-ID: <20220109210020.GI1477939@scaer>
References: <20201216174404.47363-1-paul.soucy@sense.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201216174404.47363-1-paul.soucy@sense.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/gtest: host-gtest install like
 a normal cmake package
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
Cc: Stephan Hoffmann <sho@relinux.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Paul, All,

Sorry for the long delay...

On 2020-12-16 12:44 -0500, Paul Soucy spake thusly:
> host-gtest does not actually build and install gtest libraries or header files, it just installs the gmock_gen stuff. This patch will now build and install gtest to the host like a normal cmake package.

I rewrapped the commit log, and slightly extended it with the
information you rpovided elsewhere in the thread.

> Signed-off-by: Paul Soucy <paul.soucy@sense.com>
> ---
>  package/gtest/gtest.mk | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
> index 7f967b8bfb..f35ae63383 100644
> --- a/package/gtest/gtest.mk
> +++ b/package/gtest/gtest.mk
> @@ -88,14 +88,15 @@ else
>  GTEST_CONF_OPTS += -DBUILD_GMOCK=OFF
>  endif
>  
> -define HOST_GTEST_INSTALL_CMDS
> +define HOST_GTEST_POST_INSTALL_PYTHON
>  	$(INSTALL) -D -m 0755 $(@D)/googlemock/scripts/generator/gmock_gen.py \
>  		$(HOST_DIR)/bin/gmock_gen
>  	cp -rp $(@D)/googlemock/scripts/generator/cpp \
>  		$(HOST_GTEST_GMOCK_PYTHONPATH)
>  endef
>  
> +HOST_GTEST_POST_INSTALL_HOOKS += HOST_GTEST_POST_INSTALL_PYTHON
> +
> +

    $ make check-package
    package/gtest/gtest.mk:64: consecutive empty lines

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

>  $(eval $(cmake-package))
> -# The host package does not build anything, just installs gmock_gen stuff, so
> -# it does not need to be a host-cmake-package.
> -$(eval $(host-generic-package))
> +$(eval $(host-cmake-package))

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
