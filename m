From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  2 Mar 2020 16:04:48 +0100
Subject: [Buildroot] [PATCH/next v1 1/3] package/libevdev: add host-python
 dependency
Message-ID: <20200302150450.3546-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  checking for a Python interpreter with version >= 2.6... none
  configure: error: no suitable Python interpreter found

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
  - maybe something for the master branch, but no autobuilds
    affected, seems python is installed everywhere
---
 package/libevdev/libevdev.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index 0b5a526bab..8b243be74e 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -14,7 +14,7 @@ LIBEVDEV_LICENSE_FILES = COPYING
 LIBEVDEV_AUTORECONF = YES
 
 # Uses PKG_CHECK_MODULES() in configure.ac
-LIBEVDEV_DEPENDENCIES = host-pkgconf
+LIBEVDEV_DEPENDENCIES = host-pkgconf host-python
 
 LIBEVDEV_INSTALL_STAGING = YES
 
-- 
2.25.1
