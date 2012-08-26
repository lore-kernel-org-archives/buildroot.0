From: Jonathan Liu <net147@gmail.com>
Date: Sun, 26 Aug 2012 11:51:07 +1000
Subject: [Buildroot] [PATCH v4 2/2] nodejs: new package
In-Reply-To: <20120825191538.4f545a35@skate>
References: <1344827150-25067-1-git-send-email-net147@gmail.com>
 <1344827150-25067-3-git-send-email-net147@gmail.com>
 <20120825191538.4f545a35@skate>
Message-ID: <5039810B.7090200@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 26/08/2012 3:15 AM, Thomas Petazzoni wrote:
> nodejs includes V8 for executing the JavaScript code, and V8 generates
> machine code to provide good performances when executing JavaScript.
> This means that V8 is architecture dependent: apparently, in deps/v8/,
> only IA32, x86-64, ARM and MIPS are supported.
>
> However, I don't understand how you select the target architecture or
> how it is detected. Some comments in the configure script also seem to
> imply that on ARM, only ARMv7 is supported by V8.
>
> Have you checked this, or did you try only a x86->x86 build?
I have mainly been testing x86-64->x86 builds.
I tried doing a x86-64->qemu-arm-versatile build and it seems to boot 
and run node.js properly (I am using 2012.08-rc2 with CodeSourcery ARM 
2011.09 external toolchain).
Perhaps it needs a patch to build on an ARM host 
(https://gist.github.com/1608607 might help).

Also, I was not able to get the qemu arm-versatile build to boot using 
ext2 image and the qemu command in board/qemu/arm-versatile/readme.txt.
I get "Cannot open root device or unknown-block(0,0)" when it tries to 
open /dev/sda.
Booting using a cpio initrd image works though.
Anything special I need to boot using ext2 image with ARM in qemu?

Regards,
Jonathan
