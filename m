From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Nov 2014 14:53:28 +0100
Subject: [Buildroot] [PATCH next 0/3] dbus-python cleanup and python3 support
Message-ID: <1416491611-19815-1-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This series cleans up the dbus-python package and adds python3 support. 
Doing this, I noticed that python3-config currently outputs wrong data for
--includes / --ldflags, so this gets patched as well.

There's currently (to my knowledge atleast) no other packages using this
output, so we don't need to apply it to master as well.

 package/dbus-python/Config.in                 |  5 +-
 ...thon-0001-fix-python-configure-check.patch | 27 ---------
 package/dbus-python/dbus-python.mk            | 26 +++++---
 ...on3-017-python-config-include-libdir.patch | 60 +++++++++++++++++++
 4 files changed, 80 insertions(+), 38 deletions(-)

Peter Korsgaard (3):
      dbus-python: cleanup package
      python3: add patch to fix --includes / --ldflags output of python3-config
      dbus-python: add python3 support

--
Bye, Peter Korsgaard
