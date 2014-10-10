From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Oct 2014 12:18:51 +0200
Subject: [Buildroot] Topics to discuss at the meeting
In-Reply-To: <CAAXf6LUXNKA-C9P9a97w=9Red=y=TCpMQK9Cndxj3E9trB2VWQ@mail.gmail.com>
References: <20141008105653.7252facd@free-electrons.com>
 <CAAXf6LVHz0qp3VsyAFRhrkH6ekaQ-evzJeoaYSZ+oCkg0cuTWA@mail.gmail.com>
 <20141008181204.599a5e55@free-electrons.com>
 <CAAXf6LUXNKA-C9P9a97w=9Red=y=TCpMQK9Cndxj3E9trB2VWQ@mail.gmail.com>
Message-ID: <20141010121851.72b2de6e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 10 Oct 2014 11:50:56 +0200, Thomas De Schampheleire wrote:

> > Then yes, we need to do something about it, but I don't think there's a
> > need to identify the C library, compiler and so on. Most of the
> > external toolchain providers already provide a tarball of the sources
> > they use to build the toolchain. At least that's the case for Sourcery
> > CodeBench toolchains and Linaro toolchains. But I'm not sure how to
> > integrate this with the licensing infrastructure, which assumes that
> > what each package downloads is already the source code.
> 
> Sources are one thing, the manifest is the other. Both are pretty
> independent. Even if you find some way of obtaining the sources for
> the external toolchain, you still have to list the components used in
> the manifest. For a toolchain, some components are host components
> (the actual compiler, linker etc.) and some are target components,
> like the C library, C++ library, libgcc, etc. Each of these have a
> license, version etc.

Right, not easy. Something to be discussed at the meeting maybe, even
though I'd like to avoid long and unproductive discussions if
possible :-)

> To be correct, this should be reported and fixed upstream.

Except that in many cases, those packages not having any license files
are old, not really maintained packages, where upstream is close to
dead.

> In the meantime, adding the license to buildroot seems a bit odd.
> Rather I would mark the package with some magic string (like
> '(missing)' that indicates that the license text is missing. However,
> I vaguely recall that we discussed that before, and that not everyone
> was agreeing with such a magic string.

Did we discuss that in the past? I believe it would be a good idea, as
we allow us to distinguish the cases where we have already done some
inspection and concluded that there is really no license from the cases
where the license files information hasn't been added. Though it's true
that in general, when <pkg>_LICENSE is mentioned but not
<pkg>_LICENSE_FILES, it's already an indication that the license
information has been inspected and that the conclusion was that there
was no license file available.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
