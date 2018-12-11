From: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Tue, 11 Dec 2018 10:37:50 +0000
Subject: [Buildroot] [arc-buildroot] Buildroot autobuilder: ARC
 toolchain update
In-Reply-To: <20181211113133.7929d083@windsurf>
References: <6e005856992c28fbfadecb94ec17cd55f712a615.camel@synopsys.com>
 <20181211113133.7929d083@windsurf>
Message-ID: <0aa0464092a9125f5eadbc9a2623ffeb1359cc56.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 2018-12-11 at 11:31 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 11 Dec 2018 10:24:39 +0000, Alexey Brodkin wrote:
> 
> > Now with arc-2018.09 tools integrated in Buildroot may we
> > have it packages in prebuilt tarball so autobuilder uses it
> > instead of pretty old br-arcle-hs38-full-2018.05.tar.bz2?
> 
> I did a rebuild of all toolchains not long ago, but did not deploy it
> yet. Also, it was before the bump of ARC tools to 2018.09.

Indeed I noticed that looking at tarballs folder :)

> However, notice that the 2018.09 ARC tools are already tested in the
> autobuilders, because we have a config fragment that uses the internal
> toolchain backend for ARC:

Sure that's good but what I meant we're still seeing quite some
build that use old "prebult" ARC tools and some of them fail like
http://autobuild.buildroot.net/results/39f8bd704e936f70911cccd14518b1bfbe303a65/
and others.

Some of those failures are known to be fixed by new toolchain thus
asking you to update it.

Note I'm not saying that toolchain bump will immediately fix all
ARC failures. Quite in reverse we may start seeing more breakages due to move
from GCC 7.3.1 to 8.2.1 but that's why we mess with all that here I guess :)

-Alexey
