From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Mar 2013 21:45:22 +0100
Subject: [Buildroot] [PATCH v2 0/8] Bump and improve gdisk/gptfdisk packaging
Message-ID: <1362689131-1479-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The starting point of this patch set was the patch from Justin Maggard
visible at http://patchwork.ozlabs.org/patch/164770/. I took Justin
patch, and did a number of followup improvements to the package.

Changes since v1:

 * Rebased on top of master, fixed Config.in.legacy code since 2013.02
   has been released.

Best regards,

Thomas

Justin Maggard (1):
  gdisk: Update gdisk (gptfdisk) to version 0.8.6

Thomas Petazzoni (7):
  gdisk: rename to gptfdisk
  gptfdisk: ensure that the package always builds/installs something
  gptfdisk: use TARGET_CONFIGURE_OPTS properly, use TARGET_MAKE_ENV
  gptfdisk: fix installation step
  gptfdisk: make utf16 support configurable
  gptfdisk: add support for building and install cgdisk
  gptfdisk: factorize the BR2_PACKAGE_GPTFDISK dependency

 Config.in.legacy                                   |   26 +++++++++++
 package/Config.in                                  |    2 +-
 package/gdisk/Config.in                            |   36 ---------------
 package/gdisk/gdisk-0.6.14-unistd.patch            |   19 --------
 package/gdisk/gdisk-0.6.14-uuid.h.patch            |   22 ---------
 package/gdisk/gdisk.mk                             |   39 ----------------
 package/gptfdisk/Config.in                         |   44 ++++++++++++++++++
 .../gptfdisk-001-configurable-utf16-support.patch  |   48 ++++++++++++++++++++
 package/gptfdisk/gptfdisk.mk                       |   42 +++++++++++++++++
 9 files changed, 161 insertions(+), 117 deletions(-)
 delete mode 100644 package/gdisk/Config.in
 delete mode 100644 package/gdisk/gdisk-0.6.14-unistd.patch
 delete mode 100644 package/gdisk/gdisk-0.6.14-uuid.h.patch
 delete mode 100644 package/gdisk/gdisk.mk
 create mode 100644 package/gptfdisk/Config.in
 create mode 100644 package/gptfdisk/gptfdisk-001-configurable-utf16-support.patch
 create mode 100644 package/gptfdisk/gptfdisk.mk

-- 
1.7.9.5
