From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 23:58:18 +0200
Subject: [Buildroot] [git commit branch/next] i2c-tools: include LGPL-2.1+
 license for libi2c
Message-ID: <20180824215605.E0F5A8E738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2095b596c9c0d8b955e606fb820a94d0f25ceaaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Extend i2c-tools SPDX identifiers to include the library license.
Also include COPYING.LGPL and README to license files.

The ic2-tools readme states:

LICENSE

Check the documentation of individual tools for licensing information.
The library is released under the LGPL version 2.1 or later, while most
tools are released under the GPL version 2 or later, but there are a few
exceptions.

Signed-off-by: Brad Love <brad@nextdimension.cc>
[Thomas: add hashes for COPYING.LGPL and README.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/i2c-tools/i2c-tools.hash | 4 +++-
 package/i2c-tools/i2c-tools.mk   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/i2c-tools/i2c-tools.hash b/package/i2c-tools/i2c-tools.hash
index 3475d20657..37563074fc 100644
--- a/package/i2c-tools/i2c-tools.hash
+++ b/package/i2c-tools/i2c-tools.hash
@@ -1,5 +1,7 @@
 # Locally computed
 sha256 d900ca1c11c51ea20caa50b096f948008b8a7ad832311b23353e21baa7af28d6  i2c-tools-4.0.tar.xz
 
-# License file
+# License files
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
+sha256 158abc6886c2c6e2dec7e9cb11b46fd41cb13a015c5057c2a587ef581f9142f8  README
diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index db26647eb5..ec06c73325 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -7,8 +7,8 @@
 I2C_TOOLS_VERSION = 4.0
 I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.xz
 I2C_TOOLS_SITE = https://www.kernel.org/pub/software/utils/i2c-tools
-I2C_TOOLS_LICENSE = GPL-2.0+, GPL-2.0 (py-smbus)
-I2C_TOOLS_LICENSE_FILES = COPYING
+I2C_TOOLS_LICENSE = GPL-2.0+, GPL-2.0 (py-smbus), LGPL-2.1+ (libi2c)
+I2C_TOOLS_LICENSE_FILES = COPYING COPYING.LGPL README
 I2C_TOOLS_MAKE_OPTS = EXTRA=eeprog
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
