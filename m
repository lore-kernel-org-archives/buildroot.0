From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Feb 2015 19:03:24 +0100
Subject: [Buildroot] [git commit branch/next] autoconf-archive: new package
Message-ID: <20150220180427.88AC7817E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f5f651d06df2a7dfba8822ec4579830e63262d09
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This package contains a collection of freely re-usable autoconf
macros.

[Thomas:
 - change site to $(BR2_GNU_MIRROR), so that an official GNU site is
   used.
 - Change license to "GPLv3+ with exception", and add
   COPYING.EXCEPTION to the list of license files.]

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/autoconf-archive/autoconf-archive.mk |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/package/autoconf-archive/autoconf-archive.mk b/package/autoconf-archive/autoconf-archive.mk
new file mode 100644
index 0000000..78cb6a8
--- /dev/null
+++ b/package/autoconf-archive/autoconf-archive.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# autoconf-archive
+#
+################################################################################
+
+AUTOCONF_ARCHIVE_VERSION = 2015.02.04
+AUTOCONF_ARCHIVE_SOURCE = autoconf-archive-$(AUTOCONF_ARCHIVE_VERSION).tar.xz
+AUTOCONF_ARCHIVE_SITE = $(BR2_GNU_MIRROR)/autoconf-archive/
+AUTOCONF_ARCHIVE_LICENSE = GPLv3+ with exception
+AUTOCONF_ARCHIVE_LICENSE_FILES = COPYING COPYING.EXCEPTION
+
+$(eval $(host-autotools-package))
