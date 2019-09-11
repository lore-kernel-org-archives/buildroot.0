From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 11 Sep 2019 19:17:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/ascii-invaders: fixup the 'v'
 prefix in the version
Message-ID: <20190911171729.29200-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order for the ascii-invaders version to match what is given by
release-monitoring.org, the 'v' prefix should be encoded in
ASCII_INVADERS_SITE and not ASCII_INVADERS_VERSION.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ascii-invaders/ascii-invaders.hash | 2 +-
 package/ascii-invaders/ascii-invaders.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ascii-invaders/ascii-invaders.hash b/package/ascii-invaders/ascii-invaders.hash
index b4805e7b1d..e8d482b2aa 100644
--- a/package/ascii-invaders/ascii-invaders.hash
+++ b/package/ascii-invaders/ascii-invaders.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha512	326708ffc2c277e04575920c58f6a267e0bf46f8d2a3dbca9b5c317fb01006d4f673ab35f92f292549cc52dbee4400a84c85478eb81b9bd7703689a705547bc7	v1.0.1.tar.gz
+sha512	326708ffc2c277e04575920c58f6a267e0bf46f8d2a3dbca9b5c317fb01006d4f673ab35f92f292549cc52dbee4400a84c85478eb81b9bd7703689a705547bc7	1.0.1.tar.gz
 
 # Hash for license file
 sha512	1e455684996d7733b2f1ccd4606d034694d16ceff6ede6125d7f1537d20dabe05976cca4cef5cbf6c31352cbd62a515fd8e34a2ffb54dae1181c1116b24c6cf7	LICENSE
diff --git a/package/ascii-invaders/ascii-invaders.mk b/package/ascii-invaders/ascii-invaders.mk
index c91e0eeaa8..fc1a019291 100644
--- a/package/ascii-invaders/ascii-invaders.mk
+++ b/package/ascii-invaders/ascii-invaders.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ASCII_INVADERS_VERSION = v1.0.1
+ASCII_INVADERS_VERSION = 1.0.1
 ASCII_INVADERS_SOURCE = $(ASCII_INVADERS_VERSION).tar.gz
-ASCII_INVADERS_SITE = $(call github,macdice,ascii-invaders,$(ASCII_INVADERS_VERSION))
+ASCII_INVADERS_SITE = $(call github,macdice,ascii-invaders,v$(ASCII_INVADERS_VERSION))
 ASCII_INVADERS_DEPENDENCIES = ncurses
 ASCII_INVADERS_LICENSE = GPL-2.0+
 ASCII_INVADERS_LICENSE_FILES = LICENSE
-- 
2.23.0.rc1
