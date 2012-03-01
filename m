From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Mar 2012 08:50:10 +0100
Subject: [Buildroot] Kernel and buildroot in 1MB
In-Reply-To: <4F4EC83C.7090208@yahoo.co.uk>
References: <4F4EC83C.7090208@yahoo.co.uk>
Message-ID: <20120301085010.1cec8907@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Thu, 01 Mar 2012 00:52:12 +0000,
bifferos <bifferos@yahoo.co.uk> a ?crit :

> So far I have been using buildroot only to extract the busybox binary 
> and use it with my own hand-crafted rootfs, because pretty much any 
> binaries other than busybox put me over the limit.  It would be nice
> to use the buildroot filesystem as generated, so my question is
> this:  If I build a busybox statically linked to uclibc, how can I
> remove *all* the other binaries, e.g. uclibc .so?  Or does the build
> system not support that?

Normally BR2_PREFER_STATIC_LIB=y should give you a system with no
shared libraries, and everything linked statically. However, it is not
widely, so there might be issues, but we might be interested in fixing
them.

That said, it's probably quite difficult these days to build a system
for which the kernel+root filesystem fits within 1 MB, as your e-mail
topic seems to suggest.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
