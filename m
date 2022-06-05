Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4FBC43334
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 08:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA811612F1;
	Sun,  5 Jun 2022 08:16:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lvY1_TMxse39; Sun,  5 Jun 2022 08:16:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09F31612E9;
	Sun,  5 Jun 2022 08:16:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 595891BF335
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 08:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 476E740CF2
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 08:16:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tpm.dev
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UICvCe__QJJI for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 08:16:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from delivery.mailspamprotection.com
 (delivery.mailspamprotection.com [185.56.85.138])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1ECEE400A4
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 08:16:47 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se19.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1nxlR7-000DJW-Ls; Sun, 05 Jun 2022 03:16:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tpm.dev;
 s=default; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ty7ROYAMaUgX+ib5SNfE2MKioKhVUGW9KxnE02ju9rw=; b=qypBL7nzOKsS1Re/PMbcl4x0tZ
 dYNi+W2BnL6pzI1XLKwJFh3TfyWOpJQT9g7vQlMOOIYIMAfBvwZUHZKFcLBVXvIjvcf88Qku6XteH
 U95OjEUF0+HRPqjaJ8GfRdTvcqZUu7cRJ2Xx/8Sk0ebZBuDgVjWdvCot+tXwG9+kYKH8lkJWE/6hF
 VZQuxAjBlT6SwKEtCw/0xYI2jALolMBNrBZz4M3pyPn4efl4UPOmMRg8btKo1OFR5V+h8t36MIaAU
 I8hkebHGVMp5nq3j7GmoUVFQbvOT6ekJWjW7mZ8n86B+B0Zj1YFZOn4rY5b1oK1zS1vlm5a5dvx6O
 wI9/wMQA==;
Received: from [127.0.0.1] (port=41690 helo=es87.siteground.eu)
 by es87.siteground.eu with esmtpa (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>)
 id 1nxlR4-000OlA-9W; Sun, 05 Jun 2022 08:16:34 +0000
MIME-Version: 1.0
Date: Sun, 05 Jun 2022 11:16:34 +0300
From: Dimi Tomov <dimi@tpm.dev>
To: Baruch Siach <baruch@tkos.co.il>, Martin Bark <martin@barkynet.com>
In-Reply-To: <cefa8f258208ca9c1335d03895508b16@tpm.dev>
References: <cb76d24abec40b2e48d3d1dd2964b720@tpm.dev>
 <9251c4c3977f236b6c70e2c26f65a6c9@tpm.dev>
 <cefa8f258208ca9c1335d03895508b16@tpm.dev>
Message-ID: <1ab54b30b3c2de10bcdeaa57f69c478b@tpm.dev>
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
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT+v9rc3TK8USs92HDKhpV9EPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5wyeMQO2X8Cp3nJ8z20Bm48mXQcXvgBwdPsgckLs23xIr8w
 OUqZ8/5fiNSm31Ip1nAjpx9soHOVwxRcKgX1jeW+/P2KA68bOYt0CoeAhNOZv1yxooL1g00qSu3p
 BlzxmlUhfeXMyWnUQjjMD4JK3Wq2jJKA7haz4rV6833Ny7pzTusBUwxLei5WfbYOwlA1j/PBI128
 r/Kn6gLOF3Dw0+51JU5pcJpt3JK/347T3ddDszVDPx49snBmt3mvjVEu1KMeigMttP/SK296THSN
 fG84WjgK8eSXaqvTogT9d22Zfp6J39DcTGtLC4s9xWFKM55l0UQNCYPr45YknMvmdlGdBP18vW6o
 drfO8cAzSdWUJ3ILXkRib82L43HIepkyRmrt3JsC5e/DlYVV9jqBtc/t9a3fvBg8I7q5hFKojyxx
 cVkDWpg3cUqnTXK7+jR2jt1xuwt6BW/LqWzUw+fkjzpuRAwX31WVY5lWjWxuGSRuxeH/U9irS6S/
 4tPpWmJbHa138B2VLS1CpJIOW6O9dEv0FdiB1wGsIwp1rfFVK4orKL/MkTXVmMpAWIpXwTCeSh3C
 kdUpn8A2iMkLHL7hKRavnHl2TRtBFGxCwNLr/WIXTv9XXirEnIovV1DgiaRl4uEzrxMg36Jn7L4U
 IiMZgOGil2hsR99u5gXb6tWyU4Ig+a0jiD6XqsJZtjQxlyCdseyDkKghCgVk1KWSByrV0wIUCtbE
 guydx7+/OTtKDkewxZzatGeUgZP4o9B/YaO/lyj0ueve0JZHC9g7yTKUVX5S119UJTC3pWi+xSvF
 azC0736kYH3pTkh+9N3RpnPTg4ilB88zIHaAzJ1MM+Uac+Gb8IwZYeUO3SdHOBIA/+dOcHeV3Rut
 woCbl6bePDUokDH0le6nwMqBTZPoY6UyWfs4lMBil8p6K4g5BTmMPo9j6c/9S26x+GLWtw0xFHHH
 aSUGe36LUkbq4uQ60WnRcdcrUNzSCKdUMUA8EmOuGIUG5/B4agWOBURF9vZZEPKbP7axnH8IQOGl
 0OK9YQosYvUVGBt96cyC792PGPnCwto+jc3SLvmmH08hpnUWu8Jz3L6MyGnDIpSchlco6RIDoNg/
 DowYF5X92G1XxuvnCFAIOBFH5+voV8F0lWqCjvQnQq6JWFW8yhJ2Btz1sCvfhP6Q
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

I forgot to mention that I have updated the system clock using data & 
hwclock -wu and the issue with libcurl and ca-certificates packages 
persists.

On 2022-06-05 10:24 AM, Dimi Tomov wrote:
> Hell Martin and Baruch,
> 
> Issue persist after building my buildroot image with libcurl and
> openssl as a cryptographic provider, ca-certificates package installed
> properly and in default location. Error message only changed a bit:
> 
> # curl https://google.com
> curl: (60) SSL certificate problem: certificate is not yet valid
> More details here: https://curl.se/docs/sslcerts.html
> 
> curl failed to verify the legitimacy of the server and therefore could 
> not
> establish a secure connection to it. To learn more about this situation 
> and
> how to fix it, please visit the web page mentioned above.
> 
> ^the above page mentions that a CA bundle is missing.
> 
> However, /etc/ssl/certs is deployed properly by the buildroot make and
> sdcard image.
> 
> Any ideas?
> 
> Thanks,
> 
> Dimi
> 
> --
> Founder of TPM.dev
> 
> On 2022-06-04 09:16 PM, Dimi Tomov wrote:
>> Hello Baruch,
>> 
>> I may have found an issue with the libcurl package.
>> 
>> The libcurl.mk file lacks CA path when built with wolfssl instead of 
>> openssl.
>> 
>> ifeq ($(BR2_PACKAGE_LIBCURL_WOLFSSL),y)
>> LIBCURL_CONF_OPTS += --with-wolfssl=$(STAGING_DIR)/usr
>> LIBCURL_DEPENDENCIES += wolfssl
>> else
>> LIBCURL_CONF_OPTS += --without-wolfssl
>> endif
>> 
>> I tried adding LIBCURL_CONF_OPTS += --with-ca-path=/etc/ssl/certs in
>> the above if case and rebuild, but this did not solve the issue. Could
>> you please take a look?
>> 
>> Thanks,
>> 
>> Dimi
>> 
>> On 2022-06-04 07:43 PM, Dimi Tomov wrote:
>>> Hello Buildroot community,
>>> 
>>> I have a STM32MP1 target and my buildroot image has both the curl and
>>> ca-certificates package installed. However, curl fails to 
>>> authenticate
>>> any https requests:
>>> 
>>> 
>>> # curl https://google.com
>>> 
>>> curl: (77)  CA signer not available for verification
>>> 
>>> 
>>> Do I need to do some extra buildroot configuration for libcurl to use
>>> the CA bundle in /etc/ssl/certs?
>>> 
>>> Thanks,
>>> 
>>> Dimi Tomov
>>> --
>>> Founder of TPM.dev
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot@buildroot.org
>>> https://lists.buildroot.org/mailman/listinfo/buildroot
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
