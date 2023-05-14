Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDC0C7EE22
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 14:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17D9641FC3;
	Sun, 14 May 2023 14:07:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17D9641FC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CQ86k0ZkDNUR; Sun, 14 May 2023 14:06:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F330341FB8;
	Sun, 14 May 2023 14:06:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F330341FB8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D3CD1BF3B9
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 14:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52C9983C6B
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 14:06:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52C9983C6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KIRMhb19LjPW for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 14:06:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A23A83C6A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A23A83C6A
 for <buildroot@buildroot.org>; Sun, 14 May 2023 14:06:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e91d:2912:5826:9d75])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5C7E1B0059C;
 Sun, 14 May 2023 16:06:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 May 2023 16:06:47 +0200
Date: Sun, 14 May 2023 16:06:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <20230514140647.GH2582048@scaer>
References: <20230130144655.1193660-1-maxime.chevallier@bootlin.com>
 <20230130144655.1193660-4-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230130144655.1193660-4-maxime.chevallier@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684073212;
 bh=pudjBy18hr6Fo6tY1ojttUqj5w+DZTwY391nhagHh9Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nxTozZxKYlto5vSK0UTxvT2+UR2otXurBCeuabLrrBZvYec7JkbZ1NBKL+uhAHvw9
 JioLfLhFk7pRhMUIijx/md/42p35mYQ0+wwJITN2OeveuuRWN0gD4MfHD5qfvTr8aS
 V3n3INs5y0L3z/cljKco/KaKnBWdmzIwcRzUqZmDo8rX1NqLo5Q3vJ6mRJFpXHsOeN
 V35DKYYmddruV+7aucwByFE4ls7zxlSqXAS68fARXlzIPAmp+e4zbQlGK58MRPMJLB
 tJrr/EZjYdDK/BDaAGpZ/bQv939E17jrhCk7cWBOsuoJKSuF3n75rZH9zfXF2rflIm
 3eou/odT+zQpw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nxTozZxK
Subject: Re: [Buildroot] [PATCH 3/4] package/linux-tools: add rtla
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
Cc: Pierre Floury <pierre.floury@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Maxime, All,

On 2023-01-30 15:46 +0100, Maxime Chevallier via buildroot spake thusly:
> The RealTime Linux Analysis tool includes a set of commands that relies
> on the osnoise and timerlat tracers from the ftrace kernel subsystem,
> allowing to analyze the lantency sources coming from the hardware and
> the kernel itself.
> 
> This tool was introduced in v5.17, and relies on libtracefs and
> libtraceevent, although libtraceevent itself is already a dependency for
> libtracefs.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
[--SNIP--]
> diff --git a/package/linux-tools/linux-tool-rtla.mk.in b/package/linux-tools/linux-tool-rtla.mk.in
> new file mode 100644
> index 0000000000..a736e3b785
> --- /dev/null
> +++ b/package/linux-tools/linux-tool-rtla.mk.in
> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# rtla
> +#
> +################################################################################
> +
> +LINUX_TOOLS += rtla
> +
> +RTLA_DEPENDENCIES = host-pkgconf libtracefs
> +RTLA_MAKE_OPTS = $(LINUX_MAKE_FLAGS) \
> +	CC=$(TARGET_CC) \
> +	LDFLAGS="$(TARGET_LDFLAGS)" \
> +	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig

For multi-line assignment, start first assignment on its own line as
well:

    RTLA_MAKE_OPTS = \
        $(LINUX_MAKE_FLAGS) \
        CC=$(TARGET_CC) \
        LDFLAGS="$(TARGET_LDFLAGS)" \
        PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig

> +define RTLA_BUILD_CMDS
> +	$(Q)if ! grep install $(LINUX_DIR)/tools/tracing/rtla/Makefile >/dev/null 2>&1 ; then \
> +		echo "Your kernel version is too old and does not implement the rtla tool." ; \
> +		echo "At least kernel 5.17 must be used." ; \
> +		exit 1 ; \
> +	fi
> +
> +	$(TARGET_MAKE_ENV) \
> +	$(MAKE) $(RTLA_MAKE_OPTS) \
> +	-C $(LINUX_DIR)/tools/tracing rtla

Similarly to libtraceevent and libtracefs, indent the continuation
lines. Also, keep coommon arguments in the same order for all _CMDS.

I've marked the whole series as Changes Requested. Sorry for the long
delay on providing that review... :-(

Regards,
Yann E. MORIN.

> +endef
> +
> +define RTLA_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/tracing \
> +	$(RTLA_MAKE_OPTS) \
> +	DESTDIR=$(TARGET_DIR) \
> +	rtla_install
> +endef
> -- 
> 2.39.1
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
