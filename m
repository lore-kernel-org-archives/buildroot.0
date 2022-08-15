Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39243C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 17:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF7C0607A1;
	Mon, 15 Aug 2022 17:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF7C0607A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KY_ny6mZyAb8; Mon, 15 Aug 2022 17:46:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 005C06059C;
	Mon, 15 Aug 2022 17:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 005C06059C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B05E81BF2BA
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 17:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 988D38130B
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 17:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 988D38130B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QFeSH_UPCGQ4 for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 17:46:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3E3681304
Received: from delivery21.mailspamprotection.com
 (delivery21.mailspamprotection.com [185.56.85.141])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3E3681304
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 17:46:11 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se21.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1oNeAA-0008lv-S8; Mon, 15 Aug 2022 12:46:10 -0500
Received: from [127.0.0.1] (port=26464 helo=es87.siteground.eu)
 by es87.siteground.eu with esmtpa (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>)
 id 1oNeA9-0008Gx-0R; Mon, 15 Aug 2022 17:46:05 +0000
MIME-Version: 1.0
Date: Mon, 15 Aug 2022 20:46:04 +0300
From: Dimi Tomov <dimi@tpm.dev>
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
In-Reply-To: <20220814233845.2247022-16-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
 <20220814233845.2247022-16-ricardo.martincoski@gmail.com>
Message-ID: <8e524c0dd15e9f344bdf10cedea33548@tpm.dev>
X-Sender: dimi@tpm.dev
Organization: TPM.dev
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.01)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT+Cpvbt6nfUaIHL2LUWopSnPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5zC49OQ6M95/0HxQPV39IDJsqs9zzoJ2M16bDJce8jCJJeb
 GzuZekxP+n1oUe17CSXsW3/ZYgzZMJzHmV6FKjloPumU89c8OaxcWLmp7ynpEusWtt02PPzf6IHq
 96LCWAjasE0yYSwoSJtDBJTXEF44WC2iK6R3l/33nqugsIo4i8+yZWCFZU1Ng3KHjAXaPZ+sjhY6
 zsKo7eeIGqbrHJyRsiBH6dlBYu8MOQY0c4TDJa579npQ/pM9ufp8CnVPKlTlm7E8Tiet23fWl3Uh
 lTO4qzP4Aj641pJtYuY7rjgWBnnEEeQIwKMymizPrn975/qTyWDzxrwLueamHQWu1ivy30T9fYxX
 fpuaNIWf3qETjZ4CaxvFoBKj2kX+tVhPlkEa/EgNrxTqYZafFLnwfIAYgfx2RGQWLldMpYrOPB1u
 kJvrrb+tUoZtpnlNRTQuGxNf2f4WmmDaxNuw5i4zAYasyD1cUtAkD9Qu/NyOPulfYR/qvT6my8Ml
 ygoRa/GNOWXj2b+Re0cxkt6FXLY4mW3aPd0rEuGjFyZoidhtHm+WoTb88YKaPP7/bRF5qg4SdEkp
 29PIGO2fVhm1p/bhkPZx6neeThc6EaIY7WC6Ar3FlvKYzhX51i/DfOBpfkwL5JiEKUZCoFouj/h7
 lFZN6N2kwXjQxqN+xRHPwvh2ZAsqZcurjN1ZeNj9NI6R/xj7NfwFizs9woUCws5Xi2/ojwXiUXy4
 TCX1+/jlUth6x2EP0QMqfidO/w6e0CzZ11LYdr0xs5yQFT3M2B4UlUgDB+vmSi4depZIcd7EAFf4
 +g4ytYsEMysPur9wmiDBurOy6iQO+Ct3/vsPFz96+4H/+SUWawFp42EM1hFMMXPj0AlFGh+v8dA+
 FeaECBC7emiwA7yqMWfkFc5Xfb9uT8l9fpIoH/uHnC/DAFj2RmpgBmnjiZfVL8XVLsYYMtVIBO5V
 pqMq4YC3si/Mug76sCg2+l6hw6nIoDr0sXUZ7YZoZ/GZ+v8vmUr8GiRZ53L1lW1iEWZbWlQIwd/a
 +UjiYZK36M26iw24aHSb7ZyE74jcGDdtpAT9fL1uqHa3zvHAM0nVlCcnc3E5qtA/eWzCmx7EZAWc
 gWPxcgtM34LiwnlfmQmCMqOXDjb5qkdNmdZD4/1M8W8xL7hrJSk60SF3F6RYOYr2
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tpm.dev; 
 s=default; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n2jVkI/0J7k2yzSrPxDvyC9gUEBdi9CNiutwMDuYceM=; b=eM58g/6MguTbFyI5MfI0ahRM6Y
 GUohvKm+Tz22ILEnrMs5NYdUREzakN6HwWzfnGKFVjvZe6v60Kc+DDujxoCahyjv86jd5xUCqX2OB
 ELyVyPisjp5bCZehf2F8aWLSwj5zBYmb3Bn2emEzY/BNjhSpY8YcX8ly8xCOBUj9UKEiZGyB8e5VU
 fyIS1A++JkXf0ax0/9PfFVrzIO1nJAmsgq2QFHOAU7dRGxAo6iujvS5P0iR/XopqWHIUdv0A0WByL
 NjTxzOb0Tc+udkUTnHCjXbLRFH5MQbxzKBVK4HVWKxBsMBoQliBnn+9A98AYWqdK2L4KFImUEoZwx
 NcOvVttw==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tpm.dev header.i=@tpm.dev
 header.a=rsa-sha256 header.s=default header.b=eM58g/6M
X-Mailman-Original-Authentication-Results: mailspamprotection.com; auth=pass
 smtp.auth=35.214.247.6@es87.siteground.eu
Subject: Re: [Buildroot] [PATCH 15/33] package/wolftpm: fix typo on
 BR2_PACKAGE_WOLFTPM_NUVOTON
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

This is intended and not a typo.

If you rename BR2_PACKAGE_WOLFTPM_NUVOTON to ... NPCT750 it would not 
match the actual wolfTPM options that is "--enable-nuvoton".

Here is our motivation:
--enable-st33 enables capabilities ONLY for STMicroelectronics ST33.
--enable-nuvoton enables capabilities ONLY for NPCT750.

I remember that the reason behind choosing nuvoton over npct750 for the 
config name is because of the difficulty to remember it in comparison 
with st33.

Also, the package/wolftpm/Config.in clearly explains in one sentence 
what this option does.

Thank you for addressing this Ricardo.

Regards,
Dimi
-- 
Founder of TPM.dev

On 2022-08-15 02:38 AM, Ricardo Martincoski wrote:
> The typo was added by commit 'd0dcc62c4b package/wolftpm: Add config
> options for TPM 2.0 extra capabilities'
> 
> Cc: Dimitar Tomov <dimi@tpm.dev>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
>  package/wolftpm/wolftpm.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
> index d3f693a62e..7e8a108585 100644
> --- a/package/wolftpm/wolftpm.mk
> +++ b/package/wolftpm/wolftpm.mk
> @@ -41,7 +41,7 @@ else
>  WOLFTPM_CONF_OPTS += --disable-st33
>  endif
> 
> -ifeq ($(BR2_PACKAGE_WOLFTPM_NPCT750),y)
> +ifeq ($(BR2_PACKAGE_WOLFTPM_NUVOTON),y)
>  WOLFTPM_CONF_OPTS += --enable-nuvoton
>  else
>  WOLFTPM_CONF_OPTS += --disable-nuvoton
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
