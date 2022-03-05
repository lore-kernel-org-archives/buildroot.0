Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A46FC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Mar 2022 15:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1452360AAF;
	Sat,  5 Mar 2022 15:09:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F1Xh7Tc6c2nu; Sat,  5 Mar 2022 15:09:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B310606E7;
	Sat,  5 Mar 2022 15:09:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E0491BF488
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 15:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CF1681373
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 15:09:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KJAFbasBbthl for <buildroot@lists.busybox.net>;
 Sat,  5 Mar 2022 15:09:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 596028136F
 for <buildroot@buildroot.org>; Sat,  5 Mar 2022 15:09:28 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id qt6so23175469ejb.11
 for <buildroot@buildroot.org>; Sat, 05 Mar 2022 07:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vPKvL6OfbNPAkfncNcVyryMR3qmvLjdOsYtfpdQX+zQ=;
 b=HIZefwC/KBoXiUxFnlUJNcZq5Qr9OvCqZRYlJqe2RdT4hHVAYDRKpbtlbhe4W6kWlc
 68cVveYamXMWZEE+Z5xkpbgoLLwOo7WlH6XDxIv6qmgF1P0ZkzQXGtiVLYNxbqWmNNxs
 icHEuhgadcQtHLo1nLNwwf9gaDIXEUJSmiz/gKvzyDHaQ7wJE3ElpeL+1chPltC1+6s3
 ag9wsdDLeZ74yoLsxFo4dq4RnwRflrUhDXnnmm9J0bs/B9NEThNC3kfPSjv3vcpdJhJx
 R+NNGlM56BDw4m+LT/khUbntOg1EfwWRMCQXCWyWdNfaGk1vPy6Uz1GFUK+o0NnjbenL
 XKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vPKvL6OfbNPAkfncNcVyryMR3qmvLjdOsYtfpdQX+zQ=;
 b=Q4psnWVsKtLhxtCgejan1FReIpJSeCWK2QVgrsuTOCadgx2gJteCH6MWWinQLxtgPs
 5Qef4S0lj8lICOc4V1soipvsL4FBc4vENVWGlHk/Eae0c0xwTsc/gXf02o4Xkxd1aq2x
 rWN4poETLtxnCZyoOMCg6n1b3OXuuk0LMPFKnFYFZAmNfqxDA3BsIXgkOAlkl5lpibKT
 Pm9Dy1eDGKAjFj0xfp+hkuWapC2gqTyuYnSzHsQxzQb0TeeRJNI8bQBpN2ofI9Ke8viQ
 lMD/Jea3RtFwM9UwYHY1rqZuGskT2WJxkZWOWVXgY48z8Z2nf32MNrzcPp/7F4tTY9sP
 1OuA==
X-Gm-Message-State: AOAM532BsoWHoHw8K3KjaksTrg0HOkQWSKNy19FPNESkZYLKyprhpC2t
 nTHEIhtzKlIg470jd1813IRNfg==
X-Google-Smtp-Source: ABdhPJwt7j/JCIh/VP5I0tfT0n5w8FaPjWI4Ud+qiOzd07XxR6ahuhupFckTtBZQMGvYKTAX6nH+Hg==
X-Received: by 2002:a17:906:a10:b0:6ce:7107:598b with SMTP id
 w16-20020a1709060a1000b006ce7107598bmr2963319ejf.653.1646492966310; 
 Sat, 05 Mar 2022 07:09:26 -0800 (PST)
Received: from ?IPV6:2a02:1811:b032:6b00:cb7e:b535:458f:f512?
 (ptr-cyunlkwzu35hsouvwnm.18120a2.ip6.access.telenet.be.
 [2a02:1811:b032:6b00:cb7e:b535:458f:f512])
 by smtp.gmail.com with ESMTPSA id
 cf17-20020a170906b2d100b006daa59af421sm2413874ejb.149.2022.03.05.07.09.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Mar 2022 07:09:25 -0800 (PST)
Message-ID: <2086ffec-82b8-ec71-41f0-55253c3cd8eb@mind.be>
Date: Sat, 5 Mar 2022 16:09:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20220215124619.563502-1-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220215124619.563502-1-nolange79@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] toolchain: support mismatched merged usr
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/02/2022 13:46, Norbert Lange wrote:
> Look at the case where the source toolchain has non-merged usr,
> yet the target will have merged usr.
> 
> sysroot/lib/ld-musl-x86_64.so.1 -> ../usr/lib/libc.so
> sysroot/usr/lib/libc.so

  Where do you get an external toolchain with such a weird layout? Normally libc 
is in sysroot/lib and ld-musl*.so.1 is a symlink to either /lib/libc.so or 
../lib/libc.so.


  Regards,
  Arnout

> 
> What happens is that buildroot copies the ld-*so* symlink
> into usr/lib, at which point it becomes broken.
> 
> We now detect these broken symlinks, then try to find the target
> binary in the library directories and fix the link.
> 
> Fix the case where the lib directory is a symlink, and no ld-*so*
> is installed by adding -H to find.
> 
> Also use `cp -t` instead of some rarely used xargs tricks.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>   toolchain/helpers.mk | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index ef8e9a5f64..aaf2aecd80 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -135,8 +135,17 @@ copy_toolchain_sysroot = \
>   			$(call simplify_symlink,$$i,$(STAGING_DIR)) ; \
>   		done ; \
>   	fi ; \
> -	if [[ ! $$(find $(STAGING_DIR)/lib -name 'ld*.so.*' -print -quit) ]]; then \
> -		find $${ARCH_SYSROOT_DIR}/lib -name 'ld*.so.*' -print0 | xargs -0 -I % cp % $(STAGING_DIR)/lib/; \
> +	for i in $$(find -H $(STAGING_DIR)/lib -name 'ld*.so.*' -xtype l); do \
> +		LINKTARGET=`readlink $$i`; \
> +		rm $$i; \
> +		NEWLINKTARGET=$$(find -H $(STAGING_DIR)/$${ARCH_LIB_DIR} $(STAGING_DIR)/lib $(STAGING_DIR)/usr/$${ARCH_LIB_DIR} $(STAGING_DIR)/usr/lib -name "`basename $${LINKTARGET}`" -print -quit); \
> +		if [ -n "$${NEWLINKTARGET}" -a -e "$${NEWLINKTARGET}" ]; then \
> +			ln -sr $${NEWLINKTARGET} $$i; \
> +			echo "Symlinking $$i -> `readlink $$i`" ; \
> +		fi; \
> +	done; \
> +	if [[ ! $$(find -H $(STAGING_DIR)/lib -name 'ld*.so.*' -print -quit) ]]; then \
> +		find $${ARCH_SYSROOT_DIR}/lib -name 'ld*.so.*' -print0 | xargs -0 cp -t $(STAGING_DIR)/lib/; \
>   	fi ; \
>   	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
>   		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
