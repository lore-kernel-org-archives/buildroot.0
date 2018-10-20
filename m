From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 20:26:40 +0200
Subject: [Buildroot] [PATCH v2] toolchain-external: add fortran support
 option for custom external toolchains
In-Reply-To: <20181020181226.17318-1-romain.naour@gmail.com>
References: <20181020181226.17318-1-romain.naour@gmail.com>
Message-ID: <20181020202640.27093274@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Oct 2018 20:12:26 +0200, Romain Naour wrote:

> +config BR2_TOOLCHAIN_EXTERNAL_FORTRAN
> +	bool "Toolchain has Fortran support?"
> +	# on architecture building libquadmath, wchar is required
> +	depends on !BR2_TOOLCHAIN_HAS_LIBQUADMATH || \
> +		(BR2_TOOLCHAIN_HAS_LIBQUADMATH && BR2_USE_WCHAR)

This dependency really is not necessary. Indeed, the question is "does
your toolchain supports Fortran?". If the user lies and the toolchain
doesn't have a fortran compiler, the check_fortran function will detect
that and bail out. So there's no need for a more complex dependency.

So I've applied your v1. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
