From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jun 2011 08:54:30 +0200
Subject: [Buildroot] [PATCH 7/8] package/autotools: add --{enable,
 disable}-{shared, static} automatically
In-Reply-To: <874o3t9zs2.fsf@macbook.be.48ers.dk>
References: <cover.1306792524.git.thomas.petazzoni@free-electrons.com>
	<cover.1306792524.git.thomas.petazzoni@free-electrons.com>
	<dac0f2005b38138ceb18943190580c3bd392a4fa.1306792524.git.thomas.petazzoni@free-electrons.com>
	<87k4cq7rdq.fsf@macbook.be.48ers.dk>
	<20110613001630.1281e5c3@skate>
	<874o3t9zs2.fsf@macbook.be.48ers.dk>
Message-ID: <20110614085430.3229006e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Mon, 13 Jun 2011 23:39:41 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

>  Thomas> It's true that I haven't checked the impact on the build
>  Thomas> time. Does it really build libraries twice ? Isn't only the
>  Thomas> link stage performed twice ?
> 
> Yes, in general it needs to build each source file twice because of
> the different compiler flags (E.G. -fPIC).

Ah, okay. True that I didn't check this closely.

> Which I first built normally (a) and then with make
> SHARED_STATIC_LIBS_OPTS='--disable-static --enable-shared' (b). The
> machine was busy doing other stuff, so you cannot completely trust the
> build time numbers, but here they are anyway:
> 
> (a):
> real    27m14.481s
> user    45m4.601s
> sys     12m11.738s
> 
> (b):
> real    28m56.879s
> user    44m16.506s
> sys     10m56.337s
> 
> So no significant difference - B is even slightly slower here. Most of
> the time is spent building the toolchain.

Ok, interesting. Did you actually check that in the two different
builds, one was actually building the library object files twice ?

> A naturally leads to a bit bigger staging though:
> 
> du -hs {a,b}/staging/
> 28M     a/staging/
> 26M     b/staging/
> 
> But it (naturally) doesn't affect the image size:
> du -hs {a,b}/images
> 5.0M    a/images
> 5.0M    b/images
> 
> So I think we should just leave it as it is for now.

Ok. Thanks a lot for doing this testing!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
