Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C47C433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 23:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E224740164;
	Mon, 31 Jan 2022 23:01:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b3AxF0GAPqXp; Mon, 31 Jan 2022 23:01:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1A5E40189;
	Mon, 31 Jan 2022 23:01:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A3B41BF836
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 23:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44B6F41498
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 23:01:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q_u7SBMUcidp for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 23:01:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A82904148D
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 23:01:01 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id me13so47940306ejb.12
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 15:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=m4Ler/vK4y3eXdbsOhLG0y4WtR5n2lJ4S3fCzxqX6dg=;
 b=JMdPHZ7IucIfgFIANyVbCsq0y4lswiKQW9lydx2vHvg+en85w88RT/CQnYqAGkXSNP
 PoO262l5urwPIi/DTb0nMxzytHxY67yBxq+MP0FNPPGpei+6uuVeYUEWsbjyumHuiykZ
 HSK54qHds9Rn2arCOgKmUM7KW+PugFRIDh3VUrsoHy4cXzlWsycMNF93OdCg6Jt8+5MR
 mgV8ndFfwc+s6YTz0RRKk/Z5yYHp6xvzcA18W17vyWdBaUv0pu3q3rAf/fG/QemdYPOn
 d3uVk8YHtT8PCDLBOUQvSLXmJPH+PVgEJ2NSuBcX1wG4hdiqcLDgYqEQWZmLRtD+7dki
 S1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=m4Ler/vK4y3eXdbsOhLG0y4WtR5n2lJ4S3fCzxqX6dg=;
 b=zRnJCnkYY8iWZuRkTP+osJNGNw+FYaG2C6v4zu33SMPKeULa7v6ifimjXkZOHa77DV
 T7C6kJ5QkNJ2T/Z1/Yx3/0Q1fkKEDy8bVDU2JwXh8pwM6Tk0bG6LNnXeDz1symBcM2tG
 6gry/V+h33fgnR6PBb++GzVoZa64Pz3T5IKpe9Mpq1IBykkJgoloGT81rgjAlsgkKXI4
 lqUzVxgwd/omWfLNLGnp6LACIga0JJchwvednTbOQUGSLq/XU2aU/nEksVqCm/7eZsEP
 DN3ej0fSY3VrjkFDarJ9sdwtHDhC7bmy7GzwDBVPxkSwQCurvJXGAyzmOct3+clfCEju
 D4uA==
X-Gm-Message-State: AOAM533mk8z5ob9uT++SNHd1KVaJ2WfM6sHQvL0dPfVu/L5l1ALnkT5A
 MDWZNhGjT6nBui45kG1oGhwDQl5M8KKPCw==
X-Google-Smtp-Source: ABdhPJwsegcbClYLP5awDVQOcW+jStY1tuWm+eJ1pWcCbIwfdIqynH/0BnkLeudIP/fAm3wHc5hSPw==
X-Received: by 2002:a17:906:4d2:: with SMTP id
 g18mr19387161eja.133.1643670059369; 
 Mon, 31 Jan 2022 15:00:59 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id gg14sm13885785ejb.63.2022.01.31.15.00.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 15:00:58 -0800 (PST)
Message-ID: <44572e0d-1989-106f-65fa-4b784427e15b@mind.be>
Date: Tue, 1 Feb 2022 00:00:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org,
 Peter Seiderer <ps.report@gmx.net>
References: <20211203215438.213437-1-nolange79@gmail.com>
 <20211203215438.213437-2-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211203215438.213437-2-nolange79@gmail.com>
Subject: Re: [Buildroot] [PATCH v3 2/2] package/pkg-meson: improve
 generation of cross-compilation file
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/12/2021 22:54, Norbert Lange wrote:
> Removed a few variables, as they were only used to communicate
> between the meson package and pkg-meson.mk and are not needed
> anymore.
> 
> Moved cross-compilation.conf.in out of meson package.
> 
> Creating the cross-compilation.conf files for packages is now
> using the original template.
> To avoid duplicate code, the common sed pattern is stored in
> a make variable.
> 
> Use explicit Buildroot variables for compiler tools,
> and some fixes. (TARGET_LDFLAGS and TARGET_CXXFLAGS
> were mixed up with PKG_TARGET_CFLAGS)
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

  Applied to master, but see below.

> ---
> v2->v3:
> -   rebase
> 
> v1->v2:
> -   squash 2 commits, really hard to separate as moving and renaming
>      variables from 2 to one location affects alot code.
> -   use TOOLCHAIN_POST_INSTALL_STAGING_HOOKS again.
> -   consistently use double quotes for sed patterns
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>   package/pkg-meson.mk                          | 58 +++++++++----------
>   .../misc}/cross-compilation.conf.in           | 10 ++--
>   2 files changed, 33 insertions(+), 35 deletions(-)
>   rename {package/meson => support/misc}/cross-compilation.conf.in (84%)
> 
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index 4914486665..77dc2b46b0 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -67,19 +67,9 @@ $(2)_CXXFLAGS ?= $$(TARGET_CXXFLAGS)
>   define $(2)_CONFIGURE_CMDS
>   	rm -rf $$($$(PKG)_SRCDIR)/build
>   	mkdir -p $$($$(PKG)_SRCDIR)/build
> -	sed -e 's%@TARGET_CROSS@%$$(TARGET_CROSS)%g' \
> -	    -e 's%@TARGET_ARCH@%$$(HOST_MESON_TARGET_CPU_FAMILY)%g' \
> -	    -e 's%@TARGET_CPU@%$$(HOST_MESON_TARGET_CPU)%g' \
> -	    -e 's%@TARGET_ENDIAN@%$$(HOST_MESON_TARGET_ENDIAN)%g' \
> -	    -e "s%@TARGET_CFLAGS@%$$(call make-sq-comma-list,$$($(2)_CFLAGS))%g" \
> -	    -e "s%@TARGET_LDFLAGS@%$$(call make-sq-comma-list,$$($(2)_LDFLAGS))%g" \
> -	    -e "s%@TARGET_CXXFLAGS@%$$(call make-sq-comma-list,$$($(2)_CXXFLAGS))%g" \
> -	    -e 's%@HOST_DIR@%$$(HOST_DIR)%g' \
> -	    -e 's%@STAGING_DIR@%$$(STAGING_DIR)%g' \
> -	    -e 's%@STATIC@%$$(if $$(BR2_STATIC_LIBS),true,false)%g' \
> -	    -e "/^\[binaries\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_BINARIES),\n$$(x)):" \
> +	sed -e "/^\[binaries\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_BINARIES),\n$$(x)):" \
>   	    -e "/^\[properties\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_PROPERTIES),\n$$(x)):" \
> -	    package/meson/cross-compilation.conf.in \
> +	    $$(call PKG_MESON_CROSSCONFIG_SED,$(2)_CFLAGS,$(2)_CXXFLAGS,$(2)_LDFLAGS) \
>   	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
>   	PATH=$$(BR_PATH) \
>   	CC_FOR_BUILD="$$(HOSTCC)" \
> @@ -223,31 +213,39 @@ else
>   PKG_MESON_TARGET_CPU_FAMILY = $(ARCH)
>   endif
>   
> -HOST_MESON_TARGET_ENDIAN = $(call qstrip,$(call LOWERCASE,$(BR2_ENDIAN)))
> -HOST_MESON_TARGET_CPU = $(GCC_TARGET_CPU)
> +# Generates sed patterns for patching the cross-compilation.conf template,
> +# since Flags might contain commas the arguments are passed indirectly by
> +# variable name (stripped to deal with whitespaces).
> +# Arguments are variable containing cflags, cxxflags, ldflags.
> +define PKG_MESON_CROSSCONFIG_SED
> +        -e "s%@TARGET_CC@%$(TARGET_CC)%g" \
> +        -e "s%@TARGET_CXX@%$(TARGET_CXX)%g" \
> +        -e "s%@TARGET_AR@%$(TARGET_AR)%g" \
> +        -e "s%@TARGET_STRIP@%$(TARGET_STRIP)%g" \
> +        -e "s%@TARGET_ARCH@%$(PKG_MESON_TARGET_CPU_FAMILY)%g" \
> +        -e "s%@TARGET_CPU@%$(GCC_TARGET_CPU)%g" \
> +        -e "s%@TARGET_ENDIAN@%$(call qstrip,$(call LOWERCASE,$(BR2_ENDIAN)))%g" \
> +        -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$($(strip $(1))))%g" \
> +        -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$($(strip $(3))))%g" \
> +        -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$($(strip $(2))))%g" \
> +        -e "s%@PKGCONF_HOST_BINARY@%$(HOST_DIR)/bin/pkgconf%g" \
> +        -e "s%@STAGING_DIR@%$(STAGING_DIR)%g" \
> +        -e "s%@STATIC@%$(if $(BR2_STATIC_LIBS),true,false)%g" \
> +        $(TOPDIR)/support/misc/cross-compilation.conf.in
> +endef
>   
>   # Generate a Meson cross-compilation.conf suitable for use with the
>   # SDK; also install the file as a template for users to add their
>   # own flags if they need to.
>   define PKG_MESON_INSTALL_CROSS_CONF
>   	mkdir -p $(HOST_DIR)/etc/meson
> -	sed -e 's%@TARGET_CROSS@%$(TARGET_CROSS)%g' \
> -	    -e 's%@TARGET_ARCH@%$(HOST_MESON_TARGET_CPU_FAMILY)%g' \
> -	    -e 's%@TARGET_CPU@%$(HOST_MESON_TARGET_CPU)%g' \
> -	    -e 's%@TARGET_ENDIAN@%$(HOST_MESON_TARGET_ENDIAN)%g' \
> -	    -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$(TARGET_CFLAGS))@PKG_TARGET_CFLAGS@%g" \
> -	    -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$(TARGET_LDFLAGS))@PKG_TARGET_CFLAGS@%g" \
> -	    -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$(TARGET_CXXFLAGS))@PKG_TARGET_CFLAGS@%g" \
> -	    -e 's%@HOST_DIR@%$(HOST_DIR)%g' \
> -	    -e 's%@STAGING_DIR@%$(STAGING_DIR)%g' \
> -	    -e 's%@STATIC@%$(if $(BR2_STATIC_LIBS),true,false)%g' \
> -	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
> +	sed -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$(TARGET_CFLAGS))@PKG_TARGET_CFLAGS@%g" \
> +	    -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$(TARGET_LDFLAGS))@PKG_TARGET_LDFLAGS@%g" \
> +	    -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$(TARGET_CXXFLAGS))@PKG_TARGET_CXXFLAGS@%g" \
> +	    $(call PKG_MESON_CROSSCONFIG_SED) \

  This could have been

$(call PKG_MESON_CROSSCONFIG_SED,$(call 
make-sq-comma-list,$(TARGET_CFLAGS))@PKG_TARGET_CFLAGS@,$(call 
make-sq-comma-list,$(TARGET_CXXFLAGS))@PKG_TARGET_CXXFLAGS@,$(call 
make-sq-comma-list,$(TARGET_LDFLAGS))@PKG_TARGET_LDFLAGS@)

which is of course completely unreadable.

  While looking at this, however, I noticed that there's something wrong with 
the cross-compilation.conf.in we generate. It contains this:

c_args = ['-D_LARGEFILE_SOURCE', ..., '-D_FORTIFY_SOURCE=1'@PKG_TARGET_CFLAGS@]
c_link_args = [@PKG_TARGET_CFLAGS@]

which means that @PKG_TARGET_CFLAGS@ can't be replaced with anything sane: in 
c_args, it must start with a comma, but in c_link_args it must not start with 
comma. But this was already wrong before this patch. In fact, this was already a 
problem since the very time that Peter introduced PKG_TARGET_CFLAGS.

  I'm not sure what to do about it.


>   	    > $(HOST_DIR)/etc/meson/cross-compilation.conf.in
> -	sed -e 's%@PKG_TARGET_CFLAGS@%%g' \
> -	    -e 's%@PKG_TARGET_LDFLAGS@%%g' \
> -	    -e 's%@PKG_TARGET_CXXFLAGS@%%g' \
> -	    $(HOST_DIR)/etc/meson/cross-compilation.conf.in \
> +	sed $(call PKG_MESON_CROSSCONFIG_SED,TARGET_CFLAGS,TARGET_CXXFLAGS,TARGET_LDFLAGS) \
>   	    > $(HOST_DIR)/etc/meson/cross-compilation.conf
>   endef
>   
> -TOOLCHAIN_TARGET_FINALIZE_HOOKS += PKG_MESON_INSTALL_CROSS_CONF
> +TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += PKG_MESON_INSTALL_CROSS_CONF

  This change (do it in post-install-staging instead of target-finalize) is not 
explained in the commit message, and it reverts an earlier change [1]. So I 
reverted that part.

  Regards,
  Arnout

[1] 
https://lore.kernel.org/buildroot/20191204150225.33749-1-thomas.petazzoni@bootlin.com/



> diff --git a/package/meson/cross-compilation.conf.in b/support/misc/cross-compilation.conf.in
> similarity index 84%
> rename from package/meson/cross-compilation.conf.in
> rename to support/misc/cross-compilation.conf.in
> index 7a7ece97ae..18cf258a8e 100644
> --- a/package/meson/cross-compilation.conf.in
> +++ b/support/misc/cross-compilation.conf.in
> @@ -4,11 +4,11 @@
>   # - Buildroot's 'target' is Meson's 'host'
>   
>   [binaries]
> -c = '@TARGET_CROSS@gcc'
> -cpp = '@TARGET_CROSS@g++'
> -ar = '@TARGET_CROSS@ar'
> -strip = '@TARGET_CROSS@strip'
> -pkgconfig = '@HOST_DIR@/bin/pkgconf'
> +c = '@TARGET_CC@'
> +cpp = '@TARGET_CXX@'
> +ar = '@TARGET_AR@'
> +strip = '@TARGET_STRIP@'
> +pkgconfig = '@PKGCONF_HOST_BINARY@'
>   g-ir-compiler = '@STAGING_DIR@/usr/bin/g-ir-compiler'
>   g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
