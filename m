Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851FAC4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 21:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42F7A60BE7;
	Sun, 26 Nov 2023 21:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42F7A60BE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FtYkv-vr6vhv; Sun, 26 Nov 2023 21:47:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C3B360C2C;
	Sun, 26 Nov 2023 21:47:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C3B360C2C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28D9E1BF40A
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0228360BE7
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 21:47:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0228360BE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HpTY_PBdTAzg for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 21:47:09 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 02CBB60D53
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 21:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02CBB60D53
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4fcd:aaeb:59ee:6854])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 42866780316;
 Sun, 26 Nov 2023 22:47:05 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 26 Nov 2023 22:47:05 +0100
Date: Sun, 26 Nov 2023 22:47:05 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <20231126214704.GM3177259@scaer>
References: <20231123060019.692266-1-fido_max@inbox.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231123060019.692266-1-fido_max@inbox.ru>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701035227;
 bh=FlumN9CEyZALuV468nIceOWcpBdWEuM39pmZVTGw590=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gF7l+rcW8LkGBr/08MDrnqH00I0mpdpmnquhrn2g166nsy5VPdKRw8z5bjH8lKwJj
 F43MzZIaoYgDHys9OS2r+rtKKR53N1ZDqm9p3PceLyBoGAOXqYIFohMToNIqG6XHLr
 MwxCSr/DtmVZj/q8Uw5h05NRdEYDu1kDpth1dqCyt6cLZ0gRrDZJxoVeD4Lkf1Slg4
 iAdsZOC747WNwPlOm9cuoUL9ACCY9N3neY3fnkiHRO200FpCJpM8z031EihKHBFM/9
 ddlCHPz8KNid9/boupTDBXafGv1zlpG8e+ufcuhNv2CCuuwghGoH/EIY3CqTgv0j8I
 9VhHwTW5eHEqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gF7l+rcW
Subject: Re: [Buildroot] [PATCH 1/1] package/osm2pgsql: bump version to
 1.10.0
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

On 2023-11-23 09:00 +0300, Maxim Kochetkov spake thusly:
> Release-notes: https://github.com/openstreetmap/osm2pgsql/releases/tag/1.10.0
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/osm2pgsql/osm2pgsql.hash | 2 +-
>  package/osm2pgsql/osm2pgsql.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/osm2pgsql/osm2pgsql.hash b/package/osm2pgsql/osm2pgsql.hash
> index 0b4eb17c99..a93ceb6a7f 100644
> --- a/package/osm2pgsql/osm2pgsql.hash
> +++ b/package/osm2pgsql/osm2pgsql.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  dc30a3ad9a27f944e4169be9a8e07ee09711901536ddc8fcf4a292bd3aec51d9  osm2pgsql-1.9.2.tar.gz
> +sha256  33849d8edacbca5ab5492fed32ac954de14f92ab6b3028c03ef88bb7ab596d20  osm2pgsql-1.10.0.tar.gz
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/osm2pgsql/osm2pgsql.mk b/package/osm2pgsql/osm2pgsql.mk
> index 44c980ac95..1565c2142c 100644
> --- a/package/osm2pgsql/osm2pgsql.mk
> +++ b/package/osm2pgsql/osm2pgsql.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OSM2PGSQL_VERSION = 1.9.2
> +OSM2PGSQL_VERSION = 1.10.0
>  OSM2PGSQL_SITE = $(call github,openstreetmap,osm2pgsql,$(OSM2PGSQL_VERSION))
>  OSM2PGSQL_LICENSE = GPL-2.0+
>  OSM2PGSQL_LICENSE_FILES = COPYING
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
