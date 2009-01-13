From: Hamish Guthrie <hamish.guthrie@sonycom.com>
Date: Tue, 13 Jan 2009 10:04:06 +0100
Subject: [Buildroot] arch support
In-Reply-To: <87iqokh9mt.fsf@macbook.be.48ers.dk>
References: <87ljtgj44z.fsf@macbook.be.48ers.dk>	<496B5427.6040103@sonycom.com>
	<87iqokh9mt.fsf@macbook.be.48ers.dk>
Message-ID: <496C5906.6080309@sonycom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
> 
> Strange - Are you building in a clean tree? What host are you using?
> 

Yes, building against a clean tree. I have tried this on 4 different 
build hosts:

1) Centos 5.0 i386: gcc4.1.2 - FAIL
2) Debian Etch i386: gcc4.1.2 - FAIL
3) Ubuntu 7.04 i386: gcc4.1.2 - FAIL
4) Ubuntu 8.10 i386: gcc4.3.2 - PASS

For all of the failures, the appropriate part of the config.log file is 
as follows:

configure:2567: checking for suffix of object files
configure:2588: 
/tmp/br/powerpc/toolchain_build_powerpc/gcc-4.3.2-initial/./gcc/xgcc 
-B/tmp/br/powerpc/toolchain_build_powerpc/gcc-4.3.2-initial/./gcc/ 
-B/tmp/br/powerpc/build_powerpc/staging_dir/usr/powerpc-linux-uclibc/bin/ 
-B/tmp/br/powerpc/build_powerpc/staging_dir/usr/powerpc-linux-uclibc/lib/ 
-isystem 
/tmp/br/powerpc/build_powerpc/staging_dir/usr/powerpc-linux-uclibc/include 
-isystem 
/tmp/br/powerpc/build_powerpc/staging_dir/usr/powerpc-linux-uclibc/sys-include 
-c -g -Os  conftest.c >&5
/tmp/br/powerpc/toolchain_build_powerpc/gcc-4.3.2-initial/./gcc/cc1: 
error while loading shared libraries: libmpfr.so.1: cannot open shared 
object file: No such file or directory
configure:2591: $? = 1
configure: failed program was:
| /* confdefs.h.  */
|
| #define PACKAGE_NAME "GNU C Runtime Library"
| #define PACKAGE_TARNAME "libgcc"
| #define PACKAGE_VERSION "1.0"
| #define PACKAGE_STRING "GNU C Runtime Library 1.0"
| #define PACKAGE_BUGREPORT ""
| /* end confdefs.h.  */
|
| int
| main ()
| {
|
|   ;
|   return 0;
| }
configure:2605: error: cannot compute suffix of object files: cannot compile
See `config.log' for more details.

Unfortunately, the Ubuntu 8.10 machine I used last night to test on is 
not available to me at the moment, however, I am currently getting a new 
VM set up with Ubuntu 8.10 on it, on which I will install gcc4.1.2 to 
see if that is in fact the culprit, but I am not really convinced.

Any thoughts would be appreciated

--
Hamish
