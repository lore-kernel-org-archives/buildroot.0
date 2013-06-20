From: Richard Genoud <richard.genoud@gmail.com>
Date: Thu, 20 Jun 2013 17:53:26 +0200
Subject: [Buildroot] [PATCH 0/4] make usb_modeswitch work with udev
Message-ID: <1371743610-17810-1-git-send-email-richard.genoud@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset corrects the usb_modeswitch installation:

First patch installs tclsh8.4 when usb_modeswitch_data is selected.
(it is needed by usb_modeswitch_dispatcher tcl script which is
called by udev rules)

Second patch adds a symlink tclsh->tclsh8.4
(to handle usb_modeswitch_dispatcher shebang)

The lasts two pathches are just versions bumps

Richard Genoud (4):
  TCL: change BR2_PACKAGE_TCL_SHLIB_ONLY option
  tcl: add a tclsh symlink
  usb_modeswitch: bump to 1.2.6
  usb_modeswitch_data: bump to 20130610

 package/tcl/Config.in                              |   11 ++++---
 package/tcl/tcl.mk                                 |    4 ++-
 .../usb_modeswitch/usb_modeswitch-makefile.patch   |   31 --------------------
 package/usb_modeswitch/usb_modeswitch.mk           |    2 +-
 .../usb_modeswitch_data-fix-parallel-install.patch |    6 ++--
 .../usb_modeswitch_data-makefile.patch             |   12 ++++----
 package/usb_modeswitch_data/usb_modeswitch_data.mk |    2 +-
 7 files changed, 19 insertions(+), 49 deletions(-)
 delete mode 100644 package/usb_modeswitch/usb_modeswitch-makefile.patch

-- 
1.7.10.4
