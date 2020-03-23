From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Mar 2020 21:54:28 +0100
Subject: [Buildroot] [git commit] package/libostree: bump to version 2020.3
Message-ID: <20200323204651.84D7A8111D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f45a81dbb1ecce8f1c598ac009702122cfdc7a15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream only ever made a dot-relase once, and it is not even available
as a tag, and it is not even listed as a separate release on their
github release page. We can assume that dot-release is not in upstream
habits. Drop the VERSION_MAJOR variable, just use VERSION.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
[yann.morin.1998 at free.fr:
  - drop VERSION_MAJOR
  - two spaces in hash file
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libostree/libostree.hash | 4 ++--
 package/libostree/libostree.mk   | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
index 374f278f42..2ebc560d83 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 5482b8fc179c6d2861acb176a1c379e4d02f709bffa92e63f5360f65e57219ae  libostree-2019.6.tar.xz
-sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
+sha256  5877396ea092f5b6701c17bd20280746cad20f55a94c760dbeba0fa115818c05  libostree-2020.3.tar.xz
+sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index aed97b70cc..57d9e98d72 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION_MAJOR = 2019.6
-LIBOSTREE_VERSION= $(LIBOSTREE_VERSION_MAJOR)
+LIBOSTREE_VERSION = 2020.3
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
-LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION_MAJOR)
+LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
 LIBOSTREE_LICENSE = LGPL-2.0+
 LIBOSTREE_LICENSE_FILES = COPYING
