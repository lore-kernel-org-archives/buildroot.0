From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 21:33:09 +0200
Subject: [Buildroot] [git commit] arch: add the basic IBM s390x and Z
 arch support
In-Reply-To: <20200924213039.9A20F83786@busybox.osuosl.org>
References: <20200924213039.9A20F83786@busybox.osuosl.org>
Message-ID: <20200930213309.4f9b8063@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Sep 2020 22:02:03 +0200
Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> +config BR2_s390x_z13
> +	bool "z13"
> +	depends on BR2_s390x
> +
> +config BR2_s390x_z14
> +	bool "z14"
> +	depends on BR2_s390x
> +
> +config BR2_s390x_z15
> +	bool "z15"
> +	depends on BR2_s390x
> +
> +endchoice
> +
> +config BR2_ARCH
> +	default "s390x"	if BR2_s390x
> +
> +config BR2_ENDIAN
> +	default "BIG"
> +
> +config BR2_GCC_TARGET_ARCH
> +	default "arch11" if BR2_s390x_z13
> +	default "arch12" if BR2_s390x_z14
> +	default "arch13" if BR2_s390x_z15

I was looking at this, together with the gcc documentation, and I was
surprised to see that arch13/z15 are not mentioned anywhere. My gcc
10.x documentation says:

     Generate code that runs on CPU-TYPE, which is the name of a system
     representing a certain processor type.  Possible values for
     CPU-TYPE are 'z900'/'arch5', 'z990'/'arch6', 'z9-109',
     'z9-ec'/'arch7', 'z10'/'arch8', 'z196'/'arch9', 'zEC12',
     'z13'/'arch11', 'z14'/'arch12', and 'native'.

But looking at the gcc source code, the z15/arch13 -march values are
indeed supported.

Perhaps the gcc documentation should be updated. Alexander, as it seems
you're working on S390 support in general, maybe you could take care of
this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
