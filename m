From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Feb 2013 19:11:39 +0100
Subject: [Buildroot] [PATCH] new package: iso-codes
In-Reply-To: <5121197F.1060201@petroprogram.com>
References: <1361118896-2263-1-git-send-email-stefan.froberg@petroprogram.com>
 <20130217183012.73c87347@skate> <5121197F.1060201@petroprogram.com>
Message-ID: <20130217191139.651f79c1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Sun, 17 Feb 2013 19:55:11 +0200, Stefan Fr?berg wrote:

> >> +	select BR2_PACKAGE_GETTEXT
> > Are you sure it really needs gettext as a build dependency?
> 
> Well, I did not try to build it without gettext installed but that's
> what the gentoo ebuild file
> lists as its hard dependency

We need to figure out what is needed exactly. gettext support in the C
library (in which case it depends on whether you're using glibc or
uClibc, see
http://buildroot.org/downloads/manual/manual.html#_gettext_integration_and_interaction_with_packages.
Or instead the host gettext tools to generate some stuff.

> > Also, this seems to install a big bunch of files. Maybe
> > network-manager-applet needs only some of the ISOxyz files, and
> > therefore having suboptions to select which ISOxyz set of files should
> > be installed would be useful?
> >
> 
> I have to check it.

Thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
