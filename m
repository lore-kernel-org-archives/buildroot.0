From: Thomas Lundquist <lists@zelow.no>
Date: Sun, 23 Sep 2007 00:19:07 +0200
Subject: [Buildroot] buildroot with ipkg
In-Reply-To: <1190496532.46f58914948c8@imp.free.fr>
References: <46EED912.2070902@free.fr> <20070917201401.GA28671@codepoet.org>
	<46EEEEE2.7060705@free.fr> <20070919064200.GA29317@zelow.no>
	<20070919192740.GC817@aon.at> <20070919205603.GA16408@zelow.no>
	<20070919215043.GX20058@aon.at> <46F2E33A.1070307@free.fr>
	<20070920213724.GA18637@zelow.no>
	<1190496532.46f58914948c8@imp.free.fr>
Message-ID: <20070922221907.GC711@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 22, 2007 at 11:28:52PM +0200, julien.boibessot at free.fr wrote:
> 
> With the "OpenWrt" method you have:
> * the packages (.ipkg) built for all the Buildroot software you selected with
> menuconfig
> * AND a rootfs with all these packages pre-installed (ready to test your
> configuration)

And a rootfs without any of the packages?

> After that you can upload your packages to your (web)server and share/use them,
> or directly flash the rootfs.
> What I was pointing in my email is that you probably don't need to add your
> "<m>" entry in Buildroot menuconfig. Your option to choose the package type
> should be
> enough: if the user choose to build packages, then you can build them for all
> the selected software.

I kinda like to be able to pick for a base or extras. It may make it a
tad more complex but since I've already solved it, I'm happy.

(Thanks Kconfig :=)

> Sorry, I probably failed to explain my thoughts clearly...
> Why not build all software as packages when the user want it and as "builtin" in
> the other case ?

I want more flexibility. Busybox is an example, it's usually needed to
being able to add a package, so it's a part of the base. or is it if you
add util-linux and gnu tools? so which one should become a package? or
not become one?

The builder (should) know this and do the right pick.

> Don't forget package dependencies...

I'm not bothered with them right now but I do have that on my list of
things to add when I know that it's accepted.

But it should be quite simple with the autotools stuff so I guess I
might start there as soon as I've been able to compile a simple X server
with a few drivers.

> If you need help to integrate ipkg, I have already some modifications of
> Buildroot to share with you, before publishing them.

Sounds good.



Thomas.
