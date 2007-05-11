From: Jackie Pham <jackie.study.linux@gmail.com>
Date: Fri, 11 May 2007 15:43:09 -0700
Subject: [Buildroot] Could not compile buildroot
Message-ID: <5392eb4d0705111543t7b3d09f8v64181178712c9a4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've tried to compile buildroot on my FC6 system but it failed. I searched
the Internet several times but couldn't find a solution for it. Please help
me to solve it.
Here is the log:
...
if [ -f gcc-cross ] ; then \
          if [ -d
/root/buildroot/build_arm_nofpu/staging_dir/lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/bin/.
] ; then \
            rm -f
/root/buildroot/build_arm_nofpu/staging_dir/lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/bin/gcc;
\
            /usr/bin/install -c gcc-cross
/root/buildroot/build_arm_nofpu/staging_dir/lib/gcc/arm-linux-uclibc/4.1.2/../../../../arm-linux-uclibc/bin/gcc;
\
          else true; fi; \
        else \
          rm -f
/root/buildroot/build_arm_nofpu/staging_dir/bin/arm-linux-uclibc-gcc-tmp; \
          ( cd /root/buildroot/build_arm_nofpu/staging_dir/bin && \
            ln arm-linux-uclibc-gcc arm-linux-uclibc-gcc-tmp && \
            mv -f arm-linux-uclibc-gcc-tmp
arm-linux-uclibc-arm-linux-uclibc-gcc ); \
        fi
make[2]: Leaving directory `/root/buildroot/toolchain_build_arm_nofpu/gcc-
4.1.2-initial/gcc'
make[1]: Leaving directory `/root/buildroot/toolchain_build_arm_nofpu/gcc-
4.1.2-initial'
#rm -f /root/buildroot/build_arm_nofpu/staging_dir/bin/gccbug
/root/buildroot/build_arm_nofpu/staging_dir/bin/gcov
#rm -rf /root/buildroot/build_arm_nofpu/staging_dir/info
/root/buildroot/build_arm_nofpu/staging_dir/man
/root/buildroot/build_arm_nofpu/staging_dir/share/doc
/root/buildroot/build_arm_nofpu/staging_dir/share/locale
make MAKE="make -j1" -C /root/buildroot/toolchain_build_arm_nofpu/uClibc \
                PREFIX= \
                DEVEL_PREFIX=/ \
                RUNTIME_PREFIX=/ \
                HOSTCC="gcc" \
                all
arm-linux-uclibc-gcc: y: No such file or directory
make[1]: Entering directory
`/root/buildroot/toolchain_build_arm_nofpu/uClibc'
arm-linux-uclibc-gcc: y: No such file or directory
gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE  -MM *.c >
.depend 2>/dev/null || :
arm-linux-uclibc-gcc: y: No such file or directory
make[2]: `conf' is up to date.
arm-linux-uclibc-gcc: y: No such file or directory
  CC ldso/ldso/ldso.oS
arm-linux-uclibc-gcc: y: No such file or directory
make[1]: *** [ldso/ldso/ldso.oS] Error 1
make[1]: Leaving directory
`/root/buildroot/toolchain_build_arm_nofpu/uClibc'
make: *** [/root/buildroot/toolchain_build_arm_nofpu/uClibc/lib/libc.a]
Error 2

I don't know why it always failed at "arm-linux-uclibc-gcc: y: No such file
or directory". I've tried in many systems and saw the same problem.

Any answers all are appreciated.

Best regards,
Jackie.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070511/6e49693a/attachment.htm 
