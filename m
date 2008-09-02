From: hartleys <hartleys@visionengravers.com>
Date: Tue, 2 Sep 2008 13:49:12 -0400
Subject: [Buildroot] svn commit: trunk/buildroot/package: games
	games/ace_of_penguins games/gnuch etc...
In-Reply-To: <19250901.post@talk.nabble.com>
References: <20080829132737.BF3503C864@busybox.net><20080829153841.37df370c@atmel.com><BD79186B4FD85F4B8E60E381CAEE19097AE654@mi8nycmail19.Mi8.com><19223815.post@talk.nabble.com><COL102-DS131551BA49AC350CABE3EFDC630@phx.gbl>
	<19250901.post@talk.nabble.com>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909812D2F@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, September 01, 2008 2:07 AM, Daniel Laird wrote:
> I have just tried to patch various games packages and java
> ones jamvm (packages/java/jamvm) works fine patch-version
> and patch-version.arch work
>
> ace_of_penguins - the libtool patch fails I think this a
> fault with libtool patch not the dir move lxdoom - patch
> target works rubix - patch target works gnuchess - patch
> target works vice - patch target works
>
> So I think the move is fine and that the issues are with
> making the libtool patch apply to more targets Daniel Laird

Daniel, I still don't see how the patches can be applied correctly with
the current rule in Makefile.autotools.in.

I tried to test it this morning by building one of the games packages
(gnuchess) and it never even gets processed. I think there needs to be a
games.mk in package/games that does a:

include package/games/*/*.mk

Hartley
