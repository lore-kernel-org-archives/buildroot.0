From: Rolf Blindheim <rolf@elektronix.no>
Date: Wed, 22 Aug 2007 09:03:06 +0200
Subject: [Buildroot] libmad-0.15.1b fails on build
Message-ID: <200708220903.10378.rolf@elektronix.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.
libmad-0.15.1b fails on build with buildroot-20070821, uclibc-0.29.9.

From build...
..
....
.......
then mv -f ".deps/layer3.Tpo" ".deps/layer3.Plo"; else 
rm -f ".deps/layer3.Tpo"; exit 1; fi
 /home/rolf/BUILDS/Buildroot-Builds/buildroot-20070821/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc -Os -pipe -I/home/rolf/BUILDS/Buildroot-Builds/buildroot-20070821/build_i586/staging_dir/usr/include -I/home/rolf/BUILDS/Buildroot-Builds/buildroot-20070821/build_i586/staging_dir/include --sysroot=/home/rolf/BUILDS/Buildroot-Builds/buildroot-20070821/build_i586/staging_dir/ -isysroot /home/rolf/BUILDS/Buildroot-Builds/buildroot-20070821/build_i586/staging_dir -mtune=i586 -march=i586 -DHAVE_CONFIG_H -I. -I. -I. -DFPM_INTEL -DASO_ZEROCHECK -Wall -march=i486 -O -fforce-mem -fforce-addr -fthread-jumps -fcse-follow-jumps -fcse-skip-blocks -fexpensive-optimizations -fregmove -fschedule-insns2 -fstrength-reduce -fomit-frame-pointer -MT 
layer3.lo -MD -MP -MF .deps/layer3.Tpo -c 
layer3.c  -fPIC -DPIC -o .libs/layer3.o
cc1: warning: -f[no-]force-mem is nop and option will be removed in 4.3
layer3.c:394: error: expected '=', ',', ';', 'asm' or '__attribute__' 
before 'const'
layer3.c:406: error: expected '=', ',', ';', 'asm' or '__attribute__' 
before 'const'
layer3.c:437: error: expected '=', ',', ';', 'asm' or '__attribute__' 
before 'const'
layer3.c: In function 'III_imdct_l':
layer3.c:2120: error: 'mad_coeff_t' undeclared (first use in this function)
layer3.c:2120: error: (Each undeclared identifier is reported only once
layer3.c:2120: error: for each function it appears in.)
layer3.c:2120: error: 'w_ptr' undeclared (first use in this function)
layer3.c:2133: error: 'window_l' undeclared (first use in this function)
layer3.c:2189: error: 'window_s' undeclared (first use in this function)
layer3.c: In function 'III_imdct_s':
layer3.c:2220: error: 'mad_coeff_t' undeclared (first use in this function)
layer3.c:2220: error: expected ';' before 'const'
layer3.c:2230: error: expected '=', ',', ';', 'asm' or '__attribute__' 
before 'const'
layer3.c:2230: warning: type defaults to 'int' in declaration of 's'
layer3.c:2232: error: 'imdct_s' undeclared (first use in this function)
layer3.c:2313: error: 'wptr' undeclared (first use in this function)
layer3.c:2313: error: 'window_s' undeclared (first use in this function)
make[3]: *** [layer3.lo] Error 1
make[3]: Leaving directory 
`/home/rolf/BUILDS/Buildroot-Builds/buildroot-20070821/build_i586/libmad-0.15.1b'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory 
`/home/rolf/BUILDS/Buildroot-Builds/buildroot-20070821/build_i586/libmad-0.15.1b'
make[1]: *** [all] Error 2
make[1]: Leaving directory 
`/home/rolf/BUILDS/Buildroot-Builds/buildroot-20070821/build_i586/libmad-0.15.1b'
make: *** 
[/home/rolf/BUILDS/Buildroot-Builds/buildroot-20070821/build_i586/libmad-0.15.1b/libmad.la] 
Error 2
root at ProdLinux:/home/rolf/BUILDS/Buildroot-Builds/buildroot-20070821#

-- 
Rolf Blindheim
<rolf@elektronix.no>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070822/14823888/attachment.pgp 
