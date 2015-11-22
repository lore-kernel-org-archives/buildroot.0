From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Nov 2015 22:53:27 +0100
Subject: [Buildroot] [git commit] package/libass: bump version to 0.13.0
Message-ID: <20151201232120.32BFA7FEE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e8413a86e9822c6685cc686bbf2b8024c842947
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Quote from https://github.com/libass/libass/blob/master/Changelog
"* Drop ENCA support"

Therefore we remove the dependency to libenca.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libass/libass.hash | 2 +-
 package/libass/libass.mk   | 9 +--------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/libass/libass.hash b/package/libass/libass.hash
index f300166..87d3f26 100644
--- a/package/libass/libass.hash
+++ b/package/libass/libass.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 a67c54ebaf5ec19ae72e86259ee6ab6adfe2e64ed9f9149db03dc863360ea38c  libass-0.12.3.tar.xz
+sha256	e0071a3b2e95411c8d474014678368e3f0b852f7d663e0564b344e7335eb0671	libass-0.13.0.tar.xz
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index f1f00f3..83939e2 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASS_VERSION = 0.12.3
+LIBASS_VERSION = 0.13.0
 LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.xz
 # Do not use the github helper here, the generated tarball is *NOT*
 # the same as the one uploaded by upstream for the release.
@@ -38,11 +38,4 @@ else
 LIBASS_CONF_OPTS += --disable-harfbuzz
 endif
 
-ifeq ($(BR2_PACKAGE_LIBENCA),y)
-LIBASS_DEPENDENCIES += libenca
-LIBASS_CONF_OPTS += --enable-enca
-else
-LIBASS_CONF_OPTS += --disable-enca
-endif
-
 $(eval $(autotools-package))
