From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sat, 27 Jul 2013 17:26:34 +0200
Subject: [Buildroot] [PATCH] dpkg: new package and host package
In-Reply-To: <20130727151722.13406a87@skate>
References: <2e7a58f00720bcfba517.1374659463@BEANTN0L019720>
 <20130727151722.13406a87@skate>
Message-ID: <CAAXf6LW==kDJyi_-LO+A4NXn4EPKOvRG4_yS-brF40VniceYdQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Op 27-jul.-2013 15:17 schreef "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> het volgende:
>
> Dear Thomas De Schampheleire,
>
> On Wed, 24 Jul 2013 11:51:03 +0200, Thomas De Schampheleire wrote:
> > dpkg is the debian package manager. On target, it is useful to install
> > .deb files containing certain software. On host, it is useful to create
> > such .deb files. The creation of such .deb files could happen from a
> > post-build script, or from project-specific packages.
> >
> > Signed-off-by: Thomas De Schampheleire <
thomas.de.schampheleire@gmail.com>
>
> Thanks. Unfortunately, it doesn't build with a minimal uClibc ARM
> toolchain, apparently because dpkg doesn't recognize the
> linux-uclibcgnueabi tuple fragment as a valid operating system. I get:
>
> checking for posix_fadvise... yes
> checking dpkg cpu type... arm
> configure: WARNING: arm not found in cputable
> checking dpkg operating system type... linux-uclibcgnueabi
> configure: WARNING: linux-uclibcgnueabi not found in ostable
> checking dpkg architecture name... configure: error: cannot determine
host dpkg architecture
> make: ***
[/home/thomas/projets/buildroot/output/build/dpkg-1.16.10/.stamp_configured]
Erreur 1
>
> Could you have a look?

Sure, I'll look into it and submit a new patch when it works...
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130727/277db6c1/attachment.html>
