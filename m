From: Quick X <quickx@hotmail.com>
Date: Wed, 26 Nov 2008 16:40:38 -0800
Subject: [Buildroot] Bare Toolchain
Message-ID: <BAY124-W34DB57BF59730B9E960F48D2050@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I'm a little new to this *my apologies if it is a basic question*, however, can buildroot create a "bare" toolchain for a target device?  How would I configure buildroot to build something like this?
 
 
Basically there is a startup project "softpack-1.4-at91sam9261-ek-web" which makes some lights on my board blink.  It asks for a "arm-elf-" compiler.
 
The projects compiles fine and works if I use 
1. GNUARM or YATARGO (windows) "arm-elf-" compiler.
2. CodeSourcery EABI (linux) " arm-none-eabi-" compiler.
 
When I do a default build for my AT91SAM9261-EK board with buildroot (linux) it produces a "arm-linux-" (or "arm-linux-uclibc-") compiler.  CodeSourcery also has a Linux/GNU "arm-none-linux-gnueabi-" toolchain which gives the same errors as buildroots "arm-linux-" toolchain for this project.  The error it gives is the following:
 
-----ERROR-----
arm-linux-gcc -Wall -mlong-calls -ffunction-sections -g -Os -I../../at91lib/boards/at91sam9260-ek -I../../at91lib/peripherals -I../../at91lib/memories -I../../at91lib/components -I../../at91lib -Dat91sam9260 -DDYNAMIC_TRACE_LEVEL -c -o obj/stdio.o ../../at91lib/utility/stdio.c ../../at91lib/utility/stdio.c:53: error: variable 'r' has initializer but incomplete type ../../at91lib/utility/stdio.c:53: warning: excess elements in struct initializer ../../at91lib/utility/stdio.c:53: warning: (near initialization for 'r') ../../at91lib/utility/stdio.c:53: warning: excess elements in struct initializer ../../at91lib/utility/stdio.c:53: warning: (near initialization for 'r') ../../at91lib/utility/stdio.c:53: warning: excess elements in struct initializer ../../at91lib/utility/stdio.c:53: warning: (near initialization for 'r') ../../at91lib/utility/stdio.c:53: warning: excess elements in struct initializer ../../at91lib/utility/stdio.c:53: warning: (near initialization for 'r') make: *** [obj/stdio.o] Error 1 
-----END-----
 
Reason I'm asking here is because since buildroot builds the kernel and bootstraps, it already has to use an "arm-elf-" (bare) toolchain for those correct?  Where would I find this, or, am I missing something?
 
The toolchain buildroot creates works fine for the projects I make after linux is flashed to the board so this question is more so for the test/temp/maybe future things I may need; and thus not have to install a 2nd toolchain (CodeSourcers's "arm-none-eabi-") since I already have buildroot.  Thanks for any help.
_________________________________________________________________

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081126/9121d423/attachment.htm 
