From: John Schimandle <john_schimandle@hotmail.com>
Date: Wed, 15 Oct 2008 11:33:03 -0700
Subject: [Buildroot] packages and architecture specific include files
Message-ID: <COL0-DAV11C424D48AB40570B8D5048D300@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm adding additional application software to my buildroot environment and
trying to integrated it into the system as it was designed but I'm running
into a problem and have not found any documentation that resolves this
issue. It's probably something simple.
 
First of all my application is trying to access the GPIO capabillities of
the processor to turn on and off various outputs to control functions on the
board. The processor is the at91sam9263 arm processor. The functions and
macros are defined in gpio.h which for this environment is located at
project_build_arm/at91sam9263ek/linux/2.6.24/include/asm/arch/gpio. This is
a symbolic link path. The actual physical path is
project_build_arm/at91sam9263ek/linux/2.6.24/include/asm/arch-arm/gpio and
I'm assuming the symbolic link is set so that packages can specify
<asm/arch/xxxx.h> and the code is more portable.
 
My difficulty is in setting up the package .mk file so the code will compile
and somehow I need to put a -I option with the
project_build_arm/at91sam9263ek/linux/2.6.24/include path so the gcc
compiler can find the include file. I'm assuming this goes in the package
mk file during the configure stage. I could just specify the path as a
constant but then I would have to change it every time I change to a new
linux kernel version or if buildroot changes the directory structure. There
are variables that can be used in the package .mk file like BUILD_DIR and
STAGING_DIR but these don't point to the directory I need. I'm wondering if
there is a well defined variable or set of variables that could be used to
construct the target architecture linux include file path. Or possibly there
is a buildroot configuration problem at the menuconfig level.
 
Documentation states that the STAGING_DIR holds include files but gpio.h was
not found here.

C Code include statement
 
#include <asm/arch/gpio.h>
 
Regards,
 
John
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081015/4d0e6d7e/attachment.htm 
