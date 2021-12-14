Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C27C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 20:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABA2660C30;
	Tue, 14 Dec 2021 20:09:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ygVGMGByrsIa; Tue, 14 Dec 2021 20:09:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28AE460BF6;
	Tue, 14 Dec 2021 20:09:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE4101BF30E
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB51B60BF6
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:09:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ci_6H6bHtvgG for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 20:09:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E530860BF3
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 20:09:19 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id y13so66683916edd.13
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 12:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=41Hu3EsVEGCje763r+kKiS0VBRUQ88fBfdSU8IwAPJY=;
 b=QHMu8SwT3gluvsZyMCLbj6euFakJzx4l6f+ojFVCY6BRbLDu4I0sYYi+0kM1ISYX02
 rkOj0szhR8XOeAneLePqCFO0unmqwIViEhsT2MI61vU0ilbreq647R3yTdofe0l7l9ji
 Nq5WBVtH6gk9v/qctUnWmaI/fKvUycrg4aHrveYnCKMRY9sC02Xvh1MpbVyqrU2uorFw
 nFNFq8/Y0zSs7dKNc2+RYkLt/xsyQ1ziDO+AltQJ/erubHH8oUgmkDvt1pTcM0/yq3KR
 qNhYWinTSsYZRV1Hsosr9QB66LcdoYKkKDqoGIGRQgnEJkEkZxgG0wW5BC/fHe3f7UPl
 o7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=41Hu3EsVEGCje763r+kKiS0VBRUQ88fBfdSU8IwAPJY=;
 b=oHa3j1zMZi02bKx6yIY1oGgA2vRj1EWEXUA712pIEwNTNr9GNwFk6CyoiwL0NXLQLL
 HW63+jrTippGrkn0a8q0mZJJ1v1qrlHSYKgj4OChEU8R0ePSARMlmmtYnkxj3ZSaH8Cx
 FS9bBuM0rcB05gYW/HJPXrl0g5vk6bHuJUBb0btMzLC0rgXChcHtnGSnfL//RGZU70QC
 Tza5TsHscVtrIFpekJ3RhytfLQPHWIvh316T9gRk898iCF5z+j+o8nMnqLKzqzzrR3Tr
 sx4XURoeLRi8NTLVkF7dK2PMmDxVNGvFQHF12skbpS5ctTuwvc3lMSh+KHbmXF7x5SG9
 nuVw==
X-Gm-Message-State: AOAM533q0DOSrkBjFV0pdQiaCUpkmrQJo+zLGsmvb4eZ41FRZ21I/1LJ
 mHkQQ9PhuqhkhCTdlgXFGneqiJc4MCRxHw==
X-Google-Smtp-Source: ABdhPJw8cYJ6COMCBFlm90z9gF4db6hwQJgLCLaMxRV/U7uz3uUsbMz/lfH3AT7FcR2fa9Ga3j3H+Q==
X-Received: by 2002:a50:8dcb:: with SMTP id s11mr10678843edh.125.1639512558290; 
 Tue, 14 Dec 2021 12:09:18 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id eg8sm300870edb.75.2021.12.14.12.09.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 12:09:17 -0800 (PST)
Message-ID: <3f05604a-0c2e-99ea-984f-204a7a97b444@mind.be>
Date: Tue, 14 Dec 2021 21:09:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211213213337.1775232-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211213213337.1775232-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/moarvm: enable on sparc and
 sparc64
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



On 13/12/2021 22:33, Fabrice Fontaine wrote:
> sparc and sparc64 are supported since version 2020.09 and
> https://github.com/MoarVM/MoarVM/commit/87ad486f30ecdf28b4abbcf40139467f626f8548
> https://github.com/MoarVM/MoarVM/commit/34e0fb55e33482fe09083627eb54003bde07d8a7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Both applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/moarvm/Config.in | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/package/moarvm/Config.in b/package/moarvm/Config.in
> index acef8f5d61..ec38047b2d 100644
> --- a/package/moarvm/Config.in
> +++ b/package/moarvm/Config.in
> @@ -4,8 +4,6 @@ config BR2_PACKAGE_MOARVM
>   	depends on !BR2_STATIC_LIBS # libuv
>   	depends on BR2_USE_MMU # libuv
>   	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS # libatomic_ops
> -	# needs AO_fetch_compare_and_swap, not implemented for sparcv8/sparcv9
> -	depends on !BR2_sparc64 && !BR2_sparc
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
>   	select BR2_PACKAGE_LIBUV
>   	select BR2_PACKAGE_LIBTOMMATH
> @@ -26,5 +24,4 @@ comment "moarvm needs a toolchain w/ NPTL, dynamic library"
>   	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
>   	depends on BR2_USE_MMU
>   	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
> -	depends on !BR2_sparc64 && !BR2_sparc
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
