From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Nov 2017 20:54:23 +0100
Subject: [Buildroot] [RFCv2 3/7] Makefile,
 skeleton: move the host skeleton logic to host-skeleton package
In-Reply-To: <20171125194650.3psruf7s2mhzjtgd@tarshish>
References: <20171124164610.6431-1-thomas.petazzoni@free-electrons.com>
 <20171124164610.6431-4-thomas.petazzoni@free-electrons.com>
 <20171125194650.3psruf7s2mhzjtgd@tarshish>
Message-ID: <20171125205423.45d27e1e@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Nov 2017 21:46:50 +0200, Baruch Siach wrote:
> Hi Thomas,
> 
> On Fri, Nov 24, 2017 at 05:46:06PM +0100, Thomas Petazzoni wrote:
> > As part of the per-package SDK work, we want to avoid having logic
> > that installs files to the global HOST_DIR, and instead do it inside
> > packages. One thing that gets installed to the global HOST_DIR is the
> > minimal "skeleton" that we create in host:
> > 
> >  - the "usr" symbolic link for backward compatibility
> > 
> >  - the "lib" directory, and its lib64 or lib32 symbolic links
> > 
> > This commit moves this logic to a new host-skeleton package, and makes
> > all packages (except itself) depend on it. We also make sure that this
> > host-skeleton package doesn't depend on host-patchelf, because
> > host-patchelf depends on host-skeleton.  
> 
> AFAICS, host-patchelf becomes a dependency of all packages only in patch #6. 
> Maybe this last sentence should move there.

True. This patch originally was *after* the change of the RPATH
strategy, and I decided to move it earlier in t he patch series, hoping
that it could be merged earlier than the bigger/more controversial
changes.

I'll fix that in v3.

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
