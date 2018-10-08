From: Lothar Felten <lothar.felten@gmail.com>
Date: Mon, 08 Oct 2018 16:35:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/dtc: fix include guards for
 older kernel/u-boot
In-Reply-To: <CANQCQpYouTTsJGm6VjpCgdZ54agG0jktaNPwB9my88g_dL_Bsw@mail.gmail.com>
References: <20181008115146.17797-1-lothar.felten@gmail.com>
 <CANQCQpYouTTsJGm6VjpCgdZ54agG0jktaNPwB9my88g_dL_Bsw@mail.gmail.com>
Message-ID: <1539009300.1603.8.camel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matthew,

> Lothar,
> 
> 
> On Mon, Oct 8, 2018 at 6:52 AM Lothar Felten <lothar.felten@gmail.com
> > wrote:
> > 
> > Patch dtc to accept libfdt include guards with and without leading
> > underscore.
> > A compiler warning is added to notify the user.
> > 
> > Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
> > ---
> > ?...de-guards-for-older-kernel-u-boot-sources.patch | 42
> > ++++++++++++++++++++++
> > ?1 file changed, 42 insertions(+)
> > ?create mode 100644 package/dtc/0001-Fix-include-guards-for-older-
> > kernel-u-boot-sources.patch
> > 
> > diff --git a/package/dtc/0001-Fix-include-guards-for-older-kernel-
> > u-boot-sources.patch b/package/dtc/0001-Fix-include-guards-for-
> > older-kernel-u-boot-sources.patch
> > new file mode 100644
> > index 0000000000..40cb0bdb2a
> > --- /dev/null
> > +++ b/package/dtc/0001-Fix-include-guards-for-older-kernel-u-boot-
> > sources.patch
> > @@ -0,0 +1,42 @@
> > +From b1f8b84489c96465b63485b884238b61d31ca84d Mon Sep 17 00:00:00
> > 2001
> > +From: Lothar Felten <lothar.felten@gmail.com>
> > +Date: Mon, 8 Oct 2018 13:29:44 +0200
> > +Subject: [PATCH 1/1] Fix include guards for older kernel/u-boot
> > sources
> > +
> > +Linux kernels before 4.17 and U-Boot versions before 2018.07 use
> > libfdt include guards with leading underscores.
> > +Those have been removed in dtc-1.4.7.
> 
> Is there an reference that could be listed to either
> 1) A upstream mailinglist/patchwork link that proposes adding this
> patch
> 2) If the patch below can't be upstreamed, a reference to the commit
> that is reverting this support you're adding back in and maybe a
> summary of why the backwards compatibility isn't' accepted.

This patch is a temporary fix for this issue:
https://git.buildroot.org/buildroot/tree/CHANGES#n35

It does not fix any bug, just an incompatibility of a new dtc and older
Linux kernels / u-boot loaders.

Once all Linux kernel versions are >=4.17 and u-boot versions are
>=2018.07 this patch is no longer required: they will all use the
include guard without underscore.

I could also patch the beaglebone kernel, but other targets have the 
same issue (e.g. bananapi_m1).

> 
> Matt

Lothar
