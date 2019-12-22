From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 21:57:35 +0100
Subject: [Buildroot] [git commit] package/genimage: add patch to support
 vfat volume-label
In-Reply-To: <87pnggyunx.fsf@dell.be.48ers.dk>
References: <20191221212320.354B08D318@busybox.osuosl.org>
 <8736dc2ym1.fsf@dell.be.48ers.dk>
 <20191222211222.5ae8664e@windsurf>
 <87pnggyunx.fsf@dell.be.48ers.dk>
Message-ID: <20191222215735.7565a31c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 22 Dec 2019 21:25:38 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

>  > Well, it's just a new feature that someone needs. We normally don't
>  > take feature patches, but this one is a backport from upstream.
>  > genimage also does new releases fairly infrequently, so waiting for the
>  > next release is not necessarily nice. The patch was short enough, taken
>  > directly from upstream, so I said "ok, let's take, it will anyway go
>  > away the next time we bump".  
> 
> OK, but we indeed don't take feature patches unless there is a good
> reason for it, and this commit is just syntactical sugar over adding -n
> <label> to extraargs, E.G.:
> 
> image foo.fat {
>   vfat {
>     extraargs = "-n MYLABEL"
>     ..
> }

True, I didn't know about extraargs. Really, I hesitated a bit because
of our usual policy, but then I said "meh, it's small, it's a backport
from upstream, let's not be too annoying". I can revert if needed, I
don't feel very strongly about this at all.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
