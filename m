From: Gaye Abdoulaye Walsimou <walsimou@walsimou.com>
Date: Thu, 22 Jan 2009 20:10:50 +0100
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill
 init!: at	boot time
In-Reply-To: <C171323BB93CB94897E300CBB6D4537F17D80301@CLMSG-01.ad.cirrus.com>
References: <C171323BB93CB94897E300CBB6D4537F17D80301@CLMSG-01.ad.cirrus.com>
Message-ID: <4978C4BA.3030805@walsimou.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Austin, Brian wrote:
> It's not quite that we aren't inspired.  It seems to be a common problem.
> Usually it's from either EABI/OABI conflicts with the kernel and your ramdisk, or something broken in the build with busybox itself.
>   
> Have you run 'file' on your init or busybox binary?
>
>   

Austin,

Toolchain #1:
kernel header linux-2.6.28.1, gcc-4.3.2, binutils-2.9, uclibc-0.9.30

Toolchain #1:
kernel header linux-2.6.27.10, gcc-4.2.4, binutils-2.9, uclibc-0.9.30


busybox which generates a kernel panic:
file /nfsroot/bin/busybox
/nfsroot/bin/busybox: setuid ELF 32-bit LSB executable, MIPS, MIPS32 
rel2 version 1 (SYSV), dynamically linked (uses shared libs), stripped
build with toolchain #1

file /var/lib/tftpboot/vmlinux
/var/lib/tftpboot/vmlinux: ELF 32-bit LSB executable, MIPS, MIPS32 
version 1 (SYSV), statically linked, not stripped
build with toolchain #1

Working busybox:
bin/busybox: setuid ELF 32-bit LSB executable, MIPS, MIPS32 version 1 
(SYSV), dynamically linked (uses shared libs), stripped
build with toolchain #2

I'm a bit confused, I've set mips32r2 in buildroot for toolchain #1 and 
for toolchain #2.

Thanks for your answer.
Regards
