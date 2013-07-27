From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 16:22:19 +0200
Subject: [Buildroot] [PATCH 8/9] blackfin: set GNU_TARGET_NAME
 accordingly
In-Reply-To: <1374324735-2286-9-git-send-email-gustavo@zacarias.com.ar>
References: <1374324735-2286-1-git-send-email-gustavo@zacarias.com.ar>
 <1374324735-2286-9-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130727162219.548826b8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 20 Jul 2013 09:52:14 -0300, Gustavo Zacarias wrote:
> Blackfin for FDPIC targets uses *-linux-*, however for FLAT targets it

>  # Compute GNU_TARGET_NAME
>  GNU_TARGET_NAME=$(ARCH)-buildroot-linux-$(LIBC)$(ABI)
>  
> +# Blackfin FLAT needs uclinux
> +ifeq ($(BR2_bfin)$(BR2_BINFMT_FLAT),yy)
> +GNU_TARGET_NAME=$(ARCH)-buildroot-uclinux-$(LIBC)$(ABI)
> +endif

I've changed that to keep a single GNU_TARGET_NAME definition and to
use a new TARGET_OS variable, like the existing LIBC and ABI variables
we had.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
