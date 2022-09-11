Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B78BC54EE9
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 18:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D284C84609;
	Sun, 11 Sep 2022 18:26:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D284C84609
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T8-eqTZSPlZq; Sun, 11 Sep 2022 18:26:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCC0C82521;
	Sun, 11 Sep 2022 18:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCC0C82521
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA1501BF3EB
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 18:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4248845FB
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 18:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4248845FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yK6eTqBR019Z for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 18:25:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3F67845FA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3F67845FA
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 18:25:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:41d6:744a:8631:c709])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5692113F846;
 Sun, 11 Sep 2022 20:25:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Sep 2022 20:25:31 +0200
Date: Sun, 11 Sep 2022 20:25:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220911182531.GB898622@scaer>
References: <20220911125533.29246-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220911125533.29246-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662920733;
 bh=Y+9NZuX1NZZtuTV8EtnMyufLK/KHw1LFCrrIILbyAJw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fdbKNXuwHpSsz7x1xDMvQTlkt8yE5GtSJpT03BUIg7//hRhnvh9iQu5b9q19K54Yq
 XAL585LQcpz76HJm71mtkgxD5lfCfsiMUFhrZve/p+lnxqA6xgEq4WOHGuuu1iSVKe
 d3l+fhD4oUpW5+AG7L3wDywPJElG7kvygYnIY3qZYQCkjpR8XiSH6ZbxnSjanr8DjF
 AwA+t9PfW1zTUmtrPt2XObNuw7GLUntwgYvkzvFWnefYxSzYZr6aIwvejA0M1Jyc1n
 iVPHSJfMS6tKWRMbmsggcunk0I4lplMc2Vi/L8A9Zmwo27M15MJQoXGf0A0hmLqOXB
 XXUc/Nde+5isA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fdbKNXuw
Subject: Re: [Buildroot] [PATCH 1/1] package/rhash: bump to version 1.4.3
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

On 2022-09-11 14:55 +0200, Fabrice Fontaine spake thusly:
> https://github.com/rhash/RHash/releases/tag/v1.4.3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rhash/rhash.hash | 6 +++---
>  package/rhash/rhash.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/rhash/rhash.hash b/package/rhash/rhash.hash
> index e0555af3c2..355b5c275b 100644
> --- a/package/rhash/rhash.hash
> +++ b/package/rhash/rhash.hash
> @@ -1,5 +1,5 @@
> -# From https://sourceforge.net/projects/rhash/files/rhash/1.4.2/
> -sha1  fdb0b0c16f3ba3eba734b3adf9f2fc4c427ff987  rhash-1.4.2-src.tar.gz
> +# From https://sourceforge.net/projects/rhash/files/rhash/1.4.3/
> +sha1  6e698e6d5b13aeac55076d6a53dc4dab55f2114e  rhash-1.4.3-src.tar.gz
>  # Locally calculated
> -sha256  600d00f5f91ef04194d50903d3c79412099328c42f28ff43a0bdb777b00bec62  rhash-1.4.2-src.tar.gz
> +sha256  1e40fa66966306920f043866cbe8612f4b939b033ba5e2708c3f41be257c8a3e  rhash-1.4.3-src.tar.gz
>  sha256  953e55838353335148c90b5a38a4894292680b1d4c37228ffddddbf18ce54bf5  COPYING
> diff --git a/package/rhash/rhash.mk b/package/rhash/rhash.mk
> index 02af0aa57b..8c33de1862 100644
> --- a/package/rhash/rhash.mk
> +++ b/package/rhash/rhash.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RHASH_VERSION = 1.4.2
> +RHASH_VERSION = 1.4.3
>  RHASH_SOURCE = rhash-$(RHASH_VERSION)-src.tar.gz
>  RHASH_SITE = https://sourceforge.net/projects/rhash/files/rhash/$(RHASH_VERSION)
>  RHASH_LICENSE = 0BSD
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
