Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C4DC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A60840303;
	Sun,  9 Jan 2022 22:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xu1l8kuAjdlu; Sun,  9 Jan 2022 22:41:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9319D4030F;
	Sun,  9 Jan 2022 22:41:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B49031BF41C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A132B4010E
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:41:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 27eBULhR_us2 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:41:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D2CF400FB
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:41:20 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id s1so23421383wra.6
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 14:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=gPWBmvOm8/kteRAi1eQcopxppXlW+jPu3Gc9jymBbC8=;
 b=DQ9u/amX6somH1PUzSABnYAyCmbTFizc0JU5PNF2+Y4UAH2vsBdUl2hD2zr7v34UFU
 tz3GvzB2dRcIo+tVM0nITYHj03C4X8ti0/SWFKMLsJBBuqNoBq9jQA0TN/pu0zwl3viV
 3SeCYw8lpGUvzEApfW0SeaK/b5k/t3ibWovY2WASFV5XNC40UmW043r2qipYQLdXPMv+
 SdQ21fnEJq9RDc8Gwo0LbmJ1RtiycmFtq+PZI+ofXzKTZHJwIjJ4J5z8rM4QgiPn4/g3
 e2TNGj0Iy4L7HZaNxQQ00SazUizfXpvdcuEESjYoWFz4kQKNCio4hI+L7Xys5aS50vLD
 9obg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=gPWBmvOm8/kteRAi1eQcopxppXlW+jPu3Gc9jymBbC8=;
 b=E5Zn+ohkBSyTzPI1Coq0Kdfa1eyvUAdoyQWiVV0FOAl/irIxEXPe5IlxhOEU34U18V
 dzKCKBtOocf2JQi+6IYDEK5w60MYnP6IN9CUTDpyBv4UV5RmOHXf7ydOkWXhMicuGcT9
 PqVabacUG7QwtdpQMW62CJZ+kgvROo7fiS9UFYFO45JGBp43pglAMYbP9CXrwq4eQGU1
 W+pzkZLyEVuHVmrSNERKA+rzMESWey1UDVrnhoq/Kwl2LfKG2Qy/RvjW3OnzuoFDgeTY
 AFspmlRzzLyk4QRcoBogLLO0g1M7+ZO4Oq/naFwy8S8nXhIyeGi9QRIBmSYydDGQ5Kw3
 gWcg==
X-Gm-Message-State: AOAM5337CNSzGIBTkEZdUp3+LtX/15OQvqTwonvXXAd8Gogt7fJbYSor
 YUp6OsKDJN/o8uj46YsguOKe7LDeCn/EESww
X-Google-Smtp-Source: ABdhPJzmxjOmdXtJQrj82jVoXiFx14dB1zOnsdiz5g4RWJ8V4zvOE7JnPeOczGdvyRf5PCBCXZ+8ug==
X-Received: by 2002:adf:f94e:: with SMTP id q14mr38451570wrr.526.1641768078342; 
 Sun, 09 Jan 2022 14:41:18 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id n4sm4985261wrc.1.2022.01.09.14.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 14:41:17 -0800 (PST)
Message-ID: <e1b39b55-e3fe-8c92-056f-15f35bb9637a@mind.be>
Date: Sun, 9 Jan 2022 23:41:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20220109210607.2270978-1-romain.naour@smile.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220109210607.2270978-1-romain.naour@smile.fr>
Subject: Re: [Buildroot] [PATCH v2] package/moby-buildkit: new package
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



On 09/01/2022 22:06, Romain Naour wrote:
> From: Christian Stewart <christian@paral.in>
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> [Romain:
>    - remove host-pkgconf dependency
>    - Add the license file hash
>    - Fix the check-package warning in Config.in]
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

  Applied to master, thanks. I also added Christian to DEVELOPERS.

  Regards,
  Arnout

> ---
> 
> The license file hash was a copy past error.
> The 7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8 belong to
> balena-engine package from [1]
> 
> [1] https://git.buildroot.net/buildroot/commit/?id=cb0d87004c824dc6bb421fe8316428d51e1335bd
> ---
>   package/Config.in                        |  1 +
>   package/moby-buildkit/Config.in          | 19 +++++++++++++++++++
>   package/moby-buildkit/moby-buildkit.hash |  3 +++
>   package/moby-buildkit/moby-buildkit.mk   | 22 ++++++++++++++++++++++
>   4 files changed, 45 insertions(+)
>   create mode 100644 package/moby-buildkit/Config.in
>   create mode 100644 package/moby-buildkit/moby-buildkit.hash
>   create mode 100644 package/moby-buildkit/moby-buildkit.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index edae7e4f62..7bf17f486e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2554,6 +2554,7 @@ menu "System tools"
>   	source "package/mender/Config.in"
>   	source "package/mender-grubenv/Config.in"
>   	source "package/mfoc/Config.in"
> +	source "package/moby-buildkit/Config.in"
>   	source "package/monit/Config.in"
>   	source "package/multipath-tools/Config.in"
>   	source "package/ncdu/Config.in"
> diff --git a/package/moby-buildkit/Config.in b/package/moby-buildkit/Config.in
> new file mode 100644
> index 0000000000..93c852bcdb
> --- /dev/null
> +++ b/package/moby-buildkit/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_MOBY_BUILDKIT
> +	bool "moby-buildkit"
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC
> +	depends on BR2_USE_MMU
> +	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime dependency
> +	help
> +	  BuildKit is a toolkit for converting source code to build
> +	  artifacts in an efficient, expressive and repeatable manner.
> +
> +	  https://github.com/moby/buildkit
> +
> +comment "moby-buildkit needs a glibc or musl toolchain w/ threads"
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
> +	depends on BR2_USE_MMU
> diff --git a/package/moby-buildkit/moby-buildkit.hash b/package/moby-buildkit/moby-buildkit.hash
> new file mode 100644
> index 0000000000..3015e479f6
> --- /dev/null
> +++ b/package/moby-buildkit/moby-buildkit.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  0cc31aa4b6dcdead63b07d75e0b89495ecffcc183f4f62695d8bb507433fc8ff  moby-buildkit-0.8.1.tar.gz
> +sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
> diff --git a/package/moby-buildkit/moby-buildkit.mk b/package/moby-buildkit/moby-buildkit.mk
> new file mode 100644
> index 0000000000..3f0df351ef
> --- /dev/null
> +++ b/package/moby-buildkit/moby-buildkit.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# moby-buildkit
> +#
> +################################################################################
> +
> +MOBY_BUILDKIT_VERSION = 0.8.1
> +MOBY_BUILDKIT_SITE = $(call github,moby,buildkit,v$(MOBY_BUILDKIT_VERSION))
> +MOBY_BUILDKIT_LICENSE = Apache-2.0
> +MOBY_BUILDKIT_LICENSE_FILES = LICENSE
> +
> +MOBY_BUILDKIT_GOMOD = github.com/moby/buildkit
> +
> +MOBY_BUILDKIT_TAGS = cgo
> +MOBY_BUILDKIT_BUILD_TARGETS = cmd/buildctl cmd/buildkitd
> +
> +MOBY_BUILDKIT_LDFLAGS = \
> +	-X $(MOBY_BUILDKIT_GOMOD)/version.Version="$(MOBY_BUILDKIT_VERSION)"
> +
> +MOBY_BUILDKIT_INSTALL_BINS = $(notdir $(MOBY_BUILDKIT_BUILD_TARGETS))
> +
> +$(eval $(golang-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
