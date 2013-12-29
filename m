From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2013 18:32:00 +0100
Subject: [Buildroot] [PATCH 4/6] toolchain-external: update Linaro
 AArch64 toolchains
In-Reply-To: <1388143942-1187-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1388143942-1187-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1388143942-1187-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131229173200.GF3567@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-27 12:32 +0100, Thomas Petazzoni spake thusly:
> Add Linaro AArch64 2013.10 and Linaro AArch64 2013.11, and remove
> Linaro AArch64 2013.07 and Linaro AArch64 2013.08.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

But see below, unrelated comment...

[--SNIP--]
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 0e12c76..6a44eaf 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -339,15 +339,15 @@ TOOLCHAIN_EXTERNAL_SOURCE = lin32-microblaze-unknown-linux-gnu_14.3_early.tar.xz
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
>  TOOLCHAIN_EXTERNAL_SITE = http://sources.buildroot.net/
>  TOOLCHAIN_EXTERNAL_SOURCE = microblaze-unknown-linux-gnu.tgz
> -else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_07),y)
> -TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.07/components/toolchain/binaries/
> -TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.8-2013.07-1_linux.tar.xz
> -else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_08),y)
> -TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.08/components/toolchain/binaries/
> -TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.8-2013.08_linux.tar.xz
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_09),y)
>  TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.09/components/toolchain/binaries/
>  TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.8-2013.09_linux.tar.xz
> +else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_10),y)
> +TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.10/components/toolchain/binaries/
> +TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.8-2013.10-1_linux.tar.xz
> +else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_11),y)
> +TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.11/components/toolchain/binaries/
> +TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.8-2013.11_linux.tar.xz
>  else
>  # Custom toolchain
>  TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))

I find it odd that the menu are listed with reverse order, most recent
first, while the Makefiles are listed in order, oldest first. This
applies to all toolchains, not only the Linaro ones.

Of course, this is not the fault of this patch, as you kept the previous
order. So it does not bar you from applying it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
