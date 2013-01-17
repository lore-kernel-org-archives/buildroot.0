From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Jan 2013 18:44:26 +0100
Subject: [Buildroot] RTLD_DEEPBIND and uClibc
In-Reply-To: <50F8019C.4000003@petroprogram.com>
References: <50F6A26D.4030607@petroprogram.com>
 <20130117093159.2d46ecfd@skate> <50F8019C.4000003@petroprogram.com>
Message-ID: <201301171844.27209.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On Thursday 17 January 2013 Stefan Fr?berg wrote:
> 17.1.2013 10:31, Thomas Petazzoni kirjoitti:
> > Whenever you start having X.org on a system and a window manager, most
> > likely you have hundreds of megabytes of flash, and therefore, the size
> > difference between uClibc and glibc (probably somewhere between 1 and
> > 1.5 MB) isn't that much of a problem anymore.
> 
> Eh... I think it's more than 1 - 1.5 MB :-)

The full set of libraries from a full-blown eglibc, for an ARM gnueabihf
target, is:
                      Unstripped    Stripped
Only eglibc libs      3.6MiB         2.3MiB
With gcc's libs       8.8MiB         3.0MiB

And for a relatively complete uClibc for x86_64 target:
                      Unstripped    Stripped
Only eglibc libs      2.0MiB         1.0MiB
With gcc's libs       6.9MiB         1.9MiB

(gcc libs: libstdc++ and libgcc_s)
(These are not the same architecture, but I went for the toolchains I have
locally)

So, typically, speaking only about the C library libs, the gain would be
around ~1.5MiB.

How large is your Xorg stack?
Then, compare that 1.5MiB to the size of your Xorg stack. What's the ratio?

If you're 1.5MiB short of space, then probably Xorg is not the solution for
your platform.

Of course, switching to uClibc as a learning experience is very
intreresting. But no more. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
