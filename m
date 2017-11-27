From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Mon, 27 Nov 2017 13:20:00 +0200
Subject: [Buildroot] [PATCH v1] busybox: Fix rtcwake to use /dev/rtc0
 properly
In-Reply-To: <f5531efb-4352-d8af-5c2a-5ba38bab94c4@mind.be>
References: <20171123183914.71769-1-andriy.shevchenko@linux.intel.com>
 <b2f0d3bf-b8a1-c948-2013-35dc605c2cbd@mind.be>
 <1511530053.25007.435.camel@linux.intel.com>
 <f5531efb-4352-d8af-5c2a-5ba38bab94c4@mind.be>
Message-ID: <1511781600.25007.448.camel@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2017-11-25 at 18:40 +0100, Arnout Vandecappelle wrote:
>  Hi Andy,
> 
>  Sorry, I should have started my mail with:
> 
>  Thank you very much for your contributation. I'm afraid, however, we
> will not
> accept it as is in Buildroot.

Much better :-)

> > >  In Buildroot, we don't accept "feature patches" for packages.
> > 
> > To be honest it's not a feature patch at all. It fixes (okay,
> > workarounds) obvious bug in rtcwake logic. Easy to reproduce. 100%
> > reproducible
> 
>  Yes, that's why I continued with:
> 
> > >  We try to limit
> > > to patches that fix the build or complete breakage, sometimes also
> > > to
> 
>               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
>  For other bugs, we will happily include upstream patches. But patches
> that are
> not yet upstream are dangerous: how can we be sure that it doesn't
> break things?
> In this particular case, you patch *will* actually break things for a
> who does
> have a working /dev/rtc but it is something different than /dev/rtc0.
> We want
> upstream to take the responsibility for that.

Of course.

Btw, how many use cases where people use rtcwake from busybox vs. util-
linux?

I doubt there are many.

> > >  For sure, you should first send the patch upstream.
> > 
> > Are you sure I didn't?
> 
>  I checked the mailing list, it wasn't there. I checked google, and
> found nothing.
> 
> > The policy of Busybox mailing list is to reject (I'm not subscriber
> > and
> 
>  Buildroot mailing list has the same policy (well, it goes into a
> moderation
> queue but that is filled up with so much spam that it's unlikely it
> ever makes
> it to the list).

Exactly! Not reject, but put in to moderation queue. Feel the
difference!

>  If you have a solution to bar spam from mailing lists, please
> share it!

See above.

> > after a such policy would not like to be one). Happy contribution!
> > 
> > >  Particularly in the case of
> > > busybox, Denys often proposes improved patches. If it gets
> > > accepted
> > > upstream,
> > > then we can consider including it in Buildroot as well.
> > 
> > Good luck!
> > 
> > I'm done with it. If Denys is caring about project he will take the
> > series (there are more patches than just one) from his private
> > mailbox
> > (Cc was there as well).
> 
>  If/when he does, feel free to resubmit with a reference to the
> upstream commit.

OK.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
