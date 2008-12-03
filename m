From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Dec 2008 09:31:03 +0100
Subject: [Buildroot] [RFC] First hack for external toolchain support
 based on sysroot
In-Reply-To: <COL102-DS16312FCA60C7EA2DB82A0CDC030@phx.gbl>
References: <20081202232132.7c67e402@surf>
	<COL102-DS16312FCA60C7EA2DB82A0CDC030@phx.gbl>
Message-ID: <20081203093103.3aab088d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 3 Dec 2008 08:14:00 +0000,
"Daniel Laird" <danieljlaird@hotmail.com> a ?crit :

> I had done the first bit and not the second.  I will start to look at
> this. Perhaps the CFLAGS and LDFLAGS can go back to how they were
> when new started all this.
> eg LD="$(TARGET_LD) $(TARGET_LDFLAGS)"
> 
> Does that work for DirectFB?

Maybe, I haven't tried.

> Cheers foe this good work, maybe we will have external toolchain
> working properly soon?

I hope so :-)

The nice advantage of the --sysroot solution is that it should work in
all cases, while the -rpath-link solution didn't work for Qtopia, for
example.

> My next question is - with sysroot set do we really need to set the
> SYSROOT option to pkgconfig? and do we need to sed all the .la files?

I'd say we still need them. Otherwise in a .la file you'll
have /usr/lib/libfoobar.a, and I don't think gcc will interpret that
relative to its --sysroot. But it remains to be checked.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
