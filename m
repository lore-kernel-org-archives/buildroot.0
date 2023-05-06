Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829BAC77B75
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 16:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B9D84204F;
	Sat,  6 May 2023 16:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B9D84204F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P8vLvOz0vyNo; Sat,  6 May 2023 16:13:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD38941800;
	Sat,  6 May 2023 16:13:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD38941800
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 178A21BF36A
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5AF240102
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:10:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5AF240102
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SpPqeYnbaqmq for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 16:10:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E20B401B7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E20B401B7
 for <buildroot@buildroot.org>; Sat,  6 May 2023 16:10:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 545DCB0051E;
 Sat,  6 May 2023 18:10:36 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 18:10:36 +0200
Date: Sat, 6 May 2023 18:10:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <20230506161036.GQ252090@scaer>
References: <20230504002506.1463712-1-christian@aperture.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504002506.1463712-1-christian@aperture.us>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683389439;
 bh=5SIja9ascqnfnmtp6rXW7UjMrs/yWiS4bCamill1sjs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=COvkt0XD0hxe2/L0PMZym/a/npSuMfFLc88jQs8SY+1Fm4hI90Ah0NQwkiQt8oGLa
 pyt/4aNt7cpf/zO0roI75gTxZY2ied7FlNG36x6z/gBBRENb+IQCQbGtHR6IIKmyR+
 SgZ0o7JaCGSqYh5ydqpAfAoj/8NUfc3L4XTzNmTnQL0uRGK4zGbAbIHS2yuMCf6I8x
 kIEJdzJITcKRrRWaqEWC2BnPlSCCEXX9wUOct1A5KzB2LHFmc0kITuzd4LzFJvbmp/
 KLxDMWKu6VgZyQzKQUsUIpJEurqb+z3E65JTh9J9ho/8Ebug+NeOGBmefUgOXeHvxq
 ++95ffymTp1rA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=COvkt0XD
Subject: Re: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump version
 to 2.17.3
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

christian, All,

On 2023-05-03 17:25 -0700, Christian Stewart via buildroot spake thusly:
> https://github.com/docker/compose/releases/tag/v2.17.3
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/docker-compose/docker-compose.hash | 2 +-
>  package/docker-compose/docker-compose.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
> index 2c924d5080..4fe6d73139 100644
> --- a/package/docker-compose/docker-compose.hash
> +++ b/package/docker-compose/docker-compose.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  346571ca487bf3f4b3dc9caeadc88a645354b0e098fa60f350249ec35ab3f240  docker-compose-2.15.1.tar.gz
> +sha256  3a777f6442db77447919cc7006d8b9439c95cc61c04acad4039e0120a8e591ea  docker-compose-2.17.3.tar.gz
>  sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
> diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
> index 3bced8bb7b..09f611e185 100644
> --- a/package/docker-compose/docker-compose.mk
> +++ b/package/docker-compose/docker-compose.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DOCKER_COMPOSE_VERSION = 2.15.1
> +DOCKER_COMPOSE_VERSION = 2.17.3
>  DOCKER_COMPOSE_SITE = $(call github,docker,compose,v$(DOCKER_COMPOSE_VERSION))
>  DOCKER_COMPOSE_LICENSE = Apache-2.0
>  DOCKER_COMPOSE_LICENSE_FILES = LICENSE
> -- 
> 2.40.1
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
