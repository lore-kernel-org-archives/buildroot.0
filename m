Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CABC77B7F
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 15:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C80BC82010;
	Sat,  6 May 2023 15:35:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C80BC82010
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2-LSoOS3YmjB; Sat,  6 May 2023 15:35:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C88C08142A;
	Sat,  6 May 2023 15:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C88C08142A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E5541BF36C
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52F6E41EDA
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52F6E41EDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sYw0EJbg-kjz for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 15:34:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F325E4185A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F325E4185A
 for <buildroot@buildroot.org>; Sat,  6 May 2023 15:34:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id F23EFB00576;
 Sat,  6 May 2023 17:34:52 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 17:34:52 +0200
Date: Sat, 6 May 2023 17:34:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230506153452.GE252090@scaer>
References: <20230506134744.32382-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230506134744.32382-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683387296;
 bh=WMW6ZqUBV2U6jTkzBi1emssjhV4abt5NgZAWcW/ZMwc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DsuJEmgmx1IdDjfaaehJ+St+a+VP70Jx9dVrWUKMC3DpqVLXEryPmpOtcOa/LnHZu
 7bpDRJg+JDjEsOiVES3uZmDZDait11dyhxNfQiiWkOF8t/up9LLCFFZf5PVsWiFL0i
 GVhVXmAmU2qCvUZyxg56n19/VlR6DT6dseMKJzfPPSkRs03S2hSELZj4Dz3pGmnQcP
 9x7o0mgs0LgSW0trgUiThXDn0XSMAnEJih1SayQpaS4TxWNxe+oDjCFiI+sfAtvIRy
 RjIGMvDvurDYivvuDjhdNTbykfFg0GGAk0uXDOVw79Cpa9xjcvCwGNn0YTsGLtkicz
 6DGNIxfaal4tg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DsuJEmgm
Subject: Re: [Buildroot] [PATCH 1/1] package/flatbuffers: bump version to
 23.3.3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2023-05-06 15:47 +0200, Bernd Kuhls spake thusly:
> Changelog:
> https://github.com/google/flatbuffers/blob/master/CHANGELOG.md
> 
> Follow upstream rename of license file:
> https://github.com/google/flatbuffers/commit/7fb785fd898a5379944457a399176235fc80d337
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/flatbuffers/flatbuffers.hash | 4 ++--
>  package/flatbuffers/flatbuffers.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/flatbuffers/flatbuffers.hash b/package/flatbuffers/flatbuffers.hash
> index 6382b86f1b..2ff56a8b76 100644
> --- a/package/flatbuffers/flatbuffers.hash
> +++ b/package/flatbuffers/flatbuffers.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  f97965a727d26386afaefff950badef2db3ab6af9afe23ed6d94bfb65f95f37e  flatbuffers-2.0.8.tar.gz
> -sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
> +sha256  8aff985da30aaab37edf8e5b02fda33ed4cbdd962699a8e2af98fdef306f4e4d  flatbuffers-23.3.3.tar.gz
> +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
> index 487d85ee1f..58c0414533 100644
> --- a/package/flatbuffers/flatbuffers.mk
> +++ b/package/flatbuffers/flatbuffers.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -FLATBUFFERS_VERSION = 2.0.8
> +FLATBUFFERS_VERSION = 23.3.3
>  FLATBUFFERS_SITE = $(call github,google,flatbuffers,v$(FLATBUFFERS_VERSION))
>  FLATBUFFERS_LICENSE = Apache-2.0
> -FLATBUFFERS_LICENSE_FILES = LICENSE.txt
> +FLATBUFFERS_LICENSE_FILES = LICENSE
>  FLATBUFFERS_CPE_ID_VENDOR = google
>  FLATBUFFERS_INSTALL_STAGING = YES
>  FLATBUFFERS_DEPENDENCIES = host-flatbuffers
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
