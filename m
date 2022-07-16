Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DD8C43334
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 15:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 642CD848E1;
	Sat, 16 Jul 2022 15:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 642CD848E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AjMGUIH66Y67; Sat, 16 Jul 2022 15:38:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D8A1848D9;
	Sat, 16 Jul 2022 15:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D8A1848D9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 476011BF4DA
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 15:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 214F7410A9
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 15:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 214F7410A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wmY-DUhkHXcp for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 15:37:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAAAF408FB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BAAAF408FB
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 15:37:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b44d:f503:4d93:3115])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 928E8B00727;
 Sat, 16 Jul 2022 17:37:37 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Jul 2022 17:37:37 +0200
Date: Sat, 16 Jul 2022 17:37:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220716153737.GF2543@scaer>
References: <20220712181443.1650438-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220712181443.1650438-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1657985859;
 bh=bc7cZ4nY0Ac7HrGFmXkUUknpV+7b0LuKYQ7aDCfDbMg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eCu8dcNhyC1O/tcGcIUIuOf+h9P+J0d5u81hqgty+L56NcVhPRBsTMa3dCqPNu1om
 Wg/sHltvQeUR0+NAp/A0Gs35JQkYSFv4nYrMrev8ztVVLfmRbVPTo41CEG+Pan862/
 fs6FVwYe2ScfvSToUErgte3BBbQoXoIc9ATg7GvrQv/GZvur5A23kS3ItKK2CwsL6L
 QvXHiFLvjCJNUwVqZOoOFp31/zOBlXSLmzvVgtti3vvwKZK1daPsO4sd9AzMQsECRt
 LiFytFuCJDdKKEq463AQs5XoSDL06UU/J3GWKzgoPjSp/TwxTBiHse5LV8p/OOb9f2
 fFgfhtk1zp23w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eCu8dcNh
Subject: Re: [Buildroot] [PATCH 1/1] package/suricata: security bump to
 version 6.0.6
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

Fabrice, All

On 2022-07-12 20:14 +0200, Fabrice Fontaine spake thusly:
> Various security, performance, accuracy, and stability issues have been
> fixed.
> 
> https://forum.suricata.io/t/suricata-6-0-6-and-5-0-10-released
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/suricata/suricata.hash | 2 +-
>  package/suricata/suricata.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
> index 032546fd92..38ab5e9cd3 100644
> --- a/package/suricata/suricata.hash
> +++ b/package/suricata/suricata.hash
> @@ -1,5 +1,5 @@
>  # Locally computed:
> -sha256  0d4197047c84ba070dfc6b1d9f9ee92f52a71403bfac0e29b2554bb21fe00754  suricata-6.0.5.tar.gz
> +sha256  00173634fa76aee636e38a90b1c02616c903e42173107d47b4114960b5fbe839  suricata-6.0.6.tar.gz
>  
>  # Hash for license files:
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
> index 36e641bf90..8c38b7c713 100644
> --- a/package/suricata/suricata.mk
> +++ b/package/suricata/suricata.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SURICATA_VERSION = 6.0.5
> +SURICATA_VERSION = 6.0.6
>  SURICATA_SITE = https://www.openinfosecfoundation.org/download
>  SURICATA_LICENSE = GPL-2.0
>  SURICATA_LICENSE_FILES = COPYING LICENSE
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
