From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2011 22:45:35 +0200
Subject: [Buildroot] [PATCH 11/12] linux: add support for 3.x and -rc
	versions
In-Reply-To: <871uxwlhed.fsf@macbook.be.48ers.dk>
References: <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
 <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
 <6bdb6e46725ca0fcc8f3eb50f364ecc97b3b55d4.1310392269.git.thomas.petazzoni@free-electrons.com>
 <871uxwlhed.fsf@macbook.be.48ers.dk>
Message-ID: <20110711224535.6aa06e83@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 11 Jul 2011 21:57:30 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

>  Thomas> of the version provided by the user. This assumes that the
>  Thomas> 3.1 version will be in a /v3.1/ directory, which we don't
>  Thomas> know yet because the 3.1 cycle hasn't started yet.
> 
> Good question. Have you heard anything to make you think it will be
> so, or are you just guessing?

Just guessing.

> Minor nit. I prefer positive logic, E.G.
> 
> LINUX_SITE :=
> $(BR2_KERNEL_MIRROR)/linux/kernel/v$(LINUX_VERSION_MAJOR).$(LINUX_VERSION_MINOR)/
> 
> # release candidates are in the testing/ sub dir
> ifneq ($(findstring -rc,$(LINUX_VERSION)),)
> LINUX_SITE := $(LINUX_SITE)testing/
> endif

Fixed.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
