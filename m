Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA02C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 10:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D77A405A6;
	Sat, 15 Jan 2022 10:24:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G1Tio7HmbmTg; Sat, 15 Jan 2022 10:24:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B216404CA;
	Sat, 15 Jan 2022 10:24:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D49971BF5DD
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D16D960ECB
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:24:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TmUHsBxBr8-H for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 10:24:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B572560BFA
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 10:24:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:edb9:18:17ad:29d4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id D5CE819F5B0;
 Sat, 15 Jan 2022 11:24:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642242260;
 bh=Qy9yNAHr2FJEx5LnDscudRNmOvU7sPAZB7ZY8P6L+vs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dlRITgkq5VcLwXvZYH8mJfTfqBiTKac++/ghSrMnthwPRnkWht/cVcvX5LFZtE0bD
 pizVikHbMQEZEQA4xZCfGl5TT+EwrREoxWeVDjFx9xXtJXYGvorq3+lvQl0yzL1Fk7
 vgUQsIG+IioXflneUFBMm1M1I3QHS7Tff4WkNPhNiQdlfLcoyF0ktICp2MwH4Yx0AT
 vug/vEmjR24Jg1maxXbPxwG+Rg1IrVYzn32lal/oIi4XcwnCWb1huuDTuZuG+nm8kQ
 QkR01EQ4ms56JeKRk82IYrv4zHOlnNdGQZ0w2uLRLT1r/W5LZTcLcBV21iP3HMBOAR
 UIZ7CgprssFlA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jan 2022 11:24:15 +0100
Date: Sat, 15 Jan 2022 11:24:15 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220115102415.GJ1945846@scaer>
References: <20220114210652.1057109-1-fontaine.fabrice@gmail.com>
 <20220114210652.1057109-3-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220114210652.1057109-3-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 3/3] package/targetcli-fb: security bump to
 version 2.1.54
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-01-14 22:06 +0100, Fabrice Fontaine spake thusly:
> Fix CVE-2020-13867: Open-iSCSI targetcli-fb through 2.1.52 has weak
> permissions for /etc/target (and for the backup directory and backup
> files).
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Series of 3 patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/targetcli-fb/targetcli-fb.hash | 2 +-
>  package/targetcli-fb/targetcli-fb.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/targetcli-fb/targetcli-fb.hash b/package/targetcli-fb/targetcli-fb.hash
> index 207c38e046..64f68a6675 100644
> --- a/package/targetcli-fb/targetcli-fb.hash
> +++ b/package/targetcli-fb/targetcli-fb.hash
> @@ -1,3 +1,3 @@
>  # locally computed
> -sha256  0f32ab6f3ecd234280d55be5e89ce2b3a02f9c82c8dccaae66e26464cff8901a  targetcli-fb-2.1.fb41.tar.gz
> +sha256  7ae4120a54f24b13263b4b85c43952a03546f8b9fc9bd15fe87678f68245a33f  targetcli-fb-2.1.54.tar.gz
>  sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  COPYING
> diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
> index 7425423b8f..c6ca776b27 100644
> --- a/package/targetcli-fb/targetcli-fb.mk
> +++ b/package/targetcli-fb/targetcli-fb.mk
> @@ -6,7 +6,7 @@
>  
>  # When upgrading the version, be sure to also upgrade python-rtslib-fb
>  # and python-configshell-fb at the same time.
> -TARGETCLI_FB_VERSION = 2.1.fb41
> +TARGETCLI_FB_VERSION = 2.1.54
>  TARGETCLI_FB_SITE = $(call github,open-iscsi,targetcli-fb,v$(TARGETCLI_FB_VERSION))
>  TARGETCLI_FB_LICENSE = Apache-2.0
>  TARGETCLI_FB_LICENSE_FILES = COPYING
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
