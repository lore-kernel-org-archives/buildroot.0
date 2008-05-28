From: Arun Reddy <reddyac@gmail.com>
Date: Wed, 28 May 2008 14:17:27 -0700
Subject: [Buildroot] Buildroot ARM build error for initramfs?
Message-ID: <326f33790805281417i51536796l4b1c6fb4f54e0c9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I am trying to rebuild my Buildroot project with initramfs support enabled
(selected within the Buildroot menuconfig). I also have RAM disk support
enabled in the kernel. I am getting the following error after some time.

makedevs: line 53: regular file
'/root/buildroot/project_build_arm/uclibc/root/usr/share/udhcpc/default.script'
does not exist: No such file or directory
<stdin>:1097:2: warning: #warning syscall fadvise64 not implemented
<stdin>:1265:2: warning: #warning syscall migrate_pages not implemented
<stdin>:1321:2: warning: #warning syscall pselect6 not implemented
<stdin>:1325:2: warning: #warning syscall ppoll not implemented
<stdin>:1365:2: warning: #warning syscall epoll_pwait not implemented
init/build-in.o: In function 'loglevel':
calibrate.c:(.init.text+0x168): relocation truncated to fit: R_ARM_PC24
against symbol 'get_option' defined in .text section in lib/lib.a(cmdline.o)
init/built-in.o: In function 'unknown_bootoption":
calibrate.c:(.init.text+0x190): relocation truncated to fit: R_ARM_PC24
against symbol 'strlen' defined in .text section lib in lib/lib.a(string.o)

... repeats for 'strlen', 'memmove', '__bug', 'strlen', 'strncmp', 'strchr',
'printk', 'strncmp', 'strchr', 'printk', and 'strncmp'.

init/built-in.o: In function 'parse_early_param':
calibrate.c:(.init.text+0x3cc): additional relocation overflows omitted from
the output
make: ***
[/root/buildroot/project_build_arm/uclibc/linux-2.6.24.4/arch/arm/boot/uImage]
Error 2

I looked online and found some information here:

http://www.spinics.net/lists/arm/msg14152.html

Where someone mentions that the initramfs could be too large, or it needs to
be placed at the end of the kernel image layout. Has anyone received this
error when building with initramfs support? I am unsure how what to do with
the initramfs to actually make it "fit" if the problem really is due to the
size. Anyone have any suggestions? Thanks a lot!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080528/8b674b7d/attachment.htm 
