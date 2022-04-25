Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BBDC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 20:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1161081A6F;
	Mon, 25 Apr 2022 20:24:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F0wSs8F4ygQl; Mon, 25 Apr 2022 20:24:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3DDB818D0;
	Mon, 25 Apr 2022 20:24:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A71B1BF2AB
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2871A40526
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:24:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aYmKuv5RUelP for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 20:24:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1DA20404FF
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 20:24:51 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id be20so11499919edb.12
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 13:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=RY4V6lefJUU+wplHsA+qMvsaJGHrkTSLNyoRXOao470=;
 b=Xf8YVOe85Xcg7Arp/mKY/2ulwcpqXjf/Th5bv8ONbrf0eiuqkFlVecgULc5uFBjIuR
 LfYj5Wfc+1o5py5+Y416Tj90j7ytmklZMJAP75/b4L3ynEpMVJKEXQ/BREBaxFT48l3G
 +cQnAU46g7eIUCsAZOkZ0KYl+zUliAUZVPeCpoFfSCnzXq6BJBBpR4jGTDka0QCtEX3L
 6q5z9U1xfiQRxsGy/R5JyL3dt3ZOcee0v0NE69bgPRWa4bET7XOiS2lTQqkbeDxFvSzG
 NjbDn7snfg0ver1ZqCFkHAXD2aJ2XCe9cKWq8uWRZSMSA8gLQCm+DEdxGvVou1Fwma7x
 x9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RY4V6lefJUU+wplHsA+qMvsaJGHrkTSLNyoRXOao470=;
 b=l9L0Iw185lBwXy+UH5w/dMrkwsbq95HnLdJA7r5z3vLnQ/dT1+Mj7dEYBEd++A2PVV
 jZE2en+BCvPWp6q4WXURz86hjsl96a5PAb4srRjOs73SBwR/wzlVwJpnpcaY/m0/WOxO
 qP38nNVuUjPcue/QvjnZMPM3go5WenOG6zC5l6dPsUI52u7IeO7cWAb7ILCNsqDedu4e
 318LAXc+xvqnJI0jf6V+69oU2veMHdn2C8HOBmoNhA58jXSkb3wK+melaaKGzCPJV5Q0
 ywZCntsoeed2W8Lzt/CN9W3TTH+Z2aa2/XlnESLBcF9VilANNEVq/RC0Yc9lH5vSX4ER
 XCKg==
X-Gm-Message-State: AOAM533jonsiYLH33OH2QZwGlPzoVNebpLkG2c6PZh4Fvc1jSsQiaafh
 ME5jaP3PSizmWaFJ07aB17rJJA==
X-Google-Smtp-Source: ABdhPJzsy1oPVOdJlBEK3SS5knuDsC7QIq0MH8TK5Voi58PuhoXQWWvmIEJdx3l1apFGF+6Pfzm/Cg==
X-Received: by 2002:a05:6402:90c:b0:415:d340:4ae2 with SMTP id
 g12-20020a056402090c00b00415d3404ae2mr21145444edz.331.1650918290335; 
 Mon, 25 Apr 2022 13:24:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a170906590d00b006f39021e683sm1761975ejq.12.2022.04.25.13.24.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 13:24:49 -0700 (PDT)
Message-ID: <82d546c7-683f-b283-f580-cd6ca063331f@mind.be>
Date: Mon, 25 Apr 2022 22:24:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220423202458.299067-1-fontaine.fabrice@gmail.com>
 <20220423202458.299067-2-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220423202458.299067-2-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/suricata: security bump to
 version 6.0.5
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/04/2022 22:24, Fabrice Fontaine wrote:
> Various security, performance, accuracy and stability issues have been
> fixed.
> 
> https://forum.suricata.io/t/suricata-6-0-5-and-5-0-9-released/2415
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/suricata/suricata.hash | 2 +-
>   package/suricata/suricata.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
> index 098740e769..032546fd92 100644
> --- a/package/suricata/suricata.hash
> +++ b/package/suricata/suricata.hash
> @@ -1,5 +1,5 @@
>   # Locally computed:
> -sha256  a8f197e33d1678689ebbf7bc1abe84934c465d22c504c47c2c7e9b74aa042d0d  suricata-6.0.4.tar.gz
> +sha256  0d4197047c84ba070dfc6b1d9f9ee92f52a71403bfac0e29b2554bb21fe00754  suricata-6.0.5.tar.gz
>   
>   # Hash for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
> index 86d8970178..36e641bf90 100644
> --- a/package/suricata/suricata.mk
> +++ b/package/suricata/suricata.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SURICATA_VERSION = 6.0.4
> +SURICATA_VERSION = 6.0.5
>   SURICATA_SITE = https://www.openinfosecfoundation.org/download
>   SURICATA_LICENSE = GPL-2.0
>   SURICATA_LICENSE_FILES = COPYING LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
