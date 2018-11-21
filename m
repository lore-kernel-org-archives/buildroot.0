From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Nov 2018 22:31:28 +0100
Subject: [Buildroot] [git commit] libostree: bump to version 2018.9.1
Message-ID: <20181202071557.29D9181583@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45708b0dbe60fc580834ac39f9b7c843548fe1ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to v2018.9 added ostree-finalize-staged.path through
https://github.com/ostreedev/ostree/commit/ac1a919ffd4fe944d06c4f4510604baa73d1bf8e

However, this file was not added in the tarball until commit:
https://github.com/ostreedev/ostree/commit/62594765b2fae72e332ffb21fbd11085d911ef83

So use the new 2018.9.1 tarball to get this file otherwise build with
systemd will fail

Fixes:
 - http://autobuild.buildroot.org/results/fc6435282630e60927f88bf5954805ebbaa60cb3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libostree/libostree.hash | 2 +-
 package/libostree/libostree.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
index 35bf2caf0a..ddd15b5099 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 9a3c17af133e6d381bb997473c6371ef8f048c1cfb6bd0acdb5662ede712aa5a  libostree-2018.9.tar.xz
+sha256 f263cfed75dcc9e312a874d28241e7143d8a0d8c774938f2165327bae67dbe06  libostree-2018.9.1.tar.xz
 sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 8538cdc69c..e8cdd64d6e 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2018.9
+LIBOSTREE_VERSION_MAJOR = 2018.9
+LIBOSTREE_VERSION= $(LIBOSTREE_VERSION_MAJOR).1
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
-LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
+LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION_MAJOR)
 
 LIBOSTREE_LICENSE = LGPL-2.0+
 LIBOSTREE_LICENSE_FILES = COPYING
