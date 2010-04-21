From: Nataraj S Narayan <natarajsn@gmail.com>
Date: Wed, 21 Apr 2010 12:47:05 +0000
Subject: [Buildroot] BR using Codesourcery tool chain
Message-ID: <u2q630286c71004210547s451db5d6q80cf4748e8e2c4a6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I am on armv5tejl GNU/Linux. Changed to Codesourcery toolchain for libc.

I am able to generate a file system. But the /dev directory is empty.
For booting using init=/bin/sh , I had to to manually create a
/dev/console.

For a normal boot without  init=/bin/sh I use nfs :-

setenv bootargs mem=64M console=ttyS0,115200 root=/dev/nfs
nfsroot=192.168.0.200:/usr/armel-rfs rootwait
ip=192.168.0.252:192.168.0.200:192.168.0.7:255.255.255.0::eth0


Booting stalls at:-

IP-Config: Complete:
     device=eth0, addr=192.168.0.252, mask=255.255.255.0, gw=192.168.0.7,
     host=192.168.0.252, domain=, nis-domain=(none),
     bootserver=192.168.0.200, rootserver=192.168.0.200, rootpath=
Looking up port of RPC 100003/2 on 192.168.0.200
eth0: link up (100/Full)
Looking up port of RPC 100005/1 on 192.168.0.200
VFS: Mounted root (nfs filesystem) on device 0:12.
Freeing init memory: 124K
Bad inittab entry at line 54
Initializing random number generator... done.
Starting network...
run-parts: /etc/network/if-pre-up.d: No such file or directory
ip: RTNETLINK answers: File exists


I am using almost same .config as for uclibc toolchain. May I know if
I have missed something?

regards

Nataraj
