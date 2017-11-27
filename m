From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Mon, 27 Nov 2017 08:58:10 -0500
Subject: [Buildroot] Analysis of build results for 2017-11-25
In-Reply-To: <20171126152140.0fd3902b@windsurf.home>
References: <20171126070006.676FA209DE@mail.free-electrons.com>
 <20171126152140.0fd3902b@windsurf.home>
Message-ID: <20171127135810.4tdzrguynfo4eokj@archlinux.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sun, Nov 26, 2017 at 03:21:40PM +0100, Thomas Petazzoni wrote:
> >       x86_64 |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/3c42c1eadcbfc084a1e55bf1df0450aaf1f2139c |     
> >     mips64el |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/de0dd8983243ee5d1fb189add8ce445177fb87c2 |     
> 
> /home/buildroot/build/instance-0/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/linux/in6.h:30:8: error: redefinition of 'struct in6_addr'
>  struct in6_addr {
> 
> Ga?l, you recently bumped this package, could you have a look?
>

After a quick look, the issue comes from the toolchain that uses glibc
2.18. I assume the package builds fine with glibc > 2.18.

I am on it.
