From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 21:34:32 +0200
Subject: [Buildroot] [git commit] package/i2c-tools: update download location
Message-ID: <20160626193457.9565581A0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e894aa1b6617d5b9f3e16b0c30eb0e281ac12234
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the shut down of www.lm-sensors.org we do not have a package
download location anymore, so we update the i2c-tools package to use
the git repository hosted at kernel.org.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/i2c-tools/i2c-tools.hash | 2 --
 package/i2c-tools/i2c-tools.mk   | 5 ++---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/i2c-tools/i2c-tools.hash b/package/i2c-tools/i2c-tools.hash
deleted file mode 100644
index c12ffe8..0000000
--- a/package/i2c-tools/i2c-tools.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally computed hash
-sha256	db5e69f2e2a6e3aa2ecdfe6a5f490b149c504468770f58921c8c5b8a7860a441  i2c-tools-3.1.2.tar.bz2
diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 187bd09..9625acf 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-I2C_TOOLS_VERSION = 3.1.2
-I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.bz2
-I2C_TOOLS_SITE = http://dl.lm-sensors.org/i2c-tools/releases
+I2C_TOOLS_VERSION = v3.1.2
+I2C_TOOLS_SITE = git://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git
 I2C_TOOLS_LICENSE = GPLv2+, GPLv2 (py-smbus)
 I2C_TOOLS_LICENSE_FILES = COPYING
 
