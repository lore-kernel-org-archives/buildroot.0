From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 May 2011 12:08:18 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.05/package-cleanups
Message-ID: <cover.1305713253.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is a set of misc package cleanups or bumps: removal of festival,
conversion to infrastructure/bump of dhcpdump, sudo and gtk2-engines,
bump of the Gtk stack.

Thomas

The following changes since commit ce1ae872aa72547bb291cc9e70adfe1b065cd2a8:

  Makefile.autotools.in: default to same <pkg>_MAKE setting for host and target (2011-05-17 10:00:01 +0200)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2011.05/package-cleanups

Thomas Petazzoni (10):
      festival: remove packages
      dhcpdump: move as a proper package, bump version
      sudo: bump and convert to AUTOTARGETS
      atk: bump to 1.33.6
      libglib2: bump to 2.28.6
      pango: bump to 1.28.4
      libgtk2: bump to 2.24.4
      libgtk2: change download site
      libgtk2: add option to install the gtk-demo program
      gtk2-engines: bump, rename config option and convert to AUTOTARGETS

 package/Config.in                                  |    1 +
 package/atk/atk.mk                                 |    4 +-
 package/dhcpdump/Config.in                         |    5 +
 .../dhcpdump-1.8-use-non-bsd-structures.patch      |   21 +
 package/dhcpdump/dhcpdump.mk                       |   21 +
 package/gtk2-engines/Config.in                     |    2 +-
 package/gtk2-engines/gtk2-engines.mk               |   86 +-
 package/libglib2/libglib2-mkenums-nowarn.patch     |   14 -
 package/libglib2/libglib2.mk                       |    4 +-
 package/libgtk2/Config.in                          |    7 +
 package/libgtk2/libgtk2.mk                         |    8 +-
 package/multimedia/Config.in                       |    1 -
 package/multimedia/festival/Config.in              |   27 -
 package/multimedia/festival/festival.mk            |    4 -
 .../festival/festival/festival-1.96-beta-doc.patch |   23 -
 .../festival/festival-1.96-beta-etcsiteinit.patch  |   55 -
 .../festival/festival-1.96-beta-libdir.patch       |   10 -
 .../festival-1.96-beta-speechtools-dir.patch       |   11 -
 package/multimedia/festival/festival/festival.mk   |   21 -
 package/multimedia/festival/lexicons/Config.in     |   20 -
 package/multimedia/festival/lexicons/festlex.mk    |   46 -
 package/multimedia/festival/speech-tools/Config.in |   10 -
 .../speech-tools-1.2.96-beta-install.patch         |   47 -
 .../festival/speech-tools/speech-tools.mk          |   31 -
 package/multimedia/festival/voices/Config.in       |   63 -
 package/multimedia/festival/voices/festvox.mk      |   99 -
 package/pango/pango.mk                             |    2 +-
 package/sudo/sudo-1.6.8p12-001-ubuntu6.patch       | 3994 --------
 .../sudo-1.6.8p12-002-no-cxx-configcheck.patch     |   22 -
 package/sudo/sudo-1.6.8p12-003-cross-compile.patch |10219 --------------------
 package/sudo/sudo.mk                               |   96 +-
 package/tcpdump/Config.in                          |    6 -
 package/tcpdump/dhcpdump.mk                        |   62 -
 33 files changed, 86 insertions(+), 14956 deletions(-)
 create mode 100644 package/dhcpdump/Config.in
 create mode 100644 package/dhcpdump/dhcpdump-1.8-use-non-bsd-structures.patch
 create mode 100644 package/dhcpdump/dhcpdump.mk
 delete mode 100644 package/libglib2/libglib2-mkenums-nowarn.patch
 delete mode 100644 package/multimedia/festival/Config.in
 delete mode 100644 package/multimedia/festival/festival.mk
 delete mode 100644 package/multimedia/festival/festival/festival-1.96-beta-doc.patch
 delete mode 100644 package/multimedia/festival/festival/festival-1.96-beta-etcsiteinit.patch
 delete mode 100644 package/multimedia/festival/festival/festival-1.96-beta-libdir.patch
 delete mode 100644 package/multimedia/festival/festival/festival-1.96-beta-speechtools-dir.patch
 delete mode 100644 package/multimedia/festival/festival/festival.mk
 delete mode 100644 package/multimedia/festival/lexicons/Config.in
 delete mode 100644 package/multimedia/festival/lexicons/festlex.mk
 delete mode 100644 package/multimedia/festival/speech-tools/Config.in
 delete mode 100644 package/multimedia/festival/speech-tools/speech-tools-1.2.96-beta-install.patch
 delete mode 100644 package/multimedia/festival/speech-tools/speech-tools.mk
 delete mode 100644 package/multimedia/festival/voices/Config.in
 delete mode 100644 package/multimedia/festival/voices/festvox.mk
 delete mode 100644 package/sudo/sudo-1.6.8p12-001-ubuntu6.patch
 delete mode 100644 package/sudo/sudo-1.6.8p12-002-no-cxx-configcheck.patch
 delete mode 100644 package/sudo/sudo-1.6.8p12-003-cross-compile.patch
 delete mode 100644 package/tcpdump/dhcpdump.mk

Thanks,
-- 
Thomas Petazzoni
