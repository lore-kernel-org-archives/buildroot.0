Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364A0C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 21:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E66B0400E9;
	Sat,  4 Dec 2021 21:40:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hQldipr7PHks; Sat,  4 Dec 2021 21:40:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6B4E40156;
	Sat,  4 Dec 2021 21:40:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A39CC1BF36B
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92A6360659
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:40:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fcoO470BDd9n for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 21:40:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC71360622
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 21:40:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:44c6:1f1c:4326:e15f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D0E2B5FF88;
 Sat,  4 Dec 2021 22:40:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1638654025;
 bh=CMh33P+zQzMLmf3/G2HakumBYTDWL/zQZ0jnuUBVjjA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aGc3TRMYG/NLGJ7/1Ic8ghvlNSGcrxerwoheB92c0qbgx1l5tU2MCSiPvbHrbVekN
 +20zWFhz75K/z2hgci8+mteT/V5gQ9KKFxPSxjlJGaHmiVUsG2cFaECKKQIOy8F+G/
 FAhaBy+KMk/ptBtblxwG9u0Y9a/2L1UGZYjNILpOQ034BusBqujv6ndqHl9uqwZP57
 JXohpsPb+E6HMIDAzThm6BZZyT6DXSDMFB/i/vM0cPTbjgPqIEeTnRNevh00faM8o2
 q0So3oCv8YhPmhhbKTUAj37nWCsraagxr0ytN8P/EqY0B0oDuSzeD3jmT+oDQN7X0R
 z9zVAkCW8svPA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Dec 2021 22:40:21 +0100
Date: Sat, 4 Dec 2021 22:40:21 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211204214021.GG472627@scaer>
References: <20211204213339.2019845-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211204213339.2019845-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/unrar: add UNRAR_CPE_ID_VENDOR
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

Fabrice, All,

On 2021-12-04 22:33 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:rarlab:unrar is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ararlab%3Aunrar
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/unrar/unrar.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
> index ab8d9228c8..3c8e37a220 100644
> --- a/package/unrar/unrar.mk
> +++ b/package/unrar/unrar.mk
> @@ -9,6 +9,7 @@ UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
>  UNRAR_SITE = https://www.rarlab.com/rar
>  UNRAR_LICENSE = unrar
>  UNRAR_LICENSE_FILES = license.txt
> +UNRAR_CPE_ID_VENDOR = rarlab
>  
>  define UNRAR_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) CXX="$(TARGET_CXX)" STRIP="/bin/true" \
> -- 
> 2.33.0
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
