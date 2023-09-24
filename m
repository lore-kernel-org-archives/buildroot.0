Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE622CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 10:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94B8D4171E;
	Sun, 24 Sep 2023 10:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94B8D4171E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3GLIbS71MU4l; Sun, 24 Sep 2023 10:37:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 355D641966;
	Sun, 24 Sep 2023 10:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 355D641966
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 31E161BF365
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 10:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 160BA418F0
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 10:35:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 160BA418F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3BzGCqaTXtzC for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 10:35:04 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94C124174E
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 10:35:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94C124174E
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:bf8d:df06:37bc:41df])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D9805780389;
 Sun, 24 Sep 2023 12:34:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Sep 2023 12:34:59 +0200
Date: Sun, 24 Sep 2023 12:34:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230924103459.GK1469982@scaer>
References: <20230923132703.66338-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230923132703.66338-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695551701;
 bh=fgImGVkw05M3NHw7sd4G6p46N+pNNwFMRN3g3X2C2ho=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FqFMfIADwzX36n0x035ja2roMMCX9OzeL1tBOGAMq4ToDUlmzOSTVkz4UBm9TXzC0
 V2hIFBVybfM+mFoVC40rq7NpJCvShFOQqg8xqkuNK0O/5FjdMToHV4T0tARzR1JXTv
 oOlwPXh37IZldXAhKno8qB8yjw9DGQeoYIGnlmLFkWHofDT9QJliLQsbvzxY5ncgTr
 zyOgRYyaG80ylRNJXjYfnBGoBIUjoaoZJB8vBJ4Mbwwkpv89LQjGVhubh3OTbIs6bc
 u1O2Zt+2Cx7VU39XNruIy8lxTAH0kHHv5ONoKqLlMCk7L8f2FH0HicTDPT4J867D23
 0n8edfyNKEq4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FqFMfIAD
Subject: Re: [Buildroot] [PATCH 1/2] package/dovecot: bump version to 2.3.21
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

Bernd, All,

On 2023-09-23 15:27 +0200, Bernd Kuhls spake thusly:
> Release notes:
> https://dovecot.org/mailman3/archives/list/dovecot-news@dovecot.org/thread/KYDR7WWPEQOBZA3IA4NL5XDSLODZLG6N/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Both applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/dovecot/dovecot.hash | 2 +-
>  package/dovecot/dovecot.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
> index 7036df57a8..e42bb577a8 100644
> --- a/package/dovecot/dovecot.hash
> +++ b/package/dovecot/dovecot.hash
> @@ -1,5 +1,5 @@
>  # Locally computed after checking signature
> -sha256  caa832eb968148abdf35ee9d0f534b779fa732c0ce4a913d9ab8c3469b218552  dovecot-2.3.20.tar.gz
> +sha256  05b11093a71c237c2ef309ad587510721cc93bbee6828251549fc1586c36502d  dovecot-2.3.21.tar.gz
>  sha256  319a9830aab406109cd67cb45496587566a8123203d66d037b209ca3e13de02a  COPYING
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
>  sha256  52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
> diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
> index 4b17784f93..2933401cbc 100644
> --- a/package/dovecot/dovecot.mk
> +++ b/package/dovecot/dovecot.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  DOVECOT_VERSION_MAJOR = 2.3
> -DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).20
> +DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).21
>  DOVECOT_SITE = https://dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
>  DOVECOT_INSTALL_STAGING = YES
>  DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
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
