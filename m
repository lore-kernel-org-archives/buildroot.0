Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFC9C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 10:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7CC1414C5;
	Sat,  4 Dec 2021 10:29:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pvxHmZ_BQ999; Sat,  4 Dec 2021 10:29:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A34C41499;
	Sat,  4 Dec 2021 10:29:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 140791BF5DA
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 10:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02BC541499
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 10:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l-jqeAY2JjZG for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 10:29:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD6B84148D
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 10:29:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:44c6:1f1c:4326:e15f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CC24B5FFB7;
 Sat,  4 Dec 2021 11:29:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1638613752;
 bh=AdtvSnR7fzlUHY1Aqfv1PNj8CKEB5fOhEfPvPvOI4vA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JwL30N950/D5lWj9QKuJOnAUaJBxhu2SPO5FfiHqoG5DIZ39ZgOI+XEVUULiZS1ds
 BTS8ksiEqfZ4yh7uYqnRJAzBYj5748a1BwxpotD5nora4Xp6y7s76NkxVf1pKUqhKx
 RzNPo/7i3+uoc712SG5whFbGx8M464z4o6ye8Eas9TO1ip51nCcLECuDn5vvQPwpOD
 wQeRBnVvTyIgA7a9v9u/VR58+/uYsHPNDjks4KvvhoMBuoB2/vvVQqeHVEz9IEkuj/
 zNXzWILN/o3qdHDXO1ayaZJtAIuoAVMxem9qU1ZqHwaoYy1JYGCGefZWishpkix5ak
 dKnblZYZL/08Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Dec 2021 11:29:05 +0100
Date: Sat, 4 Dec 2021 11:29:05 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211204102905.GE50662@scaer>
References: <20211204093235.2017296-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211204093235.2017296-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/netdata: add
 NETDATA_CPE_ID_VENDOR
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-12-04 10:32 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:netdata:netdata is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anetdata%3Anetdata
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

I also applied the 11 other CPE-related patches of yours, thanks!

Regards,
Yann E. MORIN.

> ---
>  package/netdata/netdata.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
> index 34365cbf56..b20d5ea37b 100644
> --- a/package/netdata/netdata.mk
> +++ b/package/netdata/netdata.mk
> @@ -8,6 +8,7 @@ NETDATA_VERSION = 1.21.1
>  NETDATA_SITE = $(call github,netdata,netdata,v$(NETDATA_VERSION))
>  NETDATA_LICENSE = GPL-3.0+
>  NETDATA_LICENSE_FILES = LICENSE
> +NETDATA_CPE_ID_VENDOR = netdata
>  # netdata's source code is released without a generated configure script
>  NETDATA_AUTORECONF = YES
>  NETDATA_CONF_OPTS = \
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
