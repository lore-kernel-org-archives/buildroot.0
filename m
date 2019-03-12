From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Mar 2019 22:34:57 +0100
Subject: [Buildroot] [PATCH 2/2] package/glibc: bump to version 2.29
In-Reply-To: <20190310165917.24325-2-romain.naour@gmail.com>
References: <20190310165917.24325-1-romain.naour@gmail.com>
 <20190310165917.24325-2-romain.naour@gmail.com>
Message-ID: <20190312213457.GI25009@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2019-03-10 17:59 +0100, Romain Naour spake thusly:
[--SNIP--]
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index ec5b3cedc9..1437f87368 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -13,7 +13,7 @@ GLIBC_SITE = $(call github,riscv,riscv-glibc,$(GLIBC_VERSION))
>  else
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
> -GLIBC_VERSION = glibc-2.28-69-g1e5c5303a522764d7e9d2302a60e4a32cdb902f1
> +GLIBC_VERSION = glibc-2.29-6-g067fc32968b601493f4b247a3ac00caeea3f3d61

I think at some point, someone suggested we drop the 'glibc-' prefix,
and jsut use e.g. 2.29-6-g067fc32968b601493f4b247a3ac00caeea3f3d61.

I just checked, and it seems to work:

    $ git show 2.29-6-g067fc32968b601493f4b247a3ac00caeea3f3d61
    commit 067fc32968b601493f4b247a3ac00caeea3f3d61 (origin/release/2.29/master)
    Author: Florian Weimer <fweimer@redhat.com>
    Date:   Fri Feb 15 21:27:01 2019 +0100

        nptl: Fix invalid Systemtap probe in pthread_join [BZ #24211]

        [...]

I think it is nicer...

Regards,
Yann E. MORIN.

>  # Upstream doesn't officially provide an https download link.
>  # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
>  # sometimes the connection times out. So use an unofficial github mirror.
> @@ -32,7 +32,7 @@ GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
>  # Before glibc is configured, we must have the first stage
>  # cross-compiler and the kernel headers
>  GLIBC_DEPENDENCIES = host-gcc-initial linux-headers host-bison host-gawk \
> -	$(BR2_MAKE_HOST_DEPENDENCY)
> +	$(BR2_MAKE_HOST_DEPENDENCY) $(BR2_PYTHON3_HOST_DEPENDENCY)
>  
>  GLIBC_SUBDIR = build
>  
> -- 
> 2.14.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
