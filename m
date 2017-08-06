From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 6 Aug 2017 10:28:47 +0300
Subject: [Buildroot] [PATCH] squashfs: fix build with gcc 7
In-Reply-To: <20170731193433.7eb92d7d@windsurf.home>
References: <51890a64ced8a223b72a52bdb0e98fc31f539a30.1501007295.git.baruch@tkos.co.il>
 <20170731193433.7eb92d7d@windsurf.home>
Message-ID: <20170806072847.gpfjbsheok5o63xf@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Jul 31, 2017 at 07:34:33PM +0200, Thomas Petazzoni wrote:
> On Tue, 25 Jul 2017 21:28:15 +0300, Baruch Siach wrote:
> > gcc 7 with -Os (optimize for size) takes the liberty to remove the code of
> > inline function entirely. This leads to undefined function references at link
> > time. Restore gcc original inline behaviour to fix this issue.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/3c5/3c5b1d799dce3ba361d618330c242bf4eba76019/
> > http://autobuild.buildroot.net/results/09f/09f350b62e2486404b78222dce211400bb233000/
> > http://autobuild.buildroot.net/results/693/693960ed7c01622c756dcc929e83b3b713c16ccc/
> > 
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> > The gcc doc[1] doesn't mention that feature of C99. A gcc bug, maybe?
> 
> Applied to master, thanks. To be honest, I hesitated between your
> proposal and patching the mksquashfs.c code, but OK, I went with your
> solution.
> 
> Can you send a patch upstream that removes the "inline" or switches
> them to "static inline" ?
> 
> Thanks!

Done.

https://sourceforge.net/p/squashfs/mailman/message/35982546/

I'm still not sure what is the root cause if this issue, and whether this is 
GCC/C99 expected behaviour.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
