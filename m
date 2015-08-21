From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Aug 2015 10:46:22 +0200
Subject: [Buildroot] Analysis of build results for 2015-08-18
In-Reply-To: <CA+BsyQ7iPgOxOOY+vi09shjAJMhkaFQBcfe6EEJxmX_kVPh21A@mail.gmail.com>
References: <20150819063013.E74B810154B@stock.ovh.net>
 <20150819224105.2993bbe5@free-electrons.com>
 <CA+BsyQ7iPgOxOOY+vi09shjAJMhkaFQBcfe6EEJxmX_kVPh21A@mail.gmail.com>
Message-ID: <20150821104622.3abb16d1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

On Wed, 19 Aug 2015 22:56:44 +0100, Brendan Heading wrote:

> > Peter, what do you suggest we do about these issues for the release?
> > Long-term, libtirpc will be changed to not use atomic builtins. But
> > what do we do now? Mark libtirpc as not available on SPARCv8, and
> > propagate the reverse dependency?
> 
> Can I suggest that you just leave it broken ?

Leaving things broken in the autobuilders is annoying. For two reasons:

 1/ Due to this Busybox failure on SPARC, many SPARC builds abort at
    this point, and we don't see other SPARC failures.

 2/ It leaves some "noise" in the build results, and due to this it's
    hard to distinguish the build failures that should be investigated
    from the ones that are already analyzed.

> I suspect it's been
> broken for a little while. The problem in libtirpc was a commit in
> 2011, which would have first been seen in stable release 0.2.3 in
> 2013. We jumped from 0.2.2 to 0.2.4 on 26 Jun 2014 (f2ac23454) so each
> release since then will have had this problem. A simple workaround in
> the short term is simply to turn off libtirpc on SPARC manually.

Testing SPARC in the autobuilders is fairly recent, that's why we're
only tackling this problem now.

> It will take another week or so to sort this out as we're waiting for
> the person who committed the change in the first place (in 2011) to
> return from vacation so he can comment on it. The fix should be ready
> by the end of the month assuming no objections are raised.

I doubt we can get this merged for 2015.08, though. It will probably be
2015.11 material.

In any case, thanks a lot for working on this libtirpc topic, it has
been around for a while, so it's good to have someone looking into this!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
