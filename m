Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6647DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 08:49:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A359161039
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 08:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A359161039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78C7240408;
	Sun, 10 Oct 2021 08:49:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eyhz_xaZ7gsA; Sun, 10 Oct 2021 08:49:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B711B403E0;
	Sun, 10 Oct 2021 08:49:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 148711BF285
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 08:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10B25403E0
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 08:49:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eAHsyefxR2Oz for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 08:49:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1663403B5
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 08:49:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:344b:acb:d887:4b62])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id EFF3C78035D;
 Sun, 10 Oct 2021 10:49:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633855772;
 bh=9Q+uvuRT2zc3oEixZCwHn37IGX62Y7HIJd6UGchcuJo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DSOZfoj57PzvUtQdRx9o2pFWin9NvK2eXueJfZ6tGdqzwltPKeQX1dNb8V2X8mcMc
 YBdvzZM6gh3FXhoS+qUIXZCo6BBAlcR8a7UUBKDAwONHHIQkaHigi/A2r1a6RGDzNb
 Ab1xCZrm/41vGZWN5zvxel7pqpwkB+sYI+xy/ETWnyNV8VUZb+ZPzkXfK7r/rrHUvU
 cFufgUzCMuiT2eRFOLfn+C5Wt+SD7eHaBBhZcvvQTr1us5oXu9ggBPLSijRhqCPxFK
 azZTNqwybHwBNlI3Vr6c+0zyNLDs1mS+/BSNj++3JMB/EBtOG1I9aiVbNbaxOLoRzK
 suNUG44oDzHEg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 10 Oct 2021 10:49:23 +0200
Date: Sun, 10 Oct 2021 10:49:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211010084923.GJ2081069@scaer>
References: <20211009191646.1076266-1-thomas.petazzoni@bootlin.com>
 <20211009191646.1076266-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211009191646.1076266-2-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/5] package/gdb: append to dependencies in
 conditional
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
Cc: Michael Fischer <mf@go-sys.de>, Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2021-10-09 21:16 +0200, Thomas Petazzoni spake thusly:
> Repeat after me: "Forcing the value of <pkg>_DEPENDENCIES inside a
> conditional is the root of all evil."
> 
> Repeat after me: "Forcing the value of <pkg>_DEPENDENCIES inside a
> conditional is the root of all evil."
> 
> Repeat after me: "Forcing the value of <pkg>_DEPENDENCIES inside a
> conditional is the root of all evil."
> 
> Repeat after me: "Forcing the value of <pkg>_DEPENDENCIES inside a
> conditional is the root of all evil."

Forcing the value of <pkg>_DEPENDENCIES inside a conditional is the root
of all evil.

> Enough? :-)

I guess so, yes! Next time you send a patch that forces the value of
<pkg>_DEPENDENCIES in a conditional, I'll try not to apply it! ;-)

> Due to this mistake, any other GDB_DEPENDENCIES defined before this
> assignment were lost. For example, the host-flex host-bison added
> inside the GDB_FROM_GIT==y condition were ignored if
> BR2_PACKAGE_GDB_DEBUGGER.
> 
> Fixes the build of all ARC configurations that have
> BR2_PACKAGE_GDB_DEBUGGER enabled.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gdb/gdb.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index f9010019f5..4ead75289e 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -147,7 +147,7 @@ ifeq ($(BR2_PACKAGE_GDB_DEBUGGER),y)
>  GDB_CONF_OPTS += \
>  	--enable-gdb \
>  	--with-curses
> -GDB_DEPENDENCIES = ncurses \
> +GDB_DEPENDENCIES += ncurses \
>  	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
>  else
>  GDB_CONF_OPTS += \
> -- 
> 2.31.1
> 

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
