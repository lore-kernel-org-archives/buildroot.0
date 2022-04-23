Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC73C433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 16:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9048E83E08;
	Sat, 23 Apr 2022 16:27:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id djtUO4NG_0zM; Sat, 23 Apr 2022 16:27:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDAEE83E28;
	Sat, 23 Apr 2022 16:27:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 138441BF5DF
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C15683E09
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:27:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 98LO-M_JCMmO for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 16:26:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F1C7D83E0B
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 16:26:58 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id bv19so21821605ejb.6
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 09:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=3J8YZMcxd1W2AEQgYs8EwMQxpq5m4xOjC8c8+nm8Wsw=;
 b=WP20j+6iNftYNyS+shmvgtjcuA3jNNs+SgQhvrrMNpKq13EDgHwhWqhOssdXwf3sjL
 Cd4cow5QW/DomFbL21ta+QDCmsmDtr7eFlf666lSg8V1JdnBh0JiSs5lLPcLqIxhBxGU
 DXsoEtGV+rkvjWMCRHSGndBzX1vRBEcFpq3hp2CCHqqmnYNNnm/8QtTHg3x4huBQXvDm
 lrjAD5Kz6u2sVf6j3DJwBdAnbdlD3Z7DfwaJu26JbpHUQkFpk/i1Thcv8N8E6Tyc99Kv
 rV7psBiN/pBXPHH3WTTTLkVuSd+XHV+P4dnELz7AUO+508qkey4I+tbuNY8kIrgvS8SI
 6iLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3J8YZMcxd1W2AEQgYs8EwMQxpq5m4xOjC8c8+nm8Wsw=;
 b=Y0dR4qfaDLmVVgb/Tw0kvJhCYAlj007m4oMUkGOKDMx/sBlviszuttDKm3tuoV6K4k
 YnJBObZ0RGdfi9gIjze/SNo3voppQG5I+eTsw9DF7U5syjvgtdJsF1UdS52BnzxYFoia
 5+W6iPLCwf9ZqjkDHyP65ObIc914Tbd/aJfYQjrTnhmAT1Z7TsFmDfhayMwSd+qK/UVP
 Gk6Dq3QE38Hc5MDlhBlAMZcMXtubhuMiF3yZZ6rrRtx6JDN5UGaH54ILp/x2T3vLuUfc
 EiN1LOOxwwLMBXxAQL96WNdHEPiFaTlVZ6aOgzbCSNfqbhEFg6cFs7DICRiS3goHEDfH
 b+hQ==
X-Gm-Message-State: AOAM533y11xh77SbIDscalBBRuPji5P9GLLYjl6lKQ6AukR+4jMdEmEC
 p3b7zV8EjO/nVa44DgImLNCF5ym1k7701w==
X-Google-Smtp-Source: ABdhPJyI4Wpfo4vC3HTvWOTFXsHw6iwNKbZflcTHVNB6j24CcL2JwOuX0RrErfxjG5wFvgYF5dBysQ==
X-Received: by 2002:a17:907:c27:b0:6f0:270c:1121 with SMTP id
 ga39-20020a1709070c2700b006f0270c1121mr9103543ejc.137.1650731216988; 
 Sat, 23 Apr 2022 09:26:56 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 w7-20020a1709061f0700b006ec8197e8a4sm1822220ejj.97.2022.04.23.09.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 09:26:56 -0700 (PDT)
Message-ID: <7ee46221-720f-0cc0-d2a0-9dcaef44dd7f@mind.be>
Date: Sat, 23 Apr 2022 18:26:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20220420200102.2420626-1-yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220420200102.2420626-1-yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] package/wtfutil: new package
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



On 20/04/2022 22:01, Yann E. MORIN wrote:
> Some of wtfutils modules (i.e. plugins) can call to external tools, so
> it needs to fork(), so needs an MMU.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> 
> ---
> $ ./utils/test-pkg -c wtf.cfg -d $(pwd)/test-pkg -k -p wtfutil -a
>                               andes-nds32 [ 1/45]: SKIPPED
>                               arm-aarch64 [ 2/45]: OK
>                     bootlin-aarch64-glibc [ 3/45]: OK
>                 bootlin-arcle-hs38-uclibc [ 4/45]: SKIPPED
>                      bootlin-armv5-uclibc [ 5/45]: OK
>                       bootlin-armv7-glibc [ 6/45]: OK
>                     bootlin-armv7m-uclibc [ 7/45]: SKIPPED
>                        bootlin-armv7-musl [ 8/45]: OK
>                  bootlin-m68k-5208-uclibc [ 9/45]: SKIPPED
>                 bootlin-m68k-68040-uclibc [10/45]: SKIPPED
>               bootlin-microblazeel-uclibc [11/45]: SKIPPED
>                  bootlin-mipsel32r6-glibc [12/45]: SKIPPED
>                     bootlin-mipsel-uclibc [13/45]: SKIPPED
>                       bootlin-nios2-glibc [14/45]: SKIPPED
>                   bootlin-openrisc-uclibc [15/45]: SKIPPED
>          bootlin-powerpc64le-power8-glibc [16/45]: OK
>             bootlin-powerpc-e500mc-uclibc [17/45]: SKIPPED
>                     bootlin-riscv32-glibc [18/45]: SKIPPED
>                     bootlin-riscv64-glibc [19/45]: SKIPPED
>                      bootlin-riscv64-musl [20/45]: SKIPPED
>                        bootlin-sh4-uclibc [21/45]: SKIPPED
>                     bootlin-sparc64-glibc [22/45]: SKIPPED
>                      bootlin-sparc-uclibc [23/45]: SKIPPED
>                      bootlin-x86-64-glibc [24/45]: OK
>                       bootlin-x86-64-musl [25/45]: OK
>                     bootlin-x86-64-uclibc [26/45]: OK
>                     bootlin-xtensa-uclibc [27/45]: SKIPPED
>                              br-arm-basic [28/45]: OK
>                      br-arm-full-nothread [29/45]: OK
>                        br-arm-full-static [30/45]: SKIPPED
>                     br-i386-pentium4-full [31/45]: OK
>                  br-i386-pentium-mmx-musl [32/45]: OK
>                        br-mips64-n64-full [33/45]: OK
>                   br-mips64r6-el-hf-glibc [34/45]: SKIPPED
>                 br-powerpc-603e-basic-cpp [35/45]: SKIPPED
>                 br-powerpc64-power7-glibc [36/45]: SKIPPED
>                         linaro-aarch64-be [37/45]: SKIPPED
>                            linaro-aarch64 [38/45]: OK
>                                linaro-arm [39/45]: OK
>                       sourcery-arm-armv4t [40/45]: SKIPPED
>                              sourcery-arm [41/45]: OK
>                       sourcery-arm-thumb2 [42/45]: OK
>                           sourcery-mips64 [43/45]: FAILED
>                             sourcery-mips [44/45]: SKIPPED
>                            sourcery-nios2 [45/45]: SKIPPED
> 45 builds, 26 skipped, 1 build failed, 0 legal-info failed, 0 show-info failed
> 
> The failing one is not even a build failure of wtfutil itself, but
> really just host-go that fails to build, because of some issues because
> of missing GOMIPS64 setting for soft-float, which when fixed opens
> another can of worms of itself...
> ---
>   package/Config.in            |  1 +
>   package/wtfutil/Config.in    |  8 ++++++++
>   package/wtfutil/wtfutil.hash |  2 ++
>   package/wtfutil/wtfutil.mk   | 12 ++++++++++++
>   4 files changed, 23 insertions(+)
>   create mode 100644 package/wtfutil/Config.in
>   create mode 100644 package/wtfutil/wtfutil.hash
>   create mode 100644 package/wtfutil/wtfutil.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 20d7156cea..f1e8b64e0d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2500,6 +2500,7 @@ comment "Utilities"
>   	source "package/tmux/Config.in"
>   	source "package/ttyd/Config.in"
>   	source "package/which/Config.in"
> +	source "package/wtfutil/Config.in"
>   	source "package/xmlstarlet/Config.in"
>   	source "package/xxhash/Config.in"
>   	source "package/ytree/Config.in"
> diff --git a/package/wtfutil/Config.in b/package/wtfutil/Config.in
> new file mode 100644
> index 0000000000..8c3efcea5d
> --- /dev/null
> +++ b/package/wtfutil/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_WTFUTIL
> +	bool "wtfutil"
> +	depends on BR2_USE_MMU  # fork()
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	help
> +	  WTF is the personal information dashboard for your terminal.
> +
> +	  https://wtfutil.com/
> diff --git a/package/wtfutil/wtfutil.hash b/package/wtfutil/wtfutil.hash
> new file mode 100644
> index 0000000000..deb162794e
> --- /dev/null
> +++ b/package/wtfutil/wtfutil.hash
> @@ -0,0 +1,2 @@
> +sha256  d15b2e8833d31d5b1ad7b4317777dc7aa045124d1d91994f02c9b5709f09fef3  wtfutil-0.41.0.tar.gz
> +sha256  b59f3dbd83c6aa4e003b6eafa80bc53f0629e4d164e8b125c56869c2603dbc8f  LICENSE.md
> diff --git a/package/wtfutil/wtfutil.mk b/package/wtfutil/wtfutil.mk
> new file mode 100644
> index 0000000000..6e841411a9
> --- /dev/null
> +++ b/package/wtfutil/wtfutil.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# wtfutil
> +#
> +################################################################################
> +
> +WTFUTIL_VERSION = 0.41.0
> +WTFUTIL_SITE = $(call github,wtfutil,wtf,v$(WTFUTIL_VERSION))
> +WTFUTIL_LICENSE = MPL-2.0
> +WTFUTIL_LICENSE_FILES = LICENSE.md
> +
> +$(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
