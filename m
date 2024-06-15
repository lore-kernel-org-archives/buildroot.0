Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C93C27C7B
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 16:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 802A940727;
	Sat, 15 Jun 2024 16:13:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJq6ThtBy14Q; Sat, 15 Jun 2024 16:13:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EE2E40734
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EE2E40734;
	Sat, 15 Jun 2024 16:13:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7EC9B1BF300
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 16:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68492404B3
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 16:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ylRtdOL_4GRV for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 16:13:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0AD6F40103
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AD6F40103
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0AD6F40103
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 16:13:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id F07F313F880
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 18:13:16 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jun 2024 18:13:16 +0200
Date: Sat, 15 Jun 2024 18:13:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <Zm29nI_2C5olH70z@landeda>
References: <cover.1718382114.git.yann.morin.1998@free.fr>
 <9e97f8655ad7d22ce0b8fe35c1096fbefab528ee.1718382114.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e97f8655ad7d22ce0b8fe35c1096fbefab528ee.1718382114.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718467998;
 bh=seu9/OIGkXyBY0mg1JTkcbbzv69b819NJwxF8G+3Jn8=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=CRYc8NSVdoJvuzMbpxi6WlSfWmlcSdFgV/f6EtJcPxii9PpltIZAj2nXger9IRhY6
 0dkYChSSkVP94eX3gZ7ijpuEKSsy7S/e6i3v+R4dzUZXTuG9Du+PzqhAPZ/htCGcip
 MC8pBV9jhyGSttxGen6KTmypieP6JRTYqdB9RJG3IijQG29H2Dv0/YSjbm5aUGTmsJ
 EtIBIsfmbz4ZdpCAo7sqrJlI2LcKk0KIO/U46zAusBAR86Vlz2hZdo5QvrzE+KbHiK
 k84wcx5QPAeTUKWSt9j/IvbzC8aqzlXIJtZEDu3EiG6AysEsXZkbfEhwzpyxW3HuZt
 wam0bYTAZdgHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CRYc8NSV
Subject: Re: [Buildroot] [PATCH 1/6] package/sentry-cli: needs pkgconf and
 openssl
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2024-06-14 18:21 +0200, Yann E. MORIN spake thusly:
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sentry-cli/sentry-cli.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/sentry-cli/sentry-cli.mk b/package/sentry-cli/sentry-cli.mk
> index df419f81e1..3ddf5e44fc 100644
> --- a/package/sentry-cli/sentry-cli.mk
> +++ b/package/sentry-cli/sentry-cli.mk
> @@ -9,6 +9,6 @@ SENTRY_CLI_SITE = $(call github,getsentry,sentry-cli,$(SENTRY_CLI_VERSION))
>  SENTRY_CLI_LICENSE = BSD-3-clause
>  SENTRY_CLI_LICENSE_FILES = LICENSE
>  
> -HOST_SENTRY_CLI_DEPENDENCIES = host-zlib
> +HOST_SENTRY_CLI_DEPENDENCIES = host-pkgconf host-openssl host-zlib
>  
>  $(eval $(host-cargo-package))
> -- 
> 2.45.1
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
