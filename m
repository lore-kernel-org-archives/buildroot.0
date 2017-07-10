From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 Jul 2017 13:38:01 +0200
Subject: [Buildroot] [PATCH] i2c-tools: use upstream tarball
Message-ID: <20170710113801.31752-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tarballs of the releases are now again available:

https://www.spinics.net/lists/linux-i2c/msg30349.html

So change back to that instead of getting the source code from git.

While we're at it, add a hash for the license file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/i2c-tools/i2c-tools.hash | 5 ++++-
 package/i2c-tools/i2c-tools.mk   | 5 +++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/i2c-tools/i2c-tools.hash b/package/i2c-tools/i2c-tools.hash
index e45e5324bf..464219dea8 100644
--- a/package/i2c-tools/i2c-tools.hash
+++ b/package/i2c-tools/i2c-tools.hash
@@ -1,2 +1,5 @@
 # Locally computed
-sha256 972b8da73b5aada91e8f21573cf5dbf6dc2d5d64864210e80b2b1aa710a66d02  i2c-tools-v3.1.2.tar.gz
+sha256 6d6079153cd49a62d4addacef4c092db1a46ba60b2807070a3fbe050262aef87  i2c-tools-3.1.2.tar.xz
+
+# License file
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 978c5c0430..3bbaf38ff3 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-I2C_TOOLS_VERSION = v3.1.2
-I2C_TOOLS_SITE = git://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git
+I2C_TOOLS_VERSION = 3.1.2
+I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.xz
+I2C_TOOLS_SITE = https://www.kernel.org/pub/software/utils/i2c-tools
 I2C_TOOLS_LICENSE = GPL-2.0+, GPL-2.0 (py-smbus)
 I2C_TOOLS_LICENSE_FILES = COPYING
 
-- 
2.11.0
