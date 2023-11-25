Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC02C4167B
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 15:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 377DE41908;
	Sat, 25 Nov 2023 15:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 377DE41908
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t9L9VJHXu6Ch; Sat, 25 Nov 2023 15:41:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81B81418F1;
	Sat, 25 Nov 2023 15:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81B81418F1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5CBD51BF423
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 15:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 361EA813F0
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 15:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 361EA813F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xxXJH4LOSw-8 for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 15:41:08 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0569813D0
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 15:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0569813D0
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:a9ce:514c:eb15:225c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EC93113F880;
 Sat, 25 Nov 2023 16:41:01 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 25 Nov 2023 16:41:01 +0100
Date: Sat, 25 Nov 2023 16:41:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20231125154101.GL3177259@scaer>
References: <20230930221727.1458825-1-arnout@mind.be>
 <20230930221727.1458825-3-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230930221727.1458825-3-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700926866;
 bh=797TG380atThpg9eTj3eWdz3qnKVaRVMW3BsrA6njQA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i3RWmDoyxn1d/IjS//wqsalhMiUUaZd28ZFGR/ve1rWBqEXtOjxZARhlayL/Is93J
 I8NjQBw+7tQjqrzal4fZu6tRIYygPkC11gq3gUNUjQHDqfuusbGwShx+K/S6gQUzIk
 dNOBMZ65HV+DSlXP88fvaoLIgjokiXZ5i3vgJyFi5CCDYLDjR2C/w9j7mu5pCoikBv
 vn6f6HcSqK76ceD1hivl8WQBZPFCKSmozNJiGX/U0wvsICeYNsaoVbTd5hfaao+yk9
 IO3AGvV2aF+TD77klL2kS80+Yrs8pji2/TZTi4JSmLAHVgNlmq3AD1ib7tUM6pw5+4
 m/MJNtooXEiaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=i3RWmDoy
Subject: Re: [Buildroot] [PATCH 02/10] package/pkg-python.mk: remove
 _BASE_BUILD_OPTS variable
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
 "Signed-off-by : Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2023-10-01 00:16 +0200, Arnout Vandecappelle via buildroot spake thusly:
> This variable can just as well be merged into _BASE_BUILD_CMD. This is
> how it's done for the install opts. And anyway it's only used by
> distutils and nowhere else.
> 
> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-python.mk | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 1fc096efb3..eacf75c165 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -198,8 +198,7 @@ endif
>  ifeq ($$($(2)_SETUP_TYPE),distutils)
>  ifeq ($(4),target)
>  $(2)_BASE_ENV = $$(PKG_PYTHON_DISTUTILS_ENV)
> -$(2)_BASE_BUILD_CMD = setup.py build
> -$(2)_BASE_BUILD_OPTS = $$(PKG_PYTHON_DISTUTILS_BUILD_OPTS)
> +$(2)_BASE_BUILD_CMD = setup.py build $$(PKG_PYTHON_DISTUTILS_BUILD_OPTS)
>  $(2)_BASE_INSTALL_TARGET_CMD  = setup.py install --no-compile $$(PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS)
>  $(2)_BASE_INSTALL_STAGING_CMD = setup.py install $$(PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS)
>  else
> @@ -335,7 +334,7 @@ define $(2)_BUILD_CMDS
>  		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
>  		$$(HOST_DIR)/bin/python3 \
>  		$$($$(PKG)_BASE_BUILD_CMD) \
> -		$$($$(PKG)_BASE_BUILD_OPTS) $$($$(PKG)_BUILD_OPTS))
> +		$$($$(PKG)_BUILD_OPTS))
>  endef
>  endif
>  
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
