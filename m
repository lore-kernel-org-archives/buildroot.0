From: Andreas Naumann <anaumann@ultratronik.de>
Date: Fri, 10 Feb 2017 14:59:56 +0100
Subject: [Buildroot] [PATCH 0/2] poppler: Add option for Qt5 support
Message-ID: <1486735198-29936-1-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This explicitly adds poppler support for qt5. Since we depend on qt5 we dont
need to depend on individual toolchain requirements for Qt5.
However for supporting Qt >= 5.7 we need to use the -std=c++11 compiler option.

Should fix:
http://autobuild.buildroot.net/results/359/35916f2a34ec45ced3e30a25a680cbaa3a0aba6f/


Andreas Naumann (1):
  poppler: qt5 support needs c++11 (since Qt5.7)

Jens Kleintje (1):
  poppler: Add option for Qt5 support

 package/poppler/Config.in  |  9 +++++++++
 package/poppler/poppler.mk | 11 +++++++++++
 2 files changed, 20 insertions(+)

-- 
1.9.1
