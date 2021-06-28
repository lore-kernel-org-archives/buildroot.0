From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Mon, 28 Jun 2021 19:01:04 +0300
Subject: [Buildroot] [PATCH v2 1/1] package/fb-test-app: Move 'rosetta'
 prefix from VERSION to SITE
Message-ID: <20210628160104.8793-1-andriy.shevchenko@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move 'rosetta' prefix from VERSION to SITE to have version be
in a standard format.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: fixed hash file as well (Thomas)
 package/fb-test-app/fb-test-app.hash | 2 +-
 package/fb-test-app/fb-test-app.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fb-test-app/fb-test-app.hash b/package/fb-test-app/fb-test-app.hash
index 3068caf278df..ff7730ef8dc6 100644
--- a/package/fb-test-app/fb-test-app.hash
+++ b/package/fb-test-app/fb-test-app.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  45d490ed78a6e4425d9a760e81e99dc503af01704e17ab5bf186b87a31c5e3db  fb-test-app-rosetta-1.1.1.tar.gz
+sha256  45d490ed78a6e4425d9a760e81e99dc503af01704e17ab5bf186b87a31c5e3db  fb-test-app-1.1.1.tar.gz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/fb-test-app/fb-test-app.mk b/package/fb-test-app/fb-test-app.mk
index f6e949015ef8..89d533ab15b4 100644
--- a/package/fb-test-app/fb-test-app.mk
+++ b/package/fb-test-app/fb-test-app.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FB_TEST_APP_VERSION = rosetta-1.1.1
-FB_TEST_APP_SITE = $(call github,andy-shev,fb-test-app,$(FB_TEST_APP_VERSION))
+FB_TEST_APP_VERSION = 1.1.1
+FB_TEST_APP_SITE = $(call github,andy-shev,fb-test-app,rosetta-$(FB_TEST_APP_VERSION))
 FB_TEST_APP_LICENSE = GPL-2.0
 FB_TEST_APP_LICENSE_FILES = COPYING
 
-- 
2.30.2
