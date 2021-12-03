Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DBFC433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 21:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD0B160646;
	Fri,  3 Dec 2021 21:57:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dWViOGrYwhac; Fri,  3 Dec 2021 21:57:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 207EC606B4;
	Fri,  3 Dec 2021 21:57:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 949E41BF2CA
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 21:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E71240270
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 21:57:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Wz8qtnDD1UV for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 21:57:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19EBA4013F
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 21:57:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:28e3:e36b:4389:5725])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 08579200390;
 Fri,  3 Dec 2021 22:56:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1638568620;
 bh=74qCXtKt4c77tr80I5X+7QQuLSneZHtEAnQ48d0sE3A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Eng+cxfNGQjd6lKM8EV1HsfM84ivO5nJaAmBsiGfROUSQeUB1RvKkn2B5U5nosLi6
 pn4xD62j+Fin8RTAvklmBjbg7l4zGMWLwGjG8g+GnqGhr9gyLsfWkNIL+FXLWw8Hl7
 YaLetvftZgx988K28bfCbNPmH1EHssc31zlQSqnBdTnejAlTueKaSDGlqOf/GO6suJ
 mQMJN80MupudyaqxQeEuSS/DvGVPK5GbUZS/sW8e61drqXCd1SbcPJMnGuE8kwoa9i
 vWn9fHG9CENTZi+zBzBYcQtlWpsLeav5qvRR6NDFLTvkKMG/hcBInItnAXy+cJJR8c
 7fK+tzhGqBrGQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 03 Dec 2021 22:56:51 +0100
Date: Fri, 3 Dec 2021 22:56:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211203215651.GB50662@scaer>
References: <20211203204417.1922170-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211203204417.1922170-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss: add CPE variables
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-12-03 21:44 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:mozilla:nss is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amozilla%3Anss
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libnss/libnss.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index 2d880d2336..88e7cfb183 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -12,6 +12,8 @@ LIBNSS_INSTALL_STAGING = YES
>  LIBNSS_DEPENDENCIES = libnspr sqlite zlib
>  LIBNSS_LICENSE = MPL-2.0
>  LIBNSS_LICENSE_FILES = nss/COPYING
> +LIBNSS_CPE_ID_VENDOR = mozilla
> +LIBNSS_CPE_ID_PRODUCT = nss
>  
>  LIBNSS_CFLAGS = $(TARGET_CFLAGS)
>  
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
