From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Feb 2014 14:50:23 +0100
Subject: [Buildroot] [git commit] Revert "libpng: fix download location"
Message-ID: <20140228135108.240F99BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a70fcb0efc3a27cefc6ccaf3a25596eee155897
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 7e505749659cde372fe5c52d2d8e5f9a2e945223.

Now that we've bumped the libpng version, we shouldn't look for it among the
older releases.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpng/libpng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index e8483b7..0bfe7d1 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -7,7 +7,7 @@
 LIBPNG_VERSION = 1.6.9
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
-LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/older-releases/$(LIBPNG_VERSION)
+LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
 LIBPNG_LICENSE = libpng license
 LIBPNG_LICENSE_FILES = LICENSE
 LIBPNG_INSTALL_STAGING = YES
