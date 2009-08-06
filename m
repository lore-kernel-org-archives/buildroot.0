From: Daniel Mack <daniel@caiaq.de>
Date: Thu, 6 Aug 2009 16:18:18 +0200
Subject: [Buildroot] [PATCH 2/2] mtd-utils.git: fix targets
In-Reply-To: <8763d1mkzr.fsf@macbook.be.48ers.dk>
References: <20090729172019.GS19257@buzzloop.caiaq.de>
	<1248888083-11767-1-git-send-email-daniel@caiaq.de>
	<1248888083-11767-2-git-send-email-daniel@caiaq.de>
	<87tz0mm4as.fsf@macbook.be.48ers.dk>
	<20090806063612.GQ13236@buzzloop.caiaq.de>
	<8763d1mkzr.fsf@macbook.be.48ers.dk>
Message-ID: <20090806141818.GL19257@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 06, 2009 at 09:58:48AM +0200, Peter Korsgaard wrote:
> >>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:
> 
>  >> I expect that you just need to make mkfs.ubifs depend on largefile
>  >> support in the toolchain if it cannot easily be fixed in the
>  >> sources.
> 
>  Daniel> Hmm, yes. Unfortunately, we'll have to depend on LARGEFILE
>  Daniel> then. Give the patch below a try - and thanks for the
>  Daniel> patience :)
> 
> Hmm, that's quite a big hammer. Looking closer at it, it seems like
> the only thing that really needs largefile and libuuid support is
> mkfs.ubifs, which you build but never install. Wouldn't it be a lot
> simpler to simply add SUBDIRS=ubi-utils to the make arguments so it
> never tries to build mkfs.ubifs and get rid of the libuuid / largefile
> dependency?


I tried that now and it doesn't seem to suffice to override the SUBDIRS
directive. There are some other references as well.

As I would like to see these feature in the 2009.08 release, I suggest
to take it as it is now and amend it later to maybe eventually drop the
LARGEFILE dependency again. Does that sound feasible?

Daniel
