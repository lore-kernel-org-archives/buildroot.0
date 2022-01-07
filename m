Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EABC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 22:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB49F60B4E;
	Fri,  7 Jan 2022 22:10:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qMjp-jtwFCd1; Fri,  7 Jan 2022 22:10:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0710260745;
	Fri,  7 Jan 2022 22:10:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 426211BF30A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F53081775
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PQeB25xGsWzZ for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 22:10:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5521281467
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 22:10:28 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id l25so2730428wrb.13
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 14:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GJhX0zXsaoNaVz7SdoucIdrCjJjMnO+QHVGiOw+1l/k=;
 b=FuVt4t9Kbm+coYIWoCrYXg1Zl5wks/BfTihone4svZOA/N1m27J/dB6SEONU9QvCNG
 qVFPdkZGLihPtTUroKKgi421relDhH0bRWA07kAFyGvZfbPPC+wbYCeQbq5wNOmpW5QN
 oY3wfT3rwy/mNfj+Vis3Kmm/WmxtVGYShs9w4AY+tPiXMiaHyDAIs4W6ZB2D6286by3G
 BAAKvQdosNy8VweIls2XIPF04zJIF8TQNgKPg2PITj4l6k2SFe+wgMhVX88VEJ3QNAMk
 8yB3+jddWGBAQZjXXQ8s+74xkrPNo/5crZSh0IC7CoM0p+KNvdzcooGOzqpdOMElYIMU
 yFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GJhX0zXsaoNaVz7SdoucIdrCjJjMnO+QHVGiOw+1l/k=;
 b=oK2QrOjHkmgZ/FsaXrj3UOq70v12muSCH5+qt2411nxu1L/YKfFJ+cj2/NqHIQRz3A
 frIzjNL/y9zBFCLsplwWZMNuaTi4cnELELDtawH8slKOSDTIfa/Umsw7Caz0Y1CNH70k
 cOt20x7d6Zm2lJsiSOrGp64hV8w5j6UgkMMOoT0wdniYzh4DAjuVCNBdObGR6vJwMSZd
 4YL/7/PLvDaMz7Lj6RBevt7JnqTauMI7o06t6kxQTc3kl+vHTvxuOmtolvfHh84AgUzy
 SRWWRBrUQBu7Txwxj6XF70LS3Cm0CPEAD9E2WyfuTjb1b7R5SooW5d4E3gDFvnNWMCjc
 xsQQ==
X-Gm-Message-State: AOAM531qOQ9eRwEWZZtThkltb5Ii4atoT2M18DeCLdCyNDHU3Nk9lZnj
 lEyn4cWnyz19RCsOmDyJfWaTTw==
X-Google-Smtp-Source: ABdhPJywWP8lMzyOqgTK8hpWj3gvRZmZf39CMwZ0yjjku4nG5vIhlAPGgf8d3knrPaq25mtFxRXaxw==
X-Received: by 2002:a5d:6685:: with SMTP id l5mr7205236wru.588.1641593426547; 
 Fri, 07 Jan 2022 14:10:26 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id g8sm5260586wmh.17.2022.01.07.14.10.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 14:10:26 -0800 (PST)
Message-ID: <219ad3fa-0ae0-c979-b9cb-879dddf3f7f4@mind.be>
Date: Fri, 7 Jan 2022 23:10:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
References: <20200407111515.21131-1-jagan@amarulasolutions.com>
 <20200407111515.21131-3-jagan@amarulasolutions.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200407111515.21131-3-jagan@amarulasolutions.com>
Subject: Re: [Buildroot] [PATCH v8 2/5] package/python-numpy: fixup
 npymath.ini for numpy extensions
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
Cc: Esben Haabendal <esben@geanix.com>,
 Guillaume William Bres <guillaume.bressaix@gmail.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/04/2020 13:15, Jagan Teki wrote:
> From: Esben Haabendal <esben@geanix.com>
> 
> Inorder to build the numpy distutils extension packages like
> python-scipy, python-numba, it require an explicit pkg-config
> path fixup for npymath.ini.
> 
> This pkg-config path fixup would update the prefix path of
> npymath.ini with actual target staging area where numpy core
> was built, so-that numpy distutils extension packages would
> explicitly link this config path for their package environment.
> 
> Without this extension packages cannot find -lnpymath since
> it uses host libraries (like libnpymath.a).
> 
> So, attach the post install staging hook with pkg-config
> path fixup for npymath.ini.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes for v8:
> - none
> Changes for v7:
> - rephrase commit and comments of fixup npymath.ini
> 
>   package/python-numpy/python-numpy.mk | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
> index 3f0df7a640..4d2e852b43 100644
> --- a/package/python-numpy/python-numpy.mk
> +++ b/package/python-numpy/python-numpy.mk
> @@ -32,6 +32,21 @@ define PYTHON_NUMPY_CONFIGURE_CMDS
>   	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
>   endef
>   
> +# Fixup the npymath.ini prefix path with actual target staging area where
> +# numpy core was built. Without this, target builds using numpy distutils
> +# extensions like python-scipy, python-numba cannot find -lnpymath since
> +# it uses host libraries (like libnpymath.a).
> +# So, the numpy distutils extension packages would explicitly link this
> +# config path for their package environment.
> +PYTHON_NUMPY_STAGING_DIR = $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy
> +PYTHON_NUMPY_NPY_PKG_CONFIG_PATH=$(PYTHON_NUMPY_STAGING_DIR)/core/lib/npy-pkg-config
> +define PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES
> +	sed -e '/^pkgdir=/d' \
> +	    -e '/^prefix=/i pkgdir=$(PYTHON_NUMPY_STAGING_DIR)/core' \
> +	    -i $(PYTHON_NUMPY_NPY_PKG_CONFIG_PATH)/npymath.ini
> +endef
> +PYTHON_NUMPY_POST_INSTALL_STAGING_HOOKS += PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES
> +
>   # Some package may include few headers from NumPy, so let's install it
>   # in the staging area.
>   PYTHON_NUMPY_INSTALL_STAGING = YES
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
