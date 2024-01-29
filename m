Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E239C47DA9
	for <buildroot@archiver.kernel.org>; Mon, 29 Jan 2024 20:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BE0D40025;
	Mon, 29 Jan 2024 20:50:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BE0D40025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LRZn6fKJphBc; Mon, 29 Jan 2024 20:50:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3413401B7;
	Mon, 29 Jan 2024 20:50:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3413401B7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C5CE1BF36D
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 20:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71121821BF
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 20:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71121821BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8g1PaoMxkxxi for <buildroot@lists.busybox.net>;
 Mon, 29 Jan 2024 20:50:25 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BA0E82173
 for <buildroot@buildroot.org>; Mon, 29 Jan 2024 20:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BA0E82173
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 885CB13F8AD;
 Mon, 29 Jan 2024 21:50:20 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 29 Jan 2024 21:50:20 +0100
Date: Mon, 29 Jan 2024 21:50:20 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Abilio Marques <abiliojr@gmail.com>
Message-ID: <ZbgPjOux3Jjl2KTj@landeda>
References: <20240129022913.3367510-1-abiliojr@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129022913.3367510-1-abiliojr@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706561423;
 bh=8NJYLfXtEgu/Kaqkqjmg2xoG8EqZdNxSBWwA6HwegW4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pPHA/O37NCvaLay5xwytUyOwSNXie6HEBczmiZ7yDPNUyXxivKNVUk/R7Izcsg4DO
 dUz1wnFC3aWeoCojPu0zRrJKxB1uyOOOEiLBXNGnHXcOu7i3hYTClPH1wkMiz6g2wa
 qfueg2DmbZ7Pji7JnXypRRtX4qHliT8aOqKhbHf8YW0esjxUTWP2fJGqX/2Ln344HB
 CPoTOE4xMKx5zssJtwwXKo3dVnk6cEz9TGIbmohJlVZVfawoY8gVUb2rvb9etTAg48
 Ijmr036LEptTf+YTCKsR1R4qKEJ/lh04kJUoYF6nT9U3amnKDAOcGeW6u0EK5i9Y8J
 KMZnEAmxN+h8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pPHA/O37
Subject: Re: [Buildroot] [PATCH v2 1/1] package/micropython: make use of
 recent micropython-lib
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
Cc: Chris Packham <judge.packham@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Abilio, All,

On 2024-01-28 18:29 -0800, Abilio Marques spake thusly:
> Until now, micropython-lib was a package that installed v1.9.3,
> which is more than 6 years old. This was acceptable since micropython
> never made any other official release of the library until v1.20.
> 
> Meanwhile, the libraries underwent a reorganization, and they are now
> available in a directory structure that cannot be copied directly into
> the target. This is my theory on why v1.9.3 is still present in the
> current day buildroot (which comes with micropython v1.22).
> 
> This commit introduces an auxiliary script to collect those libraries
> and reorder them into a structure that can then be copied into
> /usr/lib/micropython. The script utilizes a module from the tools
> directory of the micropython repo.
> 
> As part of the changes made by the micropython project, the libraries
> are now released together with the interpreter. They are cloned as a
> submodule into the lib/micropython-lib directory.
> 
> These are the 2 main reasons why the old buildroot micropython-lib
> package is being removed.
> 
> With this commit, micropython-lib is installed (optionally) as part
> of micropython. The original config variable name was retained as it
> fits with the micropython package 'namespace", and thus this is
> backward compatible and no legacy handling is needed.
> 
> I tried to keep it simple. It makes use of existing micropython tools
> (used to process manifests) to discover the list of packages available
> in micropython-lib. My hope is that by relying on them, any future
> changes in directory structure will be covered by the official
> "manifestfile.py" tool.
> 
> This commit also ensures that the libraries in micropython-lib will
> be updated together with newer versions of micropython.
> 
> Signed-off-by: Abilio Marques <abiliojr@gmail.com>

I have slightly reworded and somewhat erorganmised th ecommit log in a
more logical sequence, but it was already very good to begin with!

[--SNIP--]
> diff --git a/package/micropython/Config.in b/package/micropython/Config.in
> index 30161c8b70..966e4b958e 100644
> --- a/package/micropython/Config.in
> +++ b/package/micropython/Config.in
> @@ -9,5 +9,13 @@ config BR2_PACKAGE_MICROPYTHON
>  
>  	  http://micropython.org
>  
> +config BR2_PACKAGE_MICROPYTHON_LIB
> +	bool "micropython-lib"
> +	default y

There is no reason to 'default y' here, as the previously separate
micropython-lib did not. The new ones are no more required than the old
ones, and we really need default y' to hae a good rationale. If you
think there is one, then do not hesitate to send a follow up patch that
explains why switching to 'default y' is needed.

> +	depends on BR2_PACKAGE_MICROPYTHON

Even for a single sub-options, we prefer an enclosing if-block, so I
converted the dependency to that.

[--SNIP--]
> diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
> index 37c148da94..5a0c5616a5 100644
> --- a/package/micropython/micropython.mk
> +++ b/package/micropython/micropython.mk
> @@ -57,4 +57,21 @@ define MICROPYTHON_INSTALL_TARGET_CMDS
>  		install
>  endef
>  
> +ifeq ($(BR2_PACKAGE_MICROPYTHON_LIB),y)
> +define MICROPYTHON_COLLECT_LIBS
> +	$(EXTRA_ENV) PYTHONPATH=$(@D)/tools:/$PYTHONPATH \

And I have indeed dropped the latter part of PYTHONPATH, because it is
not useful and is even incorrect.

> +		package/micropython/collect_micropython_lib.py \
> +		$(@D) $(@D)/.built_pylib
> +endef
> +
> +define MICROPYTHON_INSTALL_LIBS
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/micropython
> +	cp -a $(@D)/.built_pylib/* $(TARGET_DIR)/usr/lib/micropython
> +endef
> +
> +MICROPYTHON_POST_BUILD_HOOKS += MICROPYTHON_COLLECT_LIBS
> +MICROPYTHON_POST_INSTALL_TARGET_HOOKS += MICROPYTHON_INSTALL_LIBS
> +endif
> +
> +

    $ ./utils/docker-run make check-package
    package/micropython/micropython.mk:76: consecutive empty lines

So I've fixed that too. So here are the few minoor changes I made:

  - use if-block in Config.in
  - simplify PYTHONPATH
  - fix check-package
  - reword and reorder parts of the commit log

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  $(eval $(generic-package))
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
