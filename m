From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 May 2014 12:40:25 +0200
Subject: [Buildroot] [PATCH 0/3] Speed-up gettext and host-gettext build
Message-ID: <1401360028-10423-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This series aims at speeding up the build of the gettext and
host-gettext packages, which are particularly long currently.

It has been tested with the minidlna build against a uClibc toolchain,
minidlna being a package that needs both gettext and host-gettext.

It would be nice if a few other people could test these changes in
their own configuration, to confirm that they don't break anything.

Best regards,

Thomas

Thomas Petazzoni (3):
  minidlna: do not select BR2_PACKAGE_GETTEXT_TOOLS
  gettext: remove support for gettext-tools on target
  gettext: optimize build time

 Config.in.legacy                                   | 12 +++++++
 package/gettext/Config.in                          | 14 --------
 .../gettext-03-option-to-disable-tools.patch       | 42 ----------------------
 .../gettext/gettext-04-remove-examples-tests.patch | 20 -----------
 package/gettext/gettext.mk                         | 27 +++++++-------
 package/minidlna/Config.in                         |  1 -
 6 files changed, 27 insertions(+), 89 deletions(-)
 delete mode 100644 package/gettext/gettext-03-option-to-disable-tools.patch
 delete mode 100644 package/gettext/gettext-04-remove-examples-tests.patch

-- 
1.9.3
