Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E438C433FE
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 15:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D14AA40201;
	Sun,  6 Nov 2022 15:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D14AA40201
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FX01SQWTAHHM; Sun,  6 Nov 2022 15:18:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5467400FF;
	Sun,  6 Nov 2022 15:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5467400FF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39F281BF287
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 15:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 157BE81A27
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 15:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 157BE81A27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W4VAmUyF6xie for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 15:18:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 095AD81A18
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 095AD81A18
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 15:18:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b857:25fc:60e2:657f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 06D5A5FF95;
 Sun,  6 Nov 2022 16:18:06 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 06 Nov 2022 16:18:06 +0100
Date: Sun, 6 Nov 2022 16:18:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20221106151806.GZ3918838@scaer>
References: <20221103224539.692322-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221103224539.692322-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667747892;
 bh=gaCQS52KJA1NzlcBdghQSktmn/Inghduj63+0pMv+Fk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bmSEUZzsg19HqO0ZQ9lUaG7vAPJ9rkVwSYLIOCpu3GNQuZXUnbR3byyz0oLt91gY4
 qpdnp3CvzqWm7cnOZHuff2X6uxhRHDmLWrkEZi6y9EVq0+aZaakkKYYVOvYs5qpb6A
 bYzU51+SQKDa8v4mZ06fdcW1UD7I7uaRqqo9BSFpFH6JzK0cvltf4i4Fyvj6FbexGB
 o/oaBjf3m+tR3+HTsg9f/xL2Gg/dOVUaZ8+v0AF8UBxFFE24tTTTKy2Ht58irguRL/
 YfWWozvJCXbjkR8A3QVNl8yrXvgO/uGxnYSUwrdB58yJXZxTrqd/zlJAD+h7oK7HXH
 ZRka5suEQHDvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bmSEUZzs
Subject: Re: [Buildroot] [PATCH next 1/2] package/pkg-cargo: provide a
 single definition of CARGO_HOME value
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
Cc: Moritz Bitsch <moritz@h6t.eu>, James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-11-03 23:45 +0100, Thomas Petazzoni via buildroot spake thusly:
> Instead of replicating $(HOST_DIR)/share/cargo in several place,
> define BR_CARGO_HOME. This will help when we'll want to change this
> location.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-cargo.mk         | 6 ++++--
>  package/suricata/suricata.mk | 2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> index f7e3f39503..5923725f5e 100644
> --- a/package/pkg-cargo.mk
> +++ b/package/pkg-cargo.mk
> @@ -20,8 +20,10 @@
>  #
>  ################################################################################
>  
> +BR_CARGO_HOME = $(HOST_DIR)/share/cargo
> +
>  PKG_COMMON_CARGO_ENV = \
> -	CARGO_HOME=$(HOST_DIR)/share/cargo
> +	CARGO_HOME=$(BR_CARGO_HOME)
>  
>  # __CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS is needed to allow
>  # passing the -Z target-applies-to-host, which is needed together with
> @@ -79,7 +81,7 @@ $(2)_DOWNLOAD_DEPENDENCIES += host-rustc
>  $(2)_DEPENDENCIES += host-rustc
>  
>  $(2)_DOWNLOAD_POST_PROCESS = cargo
> -$(2)_DL_ENV += CARGO_HOME=$$(HOST_DIR)/share/cargo
> +$(2)_DL_ENV += CARGO_HOME=$$(BR_CARGO_HOME)
>  
>  # If building in a sub directory, use that to find the Cargo.toml
>  ifneq ($$($(2)_SUBDIR),)
> diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
> index 8c38b7c713..72b72cc94d 100644
> --- a/package/suricata/suricata.mk
> +++ b/package/suricata/suricata.mk
> @@ -29,7 +29,7 @@ SURICATA_DEPENDENCIES = \
>  
>  SURICATA_CONF_ENV = \
>  	ac_cv_path_HAVE_SPHINXBUILD=no \
> -	CARGO_HOME=$(HOST_DIR)/share/cargo \
> +	CARGO_HOME=$(BR_CARGO_HOME) \
>  	RUST_TARGET=$(RUSTC_TARGET_NAME)
>  
>  SURICATA_CONF_OPTS = \
> -- 
> 2.38.1
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
