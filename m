From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Mar 2016 22:42:56 +0100
Subject: [Buildroot] [PATCH] toolchain: switch linaro to https urls
In-Reply-To: <1457552439-8185-1-git-send-email-jason.abele@gmail.com>
References: <1457552439-8185-1-git-send-email-jason.abele@gmail.com>
Message-ID: <20160309214256.GA5634@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jason, All,

On 2016-03-09 11:40 -0800, Jason Abele spake thusly:
> From: Jason Abele <jason@nextthing.co>
> 
> Signed-off-by: Jason Abele <jason@nextthing.co>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
> It looks like releases.linaro.org is no longer available without ssl.
> If this change is permanent, we should probably fix the urls.

Even if the http URLs return to operational in the future, we want
to keep the https ones anyway.

Thanks!

Regards,
Yann E. MORIN.

> 
>  toolchain/toolchain-external/toolchain-external.mk | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index e712998..37e1a2e 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -295,22 +295,22 @@ endef
>  TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_FIXUP_CMDS
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM),y)
>  ifeq ($(HOSTARCH),x86)
> -TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
> +TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/14.09/components/toolchain/binaries
>  TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
>  TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_src.tar.bz2
>  TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
>  else
> -TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/components/toolchain/binaries/5.2-2015.11-2/arm-linux-gnueabihf
> +TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.2-2015.11-2/arm-linux-gnueabihf
>  TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.2-2015.11-2-x86_64_arm-linux-gnueabihf.tar.xz
>  endif
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB),y)
>  ifeq ($(HOSTARCH),x86)
> -TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
> +TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/14.09/components/toolchain/binaries
>  TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
>  TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_src.tar.bz2
>  TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMEBHF_SYMLINK
>  else
> -TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/components/toolchain/binaries/5.2-2015.11-2/armeb-linux-gnueabihf
> +TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.2-2015.11-2/armeb-linux-gnueabihf
>  TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.2-2015.11-2-x86_64_armeb-linux-gnueabihf.tar.xz
>  endif
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS),y)
> @@ -350,12 +350,12 @@ TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 3
>  TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_BLACKFIN_UCLIBC_EXTRA_EXTRACT
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64),y)
>  ifeq ($(HOSTARCH),x86)
> -TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
> +TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/14.09/components/toolchain/binaries
>  TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
>  TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL = gcc-linaro-aarch64-linux-gnu-4.9-2014.09_src.tar.bz2
>  TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
>  else
> -TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/components/toolchain/binaries/5.2-2015.11-2/aarch64-linux-gnu
> +TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/components/toolchain/binaries/5.2-2015.11-2/aarch64-linux-gnu
>  TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.2-2015.11-2-x86_64_aarch64-linux-gnu.tar.xz
>  endif
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64),y)
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
