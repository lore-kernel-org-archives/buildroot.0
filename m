From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Aug 2015 08:18:10 +0200
Subject: [Buildroot] Analysis of build results for 2015-08-18
In-Reply-To: <CA+BsyQ7iPgOxOOY+vi09shjAJMhkaFQBcfe6EEJxmX_kVPh21A@mail.gmail.com>
 (Brendan Heading's message of "Wed, 19 Aug 2015 22:56:44 +0100")
References: <20150819063013.E74B810154B@stock.ovh.net>
 <20150819224105.2993bbe5@free-electrons.com>
 <CA+BsyQ7iPgOxOOY+vi09shjAJMhkaFQBcfe6EEJxmX_kVPh21A@mail.gmail.com>
Message-ID: <87k2sq7aal.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Brendan" == Brendan Heading <brendanheading@gmail.com> writes:

Hi,

 >> Peter, what do you suggest we do about these issues for the release?
 >> Long-term, libtirpc will be changed to not use atomic builtins. But
 >> what do we do now? Mark libtirpc as not available on SPARCv8, and
 >> propagate the reverse dependency?

 > Can I suggest that you just leave it broken ? I suspect it's been
 > broken for a little while. The problem in libtirpc was a commit in
 > 2011, which would have first been seen in stable release 0.2.3 in
 > 2013. We jumped from 0.2.2 to 0.2.4 on 26 Jun 2014 (f2ac23454) so each
 > release since then will have had this problem. A simple workaround in
 > the short term is simply to turn off libtirpc on SPARC manually.

Yes, that's fine by me.

 > It will take another week or so to sort this out as we're waiting for
 > the person who committed the change in the first place (in 2011) to
 > return from vacation so he can comment on it. The fix should be ready
 > by the end of the month assuming no objections are raised.

Ok, let us know how it goes.

 >>> arm | linux-pam-1.1.8 | NOK |
 >>> http://autobuild.buildroot.net/results/e337d69420ad00b2cc4017d639a31803926f2353/
 >> 
 >> musl build issue.

 > I have fixed most of this, nearly ready to submit a patch set once
 > I've tidied it all up. There are several further problems that also
 > have to be fixed. An additional headache is that the changes clash
 > with some of the existing patches.

 > Also, I've had to implement some functions that are missing from musl
 > entirely (by borrowing BSD implementations and conditionally
 > compiling). I know that Yann has been disabling musl support with
 > other packages that require this kind of change, so I'd be interested
 > to hear what the view is. linux-pam is a reasonably major component
 > and part of the justification for musl is to do with security ..

 > I will try to send an RFC patch tomorrow, it might take an iteration
 > or two to get it right. This might be a case where it is appropriate
 > to disable libpam + musl in the coming release.

For 2015.08 I would prefer to just disable it for musl. In general, we
want to carry as few / small patches as possible - So if we can work
with upstream to get these included that would be very good.

-- 
Bye, Peter Korsgaard
