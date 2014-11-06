From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  6 Nov 2014 10:36:46 -0300
Subject: [Buildroot] [PATCH 0/7] [RFC] systemV init without busybox series
Message-ID: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a RFC patch series that enables busybox-less systemV systems to be
built.
It contains fixes that enable it to work seamlessly, some new packages and a
couple of non essential/related bumps.

The series is still missing start-stop-daemon which is contained in the dpkg
upstream package which begs the question, should we ship it as dpkg (with the
side consequences and expectations) or name it start-stop-daemon and install
just that? (option 2 is what i've got done at the moment, that's my choice,
but be free and vote).

It's also missing documentation on the recommended packages for a normal boot
to take place without any errors or warnings for a default busybox skeleton.

* debianutils provides run-parts for ifupdown
* ifupdown provides ifup/ifdown

Gustavo Zacarias (7):
  skeleton/S40network: tweak for debian ifupdown
  package/uclibc: enable wordexp
  dhcpcd: install binary to /sbin
  dhcpcd: bump to version 6.6.0
  dash: bump to 0.5.8-2
  debianutils: new package
  ifupdown: new package

 package/Config.in                     |  4 ++++
 package/dash/dash.hash                |  4 ++--
 package/dash/dash.mk                  |  4 ++--
 package/debianutils/Config.in         |  7 +++++++
 package/debianutils/debianutils.hash  |  2 ++
 package/debianutils/debianutils.mk    | 14 ++++++++++++++
 package/dhcpcd/dhcpcd.hash            |  2 ++
 package/dhcpcd/dhcpcd.mk              |  4 ++--
 package/ifupdown/Config.in            | 11 +++++++++++
 package/ifupdown/ifupdown.hash        |  2 ++
 package/ifupdown/ifupdown.mk          | 28 ++++++++++++++++++++++++++++
 package/uclibc/uClibc-0.9.31.config   |  2 +-
 package/uclibc/uClibc-0.9.33.config   |  2 +-
 package/uclibc/uClibc-snapshot.config |  2 +-
 system/skeleton/etc/init.d/S40network |  3 +++
 15 files changed, 82 insertions(+), 9 deletions(-)
 create mode 100644 package/debianutils/Config.in
 create mode 100644 package/debianutils/debianutils.hash
 create mode 100644 package/debianutils/debianutils.mk
 create mode 100644 package/dhcpcd/dhcpcd.hash
 create mode 100644 package/ifupdown/Config.in
 create mode 100644 package/ifupdown/ifupdown.hash
 create mode 100644 package/ifupdown/ifupdown.mk

-- 
2.0.4
