Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74326C433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 18:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3901F60D6E;
	Tue, 25 Jan 2022 18:39:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IVC_52FRuZ6S; Tue, 25 Jan 2022 18:39:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80301607A4;
	Tue, 25 Jan 2022 18:39:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2ACCD1BF2C8
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2674082A3B
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:36:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pLOVFxNoCjWi for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 18:36:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 507DC82A2E
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 18:36:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:40e2:478e:9a26:9cef])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id DBEF55FFA5;
 Tue, 25 Jan 2022 19:36:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643135805;
 bh=WoFGKfI224FQLXaHhyZ785T+sCj8dNpQf5Kqek59Zx4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fw04ffNS9lO4Ky6hdcGYKd6tW1LfK89O61Qv3IMw380SJpDo/Vf9Q+wdyJDby6GZv
 8gROME/0+BWtL+pEZ8fJT1bxzb8KMQ/WJ9jsskd4yWLdSxUD7DyzBF4v5vuRo2gt9L
 9ACbHGeVE4F2IB53Y0FMSQGwpBAsbYykj2KitnJDjV6jeB2pZicVmQZqTydRkQP5UB
 qukr/NT+6s8M9gzB0xGW3djLqshYyuZUdw3ZWfwh6msbI927XF2ce13Aw3YyH3J6Ng
 bEOTKGAfxnOCa/aechz69iphptLi/o1b7kUaqdggWYlSydaWNr3q8vqyMMBm4yciIZ
 YzZ/8/rDLIiug==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jan 2022 19:36:40 +0100
Date: Tue, 25 Jan 2022 19:36:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220125183640.GD457876@scaer>
References: <20220124094408.421939-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220124094408.421939-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-autobahn: bump to
 version 21.11.1
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
Cc: Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-01-24 02:44 -0700, James Hilliard spake thusly:
> Drop patches that are now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
> index 4ec47f54ce..481d9373ad 100644
> --- a/package/python-autobahn/python-autobahn.mk
> +++ b/package/python-autobahn/python-autobahn.mk
> @@ -4,9 +4,10 @@
>  #
>  ################################################################################
>  
> -PYTHON_AUTOBAHN_VERSION = 21.3.1
> +PYTHON_AUTOBAHN_VERSION = 21.11.1
>  PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
> -PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/4c/9e/f5bdfb55d1eab67c4b6d24d1397f95feec792071ff1b2f5a893d6d5247f3
> +PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/f1/d3/23fdf1ab0104b1b65d2f7884e923f0526750a59f96334d752afc79cf44ed
> +PYTHON_AUTOBAHN_SETUP_TYPE = setuptools

    $ make check-package
    package/python-autobahn/python-autobahn.mk:15: unconditional override of variable PYTHON_AUTOBAHN_SETUP_TYPE

python-autobachn was already declared as a setuptools package; your
change was superfluous.

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

>  PYTHON_AUTOBAHN_LICENSE = MIT
>  PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
>  PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
> -- 
> 2.25.1
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
