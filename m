Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D608C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 11:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B11CA404B2;
	Wed, 27 Jul 2022 11:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B11CA404B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tVhdZwvDEbT2; Wed, 27 Jul 2022 11:25:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64B3240168;
	Wed, 27 Jul 2022 11:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64B3240168
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 421421BF46D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 11:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29ACD40168
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 11:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29ACD40168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iaZ_0YMThuyJ for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 11:25:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4BF240105
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4BF240105
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 11:25:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:2464:a3b6:9580:87a1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 70062B00728;
 Wed, 27 Jul 2022 13:25:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 27 Jul 2022 13:25:23 +0200
Date: Wed, 27 Jul 2022 13:25:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220727112523.GA1134587@scaer>
References: <20220727071557.3434892-1-james.hilliard1@gmail.com>
 <20220727071557.3434892-2-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220727071557.3434892-2-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658921131;
 bh=JdyEDNu7XwUCOhuOcZMJOTxaf/jZSSFAFM4TPr1OGSs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RTlPt55oHs+g9n4GAwpt0KpM0itrUpeJ8b3sz5p1labl+5pwCBZqkOHwKZNFqCk2w
 qbg+SsHGboY684G2rtAVZWJBy9i2ud5rClH22CTWTU4WVu7P7vpAOKzn7h+URfcDcg
 A0pPeewx/1IPZWNbJ1pJ1Jg7p7C65GFux2Pa1bI51PDL9YIrr1xHAgaqFDl+sZh6sf
 TQIhkKC/EzQ9pbaoI5bhdSKKeiHaqQ0TbiO9jNUS7nOol0dTqsRE5ZoVQppE1Dzdrg
 Mc6seemFwqk6IMbh/iSqrBB5VT/E12HJv/STNZv5YSGcTm4PSYQUZF5zAc9apK3z7h
 w/FJhlZ5/hQIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RTlPt55o
Subject: Re: [Buildroot] [PATCH v5 2/2] package/pkg-meson: use meson to
 build/install packages
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 buildroot@buildroot.org, Norbert Lange <nolange79@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-07-27 01:15 -0600, James Hilliard spake thusly:
> As of version 0.54.0 meson has had the ability to build and install
> packages rather than having to run ninja directly as before.
[--SNIP--]
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 47aaddf849..6efc8d636f 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
[--SNIP--]
> @@ -777,10 +777,7 @@ endef
>  HOST_SYSTEMD_CONF_OPTS = \
>  	-Dsplit-bin=true \
>  	-Dsplit-usr=false \
> -	--prefix=/usr \
> -	--libdir=lib \
> -	--sysconfdir=/etc \
> -	--localstatedir=/var \
> +	-Drootprefix=$(HOST_DIR) \

Have you read the explanations in 35c11a027c8 (package/systemd: add host
variant)? This change must expand on how it does not break things, with
a very good and detailed commit log, and as a separate patch.

Also, if the HOST_SYSTEMD_FIX_RPATH hook still needed, then?

Regards,
Yann E. MORIN.

>  	-Dutmp=false \
>  	-Dhibernate=false \
> @@ -852,8 +849,6 @@ HOST_SYSTEMD_DEPENDENCIES = \
>  	host-gperf \
>  	host-python-jinja2
>  
> -HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
> -
>  # Fix RPATH After installation
>  # * systemd provides a install_rpath instruction to meson because the binaries
>  #   need to link with libsystemd which is not in a standard path
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
