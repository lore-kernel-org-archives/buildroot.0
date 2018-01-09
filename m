From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jan 2018 15:50:57 +0100
Subject: [Buildroot] [PATCH] glibc: ARC is now supported via patches
In-Reply-To: <1515506414.3868.7.camel@synopsys.com>
References: <20171109215821.16615-1-abrodkin@synopsys.com>
 <20180101123936.609b7f41@windsurf>
 <1515506414.3868.7.camel@synopsys.com>
Message-ID: <20180109155057.659c646b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 9 Jan 2018 14:00:15 +0000, Alexey Brodkin wrote:

> > This is a bit too much feature patches IMO, it's a complete
> > architecture port. I agree it's a backport from upstream, so it's not
> > too bad. But since glibc 2.27, which includes this, is expected to be
> > released on February 1st, I prefer to post-pone this change until glibc
> > 2.27 gets released and we move to it.  
> 
> That's very unfortunate but looks like we're not going to make ARC glibc port
> accepted before the upcoming release.

Gah, too bad :-/

> See https://sourceware.org/ml/libc-alpha/2017-12/msg00251.html for more details.
> Basically Vineet [who's doing the port] is now chasing a couple of issues found
> by glibc test-suite and before pretty much all of them are fixed the port will be
> considered for merging. That said having quite functional port in our fork
> we can and want to use it more to get better test coverage but for some more time
> [hopefully just before the next release] we'll need to use sources either from our GitHub
> [as we do today] or keep a set of patches.
> 
> Probably getting sources from GitHub is not the worst idea but my intention with
> patches on top of the tip of glibc sources from upstream "stable" branch was to get
> all latest fixes from this "stable" branch especially if those are fixes of build- and run-time
> issues.

I guess the easiest approach is to keep using your fork from Github.
It's up to you to decide what is the glibc version you want to use in
Buildroot, so if you want to move to something that is closer to what
is being submitted to glibc upstream, then that's perfectly fine: we
can take a patch changing the glibc package to use a new ARC glibc
version from Github.

Is that OK for you ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
