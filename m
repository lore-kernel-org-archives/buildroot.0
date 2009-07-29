From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2009 10:25:24 +0200
Subject: [Buildroot] Problem using netsnmp
In-Reply-To: <4A70030F.9080007@tandberg.com>
References: <4A6EE8F1.3060302@tandberg.com>
	<87y6q8jyz1.fsf@macbook.be.48ers.dk>
	<4A70030F.9080007@tandberg.com>
Message-ID: <20090729102524.0178b0d6@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 29 Jul 2009 09:06:39 +0100,
Chris Smith <chris.smith@tandberg.com> a ?crit :

> Sorry that should have been libc.so.6.
> 
> Building for i486.

Ok, so same architecture on the build machine and the target machine.

> /usr/sbin/snmpd: can't load library 'libc.so.6'

I suspect that the host toolchain is leaking somewhere in the build.
libc.so.6 clearly indicates a glibc-based toolchain, which is the one
of your host. Such a mix usually gets detected when the build machine
and the target machine have a different architecture, but here, since
it's the same, it might remain undetected.

I suspect one of the libraries on which snmpd depends, gets compiled
against the host glibc instead of the target uClibc.

Will try to find some time to dig into this.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
