From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Apr 2020 07:54:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-greenlet: disable on
 unsupported architectures
In-Reply-To: <20200419233823.29410-1-james.hilliard1@gmail.com>
References: <20200419233823.29410-1-james.hilliard1@gmail.com>
Message-ID: <20200420075430.23f2b737@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 19 Apr 2020 17:38:23 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> diff --git a/package/python-greenlet/Config.in b/package/python-greenlet/Config.in
> index ef82375b0b..eae76ef6be 100644
> --- a/package/python-greenlet/Config.in
> +++ b/package/python-greenlet/Config.in
> @@ -1,5 +1,11 @@
>  config BR2_PACKAGE_PYTHON_GREENLET
>  	bool "python-greenlet"
> +	depends on !BR2_arceb
> +	depends on !BR2_arcle
> +	depends on !BR2_microblazebe
> +	depends on !BR2_microblazeel
> +	depends on !BR2_or1k
> +	depends on !BR2_sh

We prefer to use a BR2_PACKAGE_foo_ARCH_SUPPORTS hidden boolean, and to
use positive logic (i.e enable the package for supported architectures,
not disable for unsupported one). For example, you had probably missed
nios2 or nds32 as unsupported architectures.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
