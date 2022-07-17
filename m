Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF67C43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EACA8840B2;
	Sun, 17 Jul 2022 13:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EACA8840B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vAXN-dBsKRp5; Sun, 17 Jul 2022 13:25:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 720FF83EF7;
	Sun, 17 Jul 2022 13:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 720FF83EF7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C6AD61BF3D5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEA86416F7
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEA86416F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZSQh9cio3U7W for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:23:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 666FD41708
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 666FD41708
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:23:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 17A6A78050A;
 Sun, 17 Jul 2022 15:23:52 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 15:23:51 +0200
Date: Sun, 17 Jul 2022 15:23:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220717132351.GM2249625@scaer>
References: <20220710133917.359553-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220710133917.359553-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658064235;
 bh=5vf7K7h0F+CePp1c4A9NzzZSrxkwVYmLVU60Z5F2GYw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y/OFS1EGs9VtHw1Vu789aPr+bpFpf2HJF+I6c8LftZF57SEztjQneCNpysez2scGa
 k4Laa1LtIJ6IGUlak91XoGakyfKsed09jWrlGpzTWJqWHxA7E386OdhedU/vrRhe3b
 KQrhizkv3Jiv1CV6ZzIMmytLqmqGDaIPnU7+aXpr54ZzxfKnoYBYswbuQgxJ78md0Q
 62MwREPgm2BTsm5UH3/5uNl9o5/tLFkXpIyD0BaNAO1j5ERwPgsVrgyThGT1h+NjM0
 LoceMgMs9ns2KyzcunxIQ5RlT5+NWZr1Pg1eruFJb3oECIsmnFG4PfLW7nhxKWk7xt
 OQaJ+z8Jf+/cQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Y/OFS1EG
Subject: Re: [Buildroot] [PATCH 1/1] package/log4cplus: bump to version 2.0.8
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-07-10 15:39 +0200, Fabrice Fontaine spake thusly:
> https://github.com/log4cplus/log4cplus/releases/tag/REL_2_0_8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/log4cplus/log4cplus.hash | 2 +-
>  package/log4cplus/log4cplus.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/log4cplus/log4cplus.hash b/package/log4cplus/log4cplus.hash
> index a668eca37a..c4540c9d56 100644
> --- a/package/log4cplus/log4cplus.hash
> +++ b/package/log4cplus/log4cplus.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  8f74a0a5920ba044b24e2ebeb0f1e5e36d85d5c23ed48d9fe328882b16130db8  log4cplus-2.0.7.tar.xz
> +sha256  f5949e713cf8635fc554384ab99b04716e3430f28eed6dd7d71ad03d959b91a0  log4cplus-2.0.8.tar.xz
>  sha256  91d7e42ff80e74c4c94e5ad353375fa0358cd0abbf43f5fe957097cdbd4e2c4d  LICENSE
> diff --git a/package/log4cplus/log4cplus.mk b/package/log4cplus/log4cplus.mk
> index 56a85025cb..b2e9ac3ed1 100644
> --- a/package/log4cplus/log4cplus.mk
> +++ b/package/log4cplus/log4cplus.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LOG4CPLUS_VERSION = 2.0.7
> +LOG4CPLUS_VERSION = 2.0.8
>  LOG4CPLUS_SOURCE = log4cplus-$(LOG4CPLUS_VERSION).tar.xz
>  LOG4CPLUS_SITE = http://downloads.sourceforge.net/project/log4cplus/log4cplus-stable/$(LOG4CPLUS_VERSION)
>  LOG4CPLUS_LICENSE = Apache-2.0, BSD-2-Clause, BSD-like (threadpool)
> -- 
> 2.35.1
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
