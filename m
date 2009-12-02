From: Nicholas Kinar <n.kinar@usask.ca>
Date: Tue, 01 Dec 2009 19:47:09 -0600
Subject: [Buildroot] Updated status on the compilation of busybox on Mac
 OS X
In-Reply-To: <873a3ulncz.fsf@macbook.be.48ers.dk>
References: <4B11D0C8.9050901@usask.ca> <87vdgt3eh8.fsf@macbook.be.48ers.dk>
	<4B128965.2090303@usask.ca> <87einh2n3w.fsf@macbook.be.48ers.dk>
	<20091201144803.26ddbe83@surf> <4B153461.1030404@usask.ca>
	<873a3ulncz.fsf@macbook.be.48ers.dk>
Message-ID: <4B15C71D.8020106@usask.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>
>
>  Nicholas> Here is where buildroot-2009.08 crashes:
>
> FYI, 2009.11 is out.
>   
I just downloaded it.  Once again, it's a really nice piece of work.  
Congratulations! - and thanks to you and the rest of the people who made 
this release of Buildroot a reality.
>  Nicholas> Command not found
>  Nicholas>  HOSTCC extra/locale/gen_locale
>
> Locales might be different on MacOSX - uclibc builds these using
> information from the host. You might have more luck by disabling locale
> support for now (BR2_ENABLE_LOCALE)
>
>   
Peter - you are right about this.  I modified the Buildroot .config to 
so that BR2_ENABLE_LOCALE=no, and the build process continues on Mac OS 
X.  However, I then encountered another error.  Apparently the gcc 
makefile believes that the host is Linux, so host-linux.c is being 
compiled instead of host-darwin.c.

Here's the output of the most recent error:


/Users/nkinar/Desktop/buildroot-1/buildroot-2009.11/output/toolchain/gcc-4.2.2-avr32-1.1.3/gcc/config/host-linux.c: 
In function 'linux_gt_pch_use_address':
/Users/nkinar/Desktop/buildroot-1/buildroot-2009.11/output/toolchain/gcc-4.2.2-avr32-1.1.3/gcc/config/host-linux.c:194: 
error: ?MAP_ANONYMOUS? undeclared (first use in this function)
/Users/nkinar/Desktop/buildroot-1/buildroot-2009.11/output/toolchain/gcc-4.2.2-avr32-1.1.3/gcc/config/host-linux.c:194: 
error: (Each undeclared identifier is reported only once
/Users/nkinar/Desktop/buildroot-1/buildroot-2009.11/output/toolchain/gcc-4.2.2-avr32-1.1.3/gcc/config/host-linux.c:194: 
error: for each function it appears in.)
make[2]: *** [host-linux.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [all-gcc] Error 2
make: *** 
[/Users/nkinar/Desktop/buildroot-1/buildroot-2009.11/output/toolchain/gcc-4.2.2-initial/.compiled] 
Error
