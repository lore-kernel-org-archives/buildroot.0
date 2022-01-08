Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8809DC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 17:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CCF460804;
	Sat,  8 Jan 2022 17:37:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BsaM05zXMhXO; Sat,  8 Jan 2022 17:37:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A6E0607F2;
	Sat,  8 Jan 2022 17:37:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B3B0F1BF2C6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2B30408B6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:37:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xt5mmRCuWD87 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 17:37:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6C44405A6
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 17:37:18 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id q8so17691245wra.12
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 09:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UPRO747TGbM9kHML7YYLhyu7ToXyMx5aSKXu5putBFQ=;
 b=AN4Pxtk4fXTb+F4n6UTM99jlMntzfkG6Wib+aWQ0sLqixfgepo/NZ4uhY01h6nxhcJ
 fFXmIdIXsTGAeru4tWkdLBXc6yLyXXCGCUsVU1uoLLYd42afdX8qZeWG8T3tTj2bjAnN
 KIco9yBYiiZmmldo0j1F6MBZAl4WgmqFj427wW9bPV20q1pUlR21wpNSXAhtLy84684M
 AXsLD1si3r7vbLNf4UIYLm7L9HckFKah6coOKHycSAOvMoJHc0Nawav8zxZeIHBEDypX
 17ebyEDfpT7i+mzLHAoXw6Hx4zefTPdR5uA68hm1n5tjjKFrLkOikceB27MaLqSjPZv6
 aRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UPRO747TGbM9kHML7YYLhyu7ToXyMx5aSKXu5putBFQ=;
 b=yT8qF8z2w1Z2nu2DXNp3PvPoc9ZnY0OKXkr39pf2ZMdFnR6Qa3C7XMYfHsqfmx/jXE
 4mXHHa2aaf8WKl9rhyCA5+zMpj0NH8vOvobjLRdc0/A8WGtGLJyWn3NiJeBnD+YUjUrc
 vbgoaxaucMN6jCvRxhVSWkdtNoVRRYFjNsEnA5W85O2LJRUphCaCI8D21pt6jPK/5liG
 izFzTvPhvjT0gC8hlkqeJmQoXj4jEkWr/eX5vXHg8YDZeNorBUJpmAGj/FEUrJm8oM57
 g8NoG4xjOizRQDZLWdH8StUHSH3wjrjWH3gwu1u3hyY4Py3ars5PLruskHn1VCldplPb
 K2MA==
X-Gm-Message-State: AOAM530g6kil9iLE8w4/i4KDN2my2fmvZB/X4dnZTe7oejj8yyELfryN
 nnwzKj1+37vYCLX45JaIawhMQQ==
X-Google-Smtp-Source: ABdhPJwKDw9SUkfOYBEa/QJ6QcsV0pPF/6x1FYH3pXqpVS/gn4IwoOfugfRNLcsfe03x0ltJZAo4Xw==
X-Received: by 2002:a05:6000:92:: with SMTP id
 m18mr59345713wrx.676.1641663437050; 
 Sat, 08 Jan 2022 09:37:17 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id d22sm2129651wmq.17.2022.01.08.09.37.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 09:37:16 -0800 (PST)
Message-ID: <6baa15d6-7df0-1aa7-71c5-dea500fe9bfb@mind.be>
Date: Sat, 8 Jan 2022 18:37:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Charlie Turner <cturner@igalia.com>, buildroot@buildroot.org
References: <20200429140729.3325-1-cturner@igalia.com>
 <20200429140729.3325-2-cturner@igalia.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200429140729.3325-2-cturner@igalia.com>
Subject: Re: [Buildroot] [PATCH 1/1] [RFC] add support for icecc
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
Cc: thomas.petazzoni@bootlin.com, Romain Naour <romain.naour@gmail.com>,
 yann.morin.1998@free.fr,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/04/2020 16:07, Charlie Turner wrote:
> Signed-off-by: Charlie Turner <cturner@igalia.com>
> ---
>   Config.in                      |  9 +++++++++
>   Makefile                       |  2 ++
>   toolchain/toolchain-wrapper.c  | 26 ++++++++++++++++++++++++++
>   toolchain/toolchain-wrapper.mk |  4 ++++
>   4 files changed, 41 insertions(+)
> 
> diff --git a/Config.in b/Config.in
> index 48fd36ff98..bda65e8daf 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -367,6 +367,15 @@ config BR2_CCACHE_USE_BASEDIR
>   
>   endif
>   
> +config BR2_ICECC
> +	bool "Enable distributed compilation"
> +	help
> +          Write a nice explanation.
> +
> +if BR2_ICECC
> +
> +endif
> +
>   config BR2_ENABLE_DEBUG
>   	bool "build packages with debugging symbols"
>   	help
> diff --git a/Makefile b/Makefile
> index ae29b042ec..30000b2390 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -472,6 +472,8 @@ BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(PATH)"
>   # should not be used as the root filesystem.
>   TARGET_DIR_WARNING_FILE = $(TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
>   
> +# FIXME: Add the appropriate stuff for BR2_ICECC for accelerated host
> +# builds?
>   ifeq ($(BR2_CCACHE),y)
>   CCACHE = $(HOST_DIR)/bin/ccache
>   BR_CACHE_DIR ?= $(call qstrip,$(BR2_CCACHE_DIR))
> diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> index 8cfc963ccd..3e6c9c2603 100644
> --- a/toolchain/toolchain-wrapper.c
> +++ b/toolchain/toolchain-wrapper.c
> @@ -28,6 +28,9 @@
>   #ifdef BR_CCACHE
>   static char ccache_path[PATH_MAX];
>   #endif
> +#ifdef BR_ICECC
> +static char icecc_path[PATH_MAX];
> +#endif
>   static char path[PATH_MAX];
>   static char sysroot[PATH_MAX];
>   /* As would be defined by gcc:
> @@ -59,6 +62,13 @@ static char _date_[sizeof("-D__DATE__=\"MMM DD YYYY\"")];
>   static char *predef_args[] = {
>   #ifdef BR_CCACHE
>   	ccache_path,
> +#endif
> +#if defined(BR_ICECC) && !defined(BR_CCACHE)
> +/* When icecc and ccache are used together, ccache is used as the

  Actually, I expect that combining the two (with a cluster of >5 machines) and 
with top-level parallel build) will slow down the build because the ccache 
calculations are not serialized and they're relatively expensive (on most object 
files, ccache is only a few times faster than just doing the compilation). So to 
simplify our life we could just make ccache and icecc mutually exclusive.

> + * wrapper, which then rewraps with icecc via the CCACHE_PREFIX
> + * environment variable, see below.
> + */
> +        icecc_path,
>   #endif
>   	path,
>   	"--sysroot", sysroot,
> @@ -312,6 +322,15 @@ int main(int argc, char **argv)
>   		return 3;
>   	}
>   #endif
> +
> +#ifdef BR_ICECC
> +        /* FIXME: hardcoding. Copy how ccache is installed in the abspath in output/host? */

  ccache is built by Buildroot itself. If you assume that icecc is 
pre-installed, you could just make the path a Config.in option and pass it in 
with a -D option, similar to e.g. BR_ABI. You can even reuse the BR_ICECC macro, 
i.e. -DBR_ICECC=\"$(call qstrip, $(BR2_ICECC_PATH))\"

> +	ret = snprintf(icecc_path, sizeof(icecc_path), "/home/cht/local/bin/icecc");
> +	if (ret >= sizeof(icecc_path)) {
> +		perror(__FILE__ ": overflow");
> +		return 3;
> +	}
> +#endif
>   	ret = snprintf(sysroot, sizeof(sysroot), "%s/" BR_SYSROOT, absbasedir);
>   	if (ret >= sizeof(sysroot)) {
>   		perror(__FILE__ ": overflow");
> @@ -532,6 +551,13 @@ int main(int argc, char **argv)
>   	}
>   #endif
>   
> +#if defined(BR_CCACHE) && defined(BR_ICECC)
> +        if (setenv("CCACHE_PREFIX", icecc_path, 0)) {

  Again, I don't think it's worth supporting the combination of the two.

  Regards,
  Arnout

> +		perror(__FILE__ ": Failed to set CCACHE_PREFIX");
> +		return 3;
> +	}
> +#endif
> +
>   	if (execv(exec_args[0], exec_args))
>   		perror(path);
>   
> diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
> index 09dda17890..1a8532208c 100644
> --- a/toolchain/toolchain-wrapper.mk
> +++ b/toolchain/toolchain-wrapper.mk
> @@ -39,6 +39,10 @@ ifeq ($(BR2_CCACHE),y)
>   TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE
>   endif
>   
> +ifeq ($(BR2_ICECC),y)
> +TOOLCHAIN_WRAPPER_ARGS += -DBR_ICECC
> +endif
> +
>   ifeq ($(BR2_x86_x1000),y)
>   TOOLCHAIN_WRAPPER_ARGS += -DBR_OMIT_LOCK_PREFIX
>   endif
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
