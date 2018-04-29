From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 18:51:18 +0200
Subject: [Buildroot] [git commit] libebml: bump to version 1.3.6
Message-ID: <20180429165326.DF9D58A35C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=962c516431e0b56275dff3aa5f027868e6c5f546
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use tar.xz (tar.bz2 is not available since 1.3.5)
- Use cmake infrastructure (autotools has been removed)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libebml/libebml.hash | 3 ++-
 package/libebml/libebml.mk   | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libebml/libebml.hash b/package/libebml/libebml.hash
index 5abc1ebfb0..6daa4746c2 100644
--- a/package/libebml/libebml.hash
+++ b/package/libebml/libebml.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	35fb44daa41961f94a0ac1b8f06801e88cc9bf2ad6f562ced8ab7c1f1a875499	libebml-1.3.3.tar.bz2
+sha256	1e5a7a7820c493aa62b0f35e15b4233c792cc03458c55ebdfa7a6521e4b43e9e	libebml-1.3.6.tar.xz
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL
diff --git a/package/libebml/libebml.mk b/package/libebml/libebml.mk
index 8c5dee3f4b..3c34462738 100644
--- a/package/libebml/libebml.mk
+++ b/package/libebml/libebml.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBEBML_VERSION = 1.3.3
-LIBEBML_SOURCE = libebml-$(LIBEBML_VERSION).tar.bz2
+LIBEBML_VERSION = 1.3.6
+LIBEBML_SOURCE = libebml-$(LIBEBML_VERSION).tar.xz
 LIBEBML_SITE = http://dl.matroska.org/downloads/libebml
 LIBEBML_INSTALL_STAGING = YES
 LIBEBML_LICENSE = LGPL-2.1+
 LIBEBML_LICENSE_FILES = LICENSE.LGPL
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
