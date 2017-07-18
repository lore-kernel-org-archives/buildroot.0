From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Jul 2017 10:19:48 +0200
Subject: [Buildroot] [PATCH] autobuild-run: add --repo option
In-Reply-To: <d958d5e4-3a8e-886d-5cc0-b632b15bd748@mind.be>
References: <20170717212859.12581-1-arnout@mind.be>
 <20170718095702.56523c1f@windsurf>
 <d958d5e4-3a8e-886d-5cc0-b632b15bd748@mind.be>
Message-ID: <20170718101948.2d81c105@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Jul 2017 10:12:11 +0200, Arnout Vandecappelle wrote:

> > Would it be reasonable to request that if a custom repo is used, then
> > uploading the results to autobuild.b.o is not possible ?  
> 
>  But Matt's use case is exactly that he doesn't have a good connection to the
> upstream repo so he wants to use a mirror, but still upload to a.b.o.
> 
>  Admittedly, this is exactly what lead to the recent problems with Matt's
> autobuilder...

Exactly my point: Matt's experience has shown that using a non-default
repository was causing problems, hence my resistance to this change.

In addition, if one is not able to fetch from https://github.com in a
reliable way, I don't see how one can decently run an autobuilder
instance that will anyway require download tons of stuff from various
places on the Internet.

> > Or am I too zealous about this ?  
> 
>  Yes you are. Without this change, someone like Matt will just edit the
> autobuild-run script and you still have the same problem :-)
> 
>  Perhaps we can make the problem at least detectable, by pushing *kwargs to
> a.b.o in addition to the BR git ID. But that obviously requires modifications on
> a.b.o itself, which is a bit more difficult to organize I guess.
> 
>  Since you're the BDFL for autobuild-run, feel free to follow up this patch with
> something that disables uploading if --repo is non-default. And let Matt solve
> his own problems :-)

Or I could add a server-side check that the git commit being reported
exists in the upstream Buildroot, and is not more than 1 or 2 days old.
It probably makes more sense to do this server-side. Which means I
could merge your --repo option (even if I still find its use cases
very, very dubious).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
