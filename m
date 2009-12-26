From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 26 Dec 2009 08:08:53 -0600
Subject: [Buildroot] gcc-error with latest buildroot
In-Reply-To: <200912261427.53159.marco-glatz@web.de>
References: <200912261427.53159.marco-glatz@web.de>
Message-ID: <200912260808.55440.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat December 26 2009, Marco Glatz wrote:
> hello,
> 
> i'm trying to make a toolchain using latest buildroot, but when compiling gcc 
> i get this error:
> 
> checking for correct version of gmp.h... yes
> checking for correct version of mpfr.h... no
>

This problem shipped in 2009.11 also -
Fails even if mpfr is put into the GCC tree -

Looks like it might be tied in with the logic of building Fortran -
(GCC once only used mpfr on the Fortran builds).
Haven't had time for further testing myself.

There is what might be a related bug report already posted.

Mike
> configure: error: Building GCC requires GMP 4.1+ and MPFR 2.3.2+.
> Try the --with-gmp and/or --with-mpfr options to specify their locations.
> Copies of these libraries' source code can be found at their respective
> hosting sites as well as at ftp://gcc.gnu.org/pub/gcc/infrastructure/.
> See also http://gcc.gnu.org/install/prerequisites.html for additional info.
> If you obtained GMP and/or MPFR from a vendor distribution package, make
> sure that you have installed both the libraries and the header files.
> They may be located in separate packages.
> make: *** [/devel/buildroot/output/build/gcc-4.4.2-target/.configured] Fehler 1
> 
> 
> 
> regards,
> marco
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
