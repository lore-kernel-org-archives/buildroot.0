Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268AEC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 15:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D670A82DE6;
	Sun,  3 Apr 2022 15:04:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZaK9faRcoI5h; Sun,  3 Apr 2022 15:04:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9E0C82C35;
	Sun,  3 Apr 2022 15:04:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 290E91BF96B
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 15:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17E834058E
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 15:04:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rV9vN7H3tNP3 for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 15:04:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24B9D405A5
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 15:04:10 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id b24so8209625edu.10
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 08:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vAqldAbqAl9RlHLp5vaIHcHQ0UxHUmFYLzTa+OgvQn8=;
 b=gdE+VRie+Pl4/1UJ9QIhuGkNk7nvdTUH0YQ+2PxQejzYvAquRlTJgQJybAChw2E7Yp
 9CROpp5AkTvdRmgRo+E83hHSXJ2G7l+KZ/u1mrpP4LP5QRN4MroMlFfkcR5RnPUZH6p2
 p7VSMu1V72Evp4Kn4Ve4HoCh+SDhAr/ddCi1sff+CCZDKoPxOJ2PL4A6Mrk3g4fkUkwx
 Kh4mJ9EQGUJ8AfwygmTH2EQxrbZlGsQ4kfzatmuPj3idt3df9Z08kAeapA4RG7excZlJ
 nkVBdbMw3xxCCSt9O7JxWbMYbuVYIm79Pkw4fSBWpK2912SL2HoLecD+JjpS9ASCr2mQ
 N7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vAqldAbqAl9RlHLp5vaIHcHQ0UxHUmFYLzTa+OgvQn8=;
 b=snMtITJJOmnJpm7+jLkmoppKbrIY7GVOaAG9BOnDTer8Gaa0D2K5kLdBqztUD7MhBo
 mv4Rg0QYczBKR2v95xwlhSDwZrAcaDoxGJRlKo6Uw8JxjN6DenWQlHH2cjvG0b1eDpx3
 T0yjlLLj2vQOE3YfYy2IjcQ1Gcto4Dq/gW8GZitBqmtUMNp0wjV/5vFxgbJrjfDuN61Z
 OuEC0cXmuqQQcSxYPswxfKayLwtdBFNZmNQSame7vqrz26ZZeSEbxLCwkuDUMKpyfk7P
 VLFN7BuT3Uam+GZ0mEI6fmqYhS923QynT8GChzOyLhe+WODhzbx99ORF4ObUT7ixZmOt
 QuEA==
X-Gm-Message-State: AOAM532yaeh6la3paLqKVPPxmsHf9SEP7thmoIuNw8heI/YOU9ZEQvdf
 xvjgEufIyUJLzUxAN+shNvx/XQ==
X-Google-Smtp-Source: ABdhPJzzq55r6IRC1eEf2jUgat7DA7HZu880jZGFXOSe1Mn5rg2CwoTj9QI46SWnDH2G8+GJZPsy0w==
X-Received: by 2002:a50:da8b:0:b0:415:a122:d7ad with SMTP id
 q11-20020a50da8b000000b00415a122d7admr29003213edj.123.1648998248160; 
 Sun, 03 Apr 2022 08:04:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:68f9:c8ef:77ab:7425?
 (ptr-9fplejof7ird5pjql2d.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:68f9:c8ef:77ab:7425])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a056402269600b004194f4eb3e7sm3998486edd.19.2022.04.03.08.04.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Apr 2022 08:04:07 -0700 (PDT)
Message-ID: <dd79b27a-3381-a207-4808-7c9864c6a81c@mind.be>
Date: Sun, 3 Apr 2022 17:04:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220402160718.750069-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220402160718.750069-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/fluidsynth: needs C++
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/04/2022 18:07, Fabrice Fontaine wrote:
> fluidsynth needs C++ since bump to version 2.2.0 in commit
> 7e02d2e762eb94fde1f222df1b960dbd263fa946 and
> https://github.com/FluidSynth/fluidsynth/commit/0d98c47545aa2424741c0cc2b244e4f73249302c:
> 
> CMake Error at CMakeLists.txt:32 (project):
>    No CMAKE_CXX_COMPILER could be found.
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/fe677f7b38c8ed7011f1c976bdb45768067936f7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/fluidsynth/Config.in | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/fluidsynth/Config.in b/package/fluidsynth/Config.in
> index 5726e235e4..376419ce8f 100644
> --- a/package/fluidsynth/Config.in
> +++ b/package/fluidsynth/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_FLUIDSYNTH
>   	# the .pc file installed by fluidsynth does not mention its
>   	# indirect dependencies in Libs.private.
>   	depends on !BR2_STATIC_LIBS
> +	depends on BR2_INSTALL_LIBSTDCPP
>   	select BR2_PACKAGE_LIBGLIB2
>   	help
>   	  FluidSynth is a real-time software synthesizer based on the
> @@ -128,7 +129,7 @@ config BR2_PACKAGE_FLUIDSYNTH_READLINE
>   
>   endif # BR2_PACKAGE_FLUIDSYNTH
>   
> -comment "fluidsynth needs a toolchain w/ threads, wchar, dynamic library"
> +comment "fluidsynth needs a toolchain w/ threads, wchar, dynamic library, C++"
>   	depends on BR2_USE_MMU
>   	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> -		BR2_STATIC_LIBS
> +		BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
