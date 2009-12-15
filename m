From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 15 Dec 2009 22:45:20 +0100
Subject: [Buildroot] [pull request] Pull request for branch
 package-infrastructure
In-Reply-To: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1260913520.14582.4.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 2009-12-15 at 20:30 +0100, Thomas Petazzoni wrote:

> This patchset :
> 
>  * implements a new infrastructure to support all type of packages,
>    not only packages relying on the autotools build system. Through
>    the new GENTARGETS macro, implemented in
>    package/Makefile.package.in, we will be able to write simpler .mk
>    files and be able to factorize the common parts of the different
>    .mk files. This infrastructure support building both host and
>    target packages.
> 
>  * rebases the existing autotools infrastructure on top of the new
>    generic infrastructure. This rebasing has no impact on the existing
>    .mk files for autotools packages. With this rebasing, the autotools
>    infrastructure gains the ability to build host packages.
> 
>  * simplifies most (if not all) .mk files of autotools-based packages
>    that required an host version to be compiled (xutil_makedepend,
>    xproto_xproto, pixman, m4, mtd-utils, lzo, libusb, libgtk2, gob2,
>    expat, dbus-glib, shared-mime-info, libxml2, freetype, fontconfig,
>    directfb, dbus, atk, pango, libtool, libglib2, cairo, automake,
>    pkg-config)
> 
>  * bumps the version of autoconf to 2.65 and finally fixes the
>    host-autoconf build problem when sh is symlinked to dash.
> 
>  * converts a few packages to the generic infrastructure (zlib, olsr,
>    udev)
> 
>  * updates and extends the documentation to cover the new
>    infrastructures with examples and reference information

I only had a quick look at your patches, but I think I can already can
say that this looks wonderful. With these changes, it becomes a lot
simpler to create and to maintain buildroot packages. Thanks for your
work on this.


Sven
