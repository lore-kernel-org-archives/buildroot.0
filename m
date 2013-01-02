From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Jan 2013 12:26:35 +0100
Subject: [Buildroot] [pull request] Pull request for branch xorg-cleanups
Message-ID: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This set of patches makes a number of minor cleanups to our X.org
packaging, and adds a script to help in keeping this set of packages
up to date.

In summary:

 * Patches 1 to 3 fix inconsistencies in package names, or directory
   names, or .mk file formatting that prevent a proper automated
   processing of our X.org packages.

 * Patches 4 to 19 remove all X.org drivers for which we have
   packages, but that are no longer present in X.org releases. There
   are many more packages that we have in Buildroot and that are no
   longer part of X.org releases, but for now, we only do the drivers
   removal since those are very likely to be uncontroversial.

 * Patch 20 adds a script, xorg-release.py, that downloads the list of
   tarballs of a given X.org release, compares that to the list of
   packages we have in Buildroot, and gives a status of what needs to
   be done. See this patch for the current output of this script.

Thanks to patches 4 to 19, the script doesn't report any X.org driver
as "to be removed". However, there is a fairly large number of X.org
applications that are packaged in Buildroot but no longer part of
X.org releases. What is however strange is that some of those
applications are apparently still maintained, as recent version tags
are present in their respective Git repositories. The status of such
X.org components is therefore unclear, and we should discuss what is
the appropriate action to take in Buildroot with regard to the
corresponding packages.

Best regards,

Thomas

The following changes since commit f1d44593a04ff3be981c8a3b01a502f0b18193ee:

  docs/manual: small fixes and enhancements to adding generic packages (2012-12-30 22:39:13 +0100)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git xorg-cleanups

for you to fetch changes up to 41c1bc2b4f8953280e305deada0b52e432974b58:

  support/scripts: add xorg-release.py script (2013-01-02 11:10:30 +0100)

----------------------------------------------------------------
Thomas Petazzoni (20):
      xapp_xinput-calibrator: rename directory to match .mk name
      xapp_xman: replace := by =
      pthread-stubs: rename to xlib_libpthread-stubs
      xdriver_xf86-input-acecad: remove package
      xdriver_xf86-input-aiptek: remove package
      xdriver_xf86-video-apm: remove package
      xdriver_xf86-video-chips: remove package
      xdriver_xf86-video-i740: remove package
      xdriver_xf86-video-rendition: remove package
      xdriver_xf86-video-s3: remove package
      xdriver_xf86-video-s3virge: remove package
      xdriver_xf86-video-sisusb: remove package
      xdriver_xf86-video-suncg14: remove package
      xdriver_xf86-video-suncg3: remove package
      xdriver_xf86-video-sunleo: remove package
      xdriver_xf86-video-suntcx: remove package
      xdriver_xf86-video-tseng: remove package
      xdriver_xf86-video-xgi: remove package
      xdriver_xf86-video-xgixp: remove package
      support/scripts: add xorg-release.py script

 Config.in.legacy                                   |    8 +
 package/libdrm/libdrm.mk                           |    2 +-
 package/x11r7/Config.in                            |   20 +--
 package/x11r7/libxcb/libxcb.mk                     |    2 +-
 package/x11r7/pthread-stubs/pthread-stubs.mk       |   14 --
 .../Config.in                                      |    0
 .../xapp_xinput-calibrator.mk                      |    0
 package/x11r7/xapp_xman/xapp_xman.mk               |    6 +-
 package/x11r7/xdriver_xf86-input-acecad/Config.in  |    8 -
 .../xdriver_xf86-input-acecad.mk                   |   12 --
 package/x11r7/xdriver_xf86-input-aiptek/Config.in  |    8 -
 .../xdriver_xf86-input-aiptek.mk                   |   12 --
 package/x11r7/xdriver_xf86-video-apm/Config.in     |   12 --
 .../xdriver_xf86-video-apm.mk                      |   12 --
 package/x11r7/xdriver_xf86-video-chips/Config.in   |   10 --
 .../xdriver_xf86-video-chips.mk                    |   12 --
 package/x11r7/xdriver_xf86-video-i740/Config.in    |   11 --
 .../xdriver_xf86-video-i740.mk                     |   12 --
 .../x11r7/xdriver_xf86-video-rendition/Config.in   |   10 --
 .../xdriver_xf86-video-rendition.mk                |   12 --
 package/x11r7/xdriver_xf86-video-s3/Config.in      |   11 --
 .../xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk |   12 --
 package/x11r7/xdriver_xf86-video-s3virge/Config.in |   11 --
 .../xdriver_xf86-video-s3virge.mk                  |   12 --
 package/x11r7/xdriver_xf86-video-sisusb/Config.in  |   12 --
 .../xdriver_xf86-video-sisusb.mk                   |   12 --
 package/x11r7/xdriver_xf86-video-suncg14/Config.in |    9 --
 .../xdriver_xf86-video-suncg14.mk                  |   12 --
 package/x11r7/xdriver_xf86-video-suncg3/Config.in  |    9 --
 .../xdriver_xf86-video-suncg3.mk                   |   12 --
 package/x11r7/xdriver_xf86-video-sunleo/Config.in  |    9 --
 .../xdriver_xf86-video-sunleo.mk                   |   12 --
 package/x11r7/xdriver_xf86-video-suntcx/Config.in  |    9 --
 .../xdriver_xf86-video-suntcx.mk                   |   12 --
 package/x11r7/xdriver_xf86-video-tseng/Config.in   |   11 --
 .../xdriver_xf86-video-tseng.mk                    |   12 --
 package/x11r7/xdriver_xf86-video-xgi/Config.in     |   11 --
 .../xdriver_xf86-video-xgi.mk                      |   13 --
 package/x11r7/xdriver_xf86-video-xgixp/Config.in   |   11 --
 .../xdriver_xf86-video-xgixp-cross-compile.patch   |   24 ---
 .../xdriver_xf86-video-xgixp.mk                    |   13 --
 .../Config.in                                      |    4 +-
 .../xlib_libpthread-stubs/xlib_libpthread-stubs.mk |   14 ++
 support/scripts/xorg-release.py                    |  165 ++++++++++++++++++++
 44 files changed, 196 insertions(+), 419 deletions(-)
 delete mode 100644 package/x11r7/pthread-stubs/pthread-stubs.mk
 rename package/x11r7/{xapp_xinput_calibrator => xapp_xinput-calibrator}/Config.in (100%)
 rename package/x11r7/{xapp_xinput_calibrator => xapp_xinput-calibrator}/xapp_xinput-calibrator.mk (100%)
 delete mode 100644 package/x11r7/xdriver_xf86-input-acecad/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
 delete mode 100644 package/x11r7/xdriver_xf86-input-aiptek/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-apm/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-chips/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-i740/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-rendition/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-s3/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-s3virge/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-sisusb/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-suncg14/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-suncg3/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-sunleo/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-suntcx/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-tseng/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-xgi/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
 delete mode 100644 package/x11r7/xdriver_xf86-video-xgixp/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp-cross-compile.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
 rename package/x11r7/{pthread-stubs => xlib_libpthread-stubs}/Config.in (70%)
 create mode 100644 package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
 create mode 100644 support/scripts/xorg-release.py

Thanks,
-- 
Thomas Petazzoni
