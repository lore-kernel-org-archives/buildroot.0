Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46650C77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 15:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E729D81951;
	Sat,  6 May 2023 15:36:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E729D81951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1CtWZBTShvxU; Sat,  6 May 2023 15:36:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1700081444;
	Sat,  6 May 2023 15:36:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1700081444
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED4F91BF36C
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C674940A86
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:36:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C674940A86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6AjdItwfHIuD for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 15:36:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1DDE401B7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1DDE401B7
 for <buildroot@buildroot.org>; Sat,  6 May 2023 15:36:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1E77BB005AB;
 Sat,  6 May 2023 17:36:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 17:36:48 +0200
Date: Sat, 6 May 2023 17:36:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230506153648.GH252090@scaer>
References: <20230505192743.6844-1-dalang@gmx.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230505192743.6844-1-dalang@gmx.at>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683387411;
 bh=KzeShcUPawDc/Ci0qQCRFAB7eeITC0VVg/cI90GOuKU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ukQyTQ/HFa9Z6OvAj1qJfJBrcHKpV+idmxZkaz/4PP794LbSGkZZYYpyOflNYJXs/
 XwpEZd8GlIqKGq3rtigb5nOgrCaJaeDeXQ4DHpjETwx0zYYYtgym8N+DZRsv2Qm8s2
 KajyS//jNSSdX+3dC6GVsDWRDzNmlYh215KBB/PCI5EMCYjtl7Kdtjbu0EqjbV9y0x
 /3iHqC5uuoY/DpD/Z1BXeMTESZNeMu7HKlbsi8tSi293pNZfnPv/yJle+h4qf4wbQX
 gRqDI4dNlVZI0ImvbgsPP2NCKVCVa1tJkLB0h3JWeO4P+lz7z9hBbmd/7ykJG2ghGv
 MZDMD8BUahw0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ukQyTQ/H
Subject: Re: [Buildroot] [PATCH] package/ncurses: security bump to
 6.4.20230429
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

Daniel, All,

On 2023-05-05 21:27 +0200, Daniel Lang spake thusly:
> Update to 6.4 and use latest snapshot to fix CVE-2023-29491.
> COPYING has been changed in snapshot 20230107 to update the year [0].
> Update CVE version to major.minor.snapshot, as NVD uses the snapshot date as patch version [1].

Nice! :-)

> [0]: https://github.com/ThomasDickey/ncurses-snapshots/commit/eedb756850fdddcd2767d488ed5ea323d40b37ec
> [1]: https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:gnu:ncurses
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ncurses/ncurses.hash | 4 ++--
>  package/ncurses/ncurses.mk   | 9 +++------
>  2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/package/ncurses/ncurses.hash b/package/ncurses/ncurses.hash
> index c96bf77bce..a5f83c8725 100644
> --- a/package/ncurses/ncurses.hash
> +++ b/package/ncurses/ncurses.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  4057d800ee96623ae70d06b05b2dadb481a80c030e4968aa5d9bcea4439441da  ncurses-6.3-20221224.tar.gz
> +sha256  004603a9b3ec51599ef0a0089482004ee3d33b0240d87ce17b6f77525b51fb4e  ncurses-6.4-20230429.tar.gz
>  # Locally computed
> -sha256  63de87399e9fc8860236082b6b0520e068e9eb1fad0ebd30202aa30bb6f690ac  COPYING
> +sha256  0413b2f4ea863194c174673032f0fca84f1ea1ed4eed6476baea68c075a631ce  COPYING
> diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
> index 73e3c3feb8..4753da299c 100644
> --- a/package/ncurses/ncurses.mk
> +++ b/package/ncurses/ncurses.mk
> @@ -5,8 +5,8 @@
>  ################################################################################
>  
>  # When there is no snapshost yet for a new version, set it to the empty string
> -NCURSES_VERSION_MAJOR = 6.3
> -NCURSES_SNAPSHOT_DATE = 20221224
> +NCURSES_VERSION_MAJOR = 6.4
> +NCURSES_SNAPSHOT_DATE = 20230429
>  NCURSES_VERSION = $(NCURSES_VERSION_MAJOR)$(if $(NCURSES_SNAPSHOT_DATE),-$(NCURSES_SNAPSHOT_DATE))
>  NCURSES_VERSION_GIT = $(subst .,_,$(subst -,_,$(NCURSES_VERSION)))
>  NCURSES_SITE = $(call github,ThomasDickey,ncurses-snapshots,v$(NCURSES_VERSION_GIT))
> @@ -15,12 +15,9 @@ NCURSES_DEPENDENCIES = host-ncurses
>  NCURSES_LICENSE = MIT with advertising clause
>  NCURSES_LICENSE_FILES = COPYING
>  NCURSES_CPE_ID_VENDOR = gnu
> -NCURSES_CPE_ID_VERSION = $(NCURSES_VERSION_MAJOR)
> +NCURSES_CPE_ID_VERSION = $(NCURSES_VERSION_MAJOR)$(if $(NCURSES_SNAPSHOT_DATE),.$(NCURSES_SNAPSHOT_DATE))
>  NCURSES_CONFIG_SCRIPTS = ncurses$(NCURSES_LIB_SUFFIX)6-config
>  
> -# Fixed since snapshot 20220416
> -NCURSES_IGNORE_CVES += CVE-2022-29458
> -
>  NCURSES_CONF_OPTS = \
>  	--without-cxx \
>  	--without-cxx-binding \
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
