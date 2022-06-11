Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC732C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Jun 2022 20:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C48C409DB;
	Sat, 11 Jun 2022 20:24:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ruz9wIVz1ema; Sat, 11 Jun 2022 20:24:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E1C14091C;
	Sat, 11 Jun 2022 20:24:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A84C1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 20:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3758F4091C
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 20:24:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J3YrlZ9hJQC6 for <buildroot@lists.busybox.net>;
 Sat, 11 Jun 2022 20:24:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from delivery.mailspamprotection.com
 (delivery.mailspamprotection.com [185.56.85.147])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDFA94058A
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 20:24:12 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se24.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1o07eS-000Gqx-Ej; Sat, 11 Jun 2022 15:24:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tpm.dev;
 s=default; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+vW/zLmHM+yW+LABcpvyWs8lrniJEj47F963D/WbXB4=; b=MK/ajE0UZ+xjwae46/0LTthzgB
 LCelq4qMeP2+ougysr8IZk0DC94LUiQE6lTME9lK9XGPAPS8QUgixoG/c5t0FCi3ceRNsCXcmvsct
 wJHgt6y7RtQIxIJeILUR2PAoK23AslnMsF0MFfcv4bJNc6ll1hC2+eaHn9RSS6J9YGSg7kNBCiT2T
 8oM5GnZdtPy2BpBN0MXzH5ebPGTjv+QVzERwSn5dWrTKJ2LVFv5esrUQjgd6eLTGIq1QeNhIjuko5
 habrHfSDikleBlp1TxEdx8ViSTB6sq/ANj/uy7nDLrO2lMc57QOyHrR0TkbSrhAnB7fS4mQ0SshaJ
 vucITU0A==;
Received: from [127.0.0.1] (port=32194 helo=es87.siteground.eu)
 by es87.siteground.eu with esmtpa (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>)
 id 1o07eQ-000Ds6-NX; Sat, 11 Jun 2022 20:24:06 +0000
MIME-Version: 1.0
Date: Sat, 11 Jun 2022 23:24:06 +0300
From: Dimi Tomov <dimi@tpm.dev>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20220611143544.844613-2-fontaine.fabrice@gmail.com>
References: <20220611143544.844613-1-fontaine.fabrice@gmail.com>
 <20220611143544.844613-2-fontaine.fabrice@gmail.com>
Message-ID: <df8cd05af52ef475efc5f6ad26b4e340@tpm.dev>
X-Sender: dimi@tpm.dev
Organization: TPM.dev
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
Authentication-Results: mailspamprotection.com;
 auth=pass smtp.auth=35.214.247.6@es87.siteground.eu
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.03)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT8OCRr5/8SOiFErXKaGmvzyPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5zXBqNSapTpPkqU8rtpw71NFyJHgrHSwCtEjluuUWcpJ8/K
 tIis73NVkbbJSPKOuEHDDdBmuyPGUTC5X8gbTECmAXDkcXwqI3EzqRI7b1h6dr2ma3bk6907iJ+7
 ChAD8wA4PWJM2zMugzmIRtzFHL4a07fHnUrGVT90d4mboms6Q4jR72V1X0CGSmjU0lJsvds8oXLp
 TS+Cr9Qe6X5KmaYlfalrtdr1VI+cQUFK8LdWxdX5jslbUZuYzq0zddjP6xUe7VM2alTUNsoANW4O
 NNcximXkW6PpQinXl75IfbrY9zYhNt8TdxUfIrY2WjbSnBaqravdRbTWhIn7CBseB1pd20+d9nkp
 +JHKcNBPs4VL7FghFiuDCY0EdD8+W8Mu0TYWMMRtIEQQxlrKshc4xAK4g+WnxXPxePRFPW6dC7hC
 Kx5IM07QBMRb2m7RenwUT16Mz313pILeCEKtSSBbIR7t5WHypSrhqI26Bkd8dH9XuNkaacPZpCod
 EHEsAzKOEJ6ImeWQPPXGnwKsTPlbyc2/5YE5enyccp7RH4WQio3uGVqtc0ZG7aDiGlv/KExpOMwu
 //nzk76lak4ojODbJHHEODUshnZOsIh2CP4DNGScxhNfkPQ0eGG0BkZ/0ghVUjHJwcJ3z+7xFrhX
 UzZERlSgGplHcpVCCoX989hgB8R+yOrC2CNsMqX4cWWt1YNUpd+PhnFJy1/Z+WD5UyDpHzozWTQK
 uqJXBJFYx/qDj1OmhUpLFBOT9LK7drsS4u6CCWlhrsFG7jcv2LcesFNdQvqnFhWhstLbpqN9dgJ+
 umAxZMpmQVxInSxb8U8A2p1qJ6mDAdkSzimbpd8etgHq15GF3/rsb8tZQgR/HwtgHPMrYEjIiij5
 thChPa+USm/pzU0I6eTqkG2aOZtv8cKbn6So1gKPmoA/joSUKeA9mhBELnH5LkArXUDn768+ho15
 PLyWbLZ/EjzJxNChQ2GvhnUzfqb5R4VemuUI6bcEARsm0KArSvzqLnLwfVVSeZ5M/YEKrlzwSpLC
 u2OVoRHtEo92VT4W03f/NYiUhPCiqZvGR2eupYYdzPm7YfRDaULOU2nVN0GmGphzs9bpXefqEDQr
 9lAdscOlQtPLiXIERw7oIzEGswHyGASTjazDoKRKoVo=
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
Subject: Re: [Buildroot] [PATCH 2/2] package/wolftpm: drop
 WOLFTPM_CPE_ID_VENDOR
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

wolfssl[1] and wolfTPM[2] are open-source products of the same company, 
wolfSSL Inc. [3]

Therefore, the wolfssl and wolftpm package share the same 
WOLFTPM_CPE_ID_VENDOR.

In case that the CPE_ID_VENDOR is incorrect then this is true also for 
the wolfssl package where the value originated.

Thank you for bringing this topic up for discussion.

[1] https://www.wolfssl.com/products/wolfssl/
[2] https://www.wolfssl.com/products/wolftpm/
[3] https://www.wolfssl.com/

Regards,
Dimi
-- 
Founder of TPM.dev

On 2022-06-11 05:35 PM, Fabrice Fontaine wrote:
> cpe:2.3:a:wolfssl:wolftpm has never been a valid CPE identifier for 
> this
> package:
> 
> 
> https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awolfssl%3Awolftpm
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/wolftpm/wolftpm.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
> index f0cf0df0d3..042ccd22e1 100644
> --- a/package/wolftpm/wolftpm.mk
> +++ b/package/wolftpm/wolftpm.mk
> @@ -9,7 +9,6 @@ WOLFTPM_SITE = $(call
> github,wolfSSL,wolfTPM,v$(WOLFTPM_VERSION))
>  WOLFTPM_INSTALL_STAGING = YES
>  WOLFTPM_LICENSE = GPL-2.0+
>  WOLFTPM_LICENSE_FILES = LICENSE
> -WOLFTPM_CPE_ID_VENDOR = wolfssl
>  WOLFTPM_CONFIG_SCRIPTS = wolftpm-config
> 
>  # wolfTPM's source code is released without a configure script,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
