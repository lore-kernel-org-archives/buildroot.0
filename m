From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 19:30:59 +0200
Subject: [Buildroot] [PATCH v2.1 1/6] package/go: Build host tools with
 host CC
In-Reply-To: <1464283496.2374.20.camel@infradead.org>
References: <cover.1463696454.git.geoff@infradead.org>
 <aa4ea0467b1c08f0afb3d5ba2cf7af201f6ceeef.1463696454.git.geoff@infradead.org>
 <1464125645.5014.52.camel@infradead.org>
 <20160525160529.2c19eea9@free-electrons.com>
 <1464194514.30545.5.camel@infradead.org>
 <20160525225947.15913a38@free-electrons.com>
 <1464283496.2374.20.camel@infradead.org>
Message-ID: <20160526193059.67057700@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 May 2016 10:24:56 -0700, Geoff Levand wrote:

> There is a subtle difference, when we build with HOST_GO_HOST_CC the
> resulting host compiler binaries have the go environment variables CC
> and CXX set to the host compilers.  They should be set to the target
> cross compilers so that by default go programs are built with the target
> cross compiler.  That was one motivation for my follow up patch
> 'package/go: Add HOST_GO_TARGET_ENV', which sets those to the proper
> values for target package builds.

Ah, indeed.

> I had planned to look into how to fix this environment problem.  One
> idea was to use a custom version of ./make.bash that would do the
> right thing.
> 
> On thinking about it, it seems it would be best for now to do the
> two step build for all configs and expect package maintainers to
> either use HOST_GO_TARGET_ENV or set CC and CXX.  That would avoid
> the situation where the maintainer does not test with host arch
> equal to target arch.

OK. Can you respin the patch quickly to address this? the host-go and
flannel issues are the main remaining build issues we have, and it
would be good to fix them for 2016.05.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
