From: J.C. Woltz <jwoltz@gmail.com>
Date: Sun, 19 Feb 2012 12:49:52 -0500
Subject: [Buildroot] [PATCH v5 0/2] usb_modeswitch update and add data
Message-ID: <1329673794-17158-1-git-send-email-jwoltz@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These two patches update usb_modeswitch to the latest version and add the data
files in a separate package. 

The first patch updates usb_modeswitch to version 1.2.3. usb_modeswitch 
itself includes bug fixes and a few new device additions.

The second patch is an addition for buildroot. It adds the usb_modeswicth_data
which is very helpful. It contains rules for many devices. On most systems,
these two programs are installed together. This data package contains udev
rules to automatically switch the device on detection. 

The second patch also depends on the tcl patch sent in. This way 
usb_modeswitch_data can select tclsh in order to get tcl. 

Signed-off-by: J.C. Woltz <jwoltz@gmail.com>

J.C. Woltz (2):
  usb_modeswitch: update to 1.2.3
  new program: usb_modeswitch_data

 package/Config.in                                  |    1 +
 .../usb_modeswitch/usb_modeswitch-makefile.patch   |   43 ++++++++++----------
 package/usb_modeswitch/usb_modeswitch.mk           |   20 ++++++---
 package/usb_modeswitch_data/Config.in              |   11 +++++
 .../usb_modeswitch_data-makefile.patch             |   27 ++++++++++++
 package/usb_modeswitch_data/usb_modeswitch_data.mk |   26 ++++++++++++
 6 files changed, 100 insertions(+), 28 deletions(-)
 create mode 100644 package/usb_modeswitch_data/Config.in
 create mode 100644 package/usb_modeswitch_data/usb_modeswitch_data-makefile.patch
 create mode 100644 package/usb_modeswitch_data/usb_modeswitch_data.mk

-- 
1.7.5.4
