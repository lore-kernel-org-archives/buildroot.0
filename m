From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Nov 2016 21:01:03 +0100
Subject: [Buildroot] [PATCH] uclibc-test: new package
In-Reply-To: <20161112192324.GN27313@waldemar-brodkorb.de>
References: <20161105105343.GA27187@waldemar-brodkorb.de>
 <bc4b5500-9bc2-90e3-975e-2f527d157e33@mind.be>
 <20161112192324.GN27313@waldemar-brodkorb.de>
Message-ID: <20161112210103.125ee1a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Nov 2016 20:23:25 +0100, Waldemar Brodkorb wrote:

> >  Why not call the package uclibc-ng-test? Are you still hoping to merge back
> > with uClibc? :-)  
> 
> No. :)
> I just thought it might better align with package/uclibc.
> What other think? How should the package be named?

We always prefer the upstream name of the package, i.e uclibc-ng-test
in this case. "uclibc" is kind of a special case: it used to be the
original upstream name, until it went dead and you forked it. But in
all other cases, using the upstream name is preferred.

> Not sure. When do I should use BR2_TOOLCHAIN_BUILDROOT_* and when
> BR2_USE_*?

Easy: the BR2_TOOLCHAIN_BUILDROOT_* options are specific to the
internal toolchain backend, they have no meaning if you use an external
toolchain or even for many of them if you use glibc or musl with the
internal toolchain backend. They are visible options that allow the
user to tell whether he wants this feature or not in the toolchain to
be built by Buildroot.

On the other hand, BR2_USE_WCHAR, BR2_TOOLCHAIN_HAS_THREADS, etc. are
blind options that tell packages which features are provided by the
toolchain. They always exist, regardless of whether you're using the
internal or external toolchain backend, and regardless of the C library
you're using.

> >  Static implies NO_TLS and NO_NPTL? That warrants a comment...  
> 
> Most of the TLS and NPTL tests use dlopen.

Needs a comment, as Arnout said.

> >  Can't this be done in one make invocation 'make ... test_compile test_gen'? Or
> > is there a parallel build issue?  
> 
> Not exactly an issue. It will generate the needed meta data, the
> order of test case execution will be random and not always the same
> order. If this is not important, I can combine this.

I think having the test execution in predictable order is a nice
feature of test suites, no?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
