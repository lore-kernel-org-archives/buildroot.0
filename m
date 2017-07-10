From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 Jul 2017 14:24:36 +0200
Subject: [Buildroot] [git commit] i2c-tools: use upstream tarball
Message-ID: <20170710122206.C04138005E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00d73749e2a2c4abb4eff44bfa10dc6cd109a67d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tarballs of the releases are now again available:

https://www.spinics.net/lists/linux-i2c/msg30349.html

So change back to that instead of getting the source code from git.

While we're at it, add a hash for the license file.

[Peter: Also update Config.in homepage URL as pointed out by Baruch]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/i2c-tools/Config.in      | 2 +-
 package/i2c-tools/i2c-tools.hash | 5 ++++-
 package/i2c-tools/i2c-tools.mk   | 5 +++--
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/i2c-tools/Config.in b/package/i2c-tools/Config.in
index b82c7dc..82ee334 100644
--- a/package/i2c-tools/Config.in
+++ b/package/i2c-tools/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_I2C_TOOLS
 	  a bus probing tool, a chip dumper, register-level access helpers,
 	  EEPROM decoding scripts, and more.
 
-	  http://www.lm-sensors.org/wiki/I2CTools
+	  https://i2c.wiki.kernel.org/index.php/I2C_Tools
diff --git a/package/i2c-tools/i2c-tools.hash b/package/i2c-tools/i2c-tools.hash
index e45e532..464219d 100644
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
index 978c5c0..3bbaf38 100644
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
 
