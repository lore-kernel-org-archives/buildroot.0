Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29CDC4321E
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 17:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D6FA4097F;
	Sun,  4 Dec 2022 17:36:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D6FA4097F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QFWEyczYMvbt; Sun,  4 Dec 2022 17:36:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16A7C40994;
	Sun,  4 Dec 2022 17:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16A7C40994
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 30A431BF2F5
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 17:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BF0081348
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 17:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BF0081348
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id shWFUDPJkH8Q for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 17:36:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07A1981343
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07A1981343
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 17:36:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d5da:276a:18d1:4753])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 7DACD200410;
 Sun,  4 Dec 2022 18:36:12 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Dec 2022 18:36:12 +0100
Date: Sun, 4 Dec 2022 18:36:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Patrick Gerber <pge@ik.me>
Message-ID: <20221204173612.GB2855@scaer>
References: <20221204140643.893075-1-pge@ik.me>
 <20221204140643.893075-2-pge@ik.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221204140643.893075-2-pge@ik.me>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670175374;
 bh=9PunCcVBRonLnWgHowa+r3RTVmoiGyh8RxP4UMqbGF8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ueoV1FnWDxG8ROAW/AgjmfZ/dJju38/rM1nBCYDe9mgU5ESOMCzM/uimI/rI+q0HE
 +qOI8xplxTRxkVFXAQ6+eU6hWJFvWGEi/8RmfMAAJqhWhNcGq0AKcOzEfjrRO+BynZ
 EKDp8zj90B/Z8g56dSent6BM877q13zTDf/o/+xE0bNXoz+Wy1iFD3cZU1bGPHxN7g
 QbY6b1BRjrF9oFTkop3wv7YrFhpJgBdL+V6bl5F+xWBn4hqr/NmrQfJgshOO76MgpS
 zdSBBG4vO8/E9XGHMBPFmnQHuzUxUbAUyDywSG4eG0ZL+saTpT/2P4yBM/MRkXD1AK
 FLQQY0PFoiK0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ueoV1FnW
Subject: Re: [Buildroot] [PATCH 2/2] package/mender-artifact: remove
 unnecessary GO_ENV
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

Patrick, All,

On 2022-12-04 15:06 +0100, Patrick Gerber via buildroot spake thusly:
> All go packages are built with:
> GOFLAGS="-mod=vendor"
> (see HOST_GO_COMMON_ENV in go/go.mk)
> 
> Signed-off-by: Patrick Gerber <pge@ik.me>

I slightly extended the commit log to explain why mender-artifacts had
that settings to begin with and applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mender-artifact/mender-artifact.mk | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
> index 1031166f34..6ade624a23 100644
> --- a/package/mender-artifact/mender-artifact.mk
> +++ b/package/mender-artifact/mender-artifact.mk
> @@ -86,14 +86,6 @@ HOST_MENDER_ARTIFACT_LICENSE_FILES = \
>  
>  HOST_MENDER_ARTIFACT_DEPENDENCIES = host-xz
>  
> -# By default, go will attempt to download needed modules before building, which
> -# is not desirable. This behavior also causes permission issues when cleaning,
> -# as go downloads modules as read-only by default. Because mender-artifact
> -# includes the modules in the vendor directory, mod=vendor prevents the package
> -# from downloading the go modules during the build process and prevents
> -# permission issues when cleaning.
> -HOST_MENDER_ARTIFACT_GO_ENV = GOFLAGS="-mod=vendor"
> -
>  HOST_MENDER_ARTIFACT_LDFLAGS = -X github.com/mendersoftware/mender-artifact/cli.Version=$(HOST_MENDER_ARTIFACT_VERSION)
>  
>  HOST_MENDER_ARTIFACT_BIN_NAME = mender-artifact
> -- 
> 2.25.1
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
