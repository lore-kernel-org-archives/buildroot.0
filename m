From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Wed, 13 Mar 2019 10:29:32 +0200
Subject: [Buildroot] [PATCH] libiio: bump to version 0.15
Message-ID: <20190313082932.13596-1-ardeleanalex@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change bumps libiio, to version 0.15.
This version is currently the most stable version in the series. It
contains several fixes over 0.14.

0.16 & 0.17 have been released but they have some issues with backwards
compatibility, so they are not yet recommended.

Changelog for version 0.15 (over 0.14).
Link:
  https://github.com/analogdevicesinc/libiio/releases/tag/v0.15

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
---

0.15 contains a fix that should also be added into the latest LTS.
buildroot LTS contains version 0.14

Question:
 - is it ok to port this change to the LTS (2019.02) ?
 - do we cherry-pick the patches from 0.15 to put on top of 0.14 ?

The important patches would be ~12.
The really important patches would be fewer (needs more digging into).

How do patches for LTS versions get marked/sent ?
(Or how is the protocol for sending patches to LTS; I haven't found
anything yet to suggest how to do it).

Thanks
Alex

 package/libiio/libiio.hash | 2 +-
 package/libiio/libiio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libiio/libiio.hash b/package/libiio/libiio.hash
index fbb4bccb90..800b2ee8f4 100644
--- a/package/libiio/libiio.hash
+++ b/package/libiio/libiio.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 12063db7a9366aa00bfd789db30afaddb29686bc29b3ce1e5d4adfe1c3b42527  libiio-0.14.tar.gz
+sha256 a729f8ff48137ad271a3e2951f322b35c1bf2ec075b488d75c8bd071c693fd19  libiio-0.15.tar.gz
 sha256 102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b  COPYING.txt
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index d2376bca34..2371a71063 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIIO_VERSION = 0.14
+LIBIIO_VERSION = 0.15
 LIBIIO_SITE = $(call github,analogdevicesinc,libiio,v$(LIBIIO_VERSION))
 LIBIIO_INSTALL_STAGING = YES
 LIBIIO_LICENSE = LGPL-2.1+
-- 
2.17.1
