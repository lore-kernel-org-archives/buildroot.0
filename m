Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E786EC25B08
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 17:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F095606FF;
	Sat, 20 Aug 2022 17:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F095606FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Jtk8I_RMyMk; Sat, 20 Aug 2022 17:33:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ACAB60615;
	Sat, 20 Aug 2022 17:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ACAB60615
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2CD9C1BF2B7
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 17:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 126A040A59
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 17:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 126A040A59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qymOTUEKzX0I for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 17:33:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F86C402F3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F86C402F3
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 17:33:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:18c4:2559:c4a2:6528])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 5C1E960130;
 Sat, 20 Aug 2022 19:33:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 20 Aug 2022 19:33:42 +0200
Date: Sat, 20 Aug 2022 19:33:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Pierre-Jean Texier <texier.pj2@gmail.com>
Message-ID: <20220820173342.GN2167049@scaer>
References: <20220817205823.47256-1-texier.pj2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220817205823.47256-1-texier.pj2@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661016824;
 bh=NdtOQSOQloZhzqif/xE2iC2xmTXfDvO1xuIbqtFfHkI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ASANO3Caz7ofr2RiNAfZGAKtPdMxbpzl/uroCdijQlqtZw6lMB/TV9m0uAQItTAZE
 VIWEpmpHpfyVPJKWIAUgYi5yISWpii1sM/kJ+jI5k9UUMRwrfQlMTkf2vvL8K5iOV3
 0Lw+DMjyM52esXvyr+YfM54nss84PFjG9qRfdk5RLCUtsI0z/oAkJlTeGoYadIR5C4
 adDjipld2HNfFmqQDO/93L5dOTUlHxOoY26suESCYPesR5zvlHwyB0IK1wUYzEOQ4U
 QdBXWScThOyI5m2+aR/BKFEstGirR01Zq0T3G0N2KqqRaUlG8gb8lLp6NhFHo4dKfh
 N7+/L3ofoxRLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ASANO3Ca
Subject: Re: [Buildroot] [PATCH] package/stunnel: bump to version 5.65
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

Pierre-Jean, All,

On 2022-08-17 22:58 +0200, Pierre-Jean Texier spake thusly:
> Update COPYING hash; copyright year update:
> 
> -_Copyright (C) 1998-2021 Michal Trojnara_
> +_Copyright (C) 1998-2022 Michal Trojnara_
> 
> See full changelog https://www.stunnel.org/NEWS.html
> 
> Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/stunnel/stunnel.hash | 6 +++---
>  package/stunnel/stunnel.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
> index b8cc62be13..19633b3c18 100644
> --- a/package/stunnel/stunnel.hash
> +++ b/package/stunnel/stunnel.hash
> @@ -1,5 +1,5 @@
> -# From https://www.stunnel.org/downloads/stunnel-5.60.tar.gz.sha256
> -sha256  c45d765b1521861fea9b03b425b9dd7d48b3055128c0aec673bba5ef9b8f787d  stunnel-5.60.tar.gz
> +# From https://www.stunnel.org/downloads/stunnel-5.65.tar.gz.sha256
> +sha256  60c500063bd1feff2877f5726e38278c086f96c178f03f09d264a2012d6bf7fc  stunnel-5.65.tar.gz
>  # Locally calculated
> -sha256  28b55d0157efd5ceb63640faeebb50fda13b1f49aec0b9c1240b9a3ea9f0eb4c  COPYING.md
> +sha256  f10bcd7ee7b722dce40c9c674761ddb37e7e29a76a6e413e961cd52e361c5d7a  COPYING.md
>  sha256  62f171d4d8b6726df61f18a6bbc0a70f79c4bc2134d837d35c81fc6289a2d84d  COPYRIGHT.md
> diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
> index cc56eb39a8..95a1530eb8 100644
> --- a/package/stunnel/stunnel.mk
> +++ b/package/stunnel/stunnel.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  STUNNEL_VERSION_MAJOR = 5
> -STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).60
> +STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).65
>  STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
>  STUNNEL_DEPENDENCIES = host-pkgconf openssl
>  STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
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
