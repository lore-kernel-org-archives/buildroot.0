From: Brad Love <brad@nextdimension.cc>
Date: Fri, 24 Aug 2018 08:54:06 -0500
Subject: [Buildroot] [PATCH v3 1/2] i2c-tools: include LGPL-2.1+ license for
 libi2c
In-Reply-To: <1535118847-21086-1-git-send-email-brad@nextdimension.cc>
References: <1535118847-21086-1-git-send-email-brad@nextdimension.cc>
Message-ID: <1535118847-21086-2-git-send-email-brad@nextdimension.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Extend i2c-tools SPDX identifiers to include the library license.
Also include COPYING.LGPL and README to license files.

The ic2-tools readme states:

LICENSE

Check the documentation of individual tools for licensing information.
The library is released under the LGPL version 2.1 or later, while most
tools are released under the GPL version 2 or later, but there are a few
exceptions.

Signed-off-by: Brad Love <brad@nextdimension.cc>
---
since v2:
- Added COPYING.LGPL and README to license files
- Expand commit message for newly included files

 package/i2c-tools/i2c-tools.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index db26647..ec06c73 100644
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
-- 
2.7.4
