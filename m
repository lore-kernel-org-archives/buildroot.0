Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C42C43217
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 18:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45B1B4088B;
	Sat,  5 Nov 2022 18:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45B1B4088B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x18tGpGWTIa4; Sat,  5 Nov 2022 18:46:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9BBE40880;
	Sat,  5 Nov 2022 18:46:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9BBE40880
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A6091BF375
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 18:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 261D081DEF
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 18:46:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 261D081DEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PmONzSe31n0W for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 18:46:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4037D81DED
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4037D81DED
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 18:46:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b857:25fc:60e2:657f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 478FB5FF3F;
 Sat,  5 Nov 2022 19:45:56 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 05 Nov 2022 19:45:55 +0100
Date: Sat, 5 Nov 2022 19:45:55 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20221105184555.GM3918838@scaer>
References: <20221031174632.377586-1-troglobit@gmail.com>
 <20221031174632.377586-2-troglobit@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221031174632.377586-2-troglobit@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667673958;
 bh=KeEgcI1ryJyMwVm5wIs6LS9H/JMZDPoMcuOa19YwYlk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NI2TEVhl1zh9RYJTVKM5U5wFwQrfHQu8mLbGsuKcZ8Kr/9xnSjrXcCKSX6+nWYZ2l
 UcZmddrITUFUkjE6Ou8BvzZy7z3nVZr7haLcE/9K8tJXjsZw/ThdydxHghp5QxnzlW
 CjrLggjHg71xmf61Tf0W4wj5JACj30GJuRWgUEyhPinEUGFEX78ZwGJz7jStnI7ctZ
 cd6CwfIbaT39SI5hJJz2JUSPph411uFhaWZ8FUtPEqX4iHWl9xeoPO5ucTe2BGRMNb
 0O28eXcBP7fnUOr4mpEx13Z+4c3iqT/gt8WVVMmI+yjpGCrIETrzG/FBuxtjfcwQ8b
 PgIseUkNlvHgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NI2TEVhl
Subject: Re: [Buildroot] [PATCH 1/3] package/ssdp-responder: bump to version
 1.9
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

Joachime, All,

On 2022-10-31 18:46 +0100, Joachim Wiberg spake thusly:
> Changes:
>  - New command line options to ssdp-scan
>  - Update copyright years (affects LICENSE file hash)
> 
> Fixes:
>  - Workaround for OpenVPN /32 default server setup
>  - Time-of-check vs time-of-use issue with caching of UUID,
>    found by Coverity Scan, fixed by Raul Porancea
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ssdp-responder/ssdp-responder.hash | 4 ++--
>  package/ssdp-responder/ssdp-responder.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ssdp-responder/ssdp-responder.hash b/package/ssdp-responder/ssdp-responder.hash
> index e8cbbb4a1f..425ad86e08 100644
> --- a/package/ssdp-responder/ssdp-responder.hash
> +++ b/package/ssdp-responder/ssdp-responder.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  7ae49229e7c7a55fed9e36598b12e2173eecef0fffe0a386b6a10fad30f3c79f  ssdp-responder-1.8.tar.gz
> -sha256  e17dc0bc91bf499d8cca5e016c22c6d2a4770e3cc1a43756a7973375a83ddb90  LICENSE
> +sha256  974c244abd4ba8c87532867a84756182a1460c99072ffb1eb91c5a1f73311d89  ssdp-responder-1.9.tar.gz
> +sha256  68d6fdc22e337f725fe719bf9ae6d92b1d8d0ca4cff8219b303ab76706670a8d  LICENSE
> diff --git a/package/ssdp-responder/ssdp-responder.mk b/package/ssdp-responder/ssdp-responder.mk
> index 3fee4c2006..fd7b1ea44b 100644
> --- a/package/ssdp-responder/ssdp-responder.mk
> +++ b/package/ssdp-responder/ssdp-responder.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SSDP_RESPONDER_VERSION = 1.8
> +SSDP_RESPONDER_VERSION = 1.9
>  SSDP_RESPONDER_SITE = https://github.com/troglobit/ssdp-responder/releases/download/v$(SSDP_RESPONDER_VERSION)
>  SSDP_RESPONDER_LICENSE = ISC
>  SSDP_RESPONDER_LICENSE_FILES = LICENSE
> -- 
> 2.34.1
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
