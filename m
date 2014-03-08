From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Mar 2014 15:05:15 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-03-07
In-Reply-To: <20140308110454.GA3254@free.fr>
References: <20140308073007.50AAF1016F2@stock.ovh.net>
 <20140308110454.GA3254@free.fr>
Message-ID: <20140308150515.467d5568@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 8 Mar 2014 12:04:54 +0100, Yann E. MORIN wrote:

> On 2014-03-08 08:30 +0100, Thomas Petazzoni spake thusly:
> > Detail of failures
> > ===================
> > 
> >       i686 |   CXX      Source/JavaScrip... | TIM | http://autobuild.buildroot.net/results/93a3e226f624bc389ad647014c070b66ac83de57/
> 
> This one had been running for 12663 seconds, which is 3h 31min 3s at the
> moment it _started_ building webkit.
> 
> So, it looks like some of the random builds can run for more than the
> limit of 4h.

Yes, it seems like some builds can actually take more than 4 hours on
this machine. I would need to compare with Peter's configuration: my
script picks a random number between 1 and 35, and uses that for the
KCONFIG_PROBABILITY. So in some builds, it means that up to 35% of the
BR2_PACKAGE_<foo> options can be enabled. Maybe it's too much?

The Free Electrons build server runs 3 Buildroot builds in parallel
24/7, and during the night, a Jenkins instance builds all the Buildroot
defconfigs, which might load the machine even more. So for a given
configuration, the build time may vary quite significantly due to the
varying load of the machine.

> Of course, I'm not saying we should bump the limit. But this is a good
> example of why saving build-time.log is useful! ;-)

Have you had a look at generating the build time graphs from such longs
builds? They are completely unreadable :/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
