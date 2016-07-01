From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 22:59:54 +0200
Subject: [Buildroot] [PATCH v2 03/15] package/Makefile.in: set
 TARGET_FCFLAGS variables
In-Reply-To: <20160701162920.19632-4-s.martin49@gmail.com>
References: <20160701162920.19632-1-s.martin49@gmail.com>
 <20160701162920.19632-4-s.martin49@gmail.com>
Message-ID: <20160701225954.65130be1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Jul 2016 18:29:08 +0200, Samuel Martin wrote:
> From: Benjamin Kamath <bkamath@spaceflight.com>
> 
> TARGET_FCFLAGS is already added to TARGET_CONFIGURE_OPTS, but was not
> defined so for.

so for -> so far.

>  ifeq ($(BR2_BINFMT_FLAT),y)
> @@ -148,29 +149,36 @@ TARGET_CFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FL
>  	-Wl$(comma)-elf2flt)
>  TARGET_CXXFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
>  	-Wl$(comma)-elf2flt)
> +TARGET_FCFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
> +	-Wl$(comma)-elf2flt)
>  TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt)
>  endif
>  
>  ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
>  TARGET_LDFLAGS += -mid-shared-library -mshared-library-id=0
>  TARGET_CFLAGS += -mid-shared-library -mshared-library-id=0
> +TARGET_FCFLAGS += -mid-shared-library -mshared-library-id=0
>  TARGET_CXXFLAGS += -mid-shared-library -mshared-library-id=0

[...]

There's really a lot of duplication between all those definitions, so
maybe one day we should clean this up. I'm also not a big fan of the
TARGET_ABI variable, but that's really unrelated to this patch.

So: applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
