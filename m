From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 21 Mar 2007 18:40:03 +0100
Subject: [Buildroot] Problems with gmp
In-Reply-To: <ed5eec790703210900m5781184eu893292fc7cc9b349@mail.gmail.com>
References: <ed5eec790703210900m5781184eu893292fc7cc9b349@mail.gmail.com>
Message-ID: <20070321174003.GA2700@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 21, 2007 at 05:00:24PM +0100, massimeddu wrote:
>Hi,
>I'm trying to make a image for the Soekris net4801 with buildroot.
>I do use a Ubuntu edgy with Linux Kernel 2.6.17 and gcc 4.1.2, lic6 2.4 and
>libgmp3c2 4.2.1.
>In the make menuconfig script i have set the linux kernel 2.6.20, gcc
>4.1.2and i have selected the gmp package too but the make failed with
>these
>errors:
>
>checking whether the
>/home/wire/Desktop/buildroot/build_i586/staging_dir/bin/i586-linux-uclibc-gcc
>linker
>(/home/wire/Desktop/buildroot/build_i586/staging_dir/bin/i586-linux-uclibc-ld)
>supports shared libraries... yes
>checking whether -lc should be explicitly linked in... no
>checking dynamic linker characteristics... cat: /etc/ld.so.conf.d/*.conf: No
>such file or directory
>GNU/Linux ld.so
>checking how to hardcode library paths into programs... immediate
>checking whether stripping libraries is possible... yes
>checking if libtool supports shared libraries... yes
>checking whether to build shared libraries... yes
>checking whether to build static libraries... yes
>configure: creating libtool
>checking whether gcc __attribute__ ((mode (XX))) works... yes
>checking for recent GMP... yes
>checking for gmp internal files... no
>checking for working alloca.h... yes
>checking for alloca... yes
>checking for __gmpz_init in -lgmp... no
>configure: error: libgmp not found
>make: *** [/home/wire/Desktop/buildroot/build_i586/mpfr-2.2.1/.configured]
>Error 1

$ rm -rf build_* toolchain_*
$ make

and paste the full invocation of "./configure ....." of mpfr

Is gmp built correctly? Watch out for errors when gmp is built.
PS: you cannot step into any of build_*/*/ and issue a "make" there
