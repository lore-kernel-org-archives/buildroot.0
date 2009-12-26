From: Marco Glatz <marco-glatz@web.de>
Date: Sat, 26 Dec 2009 15:20:40 +0100
Subject: [Buildroot] gcc-error with latest buildroot
In-Reply-To: <200912260808.55440.minimod@morethan.org>
References: <200912261427.53159.marco-glatz@web.de>
	<200912260808.55440.minimod@morethan.org>
Message-ID: <200912261520.40706.marco-glatz@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Samstag, 26. Dezember 2009 15:08:53 schrieb Michael S. Zick:
> On Sat December 26 2009, Marco Glatz wrote:
> > hello,
> >
> > i'm trying to make a toolchain using latest buildroot, but when compiling
> > gcc i get this error:
> >
> > checking for correct version of gmp.h... yes
> > checking for correct version of mpfr.h... no
> 
> This problem shipped in 2009.11 also -
> Fails even if mpfr is put into the GCC tree -
> 
> Looks like it might be tied in with the logic of building Fortran -
> (GCC once only used mpfr on the Fortran builds).
> Haven't had time for further testing myself.
> 
> There is what might be a related bug report already posted.


hi,

this helped me out:

http://www.linuxquestions.org/questions/linux-from-scratch-13/i-have-an-error-
building-gcc-requires-gmp-4.1-and-mpfr-2.3.0.-690426/

so i put  gmp and mpfr directories in the gcc-folder in the output/toolchain-
directory. then it compiled. later when linking there were a lot of errors not 
finding gmp-related functions, so i put again mpfr and gmp in output/build/gcc-
x-x-target directory. but that didn't help, still getting lot of undefined 
reference to __gmpz_* functions.

all the pages i found on google said you should configure --with-mpfr=... and 
--with-gmp=....., and there are options fpr this in the makefiles, but they do 
net get filled.


marco
