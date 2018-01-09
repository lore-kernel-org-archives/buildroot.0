From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 9 Jan 2018 14:00:15 +0000
Subject: [Buildroot] [PATCH] glibc: ARC is now supported via patches
In-Reply-To: <20180101123936.609b7f41@windsurf>
References: <20171109215821.16615-1-abrodkin@synopsys.com>
 <20180101123936.609b7f41@windsurf>
Message-ID: <1515506414.3868.7.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2018-01-01 at 12:39 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 10 Nov 2017 00:58:21 +0300, Alexey Brodkin wrote:
> > Given ARC port is just a very few patches away from upstream
> > and if those are based on 2.29 everything works like a charm
> > let's forget about SNPS GitHub stuff and use vanilla glibc
> > plus patches.
> > 
> > This among other things solves a problem with stable fixes for glibc.
> > Now when Buildroot switched to the tip of glibc's stable branch instead of
> > applying cherry-picked patches ARC version would stay behind every time
> > glibc's "version" gets updated in Buildroot.
> > 
> > But if we just apply ARC patches then we're good with whatever commit
> > from upstream stable branch is taken.
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Peter Korsgaard <peter@korsgaard.com>
> > ---
> >  package/glibc/0001-longlong.h-sync-from-gcc.patch  |  133 +
> >  .../0002-ARC-add-definitions-to-elf-elf.h.patch    |   94 +
> >  package/glibc/0003-ARC-Initial-port-to-glibc.patch | 7625 ++++++++++++++++++++
> 
> This is a bit too much feature patches IMO, it's a complete
> architecture port. I agree it's a backport from upstream, so it's not
> too bad. But since glibc 2.27, which includes this, is expected to be
> released on February 1st, I prefer to post-pone this change until glibc
> 2.27 gets released and we move to it.

That's very unfortunate but looks like we're not going to make ARC glibc port
accepted before the upcoming release.

See https://sourceware.org/ml/libc-alpha/2017-12/msg00251.html for more details.
Basically Vineet [who's doing the port] is now chasing a couple of issues found
by glibc test-suite and before pretty much all of them are fixed the port will be
considered for merging. That said having quite functional port in our fork
we can and want to use it more to get better test coverage but for some more time
[hopefully just before the next release] we'll need to use sources either from our GitHub
[as we do today] or keep a set of patches.

Probably getting sources from GitHub is not the worst idea but my intention with
patches on top of the tip of glibc sources from upstream "stable" branch was to get
all latest fixes from this "stable" branch especially if those are fixes of build- and run-time
issues.

-Alexey
