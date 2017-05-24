From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 May 2017 16:26:12 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/gcc: add support for gcc 7
In-Reply-To: <20170523202440.6949-2-romain.naour@gmail.com>
References: <20170523202440.6949-1-romain.naour@gmail.com>
 <20170523202440.6949-2-romain.naour@gmail.com>
Message-ID: <20170524162612.09a18a25@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

First of all, thanks for doing this work!

I've added Alexey, Waldemar and Vicente in Cc, since there are some
ARC, Microblaze, OpenRISC and MIPS questions below.

On Tue, 23 May 2017 22:24:39 +0200, Romain Naour wrote:
> Remove upstream patches:

[...]

Nice to see that so many patches are upstream, and that our stack of
gcc patches for 7.x is now really small!

Perhaps we should start some effort to upstream the last few remaining
patches?

> +config BR2_GCC_VERSION_7_X
> +	bool "gcc 7.x"
> +	# Broken or unsupported architectures
> +	depends on !BR2_arc
> +	depends on !BR2_microblaze
> +	depends on !BR2_or1k

ARC is indeed still not supported fully in gcc 7.x I believe. Alexey,
do you confirm?

But what is the problem with Microblaze? And with OpenRISC? Waldemar?

OpenRISC has its own gcc version, so I guess that's the answer. But
what about Microblaze?

> +	# Unsupported MIPS cores
> +	depends on !BR2_mips_m6250 && !BR2_mips_p6600

Vicente, what is the status of the support for those MIPS cores in gcc
7.x ?

Romain: I think we should also default to gcc 6.x now instead of
defaulting to gcc 5.x.

And perhaps we should start thinking about removing gcc 4.9.x as well.
For toolchain components, I don't think it makes sense to support more
than three versions, i.e:

 1. old one (would be 5.x now)
 2. default one (would be 6.x now)
 3. bleeding edge one (would be 7.x now)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
