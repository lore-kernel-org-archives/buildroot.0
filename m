From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2013 18:26:35 +0100
Subject: [Buildroot] [PATCH 2/6] toolchain-external: add Sourcery MIPS
 2013.11, remove Sourcery MIPS 2012.03
In-Reply-To: <1388143942-1187-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1388143942-1187-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1388143942-1187-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131229172635.GE3567@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-27 12:32 +0100, Thomas Petazzoni spake thusly:
> This commit adds the support for the recently release Sourcery MIPS
> 2013.11 toolchain (gcc 4.8, gdb 7.6, glibc 2.18, gdb 7.6), and
> consequently removes the support for the Sourcery MIPS 2012.03
> toolchain.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

But see below...

> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index 0607693..d6d1960 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
[--SNIP--]
> @@ -281,35 +281,35 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	help
>  	  Sourcery CodeBench toolchain for the MIPS architecture, from
> -	  Mentor Graphics. It uses gcc 4.7.2, binutils 2.23.51, glibc
> -	  2.16, uClibc 0.9.30 and gdb 7.4.50, kernel headers
> -	  3.5.4. It has support for the following variants:
> +	  Mentor Graphics. It uses gcc 4.7.3, binutils 2.23.52, glibc
> +	  2.17, uClibc 0.9.30 and gdb 7.4.50, kernel headers
> +	  3.8.2. It has support for the following variants:
>  	    - MIPS32 O32 big endian glibc
>  	      Select a MIPS generic core
>  	      Disable BR2_SOFT_FLOAT
>  	    - MIPS64 big endian glibc
> -	      Select a MIPS generic core
> +	      Select a MIPS64 generic core

Looks like you're fixing help at the same time, too. Maybe jsut add a
small sentence to the commit log:
    Fix help texts about MIPS64 inconsistencies.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
