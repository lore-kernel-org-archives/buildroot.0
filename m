From: Rajendra Dendukuri <rajendra@broadcom.com>
Date: Thu, 9 Jan 2014 00:24:59 +0000
Subject: [Buildroot] Issues with ARMv7a glibc toolchain using buildroot
Message-ID: <43F7AEDD312F9E499A1A4E3608E505ED2AC9EDF9@SJEXCHMB09.corp.ad.broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I tried doing a buildroot toolchain with glibc 2.18 as libc for an ARMv7a CPU target. I find that dynamically linked executable files are not working and are throwing an error. I am using busybox as /init and it works only if statically compiled. Rest of the binaries which are dynamically linked are not working.

# /sbin/fw_printenv
-sh: /sbin/fw_printenv: not found

Did anyone face similar issues when using buildroot glibc toolchain? Am I missing any secret configuration. I also tried eglibc option and it resulted in same error.

Another issue I noticed is that when I do a file command on the executable it shows a very old kernel version whereas we are using kernel headers with linux version 3.6.5.

-bash-3.2$ file fw_printenv
fw_printenv: ELF 32-bit LSB executable, ARM, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.16, stripped


/rajen
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140109/c6106411/attachment.html>
