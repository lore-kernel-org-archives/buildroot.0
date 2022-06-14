Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FE7C43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 16:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D2C740B90;
	Tue, 14 Jun 2022 16:56:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OtFGWprBO5Hf; Tue, 14 Jun 2022 16:56:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD1C640B7B;
	Tue, 14 Jun 2022 16:56:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F0061BF37A
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E83C8331B
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:55:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tiSCP4N6DWGd for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 16:55:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2921E832B3
 for <buildroot@busybox.net>; Tue, 14 Jun 2022 16:55:25 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id b8so12472165edj.11
 for <buildroot@busybox.net>; Tue, 14 Jun 2022 09:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=YpqRaOEuT4o6/Ju9esdr/IihHg7c7sdFpGcwsBqTZP0=;
 b=g5efUDVmEtJC8qLaqk8eQgwatjLx5oNuvKb4o5grTkzkO4jSibpvSi7URDUfI/htIF
 decntrVS31IO2TqRI47cbfc4luB2lr5Ft+xB9ERB7jHqz9a7dD7zQw7LaYIBWEthoMOP
 G0mIs67Miqq5LNUJm4l4no+QyRjO6YiGt1OCYikH27QqFugRJrzeMwJN83Le5Y028pHa
 OruStbFIIOvT5b2kL5G0BGULplLfiN528eZ9S/GtxN3tqcxy/o1MDYq0nn6gGQ7UB9q0
 pVyJfiRvWSxUJF9suvADda0VnSS2p2b9DqVxp95SrR/X0sTIaNsMKt8fZrd746Ii99Tt
 +zYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YpqRaOEuT4o6/Ju9esdr/IihHg7c7sdFpGcwsBqTZP0=;
 b=xby2ueA0P9yv5rDXtL4HsYFqt4Tj6Rf19/LXWnSNAOcB1jOJ3s74o9rBQHG8iLfUrO
 ExHraEaGabxDE1RNH3nGhWTeD3aUzjIMgmHhNah/V+tFHA1AmdFDU2U1K9ip0mz0n6mR
 QvBvPzljpZvUaxtDwtZNfQvTwrJpjQqRKWF4EFputHIqRAeIWYSwIeWh1PfY1HE3Ffs8
 S2o0s5kBzezcUQOqvBMmySXB8WtmEDg3MUti3ynUZKyLsDQQMATous+ib4yCjYNNlnrd
 IJb8ILyPlvcy+L3bHob/fudHARv163HCWlbZc39t+nM3QbeYfNcESYCFociIMLa2uQ+Q
 RHCQ==
X-Gm-Message-State: AJIora+LwEGoSMhW/q7EYkahEyi0n56TncYudp7f5hn7yzzndFbulVbJ
 eYxZU9HpcbpM1AJnCzd7/OdYMofD3tO0Ag==
X-Google-Smtp-Source: AGRyM1uSlKQoK5dyVMcypJa2ewxabEK+05/bGuIcd50gkQDfO8s3as1ZEUfIh3B7iAsE2ciJlZCBMw==
X-Received: by 2002:a50:ed12:0:b0:42d:d1d3:493c with SMTP id
 j18-20020a50ed12000000b0042dd1d3493cmr7091709eds.174.1655225723394; 
 Tue, 14 Jun 2022 09:55:23 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 ka12-20020a170907920c00b00711d8696de9sm5245017ejb.70.2022.06.14.09.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 09:55:22 -0700 (PDT)
Message-ID: <5f3fb0a1-fd87-f595-39b1-fd0f7da85c3c@mind.be>
Date: Tue, 14 Jun 2022 18:48:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220610165724.2574514-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220610165724.2574514-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/nettle: bump to version 3.8
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



On 10/06/2022 18:57, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/nettle/nettle.hash | 4 ++--
>   package/nettle/nettle.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/nettle/nettle.hash b/package/nettle/nettle.hash
> index cd32ad442..14467977b 100644
> --- a/package/nettle/nettle.hash
> +++ b/package/nettle/nettle.hash
> @@ -1,6 +1,6 @@
>   # Locally calculated after checking pgp signature
> -# https://ftp.gnu.org/gnu/nettle/nettle-3.7.3.tar.gz.sig
> -sha256  661f5eb03f048a3b924c3a8ad2515d4068e40f67e774e8a26827658007e3bcf0  nettle-3.7.3.tar.gz
> +# https://ftp.gnu.org/gnu/nettle/nettle-3.8.tar.gz.sig
> +sha256  7576c68481c198f644b08c160d1a4850ba9449e308069455b5213319f234e8e6  nettle-3.8.tar.gz
>   # Locally calculated
>   sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSERv3
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYINGv2
> diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
> index 3dbd0cb94..7520fb9fd 100644
> --- a/package/nettle/nettle.mk
> +++ b/package/nettle/nettle.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -NETTLE_VERSION = 3.7.3
> +NETTLE_VERSION = 3.8
>   NETTLE_SITE = http://www.lysator.liu.se/~nisse/archive
>   NETTLE_DEPENDENCIES = gmp
>   NETTLE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
