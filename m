From: Robert Hancock <hancock@sedsystems.ca>
Date: Mon, 13 Jul 2020 21:39:27 -0600
Subject: [Buildroot] [PATCH] package/scons: explicitly specify host Python 3
Message-ID: <20200714033927.1516172-1-hancock@sedsystems.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All packages using scons are now using Python 3 to run it, so
explicitly set scons as using host-python3. This avoids a
spurious host Python 2 dependency if BR2_PACKAGE_PYTHON3 is not
set (for example, if no Python is packaged for the target).

Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
---
 package/scons/scons.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index da2ccceb08..a95fa7fd69 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -10,6 +10,8 @@ SCONS_LICENSE = MIT
 SCONS_LICENSE_FILES = LICENSE.txt
 SCONS_SETUP_TYPE = distutils
 
+HOST_SCONS_NEEDS_HOST_PYTHON = python3
+
 HOST_SCONS_INSTALL_OPTS = \
 	--install-lib=$(HOST_DIR)/lib/scons-$(SCONS_VERSION)
 
-- 
2.18.4
