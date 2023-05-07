Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C151C77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 19:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20E8B81E7F;
	Sun,  7 May 2023 19:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20E8B81E7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UmssisX8lqjx; Sun,  7 May 2023 19:14:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54547822C2;
	Sun,  7 May 2023 19:14:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54547822C2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B28421BF2CD
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 19:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B07840B77
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 19:13:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B07840B77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oNCkkfYpNPbX for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 19:13:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5976140B60
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5976140B60
 for <buildroot@buildroot.org>; Sun,  7 May 2023 19:13:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id AA4C919F576;
 Sun,  7 May 2023 21:13:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 21:13:47 +0200
Date: Sun, 7 May 2023 21:13:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <20230507191347.GH252090@scaer>
References: <20230503044532.121962-1-fido_max@inbox.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230503044532.121962-1-fido_max@inbox.ru>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683486829;
 bh=pbq+AlwpyxvY4Z7eAs/+6b6rgqjLgsVzhN4K6YJAFaM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oGpV8T2m9ks2HdWqejraIgtJXvaST1wKO4pra4tW8cz7wiY4qWq1ThVgR26yAcz/f
 gzQgHo5WJ7FyBUPSQym9RNRIcaKgp0jXprJFQEjS0p3FTIbuSP3WUXaJJfUojuVagP
 PTIOWkfZI7RxlWsR7rsslpiwcTejL0hkuFJok5itUhx18E+ca3DDhWOk9jjvy/n271
 Gl1C5T8W8EKPEkFpSHvjnm+HgvPSvQjUCNRMEIHEsLv/qE1/g9ccoFo74AbPnODCMC
 o9YW/FAIfyhFHmdvM24bKDlxpeJpm+QkP6wpGUS+J+e69vMcf0lZ/Dvn3NbZZGQG6p
 wREOYgzeUbZrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oGpV8T2m
Subject: Re: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to
 2.10.3
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

On 2023-05-03 07:45 +0300, Maxim Kochetkov via buildroot spake thusly:
> Release notes: https://github.com/timescale/timescaledb/blob/2.10.3/CHANGELOG.md
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/timescaledb/timescaledb.hash | 2 +-
>  package/timescaledb/timescaledb.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
> index b05c7802c2..9ec92244a7 100644
> --- a/package/timescaledb/timescaledb.hash
> +++ b/package/timescaledb/timescaledb.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  6fca72a6ed0f6d32d2b3523951ede73dc5f9b0077b38450a029a5f411fdb8c73  timescaledb-2.10.1.tar.gz
> +sha256  d3bd209ebe48f058fd3fa2aa0d6a74fbce2023d64dbb205e58e2c9ab62059cce  timescaledb-2.10.3.tar.gz
>  sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
> diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
> index bcda07f893..cd02d8df50 100644
> --- a/package/timescaledb/timescaledb.mk
> +++ b/package/timescaledb/timescaledb.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TIMESCALEDB_VERSION = 2.10.1
> +TIMESCALEDB_VERSION = 2.10.3
>  TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
>  TIMESCALEDB_LICENSE = Apache-2.0
>  TIMESCALEDB_LICENSE_FILES = LICENSE
> -- 
> 2.39.2
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
