From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Oct 2015 23:04:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/swupdate: fix build issue with
 some toolchains
In-Reply-To: <1445894151-27841-1-git-send-email-joerg.krause@embedded.rocks>
References: <1445894151-27841-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20151026230404.1501048e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Mon, 26 Oct 2015 22:15:51 +0100, J?rg Krause wrote:

> +# Using 'ld' directly for the 'builtin-target' in Makefile.build to compile a
> +# set of object files into one object file does not work for some toolchains
> +# (x86_64 and mips64) leading to different kind of relocation errors. By
> +# passing the below values for 'LD' and 'ldflags-y', we ensure that 'gcc' is
> +# used to compile the 'builtin-target' target.
>  define SWUPDATE_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) -C $(@D)
> +	$(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) -C $(@D) \
> +		LD="$(TARGET_CC)" ldflags-y="-Wl,-r -nostdlib"
>  endef

But shouldn't upstream be fixed to use gcc instead of ld? Using ld
directly is normally not a good idea.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
