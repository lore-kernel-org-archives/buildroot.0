From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2015 15:39:26 +0100
Subject: [Buildroot] [PATCH 1/2] libnet:new package
In-Reply-To: <5643507F.3050903@mind.be>
References: <1447059812-26424-1-git-send-email-joris.lijssens@gmail.com>
 <56427B24.7030602@mind.be>
 <20151111150528.16ffceac@free-electrons.com>
 <5643507F.3050903@mind.be>
Message-ID: <20151111153926.6543a4a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Wed, 11 Nov 2015 15:28:15 +0100, Arnout Vandecappelle wrote:

>  Don't you have a hook that does that automatically? Anyway, they currently are
> still marked as Changes Requested, so I'll update them to Accepted.

I don't use an automatic hook, no. I used to have one, but it wasn't
working well when the patch was changed compared to the one in
patchwork. I know Peter now uses git notes to solve this problem, but I
haven't implemented a similar solution.

Since when I'm done with a patch I anyway have to look again at the
list of patches to pick the next one to work on, it's not a big deal to
mark as Accepted the patch(es) I just applied.

> > This package is not fetched from github. But I've added the hash
> > nonetheless.
> 
>  Oops, I confused the two patches :-)

As I said to my reply to Joris, there is in fact a newer upstream for
libnet, hosted at github. But it did not build nicely out of the box,
so I gave up and reverted back to the version used by Joris.

> > I did a test build here for ARM, and did not encounter any issues.
> > Which configuration did you test? Or is it just by inspection of
> > configure.ac?
> 
>  With "fail" I mean that it will think that PF_PACKET/ETH_P_ALL is not
> available, while normally on Linux it is available (at least for root). Maybe
> you can configure it out of the kernel, but that would be a very exotic config.
> 
>  I noticed it by inspecting configure.ac and tested an armv7 build to confirm.

Right. Can you submit a patch doing that? Either you or Joris?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
