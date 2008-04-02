From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 2 Apr 2008 23:28:37 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
References: <20080331054204.ECD433C3A5@busybox.net> <47F217F5.5030908@eclis.ch>
Message-ID: <01e001c8950d$99237390$0e0514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



ulf at uclibc.org a ?crit :
> --- trunk/buildroot/target/linux/Makefile.in.advanced 2008-03-30 22:23:39 UTC (rev 21590)
> +++ trunk/buildroot/target/linux/Makefile.in.advanced 2008-03-31 05:42:03 UTC (rev 21591)
> @@ -103,7 +103,7 @@
>  endif
>  endif
>  
> -KERNEL_CONFIG_METHOD:=($(strip $(subst ",,$(BR2_KERNEL_CONFIG_METHOD))),)
> +KERNEL_CONFIG_METHOD:=$(strip $(subst ",,$(BR2_KERNEL_CONFIG_METHOD)))
>  #"))
>  ifeq ($(KERNEL_CONFIG_METHOD),)
>  KERNEL_CONFIG_METHOD:=xconfig
> @@ -335,7 +335,11 @@
>  $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(KERNEL_CONFIG_METHOD) ; \
>  fi
>  endif
> +ifneq ($(strip $(subst ",,$(BR2_EXTRA_VERSION))),)
> + $(SED) 's,^EXTRA_VERSION=.*,EXTRA_VERSION=="$(BR2_EXTRA_VERSION)",g'
> +endif

> This patch break the default compilation for AT91SAM9261 (make 
> at91sam9261ek_defconfig && make) with the following error:


Choose another kernel version like 2.6.22.1.
I have a fix ready, but I am having problems
with svn access from where I am at the moment.


Best Regards
Ulf Samuelsson
