From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 14 Jun 2010 22:07:30 +0200
Subject: [Buildroot] [PATCH 04/10] external-toolchain: support 64 bits
	glibc toolchains
In-Reply-To: <25dbc7e97053c914268f376953019868b35ae49d.1276516273.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276516273.git.thomas.petazzoni@free-electrons.com>
	<25dbc7e97053c914268f376953019868b35ae49d.1276516273.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201006142207.30440.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 14 June 2010 13:54:15 Thomas Petazzoni wrote:
> On 64 bits glibc toolchains, the dynamic loader is named
> ld-linux-x86-64.so and not simply ld-linux.so. So, adjust the
> detection of the C library accordingly.
[--SNIP--]
>  check_glibc = \
>  	SYSROOT_DIR="$(strip $1)"; \
> -	if ! test -f $${SYSROOT_DIR}/lib/ld-linux.so.* -o -f $${SYSROOT_DIR}/lib/ld.so.* ; then \
> +	if ! test -f $${SYSROOT_DIR}/lib/ld-linux*.so.* -o -f $${SYSROOT_DIR}/lib/ld.so.* ; then \

Using readelf(1) on libc.so would give us the exact name of the dynamic
linker ( but I'm just repeating myself here... :-) )

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
