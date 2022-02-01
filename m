Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD51C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30892400CC;
	Tue,  1 Feb 2022 22:00:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EWDltAn91-tF; Tue,  1 Feb 2022 22:00:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED45F401DD;
	Tue,  1 Feb 2022 22:00:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C71C1BF424
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55B12401DD
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:00:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iBOb2uFMLxhM for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:00:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B02FC400CC
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:00:09 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id ah7so58313709ejc.4
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 14:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cJV6oUMTLtNWlE8RwcbxANJPwXSG0ZstCW9dicOvSo0=;
 b=MVsB2sHsZtH/TqWFD1UVE9LGdlqxf7uVJwEA8z1aFnkKgyufMZO2kbQdnHZHuGf8Ys
 hIyBYn0aUiXlqc3Sfw4H9W1ydRzGw/QrjrZRdMCFNFkKZgeJ4kTmGyFqmqKd9ImpT9Cc
 uahydk3sJRKpxPRMXxUomfpdE6CVYc4YgOv/vDMct0XZmJugrj3c5gBHafmZYZvIDHgz
 gd/9hgo2ZyR/xH6LmA/2mSWJ77c9fxfeAiVgjRstGJ5iWNxMkTOAWjAb2lVMNNO9QX3h
 xdGW9/fXjZD7PFVLt0YGVqrRzRnG9tYiPhi8oA8EpRCL2ZOe4rrhmUeMJT07amsdoVjZ
 p2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cJV6oUMTLtNWlE8RwcbxANJPwXSG0ZstCW9dicOvSo0=;
 b=dVCXSAfpa2F+zxapSTAfpHXO/WtWICAC/Ec5FTZoRo/6Cljh8+/zXZ2MAffwWPNOJq
 KqAuvVIohbmPjgei5RWMNSSwQc2Rm8uzqIJG82ty745hjY0KkciBpGFq1VBxqDB8uKhw
 NFuBcMnbNKh5ZjNd7lp4tXKkQEtj9agDMuQu+zw1j/ZoxE/YTa6QtAC0llS79CuxnfSH
 gTlyZ9778JgCMToPjcy2rG4QGqQ85/en68VoP8wqgTiDugI5ylfUV0b8CyPLxnvHTL5S
 IczownZOAfhMqA/kFENDggbgIw+8R9h0cI+3mGIjInSNIS0hiPTVsOyLkJJ/jPy6rtvp
 hKPg==
X-Gm-Message-State: AOAM533/KSb29WK6J01S2FTrN2Y6ehsvP7bulv936Os4iPBR7FVEJi4i
 zcCgBxw8LfWVucXVGT3pt/NIRw==
X-Google-Smtp-Source: ABdhPJyaYucrp2ZJo4BYxdQeZCuzZ16d7zPPE19ZmjqanRcyqRQ4yhbxtwGlMIT9OjbDx2cAZa1+cw==
X-Received: by 2002:a17:907:c003:: with SMTP id
 ss3mr22509881ejc.349.1643752807778; 
 Tue, 01 Feb 2022 14:00:07 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s7sm14957615ejo.53.2022.02.01.14.00.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 14:00:07 -0800 (PST)
Message-ID: <df787435-b1b1-30aa-dc11-3fff9787c86d@mind.be>
Date: Tue, 1 Feb 2022 23:00:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20220125221533.17535-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220125221533.17535-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v2] package/util-linux: bump version to
 2.37.3 (fixes CVE-2021-3996, CVE-2021-3995)
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/01/2022 23:15, Peter Seiderer wrote:
> - add 'touch' workaround for missing disk-utils/raw.8 file ([1], [2]) in
>    util-linux-2.37.4 release download package

2.37.3 I assume.

> 
> For details see [1].
> 
> [1] https://www.spinics.net/lists/util-linux-ng/msg17037.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Changes v1 -> v2:
>    - add workaround for missing disk-utils/raw.8 file
> ---
>   package/util-linux/util-linux.hash | 2 +-
>   package/util-linux/util-linux.mk   | 9 ++++++++-
>   2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
> index eafbe9254a..9c10a42dca 100644
> --- a/package/util-linux/util-linux.hash
> +++ b/package/util-linux/util-linux.hash
> @@ -1,5 +1,5 @@
>   # From https://www.kernel.org/pub/linux/utils/util-linux/v2.37/sha256sums.asc
> -sha256  6a0764c1aae7fb607ef8a6dd2c0f6c47d5e5fd27aa08820abaad9ec14e28e9d9  util-linux-2.37.2.tar.xz
> +sha256  590c592e58cd6bf38519cb467af05ce6a1ab18040e3e3418f24bcfb2f55f9776  util-linux-2.37.3.tar.xz
>   # License files, locally calculated
>   sha256  869660b5269f4f40a8a679da7f403ea3a6e71d46087aab5e14871b09bcb55955  README.licensing
>   sha256  9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index cf0fee409b..baf9ed3406 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -8,7 +8,7 @@
>   # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
>   
>   UTIL_LINUX_VERSION_MAJOR = 2.37
> -UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
> +UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).3
>   UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
>   UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
>   
> @@ -267,6 +267,13 @@ else
>   UTIL_LINUX_CONF_OPTS += --without-libmagic
>   endif
>   
> +# workaround missing disk-utils/raw.8 file in util-linux-2.37.4

  2.37.3 as well.

  I moved this hunk to the beginning of the file, to increase the chance that it 
is noticed on next bump (which hopefully makes it unneeded).

> +# release download package
> +define UTIL_LINUX_FIX_DISK_UTILS_COMPILE
> +	touch $(@D)/disk-utils/raw.8
> +endef
> +UTIL_LINUX_PRE_BUILD_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE

  I moved this to a post-patch instead of pre-build hook.


  Applied to master, thanks.

  Regards,
  Arnout

> +
>   # Install PAM configuration files
>   ifeq ($(BR2_PACKAGE_UTIL_LINUX_SU)$(BR2_PACKAGE_LINUX_PAM),yy)
>   define UTIL_LINUX_INSTALL_PAMFILES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
