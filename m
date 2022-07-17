Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD85C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 23:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E753C83ECA;
	Sun, 17 Jul 2022 23:34:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E753C83ECA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OGbBBkpu-NgY; Sun, 17 Jul 2022 23:34:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECCAC83E3D;
	Sun, 17 Jul 2022 23:34:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECCAC83E3D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF1641BF407
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 23:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B26F183E3D
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 23:34:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B26F183E3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2YU1R4KfbtHB for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 23:34:54 +0000 (UTC)
X-Greylist: delayed 00:46:44 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB62383E3C
Received: from delivery.mailspamprotection.com (se26.mailspamprotection.com
 [35.192.135.139])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB62383E3C
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 23:34:54 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se26.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1oDD3X-0009S6-JG; Sun, 17 Jul 2022 17:48:09 -0500
Received: from [127.0.0.1] (port=63864 helo=es87.siteground.eu)
 by es87.siteground.eu with esmtpa (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>)
 id 1oDD3V-00042t-JB; Sun, 17 Jul 2022 22:48:05 +0000
MIME-Version: 1.0
Date: Mon, 18 Jul 2022 01:48:05 +0300
From: Dimi Tomov <dimi@tpm.dev>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20220717224524.8771-1-dimi@tpm.dev>
References: <20220717224524.8771-1-dimi@tpm.dev>
Message-ID: <19429ae3172d8bf12ba77ec961c10d25@tpm.dev>
X-Sender: dimi@tpm.dev
Organization: TPM.dev
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.10)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT9XfhWSKNm2KN2rnMDqurVQPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5zHcgQ1GLCGZipGdBYX2IdejIhOyETOLJV5VgRmbWjZJaaj
 T7GK+pV+DB0C1T8MJSONp1orT0zdSv/EvZ56A6zUQaXPwIlI4yu/PH1NWDdGRXpxVWQvYJuqM4sr
 poHYYglTtObPqIqeRAv2CqzEPfjvBK5fzIEWxOKtcShtfOYYenQg45AD+/l6P8h0+TPjaDxMfcvw
 9uVrltEafCGDyHAgdas/VTNCC9cNG0ZUHetAVuAXlm/yIarJ6MLtuWSGk5WZn7S9PqmI7CxqPRD6
 uYFuJ/CiIhsZKGqQr5ZYJ1eyN9vvQ7y3dU9ER0LU50yMqo36DSViHKL1hgIsM4nL59jZSb4d2v72
 6lpj8/w5Va6KvnTD1aveotlgoppd3/OkI+ve6RqPPT75ZQBVMc+Li61b6cTrAfIBtLJVe62uoyOA
 UtfsPev7LNp/T0V6wcNiJWH6ZboosCGGDrdx/yGEn66RE9n6xcs9dAjFcdYUmx6p0CV+3YBwFTmQ
 DwcsbTdCl4f6Bfy1T3PwsUos1yNYdTOG17NirEYyqwqMBGrw8ELiqDAff04cDRXGaP/Cy6sgzmsE
 /Xy9bqh2t87xwDNJ1ZQn9Z1kUo7APEynsyHYUP3usgPt8rNcco5Lt6ku63DkksyWUQhsiRV7ToHt
 3HSONnNjcxw3qqhc+N6cuEg4XWh5FmdlgpEWziJwQtUee+sRGgamlv6tJcM7R5cihBHCoXMsdkTt
 GCGY96oGJ8D7Lmfblxv/vrSLvCUHMT/dLj+6VWWeH+mIf4ZAwT1XjbqQQ/uU0mCTpRgcoQPyBmzG
 6HJjvZ5ECu3zMC6/UIvU+dfuPW4Fq60D0IrCERjnDPsHGlH62P/Q5P2avsXwIHCKRpn8mrgUqWtM
 kwf3MnkWOmaXxaD49f7WTh79XtbTkIBkewknmbEGuuA5zxtRTh9I1mmPHh66OQ0NojUFkvjGWF6o
 Utbn/4Ny/m4PJtdsKlQhcDiq647lNwN4qOsSZg+fYhVZG+aNsL2JRrOpejgF0fuKp2SDLX1tyhUO
 sR3FEBVf9eq5Q/RubER29Gsl7u8pEy3UTWWLX2ZbQb3UJKihEmoDuwjgD4vT+QwiY2D1YBmu6gZc
 v+1j2oorz4YWED/OKQ7wdK30zNNQQeLujWA6r47gmJ4=
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tpm.dev; 
 s=default; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=clDf48TXU8J/UQDNy7WIXsPOPM1AAzcS8WWzg9zy4DY=; b=awz0EzFwVuSG64AdHm1wO+ysLk
 pFGNk/lzkZp6mkk1Ai7WSOn0vwaXnQM9KyzSqQKblXGyL8rVrHDpqdNvMAgsAMBhTWb52ZIx3Lm/n
 UURe89iyJSO3NwLdKm2tHrkKKa2ZsHYSGPDGhljTzK/14tz2/6pw9sJhagE0zcaNOR9Wg40MIqpCD
 9af+popUFN5+arwnD2yJ4ojrrkMYbHWRgYzq/mUhy5MlYMqoMLqfGzmfLQSlKrDswA0ukbBbvJX1B
 rWJOutuNZxBf7bzXeRHcBfDP8CT0sdU884VIKpG2Udbajk01OqsfWOC0+yAFv06SZF3n0X91folLb
 UtJS9GVg==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tpm.dev header.i=@tpm.dev
 header.a=rsa-sha256 header.s=default header.b=awz0EzFw
X-Mailman-Original-Authentication-Results: mailspamprotection.com; auth=pass
 smtp.auth=35.214.247.6@es87.siteground.eu
Subject: Re: [Buildroot] [PATCH 1/2] package/wolftpm: Update version to
 v2.4.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Please review when you have the chance. This patch-set updates the 
library version to the latest upstream and adds some extra options in 
the buildroot config.

Thanks,
Dimi
-- 
Founder of TPM.dev

On 2022-07-18 01:45 AM, Dimi Tomov wrote:
> From: Dimitar Tomov <dimi@tpm.dev>
> 
> Signed-off-by: Dimitar Tomov <dimi@tpm.dev>
> ---
>  package/wolftpm/wolftpm.hash | 4 ++--
>  package/wolftpm/wolftpm.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/wolftpm/wolftpm.hash 
> b/package/wolftpm/wolftpm.hash
> index b9a9628b68..d24df58eaa 100644
> --- a/package/wolftpm/wolftpm.hash
> +++ b/package/wolftpm/wolftpm.hash
> @@ -1,4 +1,4 @@
> -# Hash from 
> https://github.com/wolfSSL/wolfTPM/archive/refs/tags/v2.3.1.tar.gz
> -sha256
> f0d7c095491ac2cc9e44aa4ac3c22febf15942ef080431d8b43a9d0312ca6567
> wolftpm-2.3.1.tar.gz
> +# Hash from 
> https://github.com/wolfSSL/wolfTPM/archive/refs/tags/v2.4.0.tar.gz
> +sha256
> 31d1a5f5d60af14c4d07e14a9b0667404d4801fed32afd3fc0649749020ad17b
> wolftpm-2.4.0.tar.gz
>  # Locally calculated
>  sha256
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
> LICENSE
> diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
> index a4a9edce85..c5ebeca18e 100644
> --- a/package/wolftpm/wolftpm.mk
> +++ b/package/wolftpm/wolftpm.mk
> @@ -4,7 +4,7 @@
>  #
> 
> ################################################################################
> 
> -WOLFTPM_VERSION = 2.3.1
> +WOLFTPM_VERSION = 2.4.0
>  WOLFTPM_SITE = $(call github,wolfSSL,wolfTPM,v$(WOLFTPM_VERSION))
>  WOLFTPM_INSTALL_STAGING = YES
>  WOLFTPM_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
