Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86B2C47DDB
	for <buildroot@archiver.kernel.org>; Mon, 29 Jan 2024 18:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7606681E29;
	Mon, 29 Jan 2024 18:50:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7606681E29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b9s32elSZUYp; Mon, 29 Jan 2024 18:49:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 910CA81DFC;
	Mon, 29 Jan 2024 18:49:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 910CA81DFC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B1CB1BF287
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 18:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3285C81DFC
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 18:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3285C81DFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lqJT0zTrhlH6 for <buildroot@lists.busybox.net>;
 Mon, 29 Jan 2024 18:49:55 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E97BA81DE5
 for <buildroot@buildroot.org>; Mon, 29 Jan 2024 18:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E97BA81DE5
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B377813F8BA;
 Mon, 29 Jan 2024 19:49:48 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 29 Jan 2024 19:49:48 +0100
Date: Mon, 29 Jan 2024 19:49:48 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Abilio Marques <abiliojr@gmail.com>
Message-ID: <ZbfzTLGmqOnq02EJ@landeda>
References: <20240129022913.3367510-1-abiliojr@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129022913.3367510-1-abiliojr@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706554191;
 bh=xl0XwIV7uvHsuu4m+DFYIXgP0RLqQNbZCdnZGYhudpQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jgKeIv7p01ZzQRcHXmhQZlWAu49F9DpAVy2Fuu58Uq7hTQ6AY72/nVaL6ylQFVc0W
 +SFoE91cWeWO2L0MBkcViYScK+gQkx0dIWDUz00m8+3jAHsVRyVCeqVkf42g7JJh7g
 suY15MCtl3b+RJN4MqXalXkDzfNJ80GU26HxgoB+nwu7mczs9m633O/jN2xOpZL1ng
 JSiN/zs3Fa2C2Ut2kCf7XAINwL29S/+8IkKUXyVcT2ypZx+pVuaROmwV5a0iCgpjAk
 TgTs5M/BIttj8nxifyO2fzq7wDx1F/G1jhZXRFcM3s+PjgcsB6rmnFxe1VNJ0dKbAv
 80SGpTs1bwNzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jgKeIv7p
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

Thanks for this new iteration!

On 2024-01-28 18:29 -0800, Abilio Marques spake thusly:
> Until now, micropython-lib was a package that installed v1.9.3,
> which is more than 6 years old. This was acceptable since micropython
> never made any other official release of the library until v1.20.
> 
> Meanwhile, the libraries underwent a reorganization, and they are now
> available in a directory structure that cannot be copied directly into
> the target. This is my theory on why v1.9.3 is still present in the

We try to avoid singular first-person messages in the commit log, and
prefer the more neutral plural first-person "we", or the passive tense.
Here, I'd rephrase it as;

    This might explain why v1.9.3 is still...

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

Ditto, no "I" or "my". No need to resend just ofe of the phrasing, it
can be fixed when applying.

One thing that again got me down the host-micropython rabbit-hole, is
that we don't need host-micropython at all, because the manifestfile
module is actual CPython code, not micropython code, so we really, like
really-really, want to write that script for CPython.

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

There is no need to complement PYTHON path with $PYTHONPATH. Indeed,
PYTHONPATH only *augments* the search path, it does not replace the
standard path, so we should just need:

    $(EXTRA_ENV) PYTHONPATH=$(@D)/tools \
    package/micropython/collect_micropython_lib.py \
        $(@D) $(@D)/.built_pylib

No need to resend, I'll tinker with it tonight.

Thanks!

Regards,
Yann E. MORIN.

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
