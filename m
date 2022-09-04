Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC59C54EE9
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 19:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5DB3813D8;
	Sun,  4 Sep 2022 19:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5DB3813D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9HtWEkITDNjS; Sun,  4 Sep 2022 19:41:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A90ED81348;
	Sun,  4 Sep 2022 19:41:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A90ED81348
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A1C4C1BF303
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 19:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7973560F35
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 19:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7973560F35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7NFEPT9kCq_X for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 19:41:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2702260776
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2702260776
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 19:41:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a5dc:9bd4:48b0:8ef0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6257DB0054E;
 Sun,  4 Sep 2022 21:41:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Sep 2022 21:41:38 +0200
Date: Sun, 4 Sep 2022 21:41:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20220904194138.GA1490660@scaer>
References: <20220904191010.200822-1-christian@paral.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220904191010.200822-1-christian@paral.in>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662320501;
 bh=1BWOzNmY8/pEMWoxhaEwSXNzIJ2WKAHLDfTpHfd8HeQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XZCZf8h+jYtlslDRvpJ0/7XAZRRkF9sACL6ChRwmyT3pO7MhuDcer2bf/+uekK3oD
 QnT/D4onnHPuBoc7VpFIek6AG0yFWQ2bX0aQuWkj7+gHhJEW3uNlFTvhqVW03Kc3hO
 xXj6GmfqVfWdKQfkdrBf8CkwZNRnw/5WQuvDLSjp4XqmJ1n9vzG4ljbi5HTJxARsRy
 bmYsNJA2wwxrbgoVfVNFv9z1xung/gYVM7DupMFvHh/OOuBMG/wQYyOEYIERJZ5Edq
 mNd4+pXlWrGPmUBHIMuK9c2E37KYupcK2gVkG0kcnBHH97CdUVziq63Z99dF4F1jn7
 G2Z29mKJ17gnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XZCZf8h+
Subject: Re: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump to
 version 2.10.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2022-09-04 12:10 -0700, Christian Stewart via buildroot spake thusly:
> Docker Compose v2 is a CLI plugin loaded by docker-cli.

So, if it is a plugin for docker-cli...

[--SNIP--]
> diff --git a/package/docker-compose/Config.in b/package/docker-compose/Config.in
> index f82a0c4bc2..bac8dff30d 100644
> --- a/package/docker-compose/Config.in
> +++ b/package/docker-compose/Config.in
> @@ -1,30 +1,15 @@
>  config BR2_PACKAGE_DOCKER_COMPOSE
>  	bool "docker-compose"
[--SNIP--]
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_DOCKER_CLI

... then it should depend on it instead, no?

Indeed, the "main" program is docker-cli. Installing plugins for it does
not make sense unless it is first enabled.

That's what we do, for example, for nginx and its plugins.

Regards,
Yann E. MORIN.

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
