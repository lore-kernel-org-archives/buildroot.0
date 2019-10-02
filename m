From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 22:35:11 +0200
Subject: [Buildroot] [PATCH v1] package/libv4l: bump version to 1.18.0
In-Reply-To: <20191002222516.043555a1@gmx.net>
References: <20191002194316.978-1-ps.report@gmx.net>
 <20191002215346.695a5310@windsurf>
 <20191002222516.043555a1@gmx.net>
Message-ID: <20191002223511.2f98969c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2 Oct 2019 22:25:16 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> > On Wed,  2 Oct 2019 21:43:16 +0200
> > Peter Seiderer <ps.report@gmx.net> wrote:
> >  
> > > - remove 0001-fixup-lfs-mismatch-in-preload-libraries.patch
> > >   (Upstream applied [1])
> > > - remove 0002-keytable-fix-EVIOCSCLOCKID-related-compile-failure.patch
> > >   (Upstream applied [2])
> > > - remove 0003-Build-sdlcam-only-if-jpeg-is-enabled.patch
> > >   (Upstream applied [3])
> > > - remove 0004-v4l2-compliance-needs-fork.patch
> > >   (Upstream applied [4])  
> >
> > Since there are no patch left, do we still need AUTORECONF = YES and
> > the dependency on host-gettext ?  
> 
> Good catch (autoreconf/host-gettext) was added with the 0003-Build-sdlcam-only-if-jpeg-is-enabled.patch
> patch ([5]), but without autoreconf I get the following build error (using the config from [6]):
> 
>   .../host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/7.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: qv4l2-qv4l2.o: undefined reference to symbol '__atomic_fetch_add_4@@LIBATOMIC_1.0'
>   .../host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/7.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line

How come this is related to autoreconf ? On SPARC, you need to link
with -latomic, so this build failure is not too surprising. What is
surprising is that an autoreconf fixes it. Do you think you could
investigate this ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
