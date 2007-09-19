From: Babarovic Ivica <ivica.babarovic@asist.si>
Date: Wed, 19 Sep 2007 20:29:14 +0200
Subject: [Buildroot] strip wants to strip a shell script
Message-ID: <46F16A7A.60907@asist.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I get this after some time of compilation:

# Strip the host binaries
strip --strip-all -R .note -R .comment 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-addr2line 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-ar 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-as 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-c++ 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-c++filt 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-cpp 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-embedspu 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-g++ 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-gcc 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-gcc-4.2.1 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-gcov 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-gprof 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-ld 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-ldconfig 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-ldd 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-nm 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-objcopy 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-objdump 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-ranlib 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-readelf 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-size 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-strings 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-strip
strip: 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-embedspu: 
File format not recognized
make: *** 
[/home/ivo/src/mpc5200_binar/build-tools/buildroot/toolchain_build_powerpc/gcc-4.2.1-final/.installed] 
Error 1


Lame fix is  this:
cp 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-embedspu 
/home/ivo/src/mpc5200_binar/build-tools/buildroot/build_powerpc/staging_dir/usr/bin/embedspu

 $ svn update
At revision 19896.


Best regards,
I.
