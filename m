From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 21:07:18 +0200
Subject: [Buildroot] [PATCH resend 3/4] Added the pth package.
In-Reply-To: <1338649758-11225-3-git-send-email-stijn.souffriau@essensium.com>
References: <1338649758-11225-1-git-send-email-stijn.souffriau@essensium.com>
 <1338649758-11225-3-git-send-email-stijn.souffriau@essensium.com>
Message-ID: <20120717210718.212397ed@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stijn,

Le Sat,  2 Jun 2012 17:09:17 +0200,
Stijn Souffriau <stijn.souffriau@essensium.com> a ?crit :

> ---
>  package/Config.in                                  |    1 +
>  package/pth/Config.in                              |   10 ++++++
>  ...mmited-L-usr-lib-I-usr-include-from-paths.patch |   34 ++++++++++++++++++++
>  package/pth/pth-0002-dependencyfix.patch           |   25 ++++++++++++++
>  .../pth/pth-0003-fixed-install-dependency.patch    |   34 ++++++++++++++++++++
>  package/pth/pth.mk                                 |   12 +++++++
>  6 files changed, 116 insertions(+)
>  create mode 100644 package/pth/Config.in
>  create mode 100644 package/pth/pth-0001-ommited-L-usr-lib-I-usr-include-from-paths.patch
>  create mode 100644 package/pth/pth-0002-dependencyfix.patch
>  create mode 100644 package/pth/pth-0003-fixed-install-dependency.patch
>  create mode 100644 package/pth/pth.mk

I have tried to integrate your work, but unfortunately, the GNU Pth
library doesn't even build on ARM glibc-based systems. It simply fails with:

pth_mctx.c: In function '__pth_mctx_set':
pth_mctx.c:480:2: error: #error "Unsupported Linux (g)libc version and/or platform"

Also, I don't think it's worth putting too much effort into this since
GnuPG is currently migrating to a new library named nPth, which
apparently should cause a lot less portability problems. See:
http://lists.gnupg.org/pipermail/gnupg-announce/2012q2/000315.html.

Therefore, I would rather suggest:

 (1) To package the 1.4.x version of gnupg, which is used in current
 distros (at least Debian/Ubuntu based distros), so it shouldn't be too
 old, and apparently has less dependencies.

 (2) Wait for the 2.1 development version of gnupg to become a stable
 version, and create a package for both nPth or Pth.

In the mean time, I've put an updated version of your work at
http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=gnupg,
with a few fixes.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
