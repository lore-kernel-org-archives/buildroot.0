From: Daniel Jabbour <daniel@laptouchinc.com>
Date: Tue, 24 Mar 2009 16:26:19 -0400
Subject: [Buildroot] Build fails with external toolchain (sysroots error)
Message-ID: <585ACB2A-2E0B-4AA5-9A71-E437724E4018@laptouchinc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have configured buildroot to use an external toolchain provided by  
the manufacturer of my board. This is a glibc toolchain. I am able to  
cross compile against it outside of buildroot.

However, when I try to make buildroot, it exits with the following  
configure error when trying to build "lzo":

configure:2090: checking for C compiler default output file name
configure:2093: /opt/jztoolchain//bin/mipsel-linux-gcc -O2  -I/home/ 
djabbour/source/buildroot/build_mips/staging_dir/include -I/home/ 
djabbour/source/buildroot/build_mips/staging_dir/usr/include -I/opt/ 
jztoolchain//mipsel-linux/include --sysroot /home/djabbour/source/ 
buildroot/build_mips/staging_dir/ -O2  -I/home/djabbour/source/ 
buildroot/build_mips/staging_dir/include -I/home/djabbour/source/ 
buildroot/build_mips/staging_dir/usr/include -I/opt/jztoolchain// 
mipsel-linux/include --sysroot /home/djabbour/source/buildroot/ 
build_mips/staging_dir/  -L/home/djabbour/source/buildroot/build_mips/ 
staging_dir/lib -L/home/djabbour/source/buildroot/build_mips/ 
staging_dir/usr/lib conftest.c  >&5
/opt/jztoolchain/bin/../lib/gcc/mipsel-linux/4.1.2/../../../../mipsel- 
linux/bin/ld: this linker was not configured to use sysroots
collect2: ld returned 1 exit status
configure:2096: $? = 1
configure: failed program was:
| /* confdefs.h.  */
|
| #define PACKAGE_NAME "lzo"
| #define PACKAGE_TARNAME "lzo"
| #define PACKAGE_VERSION "2.03"
| #define PACKAGE_STRING "lzo 2.03"
| #define PACKAGE_BUGREPORT "markus at oberhumer.com"
| /* end confdefs.h.  */
|
| int
| main ()
| {
|
|   ;
|   return 0;
| }
configure:2135: error: C compiler cannot create executables

How can I resolve this issue? From my understanding, it seems like the  
sysroots flag is unsupported in my toolchain. Can buildroot work  
without this option? Thanks,

--
Daniel Jabbour
Software Engineer
Laptouch, Inc.
