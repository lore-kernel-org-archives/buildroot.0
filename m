From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 17 Aug 2020 22:54:00 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Analysis of build results
In-Reply-To: <20200816000914.5ad801d9@windsurf.home>
References: <20200815080146.EBD3186EA1@fraxinus.osuosl.org>
 <20200816000914.5ad801d9@windsurf.home>
Message-ID: <20200817225400.31abb874@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, *,

On Sun, 16 Aug 2020 00:09:14 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> >     i686     |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/48165633b841ce6468b7c34d7e47a6fb2a4555ef |
> >     arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/bcf68bf4cbb7cb6d1bf902ac6c288806d6c50588 |
>
> Peter (Seiderer), any idea ?
>
> /home/buildroot/autobuild/run/instance-2/output-1/build/qt5base-5.15.0/include/QtCore/../../src/corelib/kernel/qmetatype.h:1160:135: error: ambiguous class template instantiation for 'struct QtMetaTypePrivate::ContainerCapabilitiesImpl<QList<QVariant>, void>'
>

Could not reproduce the failures locally, but they are still from the host qmake tool
compile (not from the cross-compile), maybe the equivalent to
'depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5' for the host compiler is needed?

Regards,
Peter
