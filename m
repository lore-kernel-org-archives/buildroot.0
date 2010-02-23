From: Matthew Davison <matt.davison@lantronix.com>
Date: Tue, 23 Feb 2010 12:56:10 -0800
Subject: [Buildroot] make -C <buildroot_directory> failed
Message-ID: <8128F0FD6C26E14C8EB4BFDB92B8D6B2134B26@2putt.int.lantronix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Attempting to invoke the top level buildroot makefile from a higher
level Makefile or simply with make -C <buildroot_directory> fails during
the kernel build. This is even true if 'make -C .' is invoked from the
top level buildroot directory, as long as a kernel build is enabled. It
appears that the problem has something to do with make's
"Entering/Leaving directory" messages, as the output below suggests.
When I passed the --no-print-directory option to make, I was able to
build without problems.
 
Below is the output from my failed build.
 
  INSTALL
/home/lars/mdavison/buildroot-2009.11/output/target/lib/firmware/sb16/im
a_adpcm_init.csp
  INSTALL
/home/lars/mdavison/buildroot-2009.11/output/target/lib/firmware/sb16/im
a_adpcm_playback.csp
  INSTALL
/home/lars/mdavison/buildroot-2009.11/output/target/lib/firmware/sb16/im
a_adpcm_capture.csp
  DEPMOD  2.6.30.2
make[1]: Leaving directory
`/home/lars/mdavison/buildroot-2009.11/output/build/linux-2.6.30.2'
WARNING: Can't read module make[1]:: No such file or directory
WARNING: Can't read module Entering: No such file or directory
WARNING: Can't read module directory: No such file or directory
WARNING: Can't read module
`/home/lars/mdavison/buildroot-2009.11/output/build/linux-2.6.30.2': No
such file or directory
WARNING: Can't read module 2.6.30.2: No such file or directory
WARNING: Can't read module make[1]:: No such file or directory
WARNING: Can't read module Leaving: No such file or directory
WARNING: Can't read module directory: No such file or directory
WARNING: Can't read module
`/home/lars/mdavison/buildroot-2009.11/output/build/linux-2.6.30.2': No
such file or directory
FATAL: Could not open
/home/lars/mdavison/buildroot-2009.11/output/target/lib/modules/2.6.28-1
5-generic/modules.dep.temp for writing: No such file or directory
make: ***
[/home/lars/mdavison/buildroot-2009.11/output/stamps/linux_modules_targe
t_installed] Error 1
make: Leaving directory `/home/lars/mdavison/buildroot-2009.11'
 
**********************************************************************
This e-mail is the property of Lantronix. It is intended only for the person or entity to which it is addressed and may contain information that is privileged, confidential, or otherwise protected from disclosure. Distribution or copying of this e-mail, or the information contained herein, to anyone other than the intended recipient is prohibited.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100223/7858341e/attachment.htm>
