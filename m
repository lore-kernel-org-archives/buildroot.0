Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28ADC4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 21:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B177460D71;
	Sun, 26 Nov 2023 21:47:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B177460D71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q1HIIAKQgieE; Sun, 26 Nov 2023 21:47:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB87860C09;
	Sun, 26 Nov 2023 21:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB87860C09
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C7E931BF40A
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADC24404D0
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADC24404D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N9MTa9263u4h for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 21:47:24 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DAE3404C6
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 21:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DAE3404C6
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4fcd:aaeb:59ee:6854])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id F1191780316;
 Sun, 26 Nov 2023 22:47:20 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 26 Nov 2023 22:47:20 +0100
Date: Sun, 26 Nov 2023 22:47:20 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <20231126214720.GN3177259@scaer>
References: <20231123060558.807373-1-fido_max@inbox.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231123060558.807373-1-fido_max@inbox.ru>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701035243;
 bh=gMuKs7ai0x1pboHiyc7e1mlcoeVx4k0Fb1jA4L1aScs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=alSHHGZ6jymOHcQm+GlPEW6HNwIQzZZdyHcxcUssyJB0CWrbRu0LJ+RKJh2HWOXf5
 H1138oBCw+C4jtTRdYUk2N1lfF/bq29uJz8rWxVzxeMqnVKD9xC4zHlgUYoh+TxdcX
 50XpMtrUvsxhdJk4VYFMqsMPAft4LLKqYKA2We7O8zjPZr7Ef5qlUAUBIimljrMg5W
 YT0ypx6SXUuDy24YsvvhtoAkzOA4CiOJFRn3zQGUTJuHyr9/U3/txtEYr2YL9UEgbG
 iztO9uNEs483c1TfPlShvjSaYSG6I9W43gOPqSErGSuSYgv0Cdtw1e2q4Jopu4imXD
 O7m175XN6sHFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=alSHHGZ6
Subject: Re: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to
 2.12.2
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

Maxim, All,

On 2023-11-23 09:05 +0300, Maxim Kochetkov spake thusly:
> Release notes: https://github.com/timescale/timescaledb/blob/2.12.2/CHANGELOG.md
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/timescaledb/timescaledb.hash | 2 +-
>  package/timescaledb/timescaledb.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
> index 0f2269986e..ae1d3db1e1 100644
> --- a/package/timescaledb/timescaledb.hash
> +++ b/package/timescaledb/timescaledb.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  acca5f6ec5684722374eece92f73d7763bd171075074fd2e6bd0244bda9fbc25  timescaledb-2.11.2.tar.gz
> +sha256  d24cd29aad411d3e41d543d1a30827c48f8e01a48563650db5fac145ad7a01eb  timescaledb-2.12.2.tar.gz
>  sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
> diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
> index fe7bcbc36e..adae1c2bae 100644
> --- a/package/timescaledb/timescaledb.mk
> +++ b/package/timescaledb/timescaledb.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TIMESCALEDB_VERSION = 2.11.2
> +TIMESCALEDB_VERSION = 2.12.2
>  TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
>  TIMESCALEDB_LICENSE = Apache-2.0
>  TIMESCALEDB_LICENSE_FILES = LICENSE
> -- 
> 2.40.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
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
