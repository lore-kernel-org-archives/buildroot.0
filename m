Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F22C7EE22
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 12:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EED9241ECB;
	Sun, 14 May 2023 12:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EED9241ECB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3H7lR7TnCcOa; Sun, 14 May 2023 12:25:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA6C141F0D;
	Sun, 14 May 2023 12:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA6C141F0D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 37C011BF48B
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 12:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 102B541EFD
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 12:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 102B541EFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l3Jg5-Hym9TN for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 12:25:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9D2241ECB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9D2241ECB
 for <buildroot@buildroot.org>; Sun, 14 May 2023 12:25:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e91d:2912:5826:9d75])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 200B6B0053E
 for <buildroot@buildroot.org>; Sun, 14 May 2023 14:25:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 May 2023 14:25:41 +0200
Date: Sun, 14 May 2023 14:25:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20230514122541.GW2582048@scaer>
References: <20230513185057.2733187-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230513185057.2733187-1-yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684067143;
 bh=6nTTXxpVuFcvOFClE1JtvzYFiBa/Uxrvbeg5DHqLgk4=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=iJ1NmIcvLQ3BP9o2Qc6vshIUhHEh7kZiMf4DuCoef/tHjgJWgDj9J4/P6HsEYeoZ5
 kzEh2z8mBO2mFSuMw4IFhWVXdRLW4T7WsiKjLv4kuhuWNAAALE1gkBA2AJtKaEDjt/
 spwaHN9vkCZQgDo/dyXYNNgVIbMur4ZQWfFkFCXFPPDuWu9gVyHJSnmsumvujdJH11
 cGVz0GVofbATCiy4x2OFv9HbSo2wAO1CG3D5A2WssnZ2bmaEo1v/mM1vGUWunqfoXP
 fs4qsjmI8MXARlPz9/jAIx6c4Qtca9Pp0RKoOGnMNVpFho+q+CEV1wjGigBJDrUXv7
 qffoE9D+wAV8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iJ1NmIcv
Subject: Re: [Buildroot] [PATCH] package/tzdata: bump version to 2023c
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

On 2023-05-13 20:50 +0200, Yann E. MORIN spake thusly:
> tzdata and tzcode (for zic) are released in lock-step, as they go
> together, so we update both simultaneously.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/tzdata/tzdata.hash | 2 +-
>  package/tzdata/tzdata.mk   | 2 +-
>  package/zic/zic.hash       | 2 +-
>  package/zic/zic.mk         | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
> index aadd320063..3422655a71 100644
> --- a/package/tzdata/tzdata.hash
> +++ b/package/tzdata/tzdata.hash
> @@ -1,4 +1,4 @@
>  # From https://mm.icann.org/pipermail/tz-announce/2022-October/000075.html
> -sha512  72d05d05be999075cdf57b896c0f4238b1b862d4d0ed92cc611736592a4ada14d47bd7f0fc8be39e7938a7f5940a903c8af41e87859482bcfab787d889d429f6  tzdata2022f.tar.gz
> +sha512  608bd286ebcbd0004cfdc1da183273f08aff61f90c8867661154453d77a05d421e4c46ad6d066a1fe2e87d5c82ec0f1c0224667a3b35f3180a3eb7f6ff84cbf5  tzdata2023c.tar.gz
>  # Locally computed:
>  sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
> diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
> index 45bd7cf6e6..08f3c83bd1 100644
> --- a/package/tzdata/tzdata.mk
> +++ b/package/tzdata/tzdata.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TZDATA_VERSION = 2022f
> +TZDATA_VERSION = 2023c
>  TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
>  TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
>  TZDATA_STRIP_COMPONENTS = 0
> diff --git a/package/zic/zic.hash b/package/zic/zic.hash
> index 40f68f0299..6a7f9f2f94 100644
> --- a/package/zic/zic.hash
> +++ b/package/zic/zic.hash
> @@ -1,4 +1,4 @@
>  # From https://mm.icann.org/pipermail/tz-announce/2022-October/000075.html
> -sha512  3e2ef91b972f1872e3e8da9eae9d1c4638bfdb32600f164484edd7147be45a116db80443cd5ae61b5c34f8b841e4362f4beefd957633f6cc9b7def543ed6752b  tzcode2022f.tar.gz
> +sha512  fa18bae9c0e7c061bc9d5f5f2eb9967f0e4ddb2baafdee9887fa30cd0c60f4aa6f21eacffb17df0d59d26ff54d08c5dcefa98159309eba497e86443624913a82  tzcode2023c.tar.gz
>  # Locally computed:
>  sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
> diff --git a/package/zic/zic.mk b/package/zic/zic.mk
> index 229afaadc2..a915f6d256 100644
> --- a/package/zic/zic.mk
> +++ b/package/zic/zic.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ZIC_VERSION = 2022f
> +ZIC_VERSION = 2023c
>  ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
>  ZIC_SITE = https://www.iana.org/time-zones/repository/releases
>  ZIC_STRIP_COMPONENTS = 0
> -- 
> 2.25.1
> 

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
