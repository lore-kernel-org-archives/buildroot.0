From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Jun 2010 22:20:54 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	autotools-conversion
Message-ID: <cover.1277237892.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of package conversions to the autotools infrastructure,
coming from cmao and Paul Jones.

On the patches proposed by cmao I have done various fixes, most minor,
some a little bit more important. I've tested that all packages do
build in my chrooted environment to verify that all dependencies have
been tracked properly.

I have also removed from the patch set the conversion of the gmp
package. This one is much harder that all the other packages, because
gmp is used as a host package during the compilation of the
cross-toolchain by Buildroot.

On the patches proposed by Paul Jones, I haven't done any kind of
testing, since I can't build a X.org stack due to the infamous rpath
problem that prevents me from executing tools like
mkfontscale. However, as this change introduces a new package, it
isn't going to harm anyone even if the package doesn't build properly.

Thomas

The following changes since commit cd7459b4eef742069f7796c4dfceed8facbfab68:
  Peter Korsgaard (1):
        docs: Document location of .config for out-of-tree builds

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot autotools-conversion

Paul Jones (2):
      Remove package rxvt
      Add package xterm

Thomas Petazzoni (1):
      gawk: enable host package

cmchao (17):
      distcc : convert to autotools infrastructure & bump to 1.1-20100428
      dmalloc : convert to autotools infrastructure
      fbv : convert to autotools infrastructure
      links : convert to autotools infrastructure & bump to 1.01pre1-no-ssl
      dialog : convert to autotools infrastructure & bump to 1.1-20100428
      berkeleydb : convert to autotools infrastructure & bump to 4.4.20
      dash : convert to autotools infrastructure & bump to 0.5.5.1
      diffutils : convert to autotools infrastructure
      libfuse : convert to autotools infrastructure & bump to 2.8.4
      gzip : convert to autotools infrastructure & bump to 1.4
      make : convert to autotools infrastructure
      quagga : convert to autotools infrastructure & bump to 0.99.12
      sdl_mixer : convert to autotools infrastructure & bump to 1.2.11
      sdl_ttf : convert to autotools infrastructure
      sdl : convert to autotools infrastructure & bump to 1.2.14
      libgpg-error : convert to autotools infrastructure & bump to 1.8
      liblockfile : convert to autotools infrastructure & bump to 1.08-4

 package/Config.in                                  |    2 +-
 package/berkeleydb/berkeleydb.mk                   |   82 +-
 package/dash/dash.mk                               |   73 +--
 package/dialog/dialog.mk                           |   60 +-
 package/diffutils/diffutils.mk                     |   63 +-
 package/distcc/distcc.mk                           |   70 +-
 package/dmalloc/dmalloc.mk                         |   97 +--
 package/fbv/fbv.mk                                 |   50 +-
 package/fuse/libfuse.mk                            |   69 +-
 package/gawk/gawk.mk                               |    1 +
 package/gzip/gzip-1.3.12-rename-futimens.patch     |   48 -
 package/gzip/gzip.mk                               |   55 +-
 package/libgpg-error/libgpg-error.mk               |   71 +--
 package/liblockfile/liblockfile.mk                 |   63 +-
 package/links/links.mk                             |   62 +-
 package/make/make.mk                               |   75 +--
 .../quagga-0.99.16-fix-ipctl-forwarding.patch      |   27 +
 package/quagga/quagga.mk                           |  171 +---
 package/rxvt/Config.in                             |    7 -
 package/rxvt/rxvt-2.7.5-include.patch              |   17 -
 package/rxvt/rxvt.mk                               |   84 --
 package/rxvt/rxvt_2.6.4-10.diff                    | 1132 --------------------
 package/sdl/sdl.mk                                 |  104 +--
 package/sdl_mixer/sdl_mixer.mk                     |   67 +-
 package/sdl_ttf/sdl_ttf.mk                         |   75 +--
 package/xterm/Config.in                            |    6 +
 package/xterm/xterm.mk                             |   13 +
 27 files changed, 273 insertions(+), 2371 deletions(-)
 delete mode 100644 package/gzip/gzip-1.3.12-rename-futimens.patch
 create mode 100644 package/quagga/quagga-0.99.16-fix-ipctl-forwarding.patch
 delete mode 100644 package/rxvt/Config.in
 delete mode 100644 package/rxvt/rxvt-2.7.5-include.patch
 delete mode 100644 package/rxvt/rxvt.mk
 delete mode 100644 package/rxvt/rxvt_2.6.4-10.diff
 create mode 100644 package/xterm/Config.in
 create mode 100644 package/xterm/xterm.mk

Thanks,
-- 
Thomas Petazzoni
