Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8957C433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 21:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 697BA405B6;
	Mon,  2 May 2022 21:55:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NHdG8dvLIZtk; Mon,  2 May 2022 21:55:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60ABF40580;
	Mon,  2 May 2022 21:55:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 611661BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FD38404E9
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:55:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZffMFGWKnnxo for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:54:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31843403BF
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:54:59 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id g20so18026417edw.6
 for <buildroot@buildroot.org>; Mon, 02 May 2022 14:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=dc1OPMr2E3391D2yV9LgHYJLKUVnkAJefhi4EQEjfNE=;
 b=NQXfUKkr3XQAXdiBq0f0gEGG7nsGqlD/JBDYUdrFXNb4b7lvlNMLA079afyGl/K/j8
 G0M1p/t8Z25CeyPrBdAE0F1dAi+j0mTyZzzZKUEXFFTeND/WC+CPb8UOL0ZRJnakkGSW
 /8R0J9+tVMo3aKbBBz7zhhMY+JBV3xtmOqXd5yd3tehPi71PwnREwgUowYuwS26WIReg
 /noO23GXAQXAt77BHlJGc/CuGHBCeKcG8t7ZQR5dgYXrXEheOiXp+wTqJll97EBWD6e5
 G7p58blpt/LbY5zqfXYDcIKXGzTbOd63ng66W9/jBaLMRTiacg8+WJRxHcinzhciy3wG
 ROqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dc1OPMr2E3391D2yV9LgHYJLKUVnkAJefhi4EQEjfNE=;
 b=pGS60QgMKGERSvc5jFqM/2gWvZDDvP+BFqS6dxAYrJAlZ+LV7WUYqxqvcwAC4on69b
 iJdrWNl+nF21/hz3W3IUT4zMVr+4fhz0VLIoFDa2Wr0uFXrC25qJ7rRLvlJZ4g15SH65
 ZEoF/SOsaFjPamNimM1SB0MHMztCXHmNCcWar0rxGH0QyRuCb/c7yp7wGkuW6lLjH9GW
 VeJIEUwyloHE4yMb0Gbl1HkiXzZO/Erad3HH76seGgcgYFuZ0Vcuxa9NvBqe+KtRM4t8
 qtXFCa2cyU0vW+pQ3jYPvtOLlHbstZTrKHgMa0J7pk8wkLVJElDwTdlJgFSsbmDYmbTv
 ciJw==
X-Gm-Message-State: AOAM532pvoqU9heurnTGs1Edva+3+hnA+yV1UdCgVIOkZyO01DeocfxR
 5sjHC8NYUdmW240iPckNxuXWgA==
X-Google-Smtp-Source: ABdhPJwtEOrBWLbSMEIFESs5edOx3kGP2/bDeu5Kn1vhVudxYGZCSPliP76be+oIaUi8npo0VP/gNQ==
X-Received: by 2002:aa7:da08:0:b0:425:af3c:196a with SMTP id
 r8-20020aa7da08000000b00425af3c196amr15237911eds.69.1651528497397; 
 Mon, 02 May 2022 14:54:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 zd21-20020a17090698d500b006f3ef214e4csm3979616ejb.178.2022.05.02.14.54.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:54:56 -0700 (PDT)
Message-ID: <dd4f3977-121a-c3e3-076e-2377ab483b51@mind.be>
Date: Mon, 2 May 2022 23:54:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Alexander Egorenkov <egorenar@linux.ibm.com>, buildroot@buildroot.org
References: <20220502054637.79491-1-egorenar@linux.ibm.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220502054637.79491-1-egorenar@linux.ibm.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/s390-tools: bump to version
 2.21.0
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



On 02/05/2022 07:46, Alexander Egorenkov wrote:
> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...kefile-no-pie-is-not-a-valid-ld-flag.patch | 29 -------------------
>   package/s390-tools/s390-tools.hash            |  2 +-
>   package/s390-tools/s390-tools.mk              |  6 ++--
>   3 files changed, 3 insertions(+), 34 deletions(-)
>   delete mode 100644 package/s390-tools/0004-zipl-boot-Makefile-no-pie-is-not-a-valid-ld-flag.patch
> 
> diff --git a/package/s390-tools/0004-zipl-boot-Makefile-no-pie-is-not-a-valid-ld-flag.patch b/package/s390-tools/0004-zipl-boot-Makefile-no-pie-is-not-a-valid-ld-flag.patch
> deleted file mode 100644
> index fcdf06088a8d..000000000000
> --- a/package/s390-tools/0004-zipl-boot-Makefile-no-pie-is-not-a-valid-ld-flag.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 9fd3c733c645be13a2e39a3bae3983f88530b48d Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Lukas=20M=C3=A4rdian?= <lukas.maerdian@canonical.com>
> -Date: Thu, 7 Jan 2021 12:46:22 +0100
> -Subject: [PATCH] zipl/boot/Makefile: -no-pie is not a valid ld flag
> -
> -The "-no-pie" option never has been a valid flag of ld. It breaks the build with newer binutils.
> -See:
> -https://sourceware.org/bugzilla/show_bug.cgi?id=27050
> -https://bugs.launchpad.net/ubuntu/+source/s390-tools/+bug/1907789
> -
> -[Retrieved from: https://github.com/ibm-s390-linux/s390-tools/pull/106]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - zipl/boot/Makefile | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/zipl/boot/Makefile b/zipl/boot/Makefile
> -index a2e5f190..b81df778 100644
> ---- a/zipl/boot/Makefile
> -+++ b/zipl/boot/Makefile
> -@@ -109,7 +109,7 @@ stage3.bin:	stage3.exec
> - 		$< $@
> -
> - data.o: $(FILES)
> --	$(LD) $(NO_PIE_LDFLAGS) -r -b binary -o data.o $(FILES)
> -+	$(LD) -r -b binary -o data.o $(FILES)
> -
> - data.h: data.o
> - 	rm -f data.h
> diff --git a/package/s390-tools/s390-tools.hash b/package/s390-tools/s390-tools.hash
> index 6ea8f7ea2076..dc9209856b00 100644
> --- a/package/s390-tools/s390-tools.hash
> +++ b/package/s390-tools/s390-tools.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  6fa6add92e896541c0ef74885a4084474fc0d77049e8ac7372872a70a46ddd74  s390-tools-2.20.0.tar.gz
> +sha256  d0f56fe4f6a62dda45ccd87191e42ebfaec82671ff4b96cc2229a7fe240ce072  s390-tools-2.21.0.tar.gz
>   sha256  cca17a9a944ebec769adee4aebd805c912c357785ff2705a99ffe68563021f75  LICENSE
> diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
> index 3c386af6fd10..040db78c05a6 100644
> --- a/package/s390-tools/s390-tools.mk
> +++ b/package/s390-tools/s390-tools.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -S390_TOOLS_VERSION = 2.20.0
> +S390_TOOLS_VERSION = 2.21.0
>   S390_TOOLS_SITE = $(call github,ibm-s390-linux,s390-tools,v$(S390_TOOLS_VERSION))
>   S390_TOOLS_LICENSE = MIT
>   S390_TOOLS_LICENSE_FILES = LICENSE
> @@ -12,9 +12,7 @@ S390_TOOLS_DEPENDENCIES = zlib
>   
>   S390_TOOLS_MAKE_OPTS = \
>   	ARCH=$(BR2_ARCH) \
> -	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
> -	LINK="$(TARGET_CC)" \
> -	LINKXX="$(TARGET_CXX)"
> +	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
>   
>   ifeq ($(BR2_PACKAGE_LIBCURL),y)
>   S390_TOOLS_DEPENDENCIES += libcurl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
