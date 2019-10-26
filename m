From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sat, 26 Oct 2019 17:29:39 +0200
Subject: [Buildroot] [PATCH v2 0/4] package/mongodb: Bump to v4.1.10
Message-ID: <20191026152943.122511-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch set bumps MongoDB to v4.1.10, which requires a few other changes
in its build options and dependencies.

This is a rework from the original series from Fabrice, with small fixes so
that it nicely applies on top of master

Fabrice Fontaine (4):
  package/python-psutil: add host variant
  package/python-cheetah3: new package
  package/python-pyyaml: add a host-python3 dependency for host variant
  package/mongodb: bump to version 4.1.10

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...0002-fix-build-with-system-libraries.patch | 64 +++++++++++++++++++
 package/mongodb/Config.in                     |  8 +--
 package/mongodb/mongodb.hash                  |  2 +-
 package/mongodb/mongodb.mk                    | 23 ++++---
 package/python-cheetah3/Config.in             |  6 ++
 package/python-cheetah3/python-cheetah3.hash  |  5 ++
 package/python-cheetah3/python-cheetah3.mk    | 18 ++++++
 package/python-psutil/python-psutil.mk        |  4 ++
 package/python-pyyaml/python-pyyaml.mk        |  3 +
 11 files changed, 121 insertions(+), 14 deletions(-)
 create mode 100644 package/mongodb/0002-fix-build-with-system-libraries.patch
 create mode 100644 package/python-cheetah3/Config.in
 create mode 100644 package/python-cheetah3/python-cheetah3.hash
 create mode 100644 package/python-cheetah3/python-cheetah3.mk

-- 
2.21.0
