Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C31BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38D8F60B02;
	Tue, 15 Mar 2022 21:14:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JzT4mCjDSIBj; Tue, 15 Mar 2022 21:14:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66C5060761;
	Tue, 15 Mar 2022 21:14:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D4EF81BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1EE960761
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:14:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZNnQQI-vOAC0 for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:14:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C01246068F
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:14:54 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id yy13so315335ejb.2
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 14:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Yu8kjnBwm7ELH3EFgPzx/ru0cx5zWaiSsX+1flL1A7g=;
 b=bdqJh18RGzqPFeWX+Ra8g2XoA8su/O40mSa+qU731jkeuwTReW4n/JYfSL68xiWIhI
 fE7+gKowdtDqbC9lzJwqbAjTO45clrXTsdfb24nc3T9RneGevy8r50GFHeGI2ZvDX6Y/
 ZTbYrf8q8QwrVCeGD9DmPRm+jaHXdzDlQcF9esmWyAgArE/A4Umdb0E5Dua6ArnZi5co
 g5jeXEe/6j3vNUcjS1ZAfMK36Eo87nUQ0E/u2hMANL5WiOTCXyLzBr34JooMFcPc4HN9
 jJ2vvziwxFNNAJp1spMEYCGb57rxp7+q1IjH2jgxZKDut4S+Dog62XJ7iBsjxJe2Ey8Q
 qipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Yu8kjnBwm7ELH3EFgPzx/ru0cx5zWaiSsX+1flL1A7g=;
 b=G2NxecrJsKwSfV2xkKh7sDNsGaDVW6TxE4cN3rEqz/sjujvyiRSvoEZ9Ero/OREmlT
 wweTR1g6PKQspFlDGRlv+wrge3Gx+NAYa7pzUb6TZsriFyki5/YZAWgr/obnICIr/HtF
 ezOpT5zFC3PYM1n4LSnrvwieksUgaAhYCcwGUkUBCdTaiwsUtikXNPm3ORgL62aTcFBH
 bcXZuu3H76+/QF6hKDl92PqKtRtzNzs+0W3v/uAp1K0VpCRsacDnba1PgE4HG6WzHW9k
 dvxW+auewCrGtQLUB4U8hHgme6nqIMUO7Vr1SomiHwOVKTwoPpHu2tA3ut5i1dwG1k1E
 8ggQ==
X-Gm-Message-State: AOAM532wvCal5Gi2O0TPeV6dY4BQuO0Tqq84SKEtnRKffOqH+2FK6WgY
 iZyb8H68ZTN0BCB0dz8+yVnMCg==
X-Google-Smtp-Source: ABdhPJwTcHO4KrCPfUw3iSHIhZLnltFOhbr3H5nk97bvTp9MwwQAVb+hEeRyY6Sw2uMKCdPM5k6gAA==
X-Received: by 2002:a17:906:2584:b0:6d6:e5c9:221b with SMTP id
 m4-20020a170906258400b006d6e5c9221bmr24525869ejb.514.1647378892967; 
 Tue, 15 Mar 2022 14:14:52 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 h30-20020a056402095e00b00412b81dd96esm59349edz.29.2022.03.15.14.14.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:14:52 -0700 (PDT)
Message-ID: <69767a0f-a765-7149-381a-5ad3e07f4531@mind.be>
Date: Tue, 15 Mar 2022 22:14:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220301230504.1000454-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220301230504.1000454-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH/next 1/1] package/parted: bump to version 3.4
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



On 02/03/2022 00:05, Fabrice Fontaine wrote:
> Update indentation in hash file (two spaces)
> 
> https://git.savannah.gnu.org/cgit/parted.git/tree/NEWS?h=v3.4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/parted/parted.hash | 4 ++--
>   package/parted/parted.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/parted/parted.hash b/package/parted/parted.hash
> index 2c466eb8d2..392436ec4b 100644
> --- a/package/parted/parted.hash
> +++ b/package/parted/parted.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking pgp signature
> -sha256	57e2b4bd87018625c515421d4524f6e3b55175b472302056391c5f7eccb83d44  parted-3.3.tar.xz
> +sha256  e1298022472da5589b7f2be1d5ee3c1b66ec3d96dfbad03dc642afd009da5342  parted-3.4.tar.xz
>   
>   # Locally calculated
> -sha256	0abbff814cd00e2b0b6d08395af2b419c1a92026c4b4adacbb65ccda45fa58cf  COPYING
> +sha256  0abbff814cd00e2b0b6d08395af2b419c1a92026c4b4adacbb65ccda45fa58cf  COPYING
> diff --git a/package/parted/parted.mk b/package/parted/parted.mk
> index 66940fc516..23158179e4 100644
> --- a/package/parted/parted.mk
> +++ b/package/parted/parted.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PARTED_VERSION = 3.3
> +PARTED_VERSION = 3.4
>   PARTED_SOURCE = parted-$(PARTED_VERSION).tar.xz
>   PARTED_SITE = $(BR2_GNU_MIRROR)/parted
>   PARTED_DEPENDENCIES = host-pkgconf util-linux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
