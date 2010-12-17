From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Fri, 17 Dec 2010 18:48:55 +0100
Subject: [Buildroot] ldd and external toolchain
In-Reply-To: <4D0B9E70.3010909@carallon.com>
References: <4D0B9E70.3010909@carallon.com>
Message-ID: <201012171848.56020.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will, All,

On Friday 17 December 2010 18:31:28 William Wagner wrote:
> Sorry if this is a stupid question but I can't seem to find any way of 
> getting ldd on my target when I use an external crosstools-ng toolchain.
> Is there any support for this with an external toolchain and if so where 
> would I find it?

For glibc, ldd on the target is but a simple script, and glibc installs a
ldd script (can't remember where, look in the sysroot, probably).

For uClibc, ldd is a C program, and crosstool-NG does not build or install
it. However, it should not be too difficult to build and install them as
part of the standard build.

Crosstool-NG, however, installs a ldd-like script that can be used the cross
way: call it as you call ldd, specify where the rootfs is, and it tries to
resolve dependencies. There are still limitations, though, but are about
missing --data-relocs, --function-relocs, --unused, and --verbose.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
