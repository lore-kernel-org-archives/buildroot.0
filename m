From: Brent Generous <bgenerous@impinj.com>
Date: Mon, 5 Aug 2019 18:07:26 +0000
Subject: [Buildroot] [PATCH 1/1] Makefile: add $BINARIES_DIR dependency
 to target-post-image target
In-Reply-To: <20190804144247.GC25437@scaer>
References: <20190712160925.6027-1-bgenerous@impinj.com>
 <20190804144247.GC25437@scaer>
Message-ID: <0f0f8c382e9b9ac31cdc37c6846bfa5f9525bdb6.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, 2019-08-04 at 16:42 +0200, Yann E. MORIN wrote:
> Brent, All,
> 
> Thanks for your contribution.
> 
> On 2019-07-12 16:10 +0000, Brent Generous spake thusly:
> > Without this dependency, there is no guarantee that the
> $BINARIES_DIR
> > has been created before this point. This can cause commands that
> intend
> > to copy a file into $BINARIES_DIR to instead copy to a file named
> > $BINARIES_DIR, causing later commands to create this directory to
> fail.
> > 
> > A comment above the target for $BINARIES_DIR mentions "do NOT list
> these
> > as dependencies anywhere else". It wasn't clear from the git
> history why
> > that should be the case. This seems like the correct way to handle
> the
> > dependency on this directory.
> 
> We've discussed this today during the developpers meeting, andwe
> concluded that the real solution would be to create the directory
> right
> before calling the post-image scripts. I've respun a v2:
> 
> https://patchwork.ozlabs.org/patch/1141759/
> 
> Can you confirm this also fixes your issue?

This looks like a mix of two patches that do the same thing. The patch
in d57e7307 that was applied to master however does fix my original
issue.

I'm curious though -- d57e7307 does not have the order-only
prerequisite, and instead uses `mkdir -p` in the recipe. Do you know
why this is preferred over the order-only prerequisite?

Thanks,
Brent
