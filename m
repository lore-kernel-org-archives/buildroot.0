Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F668C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 22:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C66DE401D8;
	Sat, 28 Oct 2023 22:50:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C66DE401D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yWIiogEsdycL; Sat, 28 Oct 2023 22:50:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5194F41C6A;
	Sat, 28 Oct 2023 22:50:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5194F41C6A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E523C1BF420
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 22:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CACC66F6D2
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 22:50:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CACC66F6D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PGatNWbwidNg for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 22:50:46 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 74564613D1
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 22:50:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74564613D1
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 9B51B2003AE;
 Sun, 29 Oct 2023 00:50:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Oct 2023 00:50:38 +0200
Date: Sun, 29 Oct 2023 00:50:38 +0200
From: "Yann E. MO RIN" <yann.morin.1998@free.fr>
To: Oleg Lyovin <ovlevin@salutedevices.com>
Message-ID: <20231028225038.GG687180@scaer>
References: <20231027161010.980901-1-ovlevin@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027161010.980901-1-ovlevin@salutedevices.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698533444;
 bh=flXWFuKFOQ8JTCPwEEGTV2GkCupWDOJDNcSjSO2PDA0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uchv8rM8VNxmjvOhb/N4rQcPJ6V599Gwq/ON9iPSQcSuLdOF8eogEqLYVo0C+8x4l
 PsaWHMfPTqF6lxQtizK+ViE4zNTzKS+TxYxv/02YBZsnZrcAIanhoVC+QNwprxW39Y
 yzHo75K0NlPk3ZthKR8JUc8CF9OaiX847VMxzlo/h2MRXBrhPUS269UYNlKlQyhF/d
 VpiHJ9ocrD3aoeqjUFzmWyo9XIs56v77LsVfkbCJ9c/lr+fWB6VECPlyaAvdXXyTuJ
 QU6FNUxZMq0IZZpzr8Yyr6FzDgXO8/9Q6tHM1Cm7dPtRJaAytdp8f5h/46BtbZNKPV
 pQKd0VNl3Hpqg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uchv8rM8
Subject: Re: [Buildroot] [PATCH 1/1] package/fscryptctl: add choice between
 v1 and v2 versions
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
Cc: olegartys@gmail.com, John Keeping <john@metanate.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Oleg, All,

+John for commit b832f6eb9d

On 2023-10-27 19:10 +0300, Oleg Lyovin via buildroot spake thusly:
> b832f6eb9d bumped fscryptctl to the version that
> does not support fscrypt v1. However, there may be
> active users that already has v1 configuration without
> an ability to migrate to v2, so the above change would
> break them.
> 
> This patch adds the option to choice which fscryptctl
> version to use assuming v2 by default.

It is very exceptional that we allow chosing a version, so you'll need
to provide more explanations than "without an ability to migrate to v2".

Why is it not possible for those users to migrate?

Note that commit b832f6eb9d stated:
    There are unlikely to be many v1 users and the format has some known
    vulnerabilities so no compatibility option is included.

So this was a mindful decision not to provide such compatibility,
especially because of the vulnerability issues.

In the odd case that we do indeed need to provide that choice, then
there is no need to split in two, as it is totally possible to write
everything in a single .mk in conditional blocs. E.g. (elided for
brevity):

    choice
        prompt "fscryptctl variant"

    config BR2_PACKAGE_FSCRYPTCTL_V1
        bool "v1 (deprecated)"

    config BR2_PACKAGE_FSCRYPTCTL_V2
        bool "v2"

    endchoice

    config BR2_PACKAGE_FSCRYPTCTL_VERSION
        string
        default "f037dcf4354ce8f25d0f371b58dfe7a7ac27576f" if BR2_PACKAGE_FSCRYPTCTL_V1
        default "1.0.0" if BR2_PACKAGE_FSCRYPTCTL_V2

and then in the .mk:

    FSCRYPTCTL_VERSION = $(call qstrip,$(BR2_PACKAGE_FSCRYPTCTL_VERSION))
    FSCRYPTCTL_GIT_VERSION = $(if $(BR2_PACKAGE_FSCRYPTCTL_V2),v)$(FSCRYPTCTL_VERSION)
    FSCRYPTCTL_SITE = $(call github,google,fscryptctl,$(FSCRYPTCTL_GIT_VERSION))

    FSCRYPTCTL_CFLAGS = $(TARGET_CFLAGS)
    ifeq ($(BR2_PACKAGE_FSCRYPTCTL_V2),y)
    FSCRYPTCTL_CFLAGS += -std=c99
    endif

    define FSCRYPTCTL_BUILD_CMDS
        $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
            CFLAGS="$(FSCRYPTCTL_CFLAGS)" fscryptctl
    endef

    define FSCRYPTCTL_INSTALL_TARGET_CMDS
        $(INSTALL) -m 0755 -D $(@D)/fscryptctl $(TARGET_DIR)/usr/bin/fscryptctl
    endef

    $(eval $(generic-package))

Toally untested, and missing all the rest of the usual variables...

But of course, this still needs a good explanations why this is needed.

Regards,
Yann E. MORIN.

> Signed-off-by: Oleg Lyovin <ovlevin@salutedevices.com>
> ---
>  package/fscryptctl/Config.in                  | 22 +++++++++++++++++++
>  package/fscryptctl/fscryptctl.mk              | 22 +------------------
>  .../fscryptctl_v1/fscryptctl_v1.hash          |  3 +++
>  .../fscryptctl/fscryptctl_v1/fscryptctl_v1.mk | 20 +++++++++++++++++
>  .../fscryptctl_v2.hash}                       |  2 +-
>  .../fscryptctl/fscryptctl_v2/fscryptctl_v2.mk | 21 ++++++++++++++++++
>  6 files changed, 68 insertions(+), 22 deletions(-)
>  create mode 100644 package/fscryptctl/fscryptctl_v1/fscryptctl_v1.hash
>  create mode 100644 package/fscryptctl/fscryptctl_v1/fscryptctl_v1.mk
>  rename package/fscryptctl/{fscryptctl.hash => fscryptctl_v2/fscryptctl_v2.hash} (81%)
>  create mode 100644 package/fscryptctl/fscryptctl_v2/fscryptctl_v2.mk
> 
> diff --git a/package/fscryptctl/Config.in b/package/fscryptctl/Config.in
> index 91b9ba8ebe..2fb7176ad9 100644
> --- a/package/fscryptctl/Config.in
> +++ b/package/fscryptctl/Config.in
> @@ -10,3 +10,25 @@ config BR2_PACKAGE_FSCRYPTCTL
>  	  (BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O encrypt -b 4096")
>  
>  	  https://github.com/google/fscryptctl
> +
> +if BR2_PACKAGE_FSCRYPTCTL
> +
> +choice
> +	prompt "fscryptctl variant"
> +	default BR2_PACKAGE_FSCRYPTCTL_V2
> +	help
> +	  Select the version of fscrypt.
> +
> +config BR2_PACKAGE_FSCRYPTCTL_V2
> +	bool "fscrpyctl_v2"
> +	help
> +	  Support the latest fscrypt v2 implementation.
> +
> +config BR2_PACKAGE_FSCRYPTCTL_V1
> +	bool "fscryptctl_v1"
> +	help
> +	  v1 is deprecated, enable this only for legacy configurations.
> +
> +endchoice
> +
> +endif
> diff --git a/package/fscryptctl/fscryptctl.mk b/package/fscryptctl/fscryptctl.mk
> index 0546f67a1f..e3571f4e07 100644
> --- a/package/fscryptctl/fscryptctl.mk
> +++ b/package/fscryptctl/fscryptctl.mk
> @@ -1,21 +1 @@
> -################################################################################
> -#
> -# fscryptctl
> -#
> -################################################################################
> -
> -FSCRYPTCTL_VERSION = 1.0.0
> -FSCRYPTCTL_SITE = $(call github,google,fscryptctl,v$(FSCRYPTCTL_VERSION))
> -FSCRYPTCTL_LICENSE = Apache-2.0
> -FSCRYPTCTL_LICENSE_FILES = LICENSE
> -
> -define FSCRYPTCTL_BUILD_CMDS
> -	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
> -		CFLAGS="$(TARGET_CFLAGS) -std=c99" fscryptctl
> -endef
> -
> -define FSCRYPTCTL_INSTALL_TARGET_CMDS
> -	$(INSTALL) -m 0755 -D $(@D)/fscryptctl $(TARGET_DIR)/usr/bin/fscryptctl
> -endef
> -
> -$(eval $(generic-package))
> +include $(sort $(wildcard package/fscryptctl/*/*.mk))
> diff --git a/package/fscryptctl/fscryptctl_v1/fscryptctl_v1.hash b/package/fscryptctl/fscryptctl_v1/fscryptctl_v1.hash
> new file mode 100644
> index 0000000000..f810aaacb5
> --- /dev/null
> +++ b/package/fscryptctl/fscryptctl_v1/fscryptctl_v1.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  970a8febbcbf315313711d8a7ee3d954dea593d8087744d3cba65f6cb4bebcc1  fscryptctl_v1-f037dcf4354ce8f25d0f371b58dfe7a7ac27576f.tar.gz
> +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/fscryptctl/fscryptctl_v1/fscryptctl_v1.mk b/package/fscryptctl/fscryptctl_v1/fscryptctl_v1.mk
> new file mode 100644
> index 0000000000..c1c1ab34f2
> --- /dev/null
> +++ b/package/fscryptctl/fscryptctl_v1/fscryptctl_v1.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# fscryptctl_v1
> +#
> +################################################################################
> +
> +FSCRYPTCTL_V1_VERSION = f037dcf4354ce8f25d0f371b58dfe7a7ac27576f
> +FSCRYPTCTL_V1_SITE = $(call github,google,fscryptctl,$(FSCRYPTCTL_V1_VERSION))
> +FSCRYPTCTL_V1_LICENSE = Apache-2.0
> +FSCRYPTCTL_V1_LICENSE_FILES = LICENSE
> +
> +define FSCRYPTCTL_V1_BUILD_CMDS
> +	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) fscryptctl
> +endef
> +
> +define FSCRYPTCTL_V1_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -D $(@D)/fscryptctl $(TARGET_DIR)/usr/bin/fscryptctl
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/package/fscryptctl/fscryptctl.hash b/package/fscryptctl/fscryptctl_v2/fscryptctl_v2.hash
> similarity index 81%
> rename from package/fscryptctl/fscryptctl.hash
> rename to package/fscryptctl/fscryptctl_v2/fscryptctl_v2.hash
> index 0dcca6893e..61ff022310 100644
> --- a/package/fscryptctl/fscryptctl.hash
> +++ b/package/fscryptctl/fscryptctl_v2/fscryptctl_v2.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  3828d5ad9b93664b9fec0174fc5d8e96d7b021a7896da74efe18fabe5f01d638  fscryptctl-1.0.0.tar.gz
> +sha256  3828d5ad9b93664b9fec0174fc5d8e96d7b021a7896da74efe18fabe5f01d638  fscryptctl_v2-1.0.0.tar.gz
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/fscryptctl/fscryptctl_v2/fscryptctl_v2.mk b/package/fscryptctl/fscryptctl_v2/fscryptctl_v2.mk
> new file mode 100644
> index 0000000000..847a7bbcda
> --- /dev/null
> +++ b/package/fscryptctl/fscryptctl_v2/fscryptctl_v2.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# fscryptctl_v2
> +#
> +################################################################################
> +
> +FSCRYPTCTL_V2_VERSION = 1.0.0
> +FSCRYPTCTL_V2_SITE = $(call github,google,fscryptctl,v$(FSCRYPTCTL_V2_VERSION))
> +FSCRYPTCTL_V2_LICENSE = Apache-2.0
> +FSCRYPTCTL_V2_LICENSE_FILES = LICENSE
> +
> +define FSCRYPTCTL_V2_BUILD_CMDS
> +	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
> +		CFLAGS="$(TARGET_CFLAGS) -std=c99" fscryptctl
> +endef
> +
> +define FSCRYPTCTL_V2_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -D $(@D)/fscryptctl $(TARGET_DIR)/usr/bin/fscryptctl
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.42.0.270.gbcb6cae296
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
