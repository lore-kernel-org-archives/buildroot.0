From: Kostya Porotchkin <kostap@marvell.com>
Date: Wed, 6 Feb 2019 16:29:49 +0000
Subject: [Buildroot] [EXT] Re: [PATCH 1/2] package/libnfsidmap: new
 package
In-Reply-To: <20190206171617.6faea825@windsurf>
References: <20190206160601.6360-1-kostap@marvell.com>
 <20190206171617.6faea825@windsurf>
Message-ID: <BYAPR18MB236029909FBA5215C8D5BE65CA6F0@BYAPR18MB2360.namprd18.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Thomas,

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Wednesday, February 6, 2019 18:16
> To: Kostya Porotchkin <kostap@marvell.com>
> Cc: buildroot at buildroot.org
> Subject: [EXT] Re: [Buildroot] [PATCH 1/2] package/libnfsidmap: new
> package
> 
> External Email
> 
> ----------------------------------------------------------------------
> Hello Kostya,
> 
> On Wed, 6 Feb 2019 18:06:00 +0200
> <kostap@marvell.com> wrote:
> 
> > From: Konstantin Porotchkin <kostap@marvell.com>
> >
> > Reqired for NFSv4 support.
> 
> Required
> 
> > Taken from git at github.com:openstack/manila-test-image.git
> > /patches/nfs-utils-enable-nfsv4.patch
> 
> What is taken from there ?
[KP] Someone already made this package, but not submitted to the mainline
So I do not know the author, probably it was ported from 2011 patch series...
> 
> >  package/Config.in                  |  1 +
> >  package/libnfsidmap/Config.in      |  7 +++++++
> >  package/libnfsidmap/libnfsidmap.mk | 13 +++++++++++++
> >  3 files changed, 21 insertions(+)
> 
> An entry to the DEVELOPERS file should be added, and a .hash file is needed.
[KP] OK
> 
> 
> > diff --git a/package/libnfsidmap/Config.in
> > b/package/libnfsidmap/Config.in new file mode 100644 index
> > 0000000000..12dbf505a5
> > --- /dev/null
> > +++ b/package/libnfsidmap/Config.in
> > @@ -0,0 +1,7 @@
> > +config BR2_PACKAGE_LIBNFSIDMAP
> > +	bool "libnfsidmap"
> 
> No dependencies at all ? Did you test this package with ./utils/test-pkg ?
[KP] Not, sorry, will do it.
> 
> > +	help
> > +	  Library used by the NFSv4 server to do userid mapping.
> > +
> > +	  http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap
> > +
> 
> Unneeded empty new line at the end of the file.
[KP] OK
> 
> > diff --git a/package/libnfsidmap/libnfsidmap.mk
> > b/package/libnfsidmap/libnfsidmap.mk
> > new file mode 100644
> > index 0000000000..2c3bd812de
> > --- /dev/null
> > +++ b/package/libnfsidmap/libnfsidmap.mk
> > @@ -0,0 +1,13 @@
> > +#
> > +# libnfsidmap
> > +#
> 
> Please use the standard header for packages.
[KP] OK
> 
> > +
> > +LIBNFSIDMAP_VERSION = 0.25
> > +LIBNFSIDMAP_SITE =
> > +http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap
> > +LIBNFSIDMAP_SOURCE = libnfsidmap-$(LIBNFSIDMAP_VERSION).tar.gz
> 
> Not needed, this is the default value. Have you run "make check-package" ?
[KP] Not, sorry again, just tried to add these 2 patches as a quick fix to the NFSv4 support requirement
> 
> > +LIBNFSIDMAP_INSTALL_STAGING = YES
> > +LIBNFSIDMAP_LICENSE = BSD-like
> 
> This is not a proper license, see https://spdx.org/licenses/ for a proper list of
> SPDX license codes.
[KP] OK, will fix
> 
> > +LIBNFSIDMAP_LICENSE_FILES = COPYING
> > +
> > +$(eval $(autotools-package))
> > +$(eval $(host-autotools-package))
> 
> You're not using the host version of this package, so it shouldn't be added.
[KP] I used it for host build, but later found this unnecessary and did not remove the reminder
> 
> Thanks!
> 
> Thomas
[KP]  Thank you for review and sorry for lazy patches - I did not have time to invest into them yet.

Regards
Kosta

> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
