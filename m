From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Mar 2018 00:03:32 +0100
Subject: [Buildroot] [PATCH 2/2] core/instrumentation: shave minutes off
 the build time
In-Reply-To: <491c4cfa-b468-7208-2e38-690cdcec222f@mind.be>
References: <cover.1521146096.git.yann.morin.1998@free.fr>
 <6a793a6dba4f052ca8bbc35edd63df601f46478b.1521146096.git.yann.morin.1998@free.fr>
 <87muz5fp2n.fsf@dell.be.48ers.dk> <20180318161530.GA2478@scaer>
 <87efkhfimu.fsf@dell.be.48ers.dk>
 <20180322164144.GY14461@australia>
 <491c4cfa-b468-7208-2e38-690cdcec222f@mind.be>
Message-ID: <20180324000332.2b6ff7e7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Mar 2018 23:39:47 +0100, Arnout Vandecappelle wrote:

> > The current timestamp-based approach not guaranteeing an accurate list is
> > problematic for many such uses. And as you already mentioned, since we don't have
> > full control over the build steps done in any given package, we don't know which
> > timestamps they will use. There may be very good reasons to install certain
> > files with their original timestamp and not the one from the build.  
> 
>  We could revert to the original before/after file list approach, and just use
> something like "stat -c '%N %Y %f'" instead of md5sum.
> 
>  Though I certainly like Trent's idea of installing each package in a separate
> directory, too. With PPS we're more or less there anyway. We'd just need to step
> up the adoption rate of PPS then :-)

With the PPS patches I posted, we are not installing each package to a
separate folder, but to a folder where all the package dependencies
have already been installed.

Of course, we could change to a model where the per-package staging and
target folders really only contain what the package has installed, and
have a separate per-package SDK, in which we do the "accumulation" of
the dependencies.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
