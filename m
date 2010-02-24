From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Feb 2010 22:16:47 +0100
Subject: [Buildroot] [pull request] Pull request for branch fixes
Message-ID: <cover.1267046193.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 4f05a61b33e5d87f23837109fb0dd538a5bd5d62:
  Peter Korsgaard (1):
        Merge branch 'misc-fixes5' of git://git.busybox.net/~tpetazzoni/git/buildroot

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot fixes

Thomas Petazzoni (10):
      netsnmp: use the autoconf built by Buildroot
      ipsec-tools: add host-flex dependency
      openmotif: remove package
      xpdf: remove package
      libgtk2: host version needs host-libpng
      pango: remove gtk-doc patch
      pango: re-enable thai module
      pango: remove dependency on host-pango
      sylpheed: add dependency on libgtk2
      madplay: add patch to switch to the new ALSA API

 package/Config.in                                  |    2 -
 package/ipsec-tools/ipsec-tools.mk                 |    2 +-
 package/libgtk2/libgtk2.mk                         |    2 +-
 .../madplay-0.15.2b-switch-to-new-alsa-api.patch   |  173 ++++
 package/netsnmp/netsnmp.mk                         |    4 +-
 package/openmotif/Config.in                        |    7 -
 package/openmotif/README                           |    2 -
 .../openmotif/openmotif-2.3.0-cross-compile.patch  |  106 ---
 .../openmotif-2.3.0-legacy-bzero-must-die.patch    |  758 ------------------
 package/openmotif/openmotif.mk                     |   94 ---
 package/pango/pango-gtk-doc.patch                  |   59 --
 package/pango/pango-no-libthai.patch               |   10 -
 package/pango/pango.mk                             |   13 +-
 package/sylpheed/Config.in                         |    1 +
 package/sylpheed/sylpheed.mk                       |    2 +-
 package/xpdf/Config.in                             |    9 -
 package/xpdf/xpdf-3.02pl1.patch                    |   33 -
 package/xpdf/xpdf-3.02pl2.patch                    |  823 --------------------
 package/xpdf/xpdf.mk                               |   31 -
 19 files changed, 182 insertions(+), 1949 deletions(-)
 create mode 100644 package/multimedia/madplay/madplay-0.15.2b-switch-to-new-alsa-api.patch
 delete mode 100644 package/openmotif/Config.in
 delete mode 100644 package/openmotif/README
 delete mode 100644 package/openmotif/openmotif-2.3.0-cross-compile.patch
 delete mode 100644 package/openmotif/openmotif-2.3.0-legacy-bzero-must-die.patch
 delete mode 100644 package/openmotif/openmotif.mk
 delete mode 100644 package/pango/pango-gtk-doc.patch
 delete mode 100644 package/pango/pango-no-libthai.patch
 delete mode 100644 package/xpdf/Config.in
 delete mode 100644 package/xpdf/xpdf-3.02pl1.patch
 delete mode 100644 package/xpdf/xpdf-3.02pl2.patch
 delete mode 100644 package/xpdf/xpdf.mk

Thanks,
-- 
Thomas Petazzoni
