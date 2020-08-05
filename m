From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 15:30:06 +0200
Subject: [Buildroot] [git commit] package/enlightenment: bump to version
 0.24.2
Message-ID: <20200805132540.140798156F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=250d96129409c2e71cf4ade8ad93f6f7e3cc21d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Disable new dependency on polkit for now.
- Add OFL license for fonts.
- Update COPYING file hash.
- Update indentation in hash file (two spaces)

See:
https://www.enlightenment.org/news/e24.2

enlightenment 0.24 require efl >= 1.24.

https://git.enlightenment.org/core/enlightenment.git/commit/?id=4b6467685e7ac9ae68f08bd524f332a908f5fa74

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/enlightenment/enlightenment.hash |  7 ++++---
 package/enlightenment/enlightenment.mk   | 10 ++++++----
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
index f692a67aa1..7f0f3f3e7b 100644
--- a/package/enlightenment/enlightenment.hash
+++ b/package/enlightenment/enlightenment.hash
@@ -1,3 +1,4 @@
-# From https://www.enlightenment.org/news/e23_release
-sha256	b8c5d040875576d3d3ad8572644f92a65e21291bcee6b0d62f74fbfd482afdf8	enlightenment-0.23.0.tar.xz
-sha256	34dbd501ec9d1c8dcc569c01db9cf9a4b7ee5981614cc9f8f613a97463d27350	COPYING
+# From https://www.enlightenment.org/news/e24.2
+sha256  be18e2f18d6c0b058f633e769863d3cbc4c07b629058ae670dec74cd7906dff1  enlightenment-0.24.2.tar.xz
+sha256  17dda7902d3e1a743f91cf2545f474be93f612768a9e9022593d788ecc83935a  COPYING
+sha256  f4ba47ef8f4ff588202e721ab10f0208a3fa678147e7f928e6b2820f2e646e13  src/modules/wl_weekeyboard/themes/default/fonts/LICENSE.txt
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 43f79d59da..12827964e1 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.23.0
+ENLIGHTENMENT_VERSION = 0.24.2
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
 ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
-ENLIGHTENMENT_LICENSE = BSD-2-Clause
-ENLIGHTENMENT_LICENSE_FILES = COPYING
+ENLIGHTENMENT_LICENSE = BSD-2-Clause, OFL-1.1 (font)
+ENLIGHTENMENT_LICENSE_FILES = COPYING \
+	src/modules/wl_weekeyboard/themes/default/fonts/LICENSE.txt
 
 ENLIGHTENMENT_DEPENDENCIES = \
 	host-pkgconf \
@@ -20,7 +21,8 @@ ENLIGHTENMENT_CONF_OPTS = \
 	-Dedje-cc=$(HOST_DIR)/bin/edje_cc \
 	-Deet=$(HOST_DIR)/bin/eet \
 	-Deldbus-codegen=$(HOST_DIR)/bin/eldbus-codegen \
-	-Dpam=false
+	-Dpam=false \
+	-Dpolkit=false
 
 # enlightenment.pc and /usr/lib/enlightenment/modules/*.so
 ENLIGHTENMENT_INSTALL_STAGING = YES
