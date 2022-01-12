Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA53C433EF
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 20:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2115460A92;
	Wed, 12 Jan 2022 20:42:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PWzhm_CPzYFJ; Wed, 12 Jan 2022 20:42:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CD0860ACC;
	Wed, 12 Jan 2022 20:42:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 226431BF578
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 20:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1046A60ACC
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 20:42:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tA8u0TWkUWgr for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 20:42:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E151C60A92
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 20:42:54 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id a18so14769121edj.7
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 12:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=crMIEfkA6dRDuU5HS+xMvEsZp741sHHkax/XdQmJaaQ=;
 b=PRdjCQSu1tbjdl5AALGEgOCw+Cm+1Fm1fsxysBgdn8v4ZPRBrwmKGkjW0ePYbfToJ1
 IxhXXV//dvPkLPpujEG5hAUaHTov9TiMQXsqW8IvAifUOu2T760tfaYB+2RrY6jvik+D
 LRM7kqBQxBoOv1prm9LCZy0zy4ykIPZNAGzMmhIVH13qNCSh8ezP4QbsPV0eadbwjxe4
 KjGwuAcRDQ/pO/98eCNe2KrkI3q/2MXfdi75RBmoyBj+84tmS5nUVuzH65xfqs8shm7m
 8sboixGU5y/KgtbiQCUPMj9htSmTs7JvzcJslXFE355L50rdBxmu/0U30OBYteZRBooa
 lCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=crMIEfkA6dRDuU5HS+xMvEsZp741sHHkax/XdQmJaaQ=;
 b=OEFh01tw5WZAslYFfSCoLVhVoAO/CKLAwErf0YOcE3sRftG8mzBNHPHFwsxY/FNnyB
 FYOgB3g1z2nvMjGnBbr5bxaIowwuQ5vCFaJ4Kwr26428xKkSQzBUt+dgEzwuRDO3tFuh
 twgP/2hcfPCLb67ybyGpgF2fPXpa3VtcvucZ+BaczZslvd12rb02jVcoxhXagePfhQu6
 r0mOXKJFNR1yQAiQZRfiwY3DOl5OXvt951q3vEzgw1BYkzKpiXrikYSjpO0GuElCfQDy
 qLJ1t3QDYfd5UpHGz7i8VWczdzxYBYsCkdvrb9aiI5EKY9pTXRJVX1fOiEarTBBqyiRy
 HQmQ==
X-Gm-Message-State: AOAM531d09gOAoJarKTtkDhZgezZb0+2b6WQCZEhSKKjBJwxyVbtGzHD
 oJLRYOrBcRd5j4zxEdOx9N9ngg==
X-Google-Smtp-Source: ABdhPJz1m0czOnE7B3IqJSoqSYPmlOtyn1rKclkKzdjb4f6400yoletThuYJ6aPYs/YWfBm116jJrA==
X-Received: by 2002:a05:6402:11ca:: with SMTP id
 j10mr1274682edw.169.1642020172956; 
 Wed, 12 Jan 2022 12:42:52 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r13sm320990edh.27.2022.01.12.12.42.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 12:42:52 -0800 (PST)
Message-ID: <e0fb6796-834f-f23f-a388-37c35b59ec99@mind.be>
Date: Wed, 12 Jan 2022 21:42:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1641663315.git.yann.morin.1998@free.fr>
 <91348c3073b0dcf57a8ea3227bae74c23a122713.1641663315.git.yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <91348c3073b0dcf57a8ea3227bae74c23a122713.1641663315.git.yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 2/3] core/pkg-generic: fixup all PPD paths
 in a generic fashion
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
Cc: Louis-Paul CORDIER <lpdev@cordier.org>,
 Andreas Naumann <anaumann@ultratronik.de>, Adam Duskett <aduskett@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/01/2022 18:35, Yann E. MORIN wrote:
> Some files contain hard-coded absolute paths that point to the host
> and/or staging directories.
> 
> With per-package directories (aka. PPD), these paths point to the PPD
> of the package that created the files, when we want them to point to the
> PPD of the package that uses them.
> 
> Up until now, we had two hooks that attempted to fix those files:
> 
>    - a libtool-specific hook that searches for all .la files and seds
>      them with the proper PPD,
> 
>    - a python-specific hook that tweaks just the sysconfigdata and
>      removes the byte-compiled version of the sysconfigdata.
> 
> But now, we also have a few other kinds of files for which we need to
> fix the PPD: .cmake, .pc, or .pri files, and probably a bunch of others
> as well.
> 
> We solve this issue by just replacing any PPD in text files, with the
> current package's PPD.
> 
> This is very similar to, and inspired from what is done when relocating
> the SDK. However, we can't use the existing relocate-sdk script, because
> that needs to know the original location, which we do not have when we
> aggregate the PPD (we could store it, but we can easily do without it).

  Looking at the resulting code, it's so small that it's not worth factoring out.

> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Adam Duskett <aduskett@gmail.com>
> Cc: Louis-Paul CORDIER <lpdev@cordier.org>
> Cc: Andreas Naumann <anaumann@ultratronik.de>
> ---
>   package/pkg-generic.mk | 43 +++++++++++++++++++++---------------------
>   1 file changed, 21 insertions(+), 22 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 6a5fe5507b..1022062bcf 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -90,21 +90,24 @@ endif
>   #######################################
>   # Helper functions
>   
> -# Make sure .la files only reference the current per-package
> -# directory.
> -
> -# $1: package name (lower case)
> -# $2: staging directory of the package
>   ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> -define fixup-libtool-files
> -	$(Q)find $(2) \( -path '$(2)/lib*' -o -path '$(2)/usr/lib*' \) \
> -		-name "*.la" -print0 | xargs -0 --no-run-if-empty \
> -		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$(1)/:g"
> +
> +# Ensure files like .la, .pc, .pri, .cmake, and so on, point to the
> +# proper staging and host directories for the current package: find
> +# all text files that contain the PPD root, and replace it with the
> +# current package's PPD.
> +define PPD_FIXUP_PATHS
> +	$(Q)grep -lrZ '$(PER_PACKAGE_DIR)/[^/]\+/' $(HOST_DIR) \

  This will trawl to large binary files and potentially take a long time...

> +	|while read -d '' f; do \
> +		file -b --mime-type "$${f}" | grep -q '^text/' || continue; \

... just to be ignored here.

  More importantly though: if a file is a symlink, it's going to be hit twice. 
Worse, if it's a symlink to an absolute path (which most likely points *outside* 
of STAGING_DIR), we may end up sed'ing something on the host...

  I notice now that the same (theoretical) issue exists in relocate-sdk.sh. 
Obviously that script doesn't get thoroughly tested so it may very well be the 
wrong thing to do...

  Do you remember perhaps why we don't simply do

find $(HOST_DIR) -type f -print0 \

? I was going to say that we can skip the grep, but then we're back at the large 
(text) file thing.

> +		printf '%s\0' "$${f}"; \

  Why not do the sed right here, like is done in relocate-sdk.sh? In fact, I'd 
keep the code as close as possible to relocate-sdk.sh to make later refactoring 
easier.

> +	done \
> +	|xargs -0 --no-run-if-empty \
> +		$(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'
>   endef
> -endif
>   
> -# Make sure python _sysconfigdata*.py files only reference the current
> -# per-package directory.
> +# Remove python's pre-compiled "sysconfigdata", as it may contain paths to
> +# the original staging or host dirs.
>   #
>   # Can't use $(foreach d, $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*, ...)
>   # because those directories may be created in the same recipe this macro will
> @@ -113,19 +116,15 @@ endif
>   # fail.
>   # So we just use HOST_DIR as a starting point, and filter on the two directories
>   # of interest.
> -ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
>   define FIXUP_PYTHON_SYSCONFIGDATA

  Maybe rename to REMOVE_PYTHON_SYSCONFIGATA_PYC

  Regards,
  Arnout

>   	$(Q)find $(HOST_DIR) \
>   		\(    -path '$(HOST_DIR)/lib/python*' \
>   		   -o -path '$(STAGING_DIR)/usr/lib/python*' \
>   		\) \
> -		\(    \( -name "_sysconfigdata*.pyc" -delete \) \
> -		   -o \( -name "_sysconfigdata*.py" -print0 \) \
> -		\) \
> -	| xargs -0 --no-run-if-empty \
> -		$(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'
> +		\( -name "_sysconfigdata*.pyc" -delete \)
>   endef
> -endif
> +
> +endif  # PPD
>   
>   # Functions to collect statistics about installed files
>   
> @@ -278,8 +277,6 @@ $(BUILD_DIR)/%/.stamp_configured:
>   	@$(call pkg_size_before,$(STAGING_DIR),-staging)
>   	@$(call pkg_size_before,$(BINARIES_DIR),-images)
>   	@$(call pkg_size_before,$(HOST_DIR),-host)
> -	$(call fixup-libtool-files,$(NAME),$(HOST_DIR))
> -	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
>   	$(foreach hook,$($(PKG)_POST_PREPARE_HOOKS),$(call $(hook))$(sep))
>   	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
>   	$($(PKG)_CONFIGURE_CMDS)
> @@ -836,7 +833,9 @@ $(2)_EXTRACT_CMDS ?= \
>   		$$(TAR_OPTIONS) -)
>   
>   # pre/post-steps hooks
> -$(2)_POST_PREPARE_HOOKS += FIXUP_PYTHON_SYSCONFIGDATA
> +$(2)_POST_PREPARE_HOOKS += \
> +	PPD_FIXUP_PATHS \
> +	FIXUP_PYTHON_SYSCONFIGDATA
>   
>   ifeq ($$($(2)_TYPE),target)
>   ifneq ($$(HOST_$(2)_KCONFIG_VAR),)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
