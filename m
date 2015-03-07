From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 16:35:01 +0100
Subject: [Buildroot] [PATCH V2 1/2] tcl: add support for static builds
In-Reply-To: <54FB13AD.5080008@imgtec.com>
References: <1425734562-5312-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150307144233.5ee1db01@free-electrons.com>
 <54FB0B22.8050604@imgtec.com>
 <20150307155634.605f5a68@free-electrons.com>
 <54FB13AD.5080008@imgtec.com>
Message-ID: <20150307163501.23dbf86c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Sat, 7 Mar 2015 16:05:17 +0100, Vicente Olivert Riera wrote:

> If you have a package that depends on tcl (it links against libtcl8.6.a,
> for instance), then you will need the target tcl (actually the staging
> one), which has the right architecture for your target, no? The host tcl
> would have the same architecture as the host machine which may not be
> the same as the target one.
> 
> Am I missing anything?

Yes: you still haven't answered whether the 'packages' thing in TCL is
important or not. Yes, your tcl static linking thing is *building*
properly. But does it work? Does the result actually make sense? You've
solved the static linking case by simply not building everything. What
guarantees you that the result is something that works?

Since it seems you actually don't know what TCL is and how it works
(and neither do I), I'd prefer to mark it !BR2_STATIC_LIBS, and let
someone actually interested in using TCL in a statically linked
scenario take care of implementing this.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
