Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C19C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 20:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B280340465;
	Thu, 16 Dec 2021 20:14:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XEdrb-lfFE7c; Thu, 16 Dec 2021 20:14:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC98B40B5F;
	Thu, 16 Dec 2021 20:14:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D8C01BF325
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87D9940B5F
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:14:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PDZfBiZdQOWt for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 20:14:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B17B40465
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 20:14:36 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id b7so31887761edd.6
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 12:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=r2NmstxJ8HSLqV975EVrNIccNiCpeXUwC/r1bPMsxpY=;
 b=N7yktvN0wARs6beBR6ErsnkPw8e/sihPhP5sRT5p4kf0CR0Rm9gGluKprsparA2AA+
 7ocDaVbGTHTsABTj5y3yYRZlDPn9+qDuuOFBWYieaigjHkHFnRBVXY2toopu/2nXmLgf
 xtv6GFxNHHUgLi8/td7yYe7+UNJdV97k1TpcMj/p1d61aBorAfDT6sIFTR32wO4CwiKR
 khhQQvcmHMOV+V05md+gIb+rZIS3AE+NIKxPfbEiKhvOWNzwpJnbjNCbqEs9HG/VhbSS
 IOijRiPxsakoOF4k1J5JwxqiAmCYBR3c2Lmg4PSI96aPQ/TF7SHkPBdrfO1xRaQg7O60
 3pIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=r2NmstxJ8HSLqV975EVrNIccNiCpeXUwC/r1bPMsxpY=;
 b=ALWb8sRWC1rhM3Nf1HxBIIVaQqscyyPr4ZFSX+hnyTvJnZz0sKW+fxjvkze1E5QA8F
 k95oicmZfaTMIgpZRYPeSU+UYE5TT/2qox44QnTchGJ1AOL5aZwM1mWuXl7BDGhxlgVR
 Ok6EAKFE6+PiqJ1BoFdMi1WV6Z+XLP0x/C5BHll84WSdHucCrO7Pt1dtnlVdfytEgD8r
 V+MGUFEHXhkv4nf0PSwXFo3mz6kFOUJeOSuMVL3PsYxOBpFdVZwZZgNcV1uj/boBQPm3
 cBtHnYQt0wz1r7WNZUMYStnKxxHAYa0tor35AituVdoKUte+iApFsy6cgZIEzTAKD7i9
 +CKQ==
X-Gm-Message-State: AOAM531wNCu6H27PFG8Yc9U9xqTSUjlO4UDWIAKUqlOwFRRLEefFKXxm
 jmVtWh0+UNFvj7LzJRmbW5ve1A==
X-Google-Smtp-Source: ABdhPJzT2UW6X5U/jNYL/MibEhuMbnvXbz7b+FQ13EUDCmrVphsC8g+xLTuVsx1hJaYppSorsiO8Kg==
X-Received: by 2002:a17:907:9605:: with SMTP id
 gb5mr17678733ejc.685.1639685674524; 
 Thu, 16 Dec 2021 12:14:34 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e8sm2930963edz.73.2021.12.16.12.14.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 12:14:34 -0800 (PST)
Message-ID: <925f6891-2f2e-921b-cf8e-a5d8fe8d6905@mind.be>
Date: Thu, 16 Dec 2021 21:14:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211216070201.113909-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211216070201.113909-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/lapack: security bump to
 version 3.10.0
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
Cc: Benjamin Kamath <kamath.ben@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/12/2021 08:02, Fabrice Fontaine wrote:
> - Fix CVE-2021-4048: An out-of-bounds read flaw was found in the CLARRV,
>    DLARRV, SLARRV, and ZLARRV functions in lapack through version 3.10.0,
>    as also used in OpenBLAS before version 0.3.18. Specially crafted
>    inputs passed to these functions could cause an application using
>    lapack to crash or possibly disclose portions of its memory.
> - Update license hash, year changed:
>    https://github.com/Reference-LAPACK/lapack/commit/f67034373ee2972b4ea5de5a3d635b30ad3026c2
> - Update indentation in hash file (two spaces)
> 
> http://netlib.org/lapack/lapack-3.10.0.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/lapack/lapack.hash | 4 ++--
>   package/lapack/lapack.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/lapack/lapack.hash b/package/lapack/lapack.hash
> index bac7210c29..6f6dbff1a6 100644
> --- a/package/lapack/lapack.hash
> +++ b/package/lapack/lapack.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256 106087f1bb5f46afdfba7f569d0cbe23dacb9a07cd24733765a0e89dbe1ad573  lapack-3.9.0.tar.gz
> -sha256 d56bd4441b999b80c88df04faf0d8b3d7d3b2bd781cf91242c4188e8a6d0f8be  LICENSE
> +sha256  328c1bea493a32cac5257d84157dc686cc3ab0b004e2bea22044e0a59f6f8a19  lapack-3.10.0.tar.gz
> +sha256  66246b7d3e6736aea46e63fd5e087659474d07edfe2f9b051d085d9b42aaac61  LICENSE
> diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
> index 41774f6167..f34f685ae2 100644
> --- a/package/lapack/lapack.mk
> +++ b/package/lapack/lapack.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LAPACK_VERSION = 3.9.0
> +LAPACK_VERSION = 3.10.0
>   LAPACK_LICENSE = BSD-3-Clause
>   LAPACK_LICENSE_FILES = LICENSE
>   LAPACK_SITE = $(call github,Reference-LAPACK,lapack,v$(LAPACK_VERSION))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
