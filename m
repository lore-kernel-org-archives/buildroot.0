From: Vadym Kochan <vadim4j@gmail.com>
Date: Tue, 2 Apr 2019 19:08:53 +0300
Subject: [Buildroot] [PATCH 3/3] package/s6-rc: Allow to integrate s6-rc
 services
In-Reply-To: <20190328152346.297748d0@windsurf>
References: <20190216212835.25503-1-vadim4j@gmail.com>
 <20190216212835.25503-4-vadim4j@gmail.com>
 <20190327195409.14931f34@windsurf>
 <7bb98b03-837a-2494-3de0-b8267a8b7d56@mind.be>
 <be747f83-7044-2f47-a3bd-351bb8a59f37@mind.be>
 <20190328152346.297748d0@windsurf>
Message-ID: <20190402160853.GC3682@lwo1-lhp-f71841>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, Thomas, Eric, All

On Thu, Mar 28, 2019 at 03:23:46PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 27 Mar 2019 21:37:38 +0100
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
> > On 27/03/2019 21:35, Arnout Vandecappelle wrote:
> > >  If such a review is done, I wouldn't mind moving the hooks after the
> > > overlay/post-build.  
> > 
> >  Something essential I forgot to mention: for this s6 patch, the same approach
> > as python should be followed: do it as a TARGET_FINALIZE_HOOK. Too bad that it
> > doesn't help for init scripts added in the overlay, but such is life.
> 
> The downside is that for custom sysv init scripts or systemd unit
> files, you can put them in an overlay/post-build, but for s6 "service"
> files, you cannot do that: they must be installed by a package.
> 
> But perhaps that is an acceptable thing, at least in a first step.
> 
> Vadim: what do you think ? Would you be OK with a solution where only
> packages can install s6 service files ?
> 

I think it might be enough for the first step, then to add custom s6
scripts it will be needed to add special custom package in custom exernal tree
which will install the needed s6 scripts. BTW, to manually re-install the
services by buildroot from command line it will be needed to call re-installation
of all packages to re-generate s6-init db again.

Regards,
Vadim Kochan
