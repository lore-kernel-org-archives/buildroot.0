From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 23 Feb 2010 22:40:28 +0100
Subject: [Buildroot] make -C <buildroot_directory> failed
In-Reply-To: <8128F0FD6C26E14C8EB4BFDB92B8D6B2134B26@2putt.int.lantronix.com>
	(Matthew Davison's message of "Tue, 23 Feb 2010 12:56:10 -0800")
References: <8128F0FD6C26E14C8EB4BFDB92B8D6B2134B26@2putt.int.lantronix.com>
Message-ID: <87eikbeilv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Davison <matt.davison@lantronix.com> writes:

Hi,

 Matthew> Attempting to invoke the top level buildroot makefile from a
 Matthew> higher level Makefile or simply with make -C
 Matthew> <buildroot_directory> fails during the kernel build. This is
 Matthew> even true if 'make -C .' is invoked from the top level
 Matthew> buildroot directory, as long as a kernel build is enabled. It
 Matthew> appears that the problem has something to do with make's
 Matthew> "Entering/Leaving directory" messages, as the output below
 Matthew> suggests. When I passed the --no-print-directory option to
 Matthew> make, I was able to build without problems.
 
 Matthew> Below is the output from my failed build.
 
 Matthew>   INSTALL /home/lars/mdavison/buildroot-2009.11/output/target/lib/firmware/
 Matthew> sb16/ima_adpcm_init.csp
 Matthew>   INSTALL /home/lars/mdavison/buildroot-2009.11/output/target/lib/firmware/
 Matthew> sb16/ima_adpcm_playback.csp
 Matthew>   INSTALL /home/lars/mdavison/buildroot-2009.11/output/target/lib/firmware/
 Matthew> sb16/ima_adpcm_capture.csp
 Matthew>   DEPMOD  2.6.30.2
 Matthew> make[1]: Leaving directory `/home/lars/mdavison/buildroot-2009.11/output/build
 Matthew> /linux-2.6.30.2'

It looks to be an issue with the makefile of the Linux kernel. Please
post your .config so we can try to reproduce the problem. Do you only
have this issue with 2.6.30, or also other kernel versions? (perhaps
give buildroot-2010.02-rc1 a try)

Remember that you cannot build buildroot with a parallel toplevel make
(-jX).

-- 
Bye, Peter Korsgaard
