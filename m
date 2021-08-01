Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C0CC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:10:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C441C610A7
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C441C610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 962E04037D;
	Sun,  1 Aug 2021 12:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dQ0yL80GsuOd; Sun,  1 Aug 2021 12:10:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85EA340385;
	Sun,  1 Aug 2021 12:10:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5AF3D1BF2EF
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4ADC282ED1
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:09:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lE7Oh4zhHkmZ for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 12:09:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60F9482CB7
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 12:09:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:89a2:641e:9d1f:2c0d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 445375FF67;
 Sun,  1 Aug 2021 14:09:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627819754;
 bh=aC3tLkXxTvVzHHH90s7jUOSaAb/Afm3Z7SEvr7cS7ME=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y4z33/9rlqyyDoOl3zjwWE3V2ZBWFG/V0EyRXB+gLDUWvVHGHw/e3JvfFWmeJc9Va
 Wb2iuubwJTZPwgyWfXmh3KSOtQriojMTSLdskBAd1txdz0sTJMz1O7b0RvmECIEKX6
 wn2vj0Xql1RD8BNje77gocPtPhP05y7NylxWeMdxX6Ho97MwMHwZoOH/q9ET0/g3u/
 J3jGbqBtMzLz3gqpTJ8ex52yl0AUADKaeag69dIxYMLK5VZLOtu3ilm0ylL0nNq4pM
 kEpKZrTmJzAC8e32s5K5c4k5k99KEe/iV1lIPH1p2rQs0zpYrhd/s7gi5MPMzvCGAm
 pySFBN8M1r8Sw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 Aug 2021 14:09:08 +0200
Date: Sun, 1 Aug 2021 14:09:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210801120908.GY3189549@scaer>
References: <20210801120036.2911538-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210801120036.2911538-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libfreeimage: add CPE variables
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: =?utf-8?B?UsOpbWkgUsOpcm9sbGU=?= <remi.rerolle@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-01 14:00 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:freeimage_project:freeimage is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afreeimage_project%3Afreeimage
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libfreeimage/libfreeimage.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libfreeimage/libfreeimage.mk b/package/libfreeimage/libfreeimage.mk
> index b254fa8846..91299084a1 100644
> --- a/package/libfreeimage/libfreeimage.mk
> +++ b/package/libfreeimage/libfreeimage.mk
> @@ -9,6 +9,8 @@ LIBFREEIMAGE_SITE = http://downloads.sourceforge.net/freeimage
>  LIBFREEIMAGE_SOURCE = FreeImage$(subst .,,$(LIBFREEIMAGE_VERSION)).zip
>  LIBFREEIMAGE_LICENSE = GPL-2.0 or GPL-3.0 or FreeImage Public License
>  LIBFREEIMAGE_LICENSE_FILES = license-gplv2.txt license-gplv3.txt license-fi.txt
> +LIBFREEIMAGE_CPE_ID_VENDOR = freeimage_project
> +LIBFREEIMAGE_CPE_ID_PRODUCT = freeimage
>  LIBFREEIMAGE_INSTALL_STAGING = YES
>  
>  define LIBFREEIMAGE_EXTRACT_CMDS
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
