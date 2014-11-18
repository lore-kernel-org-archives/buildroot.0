From: Peder Alm <peder.alm@semcon.com>
Date: Tue, 18 Nov 2014 11:22:19 +0000
Subject: [Buildroot] Unable to boot Arm926t with big endian support
Message-ID: <B28B6A721CC23347BBD5566C377D30416461F1CA@se-got-mb01.semcon.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to NFS-boot my Buildroot build for Arm926t with big endian support without success. I have tried Buildroot version 2013.05 and 2014.08 with the same result. With little endian support I can boot successfully for both versions. How can I fix this?

v2013.05 - big endian
-------------------------------
...
Linux version 3.9.4 (mrlinux at computer) (gcc version 4.7.3 (Buildroot 2013.05) ) #1 Mon Nov 17 11:26:40 CET 2014
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
...
VFS: Mounted root (nfs filesystem) on device 0:10.
Freeing init memory: 140K
request_module: runaway loop modprobe binfmt-464c
Failed to execute /sbin/init.  Attempting defaults...
request_module: runaway loop modprobe binfmt-464c
request_module: runaway loop modprobe binfmt-464c
Kernel panic - not syncing: No init found.  Try passing init= option to kernel. See Linux Documentation/init.txt for guidance.
[<c00136fc>] (unwind_backtrace+0x0/0xf0) from [<c02a2d88>] (panic+0x80/0x1d0)
[<c02a2d88>] (panic+0x80/0x1d0) from [<c02a1e80>] (kernel_init+0xc0/0xe4)
[<c02a1e80>] (kernel_init+0xc0/0xe4) from [<c000edb0>] (ret_from_fork+0x14/0x24)

v2014.08 - big endian
-------------------------------
...
Linux version 3.16.1 (mrlinux at computer) (gcc version 4.8.3 (Buildroot 2014.08) ) #1 Mon Nov 17 17:14:17 CET 2014
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=0005317f
...
VFS: Mounted root (nfs filesystem) on device 0:12.
devtmpfs: mounted
Freeing unused kernel memory: 132K (c03c5000 - c03e6000)
request_module: runaway loop modprobe binfmt-464c
Failed to execute /sbin/init (error -8).  Attempting defaults...
request_module: runaway loop modprobe binfmt-464c
Starting init: /sbin/init exists but couldn't execute it (error -8)
request_module: runaway loop modprobe binfmt-464c
Starting init: /bin/sh exists but couldn't execute it (error -8)
Kernel panic - not syncing: No working init found.  Try passing init= option to kernel. See Linux Documentation/init.txt for guidance.
CPU: 0 PID: 1 Comm: swapper Not tainted 3.16.1 #1
[<c000dba0>] (unwind_backtrace) from [<c000bfc4>] (show_stack+0x10/0x14)
[<c000bfc4>] (show_stack) from [<c02cec8c>] (panic+0x84/0x1e0)
[<c02cec8c>] (panic) from [<c02ce40c>] (kernel_init+0xc8/0xec)
[<c02ce40c>] (kernel_init) from [<c0009770>] (ret_from_fork+0x14/0x24)
---[ end Kernel panic - not syncing: No working init found.  Try passing init= option to kernel. See Linux Documentation/init.txt for guidance.

/Peder
