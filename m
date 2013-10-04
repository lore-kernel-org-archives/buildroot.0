From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Oct 2013 11:07:04 +0200
Subject: [Buildroot] Some legal-info observations/problems
In-Reply-To: <CAAXf6LUTTX0OFNaP4NxVWXKC4OFBROXK-PFiumL8zYrumkbtog@mail.gmail.com>
References: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>
 <20131002172307.0d6f02ea@skate> <524C4AD4.9040902@lucaceresoli.net>
 <CAAXf6LXWf34Amx44pdixKL0m87jq_FMBxN8BJO9TBDbQ58Po1Q@mail.gmail.com>
 <524D9DE2.7090509@mind.be>
 <CAAXf6LUTTX0OFNaP4NxVWXKC4OFBROXK-PFiumL8zYrumkbtog@mail.gmail.com>
Message-ID: <20131004110704.78f5b1a6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 4 Oct 2013 10:54:55 +0200, Thomas De Schampheleire wrote:

> To come back on the comment ThomasP made about 'FOO =' and not
> defining FOO leading to the same empty FOO variable: this does not
> mean we cannot differentiate both cases: with $(origin FOO) you can.

You can also use "ifdef" I believe. But still, I believe that having:

BLEH_LICENSE_FILES =

in a package looks somewhat strange. I found find it more
explicit/readable to have:

BLEH_LICENSE_FILES = N/A
BLEH_LICENSE_FILES = none
BLEH_LICENSE_FILES = NONE

(pick your choice).

> >  That said, it would be good if we would just error out when a license is
> > defined but no license files are provided. Now we check for that during
> > review (and require an explicit comment if no license file exists), but it's
> > of course even better if that can be done during autobuilder tests.
> 
> When you say 'error out' you mean actually aborting the make process?
> Currently, anomalies in the legal-info area are just warnings hinting
> the developer he has to take some action. Do we really want to error
> out in such cases?
> 
> But if we will make a distinction between an undefined
> FOO_LICENSE_FILES (an anomaly) and an empty/magic one, then the
> autobuilder package stats could be updated with an extra column, or a
> YES/NO/EMPTY value in the existing column.
> http://autobuild.buildroot.org/stats/
> 
> (by the way: where is the code that generates these stats? I had
> expected to find it in buildroot-test, but didn't.)

support/scripts/pkg-stats in your favorite Buildroot tree :-)

> But, re-thinking this, I think none of these are actually very good:
> there _should_ be a license file but it is missing. So it's not
> 'not-applicable', and it's not 'none'. Rather, something like:
> FOO_LICENSE_FILES = missing
> FOO_LICENSE_FILES = not-provided
> FOO_LICENSE_FILES = none-provided

I'm fine with either of those choices, except 'missing'. There is very
often a 'missing' script in autotools-based packages.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
