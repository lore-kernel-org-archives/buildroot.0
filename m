From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Fri, 15 Oct 2010 02:20:57 +0200
Subject: [Buildroot] Problem making buildroot
In-Reply-To: <29964713.post@talk.nabble.com>
References: <29964713.post@talk.nabble.com>
Message-ID: <1287102057.3927.172.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The customized buildroot version you're pointing out is more than a year
old. I don't think you're going to find a lot of support here.

You better try to shake up gumstix ;)

Otherwise you can find the official stable version here :

http://buildroot.uclibc.org/download.html

or the development version on git :

http://buildroot.uclibc.org/git.html

Regards,

--
Lionel Landwerlin 

Le jeudi 14 octobre 2010 ? 11:16 -0700, vishnu87 a ?crit :
> Hi Jed ,
> I am presently facing exactly the same problem , on a Debian system kernel
> 2.6.32....
> It would be great if you have found the solution and could post it ..
> Thanks 
> 
> Vishnu
> 
> 
> 
> jdzielski wrote:
> > 
> > Sorry if this is a multiple post.  It's showing up in the list that I see
> > but there is an indication that he message hasn't been accepted.  
> > 
> > Hi,
> >     I'm new at trying to do things at this level, but I'm trying to make
> > the buildroot on Ubuntu 8.04.  I've been following the instructions at
> > http://docwiki.gumstix.org/index.php/Buildroot which is pretty straight
> > forward.  There were a couple errors that I managed to fix, but I've
> > reached a point where I'm not sure what the make file is trying to do. 
> > The command that is being executed by the main make is:
> > 
> > make -j3 -C
> > /home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6-build
> > all
> > 
> > THE OUTPUT OF THE COMMAND IS:
> > 
> > make[1]: Entering directory
> > `/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6-build'
> > make[2]: Entering directory
> > `/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6-build'
> > make[2]: Nothing to be done for `all-target'.
> > make[3]: Entering directory
> > `/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6-build/intl'
> > make[3]: Nothing to be done for `all'.
> > make[3]: Leaving directory
> > `/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6-build/intl'
> > make[3]: Entering directory
> > `/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6-build/libiberty'
> > make[4]: Entering directory
> > `/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6-build/libiberty/testsuite'
> > make[4]: Nothing to be done for `all'.
> > make[4]: Leaving directory
> > `/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6-build/libiberty/testsuite'
> > make[3]: Entering directory
> > `/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6-build/etc'
> > for f in standards.info configure.info; do \
> > 	  if test -f
> > /home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6/etc/`echo
> > $f | sed -e 's/.info$/.texi/'`; then \
> > 	    if make
> > "MAKEINFO=/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6/missing
> > makeinfo --split-size=5000000 --split-size=5000000" $f; then \
> > 	      true; \
> > 	    else \
> > 	      exit 1; \
> > 	    fi; \
> > 	  fi; \
> > 	done
> > make[3]: Leaving directory
> > `/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6-build/libiberty'
> > make[4]: Entering directory
> > `/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6-build/etc'
> > make[4]: `standards.info' is up to date.
> > make[4]: Leaving directory
> > `/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6-build/etc'
> > mkdir -p -- ./ld
> > Configuring in ./ld
> > make[4]: Entering directory
> > `/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6-build/etc'
> > make[4]: `configure.info' is up to date.
> > make[4]: Leaving directory
> > `/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6-build/etc'
> > make[3]: Leaving directory
> > `/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6-build/etc'
> > make[3]: Entering directory
> > `/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6-build/bfd'
> > Making info in doc
> > make[4]: Entering directory
> > `/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6-build/bfd/doc'
> > restore=: && backupdir=".am$$" && \
> > 	am__cwd=`pwd` && cd
> > /home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6/bfd/doc
> > && \
> > 	rm -rf $backupdir && mkdir $backupdir && \
> > 	if
> > (/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6/missing
> > makeinfo --split-size=5000000 --split-size=5000000 --version) >/dev/null
> > 2>&1; then \
> > 	  for f in
> > /home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6/bfd/doc/bfd.info
> > /home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6/bfd/doc/bfd.info-[0-9]
> > /home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6/bfd/doc/bfd.info-[0-9][0-9]
> > /home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6/bfd/doc/bfd.i[0-9]
> > /home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6/bfd/doc/bfd.i[0-9][0-9];
> > do \
> > 	    if test -f $f; then mv $f $backupdir; restore=mv; else :; fi; \
> > 	  done; \
> > 	else :; fi && \
> > 	cd "$am__cwd"; \
> > 	if
> > /home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6/missing
> > makeinfo --split-size=5000000 --split-size=5000000   -I
> > /home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6/bfd/doc
> > \
> > 	 -o
> > /home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6/bfd/doc/bfd.info
> > /home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6/bfd/doc/bfd.texinfo;
> > \
> > 	then \
> > 	  rc=0; \
> > 	  cd
> > /home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6/bfd/doc;
> > \
> > 	else \
> > 	  rc=$?; \
> > 	  cd
> > /home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6/bfd/doc
> > && \
> > 	  $restore $backupdir/* `echo
> > ".//home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6/bfd/doc/bfd.info"
> > | sed 's|[^/]*$||'`; \
> > 	fi; \
> > 	rm -rf $backupdir; exit $rc
> > WARNING: `makeinfo' is missing on your system.  You should only need it if
> >          you modified a `.texi' or `.texinfo' file, or any other file
> >          indirectly affecting the aspect of the manual.  The spurious
> >          call might also be the consequence of using a buggy `make' (AIX,
> >          DU, IRIX).  You might want to install the `Texinfo' package or
> >          the `GNU make' package.  Grab either from any GNU archive site.
> > make[4]: ***
> > [/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6/bfd/doc/bfd.info]
> > Error 1
> > make[4]: Leaving directory
> > `/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6-build/bfd/doc'
> > Making info in po
> > make[4]: Entering directory
> > `/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6-build/bfd/po'
> > make[4]: Nothing to be done for `info'.
> > make[4]: Leaving directory
> > `/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6-build/bfd/po'
> > make[4]: Entering directory
> > `/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6-build/bfd'
> > make[4]: Nothing to be done for `info-am'.
> > make[4]: Leaving directory
> > `/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6-build/bfd'
> > make[3]: *** [info-recursive] Error 1
> > make[3]: Leaving directory
> > `/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6-build/bfd'
> > make[2]: *** [all-bfd] Error 2
> > make[2]: *** Waiting for unfinished jobs....
> > configure: creating cache ./config.cache
> > checking build system type... i386-pc-linux-gnu
> > checking host system type... i386-pc-linux-gnu
> > checking target system type... arm-unknown-linux-uclibcgnueabi
> > checking for i386-pc-linux-gnu-gcc... gcc
> > checking for C compiler default output file name... a.out
> > checking whether the C compiler works... yes
> > checking whether we are cross compiling... no
> > checking for suffix of executables... 
> > checking for suffix of object files... o
> > checking whether we are using the GNU C compiler... yes
> > checking whether gcc accepts -g... yes
> > checking for gcc option to accept ANSI C... none needed
> > checking for library containing strerror... none required
> > checking for a BSD-compatible install... /usr/bin/install -c
> > checking whether build environment is sane... yes
> > checking for gawk... no
> > checking for mawk... mawk
> > checking whether make sets $(MAKE)... yes
> > checking for style of include used by make... GNU
> > checking dependency style of gcc... gcc3
> > checking for ld used by GCC... ld
> > checking if the linker (ld) is GNU ld... yes
> > checking for ld option to reload object files... -r
> > checking for BSD-compatible nm... nm
> > checking whether ln -s works... yes
> > checking how to recognise dependant libraries... pass_all
> > checking the maximum length of command line arguments... none
> > checking for i386-pc-linux-gnu-ranlib... ranlib
> > checking for i386-pc-linux-gnu-strip... no
> > checking for strip... strip
> > updating cache ./config.cache
> > loading cache ./config.cache within ltconfig
> > checking whether -lc should be explicitly linked in... no
> > checking for objdir... .libs
> > checking for gcc option to produce PIC... -fPIC -DPIC
> > checking if gcc PIC flag -fPIC -DPIC works... yes
> > checking if gcc static flag -static works... yes
> > finding the maximum length of command line arguments... 49153
> > checking if gcc supports -c -o file.o... yes
> > checking if gcc supports -fno-rtti -fno-exceptions ... no
> > checking whether the linker (ld) supports shared libraries... yes
> > checking how to hardcode library paths into programs... immediate
> > checking whether stripping libraries is possible... yes
> > checking dynamic linker characteristics... GNU/Linux ld.so
> > checking command to parse nm output... ok
> > checking if libtool supports shared libraries... yes
> > checking whether to build shared libraries... yes
> > checking whether to build static libraries... yes
> > creating libtool
> > updating cache ./config.cache
> > configure: loading cache ./config.cache
> > Setting warning flags = -W -Wall -Wstrict-prototypes -Wmissing-prototypes
> > checking for i386-pc-linux-gnu-gcc... (cached) gcc
> > checking whether we are using the GNU C compiler... (cached) yes
> > checking whether gcc accepts -g... (cached) yes
> > checking for gcc option to accept ANSI C... (cached) none needed
> > checking for a BSD-compatible install... /usr/bin/install -c
> > checking whether NLS is requested... no
> > checking whether NLS is requested... no
> > checking for msgfmt... /usr/bin/msgfmt
> > checking for gmsgfmt... /usr/bin/msgfmt
> > checking for xgettext... /usr/bin/xgettext
> > checking for msgmerge... /usr/bin/msgmerge
> > checking for bison... bison -y
> > checking for flex... flex
> > checking for yywrap in -lfl... yes
> > checking lex output file root... lex.yy
> > checking whether yytext is a pointer... yes
> > checking whether to enable maintainer-specific portions of Makefiles... no
> > checking how to run the C preprocessor... gcc -E
> > checking for egrep... grep -E
> > checking for ANSI C header files... yes
> > checking for sys/types.h... yes
> > checking for sys/stat.h... yes
> > checking for stdlib.h... yes
> > checking for string.h... yes
> > checking for memory.h... yes
> > checking for strings.h... yes
> > checking for inttypes.h... yes
> > checking for stdint.h... yes
> > checking for unistd.h... yes
> > checking for string.h... (cached) yes
> > checking for strings.h... (cached) yes
> > checking for stdlib.h... (cached) yes
> > checking for unistd.h... (cached) yes
> > checking elf-hints.h usability... no
> > checking elf-hints.h presence... no
> > checking for elf-hints.h... no
> > checking for sbrk... yes
> > checking for realpath... yes
> > checking for glob... yes
> > checking for dirent.h that defines DIR... yes
> > checking for library containing opendir... none required
> > checking for a known getopt prototype in unistd.h... yes
> > checking whether strstr is declared... yes
> > checking whether free is declared... yes
> > checking whether sbrk is declared... yes
> > checking whether getenv is declared... yes
> > checking whether environ is declared... no
> > checking whether ANSI C string concatenation works... yes
> > updating cache ./config.cache
> > configure: creating ./config.status
> > config.status: creating Makefile
> > config.status: creating po/Makefile.in
> > config.status: creating config.h
> > config.status: executing depfiles commands
> > config.status: executing default-1 commands
> > config.status: creating po/POTFILES
> > config.status: creating po/Makefile
> > make[2]: Leaving directory
> > `/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6-build'
> > make[1]: *** [all] Error 2
> > make[1]: Leaving directory
> > `/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6-build'
> > make: ***
> > [/home/jed/scratch/gumstix-buildroot/toolchain_build_arm_nofpu/binutils-2.17.50.0.6-build/binutils/objdump]
> > Error 2
> > 
> > 
> > Thanks for any help that you can provide.
> > 
> 
