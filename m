From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Jul 2020 21:56:41 +0200
Subject: [Buildroot] [PATCH RESEND 0/2] Use bzip2 for X11 PFC font
 compression
In-Reply-To: <987740769.442321.1594670110258.JavaMail.zimbra@xes-inc.com>
References: <20200713184751.23534-1-asierra@xes-inc.com>
 <20200713213225.7e9d3343@windsurf.home>
 <987740769.442321.1594670110258.JavaMail.zimbra@xes-inc.com>
Message-ID: <20200713215641.51c15c4b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Jul 2020 14:55:10 -0500 (CDT)
Aaron Sierra <asierra@xes-inc.com> wrote:

> >> 1. Even with the latest gzip, these seemingly synonymous pipelines
> >>    produce different output, but this issue does not exist with bzip2:
> >> 
> >>   $ cat /path/to/file | gzip > /path/to/file.gz
> >>   $ gzip < /path/to/file > /path/to/file.gz
> >> 
> >> 2. Prior to gzip 1.10, the compression pipeline used with PCF fonts was
> >>    not reproducible due to the implicit -N/--name injecting a timestamp:
> >> 
> >>   * cat /path/to/file | gzip > /path/to/file.gz
> >> 
> >> 3. The BR2_USE_WCHAR dependency of the gzip package tarnishes the appeal
> >>    of using host-gzip to provide reproducible output.  
> > 
> > This argument seems pretty weird. The fact that gzip needs
> > BR2_USE_WCHAR on the target doesn't at all prevent from building
> > host-gzip. We have plenty of host packages that need wchar packages,
> > and we simply assume the host system as wide char support available.
> > 
> > So this third argument is a bit "moot", especially since
> > host-xapp-mkfontscale already has a dependency on host-gzip, which
> > builds a gzip 1.10, so it shouldn't be affected by the problem you
> > describe.  
> 
> OK, then maybe adding a host-gzip dependency would be the better solution.
> I've found some evidence that this patchset isn't complete with respect to
> X itself using bzip-compressed fonts :(
> 
> > So that leaves us with just argument (1), correct ?  
> 
> Well, I think that (2) or (3) would be needed as the real justification for
> switching compression mechanisms. Let me investigate the host-gzip path now
> that I know that isn't a compatibility problem.

OK, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
