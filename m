From: Thomas Ruschival <thomas@ruschival.de>
Date: Sun, 26 Apr 2020 15:58:41 +0200
Subject: [Buildroot] [PATCH 0/1] package/pistache: new package
Message-ID: <20200426135842.2125143-1-thomas@ruschival.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pistache is a C++ REST server framework.

The upstream project https://pistache.io/ does not provide release tarballs
at https://github.com/oktal/pistache/. I have been using the commit
73f248acd6db4c53 successfully for some time now for a buildroot project.
I looked up the latest HEAD today and it seems to fail the CI tests.  

The use of dependencies of BR2_PACKAGE_OPENSSL. I am not sure if
rather BR2_PACKAGE_HAS_OPENSSL should be used.

The use of BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 is for C++14 compiler support. While
the website states it is C++11 the github repository mentions C++14.
 
Thomas Ruschival (1):
  package/pistache: new package

 package/Config.in              |  1 +
 package/pistache/Config.in     | 22 ++++++++++++++++++++++
 package/pistache/pistache.hash |  5 +++++
 package/pistache/pistache.mk   | 23 +++++++++++++++++++++++
 4 files changed, 51 insertions(+)
 create mode 100644 package/pistache/Config.in
 create mode 100644 package/pistache/pistache.hash
 create mode 100644 package/pistache/pistache.mk

-- 
2.26.2
