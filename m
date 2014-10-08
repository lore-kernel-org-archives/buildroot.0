From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Oct 2014 18:12:04 +0200
Subject: [Buildroot] Topics to discuss at the meeting
In-Reply-To: <CAAXf6LVHz0qp3VsyAFRhrkH6ekaQ-evzJeoaYSZ+oCkg0cuTWA@mail.gmail.com>
References: <20141008105653.7252facd@free-electrons.com>
 <CAAXf6LVHz0qp3VsyAFRhrkH6ekaQ-evzJeoaYSZ+oCkg0cuTWA@mail.gmail.com>
Message-ID: <20141008181204.599a5e55@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 8 Oct 2014 13:56:56 +0200, Thomas De Schampheleire wrote:

> I thought, with Luca being present again after a few years, it would
> be a good idea to briefly see what may need to be improved / added to
> the legal-info infrastructure. Is there anything missing,
> feature-wise?

Well, if no-one asks for any feature, there's nothing missing,
right ? :-)

> For toolchain, even if it is difficult to save the sources, we could
> consider identifying the packages contained in the toolchain, like
> which C library, compiler, etc. and provide version and license for
> each of them. This info could then be collected in the manifest as
> well. This should include info on the target files, like libstdc++,
> libgcc, ...

I guess you're talking about the external toolchains, right?

Then yes, we need to do something about it, but I don't think there's a
need to identify the C library, compiler and so on. Most of the
external toolchain providers already provide a tarball of the sources
they use to build the toolchain. At least that's the case for Sourcery
CodeBench toolchains and Linaro toolchains. But I'm not sure how to
integrate this with the licensing infrastructure, which assumes that
what each package downloads is already the source code.

Certainly something we can discuss with Luca during the meeting.

> Also, to me it would make sense to place the code related to
> legal-info in one file, like legal-info.mk. Currently there are parts
> in Makefile, pkg-utils.mk and pkg-generic.mk. While pkg-generic can
> stay as it is, the lines from Makefile and pkg-utils.mk could be
> extracted to a single, separate file IMO.

Right. Generally speaking, I'd like the main Makefile to reduce in
size, by moving "specific" things in other places, in a more organized
way.

> Looking at the package stats:
> Packages having license information 1298
> Packages not having licence information 73
> Packages having license files information 1219
> Packages not having licence files information 152
> 
> So at that level we're pretty good, but ideally we can get these
> second and fourth counters to 0.

For the second, yes. For the fourth, there's unfortunately an issue: we
don't distinguish packages for which we haven't yet filled the license
files information from the packages we already had a look at, and for
which unfortunately there isn't a file containing the license text. So
it's hard to go to 0 for the fourth counter, because some packages
simply do not have a license text built-in. What do we do for those
packages? Add the license text in package/<foo>/ and copy it to the
source tree as a post-extract hook ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
