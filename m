From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Feb 2017 09:27:54 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-02-16
In-Reply-To: <b94b135b-35c2-ad80-9a99-f14ebfea1e06@mind.be>
References: <20170217072852.8329420B82@mail.free-electrons.com>
 <20170217211242.GC3470@free.fr>
 <20170220134111.1bc02a9f@free-electrons.com>
 <b94b135b-35c2-ad80-9a99-f14ebfea1e06@mind.be>
Message-ID: <20170221092754.3dd7bc65@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Feb 2017 09:05:01 +0100, Arnout Vandecappelle wrote:

>  Perhaps for the timeout, it would make sense to do a setrlimit(RLIMIT_CPU) in
> addition to the monitor. That way you avoid that a single compile stays stuck
> for 7 hours. Though admittedly at the moment it happens sufficiently rarely to
> not be too much of a waste.

So doing "ulimit -t 60" will for example prevent a single process from
getting more than 60 seconds of CPU time ?

But I agree, it doesn't happen that often, so probably not worth the
effort.

> >>>         sh4a |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/2944568f9623f1377e987a1dadde5ea8cc428c5f    
> >>
> >>     error: 'SIZE_MAX' was not declared in this scope
> >>
> >> Missing header? Samuel?  
> > 
> > This is the same issue as the one fixed for libraw in
> > d246cf5fd01bb0d20a0e64194ffed514ea8dd0aa. It's annoying that the issue
> > is in the jasper package, but we have to fix it in all packages using
> > jasper. Not sure what can be done about it though.  
> 
>  Actually, only the packages that use C++. AFAICS that's just kodi, libraw,
> opencv and opencv3.

Correct. But still, that's a bit annoying to have to change all the
consumers of a package.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
