From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 11 Aug 2020 17:01:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/mtd: crypto support needs
 linux-headers
In-Reply-To: <20200811123010.4355db2a@windsurf.home>
References: <20200811091917.1545019-1-fontaine.fabrice@gmail.com>
 <20200811123010.4355db2a@windsurf.home>
Message-ID: <CAPi7W80cauJfB1B1WG_MLp0Ae-jSf+r2hyfT1KY_y6fv2biBOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mar. 11 ao?t 2020 ? 12:30, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Tue, 11 Aug 2020 11:19:17 +0200
> Fabrice Fontaine via buildroot <buildroot@busybox.net> wrote:
>
> > crypto support needs linux-headers as it includes <linux/hash_info.h>
> > since version 2.1.2 and
> > https://github.com/sigma-star/mtd-utils/commit/a739b59efe7996e3bdcbe8b17743dc05ac7c110a
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/dbaeed9e9e2af191166808d2d6d6d3c2e5051c2c
>
> You can't do that, as linux-headers is only used for the internal
> toolchain backend. Also the kernel headers are already present in all
> toolchains, so how could this change anything ?
I was not aware that kernel headers were already present in all
toolchains. Thanks for spotting my mistake. I'll send a v2 adding a
dependency on headers 4.12 as this is the real issue.

However, it should be noted that we have an "issue" with the iputils
package as it has an optional dependency on linux-headers since commit
9ffcd9279e5505535a73cf1200b3a86fd425cf32.
I assume that this dependency is also not needed?
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
