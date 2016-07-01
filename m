From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 23:23:39 +0200
Subject: [Buildroot] [PATCH v2 12/15] toolchain/toolchain-external: add
 knob for fortran support
In-Reply-To: <20160701162920.19632-13-s.martin49@gmail.com>
References: <20160701162920.19632-1-s.martin49@gmail.com>
 <20160701162920.19632-13-s.martin49@gmail.com>
Message-ID: <20160701232339.5bbd7793@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Jul 2016 18:29:17 +0200, Samuel Martin wrote:

> +config BR2_TOOLCHAIN_EXTERNAL_FORTRAN
> +	bool "Toolchain has Fortran support?"
> +	depends on BR2_USE_WCHAR # libquadmath

Is this dependency really needed? Plus libquadmath is only needed on
i386/x86_64, so on other architectures, we could have Fortran support
without wchar, could we?

> +	select BR2_TOOLCHAIN_HAS_FORTRAN
> +	help
> +	  Select this option if your external toolchain has fortran
> +	  support. If you don't know, leave the default value,
> +	  Buildroot will tell you if it's correct or not.
> +
> +comment "Fortran support needs a toolchain w/ wchar"
> +	depends on !BR2_USE_WCHAR

I think this comment is not needed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
