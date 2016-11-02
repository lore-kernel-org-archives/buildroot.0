From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Wed, 2 Nov 2016 11:21:17 +1100
Subject: [Buildroot] [PATCH 1/1] Autobuilder: add powerpc64 and
 powerpc64le
In-Reply-To: <20161101213257.21f2e590@free-electrons.com>
References: <955cacaf56560ef6d27555e5e969a576187daba3.1477975719.git.sam.bobroff@au1.ibm.com>
 <20161101154827.3b5b652f@free-electrons.com>
 <20161101213257.21f2e590@free-electrons.com>
Message-ID: <20161102002117.GB2028@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 01, 2016 at 09:32:57PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 1 Nov 2016 15:48:27 +0100, Thomas Petazzoni wrote:
> > > * I haven't inlcuded a pre-built tool chain. I'd like to have one
> > >   but I assume it can be set up separately.  
> > 
> > That's the point I wanted to discuss. I think I'd prefer to have
> > pre-built toolchains. Pre-built toolchains mean that people can much
> > more quickly reproduce build failures, as they can re-use the
> > pre-existing toolchain and just build the failing package. It *saves* a
> > lot of time. Also, using pre-built toolchains means that our
> > autobuilders CPU time is more dedicated into building packages than
> > building the toolchain.
> > 
> > The only drawback of pre-built toolchains is that they are not
> > automatically rebuilt when the toolchains components are
> > updated/patches. But I very regularly trigger a rebuild of the
> > pre-built toolchains, at least whenever I see some gcc/binutils/libc
> > changes, or when one of the person interested in a specific
> > architecture/toolchain asks me to do so.
> > 
> > So I think I'll just add a powerpc64/power7 pre-built toolchain and a
> > powerpc64le/power8 pre-built toolchain, if that's OK with you.
> 
> I just added those toolchains in the autobuilder infrastructure:
> 
>   https://git.buildroot.org/buildroot-test/commit/
> 
> So you should see the first build results for powerpc64(le) appear on
> http://autobuild.buildroot.org within the next few hours.
> 
> I've also added you in the DEVELOPERS file as a developer for the
> PowerPC architecture (which includes powerpc64/powerpc64le):
> 
>   https://git.buildroot.org/buildroot/commit/?id=adec13992ce2ee333353bac71faef18ea22f7974
> 
> This way starting tomorrow morning, you will receive every day a
> summary of the build failures that took place on powerpc.

Excellent, I, uh, look forward to build failures ;-)

Cheers,
Sam.
