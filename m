From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Dec 2018 23:08:07 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] freetype: bump version to
 2.9.1
Message-ID: <20181203220620.AFA3F8A55C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ced4c61e6a902d9555230714e96d9aaeb936c4ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

According to [1]:

- fixes CVE-2018-6942: A NULL pointer dereference in the Ins_GETVARIATION()
  function within ttinterp.c could lead to DoS via a crafted font file

- needs '--enable-freetype-config' for freetype-config installation

[1] https://git.savannah.gnu.org/cgit/freetype/freetype2.git/tree/docs/CHANGES?id=86bc8a95056c97a810986434a3f268cbe67f2902

[Peter: also pass --enable-freetype-config for host variant]
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit 750d43ae14e935f08ea3d39a5081306295d83bb2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freetype/freetype.hash | 8 ++++----
 package/freetype/freetype.mk   | 6 +++++-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index 806375c058..c98674c7c2 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,9 +1,9 @@
-# From https://sourceforge.net/projects/freetype/files/freetype2/2.9/
-md5	513c403c110016fdc7e537216a642b1d		freetype-2.9.tar.bz2
-sha1	94c4399b1a55c5892812e732843fcb4a7c2fe657	freetype-2.9.tar.bz2
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.9.1/
+md5 60ef7d8160cd4bf8cb118ee9d65367ca freetype-2.9.1.tar.bz2
+sha1 220c82062171c513e4017c523d196933c9de4a7d freetype-2.9.1.tar.bz2
 
 # Locally calculated
-sha256	e6ffba3c8cef93f557d1f767d7bc3dee860ac7a3aaff588a521e081bc36f4c8a	freetype-2.9.tar.bz2
+sha256	db8d87ea720ea9d5edc5388fc7a0497bb11ba9fe972245e0f7f4c7e8b1e1e84d	freetype-2.9.1.tar.bz2
 sha256	fd056de4196903a676208ef58cfddafc7d583d1f28fa2e44c309cf84a59e62fb	docs/LICENSE.TXT
 sha256	08c135755dd589039470f1fdbb400daaabaaa50d0b366d19cebff4d22986baa1	docs/FTL.TXT
 sha256	c4120c6752c910c299e3bd9cb3a46ff262c268303ca2069b61f92f10a5656c18	docs/GPLv2.TXT
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 1b3a9d1755..7167061568 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.9
+FREETYPE_VERSION = 2.9.1
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
@@ -17,6 +17,10 @@ FREETYPE_CONFIG_SCRIPTS = freetype-config
 HOST_FREETYPE_DEPENDENCIES = host-pkgconf
 HOST_FREETYPE_CONF_OPTS = --without-zlib --without-bzip2 --without-png
 
+# since 2.9.1 needed for freetype-config install
+FREETYPE_CONF_OPTS += --enable-freetype-config
+HOST_FREETYPE_CONF_OPTS += --enable-freetype-config
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 FREETYPE_DEPENDENCIES += zlib
 FREETYPE_CONF_OPTS += --with-zlib
