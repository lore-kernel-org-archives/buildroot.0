From: =?ISO-8859-15?Q?Kim_Str=F8ger?= <ks@sfktech.com>
Date: Tue, 09 Oct 2007 17:18:03 +0200
Subject: [Buildroot] Problems building toolchain
Message-ID: <470B9BAB.3050407@sfktech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I am trying to build just the toolchain, using svn revision 20210.
following the instruction from here:
http://www.uclibc.org/toolchains.html

# Point your web browser here <http://buildroot.uclibc.org/>,
# Download of copy of buildroot
# Unpack the tarball on your Linux system somewhere
# Edit the Makefile as needed if you wish to change anything.
# run 'unset CC'. Then run 'unset CXX'. Some Linux systems (i.e. Gentoo)
set variables such as 'CC' in the system environment which really messes
things up when cross compiling.
# run 'make menuconfig'
# Select the things you want to build. If you /only/ want a toolchain,
leave everything except the toolchain disabled.
# save your buildroot configuration.
# run 'make'

and I end up with this error msg. every time I try to build it.



make[1]: Leaving directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-initial'
touch
/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-initial/.installed
/usr/bin/make MAKE="/usr/bin/make -j1" -C
/home/cz2/Crossdev/buildroot/toolchain_build_arm/uClibc \
                PREFIX= \
                DEVEL_PREFIX=/ \
                RUNTIME_PREFIX=/ \
                HOSTCC="/usr/lib/distcc/bin/gcc" \
                all
make[1]: Entering directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/uClibc'
make[2]: `conf' is up to date.
  CC ldso/ldso/ldso.oS
cc1: error: unrecognized command line option "-mfdpic"
make[1]: *** [ldso/ldso/ldso.oS] Error 1
make[1]: Leaving directory
`/home/cz2/Crossdev/buildroot/toolchain_build_arm/uClibc'
make: ***
[/home/cz2/Crossdev/buildroot/toolchain_build_arm/uClibc/lib/libc.a] Error 2


How do I get passed this point ?

Thanks, Kim S.
