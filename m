From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Fri, 20 Feb 2015 13:28:55 +0100
Subject: [Buildroot] [PATCH 0/7] sigrok fixes and pulseview package
Message-ID: <1424435342-2188-1-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series fixes a couple of bugs which have been noticed on the sigrok
mailing list, adds some needed infrastructure in order to be able to build
pulseview (the graphical front-end for sigrok) and the pulseview package
itself.

The first patch removes an unused flag from libsigrok.mk. The second
modifies the help text for libserialport to indicate to users that it's
a reusable library not tied to the sigrok project in any way. The third
patch makes it possible to compile libsigrok without libserialport support.
The fourth adds autoconf-archive host package needed to build libsigrok C++
bindings. The fifth updates the commit tag to checkout as several things
have been merged since the previous version - BayLibre ACME driver has
been merged and several bugs preventing buildroot from building pulseview
have been fixed. The sixth patch adds the option of building libsigrokcxx.
Finally the seventh patch adds the pulseview package.

Please note, that pulseview can be built using Qt4 as well - this option
should be added in the future.

Bartosz Golaszewski (7):
  libsigrok: remove --disable-udev from CONF_OPTS
  libserialport: drop untrue statement from Config.in help
  libsigrok: don't select libserialport in Config.in
  autoconf-archive: new package
  libsigrok: bump git commit tag
  libsigrok: enable building C++ bindings
  pulseview: new package

 package/Config.in                            |  1 +
 package/autoconf-archive/autoconf-archive.mk | 13 ++++++++++++
 package/libserialport/Config.in              |  7 ++++---
 package/libsigrok/Config.in                  | 16 +++++++++++++-
 package/libsigrok/libsigrok.mk               | 18 ++++++++++++++--
 package/pulseview/Config.in                  | 31 ++++++++++++++++++++++++++++
 package/pulseview/pulseview.mk               | 24 +++++++++++++++++++++
 package/sigrok-cli/Config.in                 |  1 -
 8 files changed, 104 insertions(+), 7 deletions(-)
 create mode 100644 package/autoconf-archive/autoconf-archive.mk
 create mode 100644 package/pulseview/Config.in
 create mode 100644 package/pulseview/pulseview.mk

-- 
2.1.4
