From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu, 25 Apr 2013 10:19:00 +0100
Subject: [Buildroot] [PATCH 0/2] Add wvstreams and wvdial packages
Message-ID: <1366881542-15350-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Add packages for wvstreams and wvdial to buildroot. Note that wvstreams
requires quite heavy patching to get it to build for uClibc. Both projects
look to be long dead, so I don't hold out much hope of getting the patches
upstreamed.

Simon Dawson (2):
  wvstreams: new package
  wvdial: new package

 package/Config.in                                  |    2 +
 package/wvdial/Config.in                           |    9 +
 .../wvdial/wvdial-0001-ppp-install-prefix.patch    |   16 ++
 package/wvdial/wvdial-0002-uClibc-scandir.patch    |   23 ++
 package/wvdial/wvdial.mk                           |   41 +++
 package/wvstreams/Config.in                        |   13 +
 ...treams-0001-fix-uClibc-compile-getcontext.patch |  273 ++++++++++++++++++++
 ...002-fix-uClibc-compile-execinfo-backtrace.patch |   31 +++
 .../wvstreams-0003-fix-uClibc-compile-misc.patch   |   16 ++
 package/wvstreams/wvstreams.mk                     |   51 ++++
 10 files changed, 475 insertions(+)
 create mode 100644 package/wvdial/Config.in
 create mode 100644 package/wvdial/wvdial-0001-ppp-install-prefix.patch
 create mode 100644 package/wvdial/wvdial-0002-uClibc-scandir.patch
 create mode 100644 package/wvdial/wvdial.mk
 create mode 100644 package/wvstreams/Config.in
 create mode 100644 package/wvstreams/wvstreams-0001-fix-uClibc-compile-getcontext.patch
 create mode 100644 package/wvstreams/wvstreams-0002-fix-uClibc-compile-execinfo-backtrace.patch
 create mode 100644 package/wvstreams/wvstreams-0003-fix-uClibc-compile-misc.patch
 create mode 100644 package/wvstreams/wvstreams.mk

-- 
1.7.10.4
