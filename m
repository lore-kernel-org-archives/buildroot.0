From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 10 Nov 2014 10:24:36 +0000
Subject: [Buildroot] [PATCH 4/4] rt-tests: allow building subset of
 tests with non-NPTL toolchains
In-Reply-To: <20141110110606.091946eb@free-electrons.com>
References: <1415613549-2886-1-git-send-email-abrodkin@synopsys.com>
 <1415613549-2886-5-git-send-email-abrodkin@synopsys.com>
 <20141110110606.091946eb@free-electrons.com>
Message-ID: <1415615057.3817.1.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2014-11-10 at 11:06 +0100, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Mon, 10 Nov 2014 12:59:09 +0300, Alexey Brodkin wrote:
> 
> > diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
> > index 81e5d06..23cc284 100644
> > --- a/package/rt-tests/Config.in
> > +++ b/package/rt-tests/Config.in
> > @@ -1,7 +1,5 @@
> >  config BR2_PACKAGE_RT_TESTS
> >  	bool "rt-tests"
> > -	# no _tid field in 'struct sigevent'
> > -	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> 
> And it doesn't need thread support at all?

Indeed, threads are required.
So I should have put dependency on BR2_TOOLCHAIN_HAS_THREADS.

Thanks for pointing to this mistake.

If other patches for rt-tests are OK then I'll re-submit only the last
one.

-Alexey
