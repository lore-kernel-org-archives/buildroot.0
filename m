From: Nicholas Kinar <n.kinar@usask.ca>
Date: Wed, 02 Dec 2009 09:57:28 -0600
Subject: [Buildroot] Updated status on the compilation of busybox on Mac
 OS X
In-Reply-To: <4B15C71D.8020106@usask.ca>
References: <4B11D0C8.9050901@usask.ca> <87vdgt3eh8.fsf@macbook.be.48ers.dk>
	<4B128965.2090303@usask.ca> <87einh2n3w.fsf@macbook.be.48ers.dk>
	<20091201144803.26ddbe83@surf> <4B153461.1030404@usask.ca>
	<873a3ulncz.fsf@macbook.be.48ers.dk> <4B15C71D.8020106@usask.ca>
Message-ID: <4B168E68.1060003@usask.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In buildroot, how do I set the host system for the configuration of 
gcc?  This is trivial for a command-line compile of gcc, but how would I 
do this within Buildroot, so that the appropriate options are passed to 
./configure for gcc?

Perhaps changing this would allow for gcc to more properly compile.


> Peter - you are right about this.  I modified the Buildroot .config to 
> so that BR2_ENABLE_LOCALE=no, and the build process continues on Mac 
> OS X.  However, I then encountered another error.  Apparently the gcc 
> makefile believes that the host is Linux, so host-linux.c is being 
> compiled instead of host-darwin.c.
>
> Here's the output of the most recent error:
>
>
> /Users/nkinar/Desktop/buildroot-1/buildroot-2009.11/output/toolchain/gcc-4.2.2-avr32-1.1.3/gcc/config/host-linux.c: 
> In function 'linux_gt_pch_use_address':
> /Users/nkinar/Desktop/buildroot-1/buildroot-2009.11/output/toolchain/gcc-4.2.2-avr32-1.1.3/gcc/config/host-linux.c:194: 
> error: ?MAP_ANONYMOUS? undeclared (first use in this function)
> /Users/nkinar/Desktop/buildroot-1/buildroot-2009.11/output/toolchain/gcc-4.2.2-avr32-1.1.3/gcc/config/host-linux.c:194: 
> error: (Each undeclared identifier is reported only once
> /Users/nkinar/Desktop/buildroot-1/buildroot-2009.11/output/toolchain/gcc-4.2.2-avr32-1.1.3/gcc/config/host-linux.c:194: 
> error: for each function it appears in.)
> make[2]: *** [host-linux.o] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [all-gcc] Error 2
> make: *** 
> [/Users/nkinar/Desktop/buildroot-1/buildroot-2009.11/output/toolchain/gcc-4.2.2-initial/.compiled] 
> Error
>
