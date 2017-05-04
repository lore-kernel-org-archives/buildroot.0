From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 23:39:31 +0200
Subject: [Buildroot] Conflict between uClibc-ng if_arp.h and kernel headers
 since Linux 4.11 ?
Message-ID: <20170504233931.450f0a40@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Since a few days, we are seeing build failures of the radvd package in
Buildroot:

  http://autobuild.buildroot.net/?reason=radvd-2.12

The build failure is:

/home/buildroot/autobuild/run/instance-2/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/include/linux/if_arp.h:121:8: error: redefinition of 'struct arpreq_old'
 struct arpreq_old {
        ^~~~~~~~~~
In file included from includes.h:90:0,
                 from recv.c:17:
/home/buildroot/autobuild/run/instance-2/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/include/net/if_arp.h:147:8: note: originally defined here
 struct arpreq_old
        ^~~~~~~~~~
[...]

The build failures happens with uClibc-ng toolchains in combination
with Linux 4.11 kernel headers, so it seems to be a new thing caused by
Linux 4.11 headers. However the kernel Git history doesn't show any
change on this header file between 4.10 and 4.11.

Any idea?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
