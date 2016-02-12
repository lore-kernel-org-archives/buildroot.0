From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Feb 2016 22:17:05 +0100
Subject: [Buildroot] [git commit] mpd: fix build on SPARC
In-Reply-To: <56BE4590.8070803@mind.be>
References: <20160207210347.15B3B8033C@busybox.osuosl.org>
 <1455189153.8389.7.camel@embedded.rocks> <56BE4590.8070803@mind.be>
Message-ID: <20160212221705.432ba378@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Fri, 12 Feb 2016 21:50:24 +0100, Arnout Vandecappelle wrote:

> > However, with an external musl toolchain built with Buildroot no
> > libatomic.so will be installed on the target, it only exists in
> > sysroot:
> > 
> >     $ find output/ -type f -name "libatomic.so*"
> >     output/host/usr/arm-buildroot-linux-
> >     musleabi/sysroot/lib/libatomic.so.1.1.0
> 
>  I wonder if we shouldn't just copy all the libraries for the external
> toolchains. If you're using an external toolchain, you probably don't care about
> size too much. Or you'd use a buildroot-built external toolchain, and in that
> case really everything is needed.

I really don't see why users of external toolchains would not care
about size.

However, libatomic is pretty much as essential as libgcc is, so we
should definitely add it to the libraries that should always be copied.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
