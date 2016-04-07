From: Kinsella, Ray <ray.kinsella@intel.com>
Date: Thu, 7 Apr 2016 12:04:19 +0000
Subject: [Buildroot] [PATCH v4 2/3] package/radlib: Renamed configure.in
 to configure.ac
In-Reply-To: <57058C3E.4070201@mind.be>
References: <1459948770-2769-1-git-send-email-ray.kinsella@intel.com>
 <1459948770-2769-3-git-send-email-ray.kinsella@intel.com>
 <57058C3E.4070201@mind.be>
Message-ID: <1460030658.3176.23.camel@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


ok, I will check.

On Thu, 2016-04-07 at 00:22 +0200, Arnout Vandecappelle wrote:
> On 04/06/16 15:19, ray.kinsella at intel.com wrote:
> > From: Ray Kinsella <ray.kinsella@intel.com>
> > 
> > configure.ac is now standard for autotools, this supresses a
> > warning on autoreconf.
> 
>   If it is just a warning, then this patch isn't needed.
> 
>   If it really is needed, it's better to do it as a hook:
> 
> define RADLIB_RENAME_CONFIGURE_IN
> 	mv $(@D)/configure.in $(@D)/configure.ac
> endef
> 
> RADLIB_POST_PATCH_HOOKS += RADLIB_RENAME_CONFIGURE_IN
> 
>   That said, it's still a good idea to upstream this patch.
> 
>   Regards,
>   Arnout
> 
> > 
> > Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
> > ---
> >   ...dlib-renamed-configure.in-to-configure.ac.patch | 213
> > +++++++++++++++++++++
> >   1 file changed, 213 insertions(+)
> >   create mode 100644 package/radlib/0001-radlib-renamed
> > -configure.in-to-configure.ac.patch
> > 
> > diff --git a/package/radlib/0001-radlib-renamed-configure.in-to
> > -configure.ac.patch b/package/radlib/0001-radlib-renamed
> > -configure.in-to-configure.ac.patch
> > new file mode 100644
> > index 0000000..c808ba7
> > --- /dev/null
> > +++ b/package/radlib/0001-radlib-renamed-configure.in-to
> > -configure.ac.patch
> > @@ -0,0 +1,213 @@
> > +From d3a51cf6492e062383dd49ee604aa1f77cdd47b0 Mon Sep 17 00:00:00
> > 2001
> > +From: Ray Kinsella <ray.kinsella@intel.com>
> > +Date: Wed, 6 Apr 2016 11:23:45 +0100
> > +Subject: [PATCH 1/2] radlib: renamed configure.in to configure.ac
> > +
> > +configure.ac is now standard for autotools, this supresses a
> > warning on
> > +autoreconf
> > +
> > +Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
> > +---
> > + configure.ac | 91
> > ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> > + configure.in | 91 -----------------------------------------------
> > -------------
> > + 2 files changed, 91 insertions(+), 91 deletions(-)
> > + create mode 100644 configure.ac
> > + delete mode 100644 configure.in
> [snip]
> 
> 
