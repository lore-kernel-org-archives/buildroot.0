From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 May 2017 15:48:41 +0200
Subject: [Buildroot] [PATCH] lsscsi: add new package
In-Reply-To: <CAGm1_kutBSs6At8JvZoTsBQbDWQ6iJRSB3z_AHnLXq8+xbVPiA@mail.gmail.com>
References: <20170512121734.24601-1-antonynpavlov@gmail.com>
 <CAGm1_kutBSs6At8JvZoTsBQbDWQ6iJRSB3z_AHnLXq8+xbVPiA@mail.gmail.com>
Message-ID: <20170512154841.6843c130@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 May 2017 14:29:54 +0200, Yegor Yefremov wrote:

> On Fri, May 12, 2017 at 2:17 PM, Antony Pavlov <antonynpavlov@gmail.com> wrote:
> > Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
> > ---
> >  package/Config.in        |  1 +
> >  package/lsscsi/Config.in |  6 ++++++
> >  package/lsscsi/lsscsi.mk | 13 +++++++++++++  
> 
> You forgot the hash file.

... and the entry to the DEVELOPERS file.

> > diff --git a/package/lsscsi/Config.in b/package/lsscsi/Config.in
> > new file mode 100644
> > index 0000000000..1c856863a4
> > --- /dev/null
> > +++ b/package/lsscsi/Config.in
> > @@ -0,0 +1,6 @@
> > +config BR2_PACKAGE_LSSCSI
> > +       bool "lsscsi"

Was this tested with a sufficient number of toolchains, for example
using supports/scripts/test-pkg ? It really builds fine for all
platforms/libcs, without requiring additional options?

> > +LSSCSI_LICENSE = GPLv2

This should be "GPL-2.0" as we use SPDX identifiers since recently in
Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
