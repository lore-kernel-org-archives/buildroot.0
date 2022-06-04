Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9150DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 18:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7FC2611A7;
	Sat,  4 Jun 2022 18:16:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5JxDFWYLv_JM; Sat,  4 Jun 2022 18:16:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA42061192;
	Sat,  4 Jun 2022 18:16:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 370D71BF4E4
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 18:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25F978413F
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 18:16:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tpm.dev
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id quOs1HzpUJZe for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 18:16:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from delivery.mailspamprotection.com
 (delivery.mailspamprotection.com [185.56.85.151])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31F30840CB
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 18:16:17 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se25.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1nxYJo-000BLm-1f; Sat, 04 Jun 2022 13:16:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tpm.dev;
 s=default; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XkcOm2Q1b3s4eCn3e0S6UicbuCpT9gfN2hkgFesI53k=; b=fkYaCJA17PWSjI2xMYXrb3kYyH
 9ic4p/eE9hzDwbAzgjLqgvLwrrH5CkKiYmhYZ4A8RoDCv7dZxdWGMvPhw2XGV8yZhuTLStRRxHXf8
 4Le6UCvvyOEfB1oUPfpXhYLRziwKiAYAm6HWYSjBtqKiIGy30rcAXggDY3n5d+dVwmPCGFWYpQ3Xv
 f2iAYdT0VjfanDy2YvOR2qyxFaazHpN4ZgyzErigA8IzD0Z9qqAwyqpO4tMM758HX+5Xm3Tzuuz9e
 K/ucwWYcLdMk+42Pkxc6ybUGw8/+cnO8I00PVKhzHCdn+9i5I4eeXdPWLLcFiM+2MGzkQdt4z+EMB
 m7jaQisQ==;
Received: from [127.0.0.1] (port=63502 helo=es87.siteground.eu)
 by es87.siteground.eu with esmtpa (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>)
 id 1nxYJk-000NoY-MR; Sat, 04 Jun 2022 18:16:08 +0000
MIME-Version: 1.0
Date: Sat, 04 Jun 2022 21:16:08 +0300
From: Dimi Tomov <dimi@tpm.dev>
To: Baruch Siach <baruch@tkos.co.il>
In-Reply-To: <cb76d24abec40b2e48d3d1dd2964b720@tpm.dev>
References: <cb76d24abec40b2e48d3d1dd2964b720@tpm.dev>
Message-ID: <9251c4c3977f236b6c70e2c26f65a6c9@tpm.dev>
X-Sender: dimi@tpm.dev
Organization: TPM.dev
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
Authentication-Results: mailspamprotection.com;
 auth=pass smtp.auth=35.214.247.6@es87.siteground.eu
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.10)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT/UKG8bSQga5gJzPqiQyEamPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5wyeMQO2X8Cp3nJ8z20Bm48II0ZY5ijyiRjctGXtVv4W9Ws
 TkYe9bziclsV3FX29c1OkhzesQ0JdQzOoHQ7p+6dbtqcx+yVwPaGh5wJKf4Z+lGavff7/jlq6fkm
 O4krnmssqwWp8D71UT7e1DFkiRwOub8D9WD6xfbADJ1zA9HBaqd0cuPgMEJQbrlCqWEDfjO86MCt
 KEiN664Liq+5sX2Q30DPG3kklxPzec9XxuJeZjntX/pWw1TFLh7zj1euanxwpOsPHCzxCinEMUBF
 LsUq/f9yFbPaRdV9pEVZXxSfiuWFjcDM1XuMkZmJrWXkXHc8F/IJRA8ZF8C5AnJBxSFDEcpL0mLp
 bSEWvtYz7WRBt3Nu1v59VtN2wpeG/kC6a0h/md379rr83wlGsPkb/cfMNLm6iy4kgPDH7bQQJw2S
 D8hDqF0K58xL38EJqny9AYfllJKMSSSvxMO6e8mE51PkF3UNFAOgzdcK/YBXIWXo4uy5KYo4nKkm
 pa1tqyW+hz7BVFWSrNHngturlRbNKAJINrfqkYmj8IA0buwyojfqe0XtQhr43M8eCrxQqJFh3M4f
 thb1+PXAHSgpiDXkBWdERUFUU5/JtLKKEUu4esXRICk4xAm9D8KTeKJT7gNACPd+nNEjPOAcc2mS
 Kil38RhCINiDv46hlHAmuvJYpJLUOECAJfcnTtpRDdz8JOEfH0xd9s0thAg34RM38yy9jgKaB5hQ
 6nsDvccjqgmDvD9Wh6BpSREgLteGFdQEd1PlMhY/uD+/zbDU+yRwrzpxz6eD3Z/nKLrE+foBRgHD
 mjSepfnUsR1LUs+ffsYvxRsaG0dRTMvNkxXrT/5AUlef7a77U5PZ8trzPiBWr0+hPteNJb+hdaXi
 1JmCtjXeGaOuKkk6O9xsmswvxUxsRr2bhk3/ctgzcDoFd+96Xw4QUNtTnSvI9DJVyaWHmD3wtMx3
 WfyeXiQK+rrc+dMxd0O/evj7mC4HazrSwmyrwYh9WoYHqAuKItQTHejZSL7Lw4iFB6iUkxE+SK4C
 kqqQuY/ADtB7V9ECIyIwp9c70LlMQgcOCdMzAtRJAf3VKN1Ku0Piv2d2sjeeVldGxRi5/Df3Q3ws
 dkikeAaZM4DPxsqVMpYXkke3eAlqUrf7Jv4GIZjXCEg=
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
Subject: Re: [Buildroot] libcurl ignores default buildroot CA bundle
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
Cc: Buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Baruch,

I may have found an issue with the libcurl package.

The libcurl.mk file lacks CA path when built with wolfssl instead of 
openssl.

ifeq ($(BR2_PACKAGE_LIBCURL_WOLFSSL),y)
LIBCURL_CONF_OPTS += --with-wolfssl=$(STAGING_DIR)/usr
LIBCURL_DEPENDENCIES += wolfssl
else
LIBCURL_CONF_OPTS += --without-wolfssl
endif

I tried adding LIBCURL_CONF_OPTS += --with-ca-path=/etc/ssl/certs in the 
above if case and rebuild, but this did not solve the issue. Could you 
please take a look?

Thanks,

Dimi

On 2022-06-04 07:43 PM, Dimi Tomov wrote:
> Hello Buildroot community,
> 
> I have a STM32MP1 target and my buildroot image has both the curl and
> ca-certificates package installed. However, curl fails to authenticate
> any https requests:
> 
> 
> # curl https://google.com
> 
> curl: (77)  CA signer not available for verification
> 
> 
> Do I need to do some extra buildroot configuration for libcurl to use
> the CA bundle in /etc/ssl/certs?
> 
> Thanks,
> 
> Dimi Tomov
> --
> Founder of TPM.dev
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
Founder of TPM.dev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
