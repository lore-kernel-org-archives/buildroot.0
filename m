From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 18 Aug 2017 00:17:56 +0200
Subject: [Buildroot] [PATCH] gcc: bump 7.x series to 7.2.0
In-Reply-To: <20170816203025.22554-1-thomas.petazzoni@free-electrons.com>
References: <20170816203025.22554-1-thomas.petazzoni@free-electrons.com>
Message-ID: <ad90209d-973e-b3e4-fb76-854f6bbb01e9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-08-17 22:30, Thomas Petazzoni wrote:
> All patches continue to apply with no changes. 7.2.0 is a bugfix
> release of the 7.x branch.
> 
> The only change that is not a simple bump is that the 7.2.0 tarball is
> now available xz-compressed instead of bz2-compressed.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
> I'm not sure whether we want this for master or next. 

 master is fine for me.

[snip]
> @@ -18,9 +18,9 @@ GCC_SITE = $(call github,openrisc,or1k-gcc,$(GCC_VERSION))
>  GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
>  else
>  GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
> -# From version 6.4.0 a bz2 release tarball is not provided anymore. Use the xz
> -# tarball instead.
> -ifeq ($(BR2_GCC_VERSION_6_X),y)
> +# From version 6.4.0 and 7.2.0 a bz2 release tarball is not provided
> +# anymore. Use the xz tarball instead.
> +ifeq ($(BR2_GCC_VERSION_6_X)$(BR2_GCC_VERSION_7_X),y)

 This is not maintainable, at some point we'll have to change it into
BR2_TOOLCHAIN_GCC_AT_LEAST_6.

 Regards,
 Arnout

>  GCC_SOURCE = gcc-$(GCC_VERSION).tar.xz
>  else
>  GCC_SOURCE = gcc-$(GCC_VERSION).tar.bz2
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
