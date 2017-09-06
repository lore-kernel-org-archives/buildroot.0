From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 22:42:14 +0200
Subject: [Buildroot] [git commit] expat: bump to version 2.2.4
Message-ID: <20170906210303.26835817B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bfa4428d78c67fade7160f0bf0dd358a0bc1ba44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream migrated to automake for autotools: the "installlib" target
no longer exist, and we can use the standard "install" target, and
therefore drop the special INSTALL_STAGING_OPTS and
INSTALL_TARGET_OPTS variables.

Add license hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/expat/expat.hash | 10 ++++++----
 package/expat/expat.mk   |  4 +---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index ccf74d6..ef01ec9 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,5 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.2.3/
-md5	f053af63ef5f39bd9b78d01fbc203334	expat-2.2.3.tar.bz2
-sha1	e2be3a2aa8d12ce70184aab418d0d5d96ed86d0e	expat-2.2.3.tar.bz2
+# From https://sourceforge.net/projects/expat/files/expat/2.2.4/
+md5	6e3980aba29a224a9f478d88ac7ec207	expat-2.2.4.tar.bz2
+sha1	3394d6390c041a8f5dec1d5fe7c4af0a23ae4504	expat-2.2.4.tar.bz2
 # Calculated based on the hashes above
-sha256	b31890fb02f85c002a67491923f89bda5028a880fd6c374f707193ad81aace5f	expat-2.2.3.tar.bz2
+sha256	03ad85db965f8ab2d27328abcf0bc5571af6ec0a414874b2066ee3fdd372019e	expat-2.2.4.tar.bz2
+# Locally calculated
+sha256	46336ab2fec900803e2f1a4253e325ac01d998efb09bc6906651f7259e636f76	COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index a6fa373..ef196ec 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.2.3
+EXPAT_VERSION = 2.2.4
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.bz2
 EXPAT_INSTALL_STAGING = YES
-EXPAT_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) installlib
-EXPAT_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) installlib
 EXPAT_DEPENDENCIES = host-pkgconf
 HOST_EXPAT_DEPENDENCIES = host-pkgconf
 EXPAT_LICENSE = MIT
