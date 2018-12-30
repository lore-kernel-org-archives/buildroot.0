From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 21:27:45 +0100
Subject: [Buildroot] [PATCH 1/1] libglib2: Bump to version 2.56.3
In-Reply-To: <20181230193432.GA10930@x230>
References: <20181207173836.13091-1-petr.vorel@gmail.com>
 <20181230193432.GA10930@x230>
Message-ID: <20181230212745.196c01c3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Dec 2018 20:34:33 +0100, Petr Vorel wrote:

> >  ...gobject-fix-compilation-with-gcc-4.7.patch | 50 ------------------
> >  ...compilation-without-F_-S-G-ETPIPE_SZ.patch | 52 -------------------
> >  package/libglib2/libglib2.hash                |  4 +-
> >  package/libglib2/libglib2.mk                  |  2 +-
> >  4 files changed, 3 insertions(+), 105 deletions(-)
> >  delete mode 100644 package/libglib2/0003-gobject-fix-compilation-with-gcc-4.7.patch
> >  delete mode 100644 package/libglib2/0005-gio-fix-compilation-without-F_-S-G-ETPIPE_SZ.patch  
> 
> Ping, please.

I tried to merge a similar bump a few weeks ago, and it caused massive
build failures, so I had to revert. In the mean time, I applied the
pkg-config bump, which also caused lots of issues, which have
apparently now been all addressed, so it will be a good time to merge a
libglib2 bump.

However, was this tested with a large number of libglib2 reverse
dependencies ?

See
https://git.buildroot.org/buildroot/commit/package/libglib2?id=2694222c3d3663d9fcc55e6cf44a45b74b43793f
for details.

Did you try to build dbus-glib on the latest master, with the libglib2
bump included ?

I would be more convinced with a commit log that provides a defconfig
with lots of libglib2 reverse dependencies enabled, with the statement
that this defconfig continues to build fine after the libglib2 bump.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
