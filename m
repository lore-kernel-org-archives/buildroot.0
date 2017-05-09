From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 9 May 2017 11:13:14 +0200
Subject: [Buildroot] [uclibc-ng-devel] Conflict between uClibc-ng
	if_arp.h and kernel headers since Linux 4.11 ?
In-Reply-To: <20170504233931.450f0a40@free-electrons.com>
References: <20170504233931.450f0a40@free-electrons.com>
Message-ID: <9F5760C6-F414-4DB4-8D73-B828755B4A7A@openadk.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> Am 04.05.2017 um 23:39 schrieb Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> 
> Hello,
> 
> Since a few days, we are seeing build failures of the radvd package in
> Buildroot:
> 
>  http://autobuild.buildroot.net/?reason=radvd-2.12
> 
> The build failure is:
> 
> /home/buildroot/autobuild/run/instance-2/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/include/linux/if_arp.h:121:8: error: redefinition of 'struct arpreq_old'
> struct arpreq_old {
>        ^~~~~~~~~~
> In file included from includes.h:90:0,
>                 from recv.c:17:
> /home/buildroot/autobuild/run/instance-2/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/include/net/if_arp.h:147:8: note: originally defined here
> struct arpreq_old
>        ^~~~~~~~~~
> [...]
> 
> The build failures happens with uClibc-ng toolchains in combination
> with Linux 4.11 kernel headers, so it seems to be a new thing caused by
> Linux 4.11 headers. However the kernel Git history doesn't show any
> change on this header file between 4.10 and 4.11.
> 
> Any idea?

Not, yet. I am still investigating. May be something with the libc-compat.h mechanism inside the kernel changed. I can reproduce the issue, but had no time yet to bisect the kernel to find the commit which breaks radvd compile.

best regards
 Waldemar 
