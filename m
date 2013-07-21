From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jul 2013 17:38:45 +0200
Subject: [Buildroot] [PATCH 8/9] blackfin: set GNU_TARGET_NAME
 accordingly
In-Reply-To: <1374324735-2286-9-git-send-email-gustavo@zacarias.com.ar>
References: <1374324735-2286-1-git-send-email-gustavo@zacarias.com.ar>
 <1374324735-2286-9-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130721173845.15f7da05@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 20 Jul 2013 09:52:14 -0300, Gustavo Zacarias wrote:

> @@ -23,6 +23,11 @@ MAKE:=$(HOSTMAKE) -j$(PARALLEL_JOBS)
>  # Compute GNU_TARGET_NAME
>  GNU_TARGET_NAME=$(ARCH)-buildroot-linux-$(LIBC)$(ABI)
>  
> +# Blackfin FLAT needs uclinux
> +ifeq ($(BR2_bfin)$(BR2_BINFMT_FLAT),yy)
> +GNU_TARGET_NAME=$(ARCH)-buildroot-uclinux-$(LIBC)$(ABI)
> +endif

Isn't the 'uclinux' OS part something that is not specific to Blackfin?
I.e, should this rather be something like:

ifeq ($(BR2_USE_MMU),y)
OS=linux
else
OS=uclinux
endif

GNU_TARGET_NAME=$(ARCH)-buildroot-$(OS)-$(LIBC)$(ABI)

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
