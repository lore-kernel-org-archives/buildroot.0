From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 May 2010 01:15:25 +0200
Subject: [Buildroot] [pull request] Pull request for branch 2010-05-15-fixes
Message-ID: <cover.1273965305.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 5e25bc482134bee62e3cc9d55af694aaa977d5b5:
  Thomas Petazzoni (1):
        external toolchain: check BR2_INSTALL_LIBSTDCPP

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot 2010-05-15-fixes

Thomas Petazzoni (12):
      iconv: disallow selection when BR2_ENABLE_LOCALE is enabled
      lmbench: needs BR2_INET_RPC
      startup-notification: add dependency on xlib_libX11
      ntp: fix build failure
      samba: only require libiconv if !BR2_ENABLE_LOCALE
      pango: run pango-querymodules on the target instead of on the host
      cairo: remove host variant
      mutt: fix build and convert to autotools
      lvm2: do not override CC and similar variables
      uemacs: don't forget CFLAGS at link time
      vpnc: pass CFLAGS at link time
      netsnmp: disable build with external toolchain

 package/cairo/cairo.mk                             |    3 -
 package/libiconv/Config.in                         |    1 +
 package/lmbench/Config.in                          |    2 +
 package/lvm2/lvm2.mk                               |    2 +-
 package/mutt/mutt-1.5.16-makedoc-hostcc.patch      |   32 ---------
 package/mutt/mutt-1.5.17+20080114-nodoc.patch      |   21 ++++++
 package/mutt/mutt.mk                               |   73 +++-----------------
 package/netsnmp/Config.in                          |    3 +
 package/ntp/ntp-4.2.4_p5-nano.patch                |   36 ++++++++++
 package/pango/S25pango                             |   20 ++++++
 package/pango/pango.mk                             |   18 +----
 package/samba/Config.in                            |    2 +-
 package/samba/samba.mk                             |    2 +-
 package/startup-notification/Config.in             |    2 +
 .../startup-notification/startup-notification.mk   |    1 +
 package/uemacs/uemacs.mk                           |    2 +-
 package/vpnc/vpnc.mk                               |    4 +-
 17 files changed, 105 insertions(+), 119 deletions(-)
 delete mode 100644 package/mutt/mutt-1.5.16-makedoc-hostcc.patch
 create mode 100644 package/mutt/mutt-1.5.17+20080114-nodoc.patch
 create mode 100644 package/ntp/ntp-4.2.4_p5-nano.patch
 create mode 100644 package/pango/S25pango

Thanks,
-- 
Thomas Petazzoni
