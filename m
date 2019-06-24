From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Jun 2019 06:46:05 +0200
Subject: [Buildroot] [PATCH] ARC: Add support for ARC HS48 v3.1 processor
In-Reply-To: <20190604053927.29319-1-Evgeniy.Didin@synopsys.com>
References: <20190604053927.29319-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20190624064605.5958b976@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Evgeniy,

On Tue,  4 Jun 2019 08:39:27 +0300
Evgeniy Didin <Evgeniy.Didin@synopsys.com> wrote:

> This patch introduces recently released significant
> update to ARC HS family: ARC HS48.
> 
> One of the major ARC HS48 features is dual-issue pipeline
> which requires a little bit modified instruction scheduling compared
> to single-issue cores (HS38), thus new "-mcpu/--with-cpu=hs4x".
> 
> Also to address some peculiarities of early designs based on
> HS48 we introduced yet another "-mcpu/--with-cpu=hs4x_rel1" which

I guess you meant --with-cpu=hs4x_rel31 here, correct ?

Overall, I'm a bit confused by the naming and choice of options for the
ARC architecture.

The patch at https://patchwork.ozlabs.org/patch/995220/ adds a variant
for ARC HS38 with quad MAC and double precision FPU, and the gcc option
to enable it was named hs38_linux. It is really weird to use the name
of an operating system in a gcc architecture name option. Indeed, you
could very well run a different operating system than Linux. Don't take
it as an offense, but the logic used by RISC-V to name gcc options
looks a lot better: a number of letters than indicate with optional
features of the CPU core have been enabled in the design. This allows
gcc and therefore Buildroot to easily support possibly any combination
of CPU core design, rather than just a few selected combinations. But
well, I see that hs38_linux has been accepted into upstream gcc.

Regarding HS48, is "rel31" really part of the name ? Are you going to
update this with rel32, rel33, rel41, etc. ?

Or is this rel31 only because as explained in the commit log, it's for
early designs only ? And then you will add the real hs48 option that
will use --with-cpu=hs4x ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
