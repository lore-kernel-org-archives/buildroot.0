From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 28 Nov 2009 13:15:24 -0600
Subject: [Buildroot] BB update Was:  Build jobbing
In-Reply-To: <87ljhq4gfq.fsf@macbook.be.48ers.dk>
References: <200911271522.58858.minimod@morethan.org>
	<200911280943.16819.minimod@morethan.org>
	<87ljhq4gfq.fsf@macbook.be.48ers.dk>
Message-ID: <200911281315.27249.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat November 28 2009, Peter Korsgaard wrote:
> >>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:
> 
>  Michael> After disabling eject/eject-scsi support. . .
>  Michael> Looks like it has a dependency on jffs2:
> 
>  Michael>   CC      miscutils/flash_lock_unlock.o
>  Michael> miscutils/flash_eraseall.c:15:28: error: mtd/jffs2-user.h: No such file or directory
> 
> That's fixed by 4e385ee7 - Are you sure your tree is uptodate?
> 

I am no git expert, but it looks like it to me:

commit b4b561df9d484757845deaf1df91c418f5e68b78
Merge: 8c366a6... 4e385ee...
Author: Mike Z <minimod@morethan.org>
Date:   Sat Nov 28 09:22:25 2009 -0600

    Merge branch 'master' of git://git.buildroot.net/buildroot

commit 4e385ee794978e04701171f06cbfad8b3796e468
Author: Peter Korsgaard <jacmet@sunsite.dk>
Date:   Sat Nov 28 15:05:52 2009 +0100

    busybox: 1.15.2 flash_eraseall fix for modern kernel headers

    86cfb70ca upstream.

    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

commit 57922bfbf324745fb486775a53725ab573bfbf12
Author: Peter Korsgaard <jacmet@sunsite.dk>
Date:   Sat Nov 28 14:25:13 2009 +0100

    busybox: look at kernel headers for include files as well

    E.G. for flash_* applets.

    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

The git://git.buildroot.net/buildroot is a clone of the local
repository clone, I pulled them both before this build.

Did something move in the Buildroot tree?  I did not start over
with a distclean tree.  Whatever distclean does now.  ;)

Mike
