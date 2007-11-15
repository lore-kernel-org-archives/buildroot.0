From: ing. Federico Fuga <fuga@studiofuga.com>
Date: Thu, 15 Nov 2007 14:17:09 +0100
Subject: [Buildroot] Illegal Instruction in arm buildroot
Message-ID: <473C46D5.8040004@studiofuga.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have a strange problem with buildroot built for an em-x270 board (an
arm pxa270 based platform from compulab.co.il).
All the build is performed correctly, and after some small change I have
a working environment with busybox, udev, alsa, wireless tools, modutils
and a kernel 2.6.23.1 (patched with some platform-dependent patch).
But some program doesn't work at all, because the program receives a
SIGILL (Illegal Instruction exception): for example, wget crashes after
reading a remote file, udevd do not work at all, and also udhcpc crashes.
I have straced udevd and wget, and it seems to crash after a certain
call to syscall_nnnn where nnnn is different between the two applications.
I have tried many, many different configurations, involving different
version of gcc (4.0.1, 4.1.2, 4.2.1), of binutils (2.18 and 2.18.50.3,
AFAIR), of uclibc (0.9.29 and 0.9.28.x) and kernel headers (2.6.23 and
2.6.22).
I also have tried with different arm cpu optimizations, xscale and
generic, and xscale w/ coprocessor for the uclibc (I hoped that the
problem was in the different cpu for the uclibc and toolchain, but
without luck). I have passed --with-cpu=xscale to binutils and gcc.
None ot these configurations makes the system work.
I can exclude the kernel, because it's taken from the working
angstrom-linux provided by compulab, and it works well compiled with the
uclibc toolchain and a standard glibc toolchain, in both cases.
I provide the buildroot config files for reference.
Do you have any idea or suggestion ? 

Thank you in advance!
best regards,

ing. Federico Fuga


[ The message was reposted because of the attachment limits ]
-- 

-------------- next part --------------
A non-text attachment was scrubbed...
Name: freescan.config
Type: application/x-config
Size: 15078 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20071115/dafef198/attachment.bin 
