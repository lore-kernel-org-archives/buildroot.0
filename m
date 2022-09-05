Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3797DECAAD3
	for <buildroot@archiver.kernel.org>; Mon,  5 Sep 2022 19:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C446A81412;
	Mon,  5 Sep 2022 19:54:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C446A81412
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ch5UdytCdevb; Mon,  5 Sep 2022 19:54:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE7EF813C4;
	Mon,  5 Sep 2022 19:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE7EF813C4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA1C81BF37E
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 19:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AED09400FB
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 19:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AED09400FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8mXJN3cJOsi4 for <buildroot@lists.busybox.net>;
 Mon,  5 Sep 2022 19:54:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F398400E5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F398400E5
 for <buildroot@buildroot.org>; Mon,  5 Sep 2022 19:54:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5e76:18ec:e237:5279])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BE8F1B0055E;
 Mon,  5 Sep 2022 21:54:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 05 Sep 2022 21:54:50 +0200
Date: Mon, 5 Sep 2022 21:54:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220905195450.GI1490660@scaer>
References: <20220904211117.218817-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220904211117.218817-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662407692;
 bh=KcrMNd/wn2l5SwTl/EaRDo0N0rbIHfjuHvXO2HKJZyw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u7JazpimV+dyR3IrQ4zAlwiaV0JbhcpwVhGqps0BqrzjnKBU+omCo32PvFjlHr8PG
 i1eoCXnT/yZ63shREFWPLiwXOtk8ny6B4eA1B4meTXTRVbbMWswV7wqgum4IjY4oi1
 +xnZZ1s70Y/9Gulz3b8pcHdufO1EVDqWNsSf6iFwI9ISiNu+wGpK5ZU9fp5PPcsqHl
 0tKQ2335QB7RhvqJXVyResryN8eOmDZPXe2CpwNGrQcM1S+oCSGu95PBoL+tnu3q7b
 puO4Fr7WL7jfZqZgphHENTDPe9wsp/q/4I3nfQ4GJ7YKnMynTGMAvZR9dK+HSyzxHB
 8jgDWvIYFOtBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=u7Jazpim
Subject: Re: [Buildroot] [PATCH/next 1/1] package/minizip-zlib: bump to
 version 1.2.12
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

Fabrice, All,

On 2022-09-04 23:11 +0200, Fabrice Fontaine spake thusly:
> Update hash of README (version and year updated with
> https://github.com/madler/zlib/commit/21767c654d31d2dccdde4330529775c6c5fd5389)
> 
> https://github.com/madler/zlib/blob/v1.2.12/ChangeLog

There seems to be quite some fixes identified in that changelog. Do you
think this warrants going in master, or is it for next?

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/minizip-zlib/minizip-zlib.hash | 4 ++--
>  package/minizip-zlib/minizip-zlib.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/minizip-zlib/minizip-zlib.hash b/package/minizip-zlib/minizip-zlib.hash
> index 4d2c5c29d3..e6ca974e2f 100644
> --- a/package/minizip-zlib/minizip-zlib.hash
> +++ b/package/minizip-zlib/minizip-zlib.hash
> @@ -1,4 +1,4 @@
>  # From http://www.zlib.net/
> -sha256  4ff941449631ace0d4d203e3483be9dbc9da454084111f97ea0a2114e19bf066  zlib-1.2.11.tar.xz
> +sha256  7db46b8d7726232a621befaab4a1c870f00a90805511c0e0090441dac57def18  zlib-1.2.12.tar.xz
>  # License files, locally calculated
> -sha256  7960b6b1cc63e619abb77acaea5427159605afee8c8b362664f4effc7d7f7d15  README
> +sha256  fc2c3368901700f0acdeb1d8afeaca5923296768ec6824ecdf627aac396001fd  README
> diff --git a/package/minizip-zlib/minizip-zlib.mk b/package/minizip-zlib/minizip-zlib.mk
> index 935877678d..ec0c3da7d6 100644
> --- a/package/minizip-zlib/minizip-zlib.mk
> +++ b/package/minizip-zlib/minizip-zlib.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MINIZIP_ZLIB_VERSION = 1.2.11
> +MINIZIP_ZLIB_VERSION = 1.2.12
>  MINIZIP_ZLIB_SOURCE = zlib-$(MINIZIP_ZLIB_VERSION).tar.xz
>  MINIZIP_ZLIB_SITE = http://www.zlib.net
>  MINIZIP_ZLIB_LICENSE = Zlib
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
