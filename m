From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Jul 2012 18:43:44 +0200
Subject: [Buildroot] Help adding a prerequisite to GCC
In-Reply-To: <501315CB.2080809@sri.com>
References: <501315CB.2080809@sri.com>
Message-ID: <201207281843.44551.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Scott, All,

On Saturday 28 July 2012 00:27:23 Scott Moore wrote:
> I'm trying to compile a toolchain with LTO support in gcc.
> I tried to do this by adding the additional gcc flag "--enable-lto", but 
> the build fails (unsurprisingly) because building gcc with lto support 
> requires libelf, which is not currently a prerequisite for gcc in buildroot.
> 
> To fix this, I tried adding libelf to gcc-uclibc-4.x.mk by adding:
> GCC_HOST_PREREQ += host-libelf
> GCC_TARGET_PREREQ += libelf

Please, note that only gcc-4.5 requires libelf for LTO.
gcc-4.6 and above do *not need libelf for LTO (nor any other lib).

So, this PREREQs should be conditional to the gcc version.

Or you can use crostool-NG as a backend, that already has all the magic to
build an LTO-capable toolchain (as well as using GRAPHITE).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
