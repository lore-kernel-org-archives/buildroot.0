From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 22:37:22 +0200
Subject: [Buildroot] [v2] package/libgpg-error: bump to version 1.23
In-Reply-To: <1467589714-6122-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467589714-6122-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20160704223722.7191865a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Jul 2016 01:48:34 +0200, Maxime Hadjinlian wrote:

> +# default
> +LIBGPG_ERROR_ARCH = $(ARCH)
> +LIBGPG_ERROR_TRIPLET = unknown-linux-gnu
> +
> +# special treatments
> +ifeq ($(ARCH),$(filter $(ARCH),aarch64_eb))
> +LIBGPG_ERROR_ARCH = aarch64
> +else ifeq ($(ARCH),$(filter $(ARCH),arm armeb))
> +LIBGPG_ERROR_ARCH = arm
> +LIBGPG_ERROR_TRIPLET = unknown-linux-gnu$(ABI)
> +else ifeq ($(ARCH),$(filter $(ARCH),mips64))
> +LIBGPG_ERROR_ARCH = mips
> +else ifeq ($(ARCH),$(filter $(ARCH),sh4eb sh4a sh4aeb))
> +LIBGPG_ERROR_ARCH = sh4
> +else ifeq ($(findstring x86_64,$(ARCH)),x86_64)
> +LIBGPG_ERROR_TRIPLET = pc-linux-gnu
> +else ifeq ($(ARCH),$(filter $(ARCH),i386 i486 i586 i686))
> +LIBGPG_ERROR_ARCH = i686
> +LIBGPG_ERROR_TRIPLET = pc-linux-gnu
> +endif

This whole logic didn't work for ARM/uClibc for example, so we changed
it with Maxime to a hidden Config.in string option, which tells
libgpg-error.mk which syscfg file to use depending on the architecture.

We've also added support for NIOS2 since it has a syscfg file in the
latest version of libgpg-error.

Finally, we fixed the hash file.

Applied with those changes.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
