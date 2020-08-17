From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 17 Aug 2020 23:57:46 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Analysis of build results
In-Reply-To: <20200817233048.1bab8e39@windsurf.home>
References: <20200815080146.EBD3186EA1@fraxinus.osuosl.org>
 <20200816000914.5ad801d9@windsurf.home>
 <20200817225400.31abb874@gmx.net>
 <20200817233048.1bab8e39@windsurf.home>
Message-ID: <20200817235746.5282c7dd@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Mon, 17 Aug 2020 23:30:48 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Mon, 17 Aug 2020 22:54:00 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > > Peter (Seiderer), any idea ?
> > >
> > > /home/buildroot/autobuild/run/instance-2/output-1/build/qt5base-5.15.0/include/QtCore/../../src/corelib/kernel/qmetatype.h:1160:135: error: ambiguous class template instantiation for 'struct QtMetaTypePrivate::ContainerCapabilitiesImpl<QList<QVariant>, void>'
> > >
> >
> > Could not reproduce the failures locally, but they are still from the host qmake tool
> > compile (not from the cross-compile), maybe the equivalent to
> > 'depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5' for the host compiler is needed?
>
> Do you have confirmation that this error is related to the compiler
> having to be gcc >= 5.x ?

No...., any chance to gather the host compiler versions from the autobuild reports?

Regards,
Peter

>
> If that's the case, we can add a dependency to BR2_HOST_GCC_AT_LEAST_5.
>
> Thomas
