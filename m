From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 14 Jun 2010 21:50:20 +0200
Subject: [Buildroot] [PATCH 01/10] ext-toolchains: take into account
	other Glibc dynamic loader variants
In-Reply-To: <b68eb48549402e13326e6826aa0f3dc2051de21a.1276516273.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276516273.git.thomas.petazzoni@free-electrons.com>
	<b68eb48549402e13326e6826aa0f3dc2051de21a.1276516273.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201006142150.20073.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Monday 14 June 2010 13:54:12 Thomas Petazzoni wrote:
> External toolchains using Glibc have different names for the dynamic
> loader. Some of them name it ld-linux.so.*, while some others (such as
> the PowerPC and MIPS CodeSourcery toolchains) name it simply ld.so.*.
> 
> Therefore, we fix the glibc detection code to handle this case.
[--SNIP--]
>  check_glibc = \
>  	SYSROOT_DIR="$(strip $1)"; \
> -	if ! test -f $${SYSROOT_DIR}/lib/ld-linux.so.* ; then \
> +	if ! test -f $${SYSROOT_DIR}/lib/ld-linux.so.* -o -f $${SYSROOT_DIR}/lib/ld.so.* ; then \

Can't we just readelf(1) the libc.so to get the dynamic linker name ?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
