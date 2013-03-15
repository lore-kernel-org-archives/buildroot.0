From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Mar 2013 11:11:30 +0100
Subject: [Buildroot] [PATCH] iozone: new package
In-Reply-To: <1363195917-13185-1-git-send-email-gilles.talis@gmail.com>
References: <y>
	<1363195917-13185-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <20130315111130.27f6aeeb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gilles Talis,

On Wed, 13 Mar 2013 10:31:57 -0700, Gilles Talis wrote:

> +IOZONE_MAJOR_VERSION = 3
> +IOZONE_MINOR_VERSION = 414
> +IOZONE_VERSION = $(IOZONE_MAJOR_VERSION)_$(IOZONE_MINOR_VERSION)

Any reason to split major and minor versions here? I only see
IOZONE_VERSION used below.

> +IOZONE_SOURCE = iozone$(IOZONE_VERSION).tar
> +IOZONE_SITE = http://www.iozone.org/src/current
> +IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
> +# IOzone license details can be found at:
> +# http://www.iozone.org/docs/Iozone_License.txt
> +
> +
> +ifeq ($(BR2_arm)$(BR2_armeb),y)
> +IOZONE_TARGET = linux-arm
> +else ifeq ($(BR2_x86_64),y)
> +IOZONE_TARGET = linux-ia64

This seems wrong IA64 is the Itanium architecture from Intel, and not
the x86-64 architecture.

> +else ifeq ($(BR2_powerpc),y)
> +IOZONE_TARGET = linux-powerpc
> +else ifeq ($(BR2_sparc),y)
> +IOZONE_TARGET = linux-sparc
> +else
> +IOZONE_TARGET = linux
> +endif

What happens for other architectures? Does it still build? What
are the differences between those per-architecture make targets?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
