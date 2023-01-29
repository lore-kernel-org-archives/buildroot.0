Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7DEC05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 12:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C0034156A;
	Sun, 29 Jan 2023 12:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C0034156A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fd-3_AvfEU9x; Sun, 29 Jan 2023 12:30:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F078141554;
	Sun, 29 Jan 2023 12:30:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F078141554
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1320E1BF5F5
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 12:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1B2440529
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 12:30:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1B2440529
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sE0Vh_-XY1FY for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 12:30:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDC6D40179
Received: from delivery29.mailspamprotection.com
 (delivery29.mailspamprotection.com [185.56.85.159])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDC6D40179
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 12:30:14 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se29.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1pM6p1-0001Dz-Sw; Sun, 29 Jan 2023 06:30:13 -0600
Received: from [127.0.0.1] (port=45920 helo=es87.siteground.eu)
 by es87.siteground.eu with esmtpa (Exim 4.96)
 (envelope-from <dimi@tpm.dev>) id 1pM6oz-0007Ju-2q;
 Sun, 29 Jan 2023 12:30:09 +0000
MIME-Version: 1.0
Date: Sun, 29 Jan 2023 14:30:09 +0200
From: Dimi Tomov <dimi@tpm.dev>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20230129074509.246281-1-dimi@tpm.dev>
References: <20230129074509.246281-1-dimi@tpm.dev>
Message-ID: <79477989a889dc428dc9641ae7b3eade@tpm.dev>
X-Sender: dimi@tpm.dev
Organization: TPM.dev
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00626076305434)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT/oogVeoyItCi9Ct6527/eHPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5zHcgQ1GLCGZipGdBYX2IdejIhOyETOLJV5VgRmbWjZJaaj
 T7GK+pV+DB0C1T8MJSONp1orT0zdSv/EvZ56A6zUQaXPwIlI4yu/PH1NWDdGRWRhZm76tQ4LzJ0P
 Xg/Bcc5TtObPqIqeRAv2CqzEPfjvBK5fzIEWxOKtcShtfOYYenQg45AD+/l6P8h0+TPjaDxMfcvw
 9uVrltEafCGDyHAgdas/VTNCC9cNG0ZUHetAVuAXlm/yIarJ6MLtuWSGk5WZn7S9PqmI7CxqPRD6
 uYFuaIUEDspIkEVhfGcIvgSEJ9vvQ7y3dU9ER0LU50yMqo3HL0jq0UTY1VJNLTVaix4USb4d2v72
 6lpj8/w5Va6KvnTD1aveotlgoppd3/OkI+ve6RqPPT75ZQBVMc+Li61b6cTrAfIBtLJVe62uoyOA
 UtfsPev7LNp/T0V6wcNiJWH6ZboosCGGDrdx/yGEn66RE9n6xcs9dAjFcdYUmx6p0CV+3YBwFTmQ
 DwcsbTdCl4dB9WMTZUIC3ob4Msu0otgPqivUB0b1qGE4OurCSWk5mrwqyT5p50x81ZKcmzCu2U1F
 PahA+c6c9hzXhA/hAFzWs0BoW+zAoj3wlYkyQAvqJbvAleuUtPy8TsrLw6yMOVF3EqW8CgPw7EoL
 RLxPxZsAgFLjQLpHyp6ln/j1jDpTIUmCR0R7KNsho6aCUmp4CCjk1AsLUsKOC205gL30DOmtcZPi
 ank43QmWBquc5rhjKQ9B/gJ6M2x+ink+1RfbeZJ+yq1EyF+Ctn49BQ0HiFW86ctOVsoAU4w/3ZM9
 TbapkUsr8SkRYdcXTCWFdHP7AUsRFZ4oobg8BBg3Jq+ntzj0+lvMfyxgbl2R4qjXTRE+bEQ4A9yd
 qlBYa841NbfIhIrtFl9leV22orHMWR3xFJ8VBjs6orwzEcJnHQqd/K50h/N9jS2twbUA4P8/YGu4
 Z1tRXxKF5tPxTxfD0dMN+t5Z1dIenT1wRi1ArdyBVa46y1hd7+Z3ohEuqbhw2IGiK9DdiXSNwF/y
 iWMMKF9eAvfHpqK+P0Wc+fXgfpLjpGxn2zk1aMl3vInpojCKOhSgACsLxN0Dm6+b5joKnx+pjyIF
 lvmFLkwYbI6UWKgX6i/GVrKnKecf5lkbo3LX6pAIVSiL8e4Il1a850odPLnmNkz2MS+4ayUpOtEh
 dxekWDmK9g==
X-Report-Abuse-To: spam@quarantine2.mailspamprotection.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tpm.dev; 
 s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=9weemBia4xfvplbUR3SEnh/hp0Wx5yEHv13uzhkajvI=; b=PjMJQ0MaVpDVVoS0lVANxkMs+I
 AG5on8NPAzrKvOVSZsqzYSBXhj0yehQPLuIEJ3qWDSQD2YANs2nmZkaZmIEgGt7TlAIwI/FcEbC22
 +l3INDdEe07TH1mXE5APeSWV4Gp51v0QXBW9Qp3mL2xdwI/XaBCwCj58qAexC2lXWG/Mpo6dr6vUu
 ZjPlz54joTHvOJNu405U1dpG9GlYrP0/Tdqfcb/jxa8k+jNmOv4rk463TwTRNQ9bSZU9BhLRr7z5H
 F8WYJEnJQcW1HmOrF8sPUgeQ7h1OpHLmsr/TmZ+2qINJM/DKPbcmQksIcIoOBe18XNojH+82dFbv9
 a8I1rSaw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=tpm.dev header.i=@tpm.dev
 header.a=rsa-sha256 header.s=default header.b=PjMJQ0Ma
X-Mailman-Original-Authentication-Results: mailspamprotection.com; auth=pass
 smtp.auth=35.214.247.6@es87.siteground.eu
Subject: Re: [Buildroot] [PATCH 1/1] package/wolftpm: bump version to v2.7.0
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

This version bump is built against latest next and tested on STM32MP1 
with ST33 TPM.

Thanks,
Dimi
--
Founder of TPM.dev

On 2023-01-29 09:45 AM, Dimi Tomov wrote:
> From: Dimitar Tomov <dimi@tpm.dev>
> 
> Signed-off-by: Dimitar Tomov <dimi@tpm.dev>
> ---
>  package/wolftpm/wolftpm.hash | 2 +-
>  package/wolftpm/wolftpm.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wolftpm/wolftpm.hash 
> b/package/wolftpm/wolftpm.hash
> index 735c731a53..3329528095 100644
> --- a/package/wolftpm/wolftpm.hash
> +++ b/package/wolftpm/wolftpm.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256
> 78331cc2d98339247857f5ceb3e7cd3c4f5773e3d81bf1d73e8df9446e37472b
> wolftpm-2.6.0.tar.gz
> +sha256
> d8e06e77893f104be7eb9421cac50518552ad9c5fc7fe8a9c1cdfaf4f11b92df
> wolftpm-2.7.0.tar.gz
>  sha256
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
> LICENSE
> diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
> index 398fa668af..db332712f5 100644
> --- a/package/wolftpm/wolftpm.mk
> +++ b/package/wolftpm/wolftpm.mk
> @@ -4,7 +4,7 @@
>  #
> 
> ################################################################################
> 
> -WOLFTPM_VERSION = 2.6.0
> +WOLFTPM_VERSION = 2.7.0
>  WOLFTPM_SITE = $(call github,wolfSSL,wolfTPM,v$(WOLFTPM_VERSION))
>  WOLFTPM_INSTALL_STAGING = YES
>  WOLFTPM_LICENSE = GPL-2.0+

-- 
Founder of TPM.dev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
