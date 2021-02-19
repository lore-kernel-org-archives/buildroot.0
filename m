From: Titouan Christophe <titouanchristophe@gmail.com>
Date: Fri, 19 Feb 2021 11:03:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/micropython: bump to v1.14
Message-ID: <20210219100344.130136-1-titouanchristophe@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Micropython 1.4 brings many changes, see the release notes:
https://github.com/micropython/micropython/releases/tag/v1.14

Amongst these changes, Micropython can now produce reproducible
builds, using the standard SOURCE_DATE_EPOCH.

The LICENSE hash changed because the copyright year range was extended
to 2021.

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/micropython/micropython.hash | 4 ++--
 package/micropython/micropython.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
index 5dfbb74522..fe47ee09c4 100644
--- a/package/micropython/micropython.hash
+++ b/package/micropython/micropython.hash
@@ -1,3 +1,3 @@
 #locally computed
-sha256  31466dacebeb3af60dc80a071a07c3e15b657219a826e0b6ac741f9f22472f23  micropython-1.13.tar.gz
-sha256  4b8a8884a60cd72749f9ef40328b85b40d13c22594c01352e0a55392141e0f89  LICENSE
+sha256  542eb120df8d9eb6f200bcd856294e143813adea9dda0d7189405c218d4b16f7  micropython-1.14.tar.gz
+sha256  9c6089e26c8638a0645bcb0db2c85051f82de8022dcd07fb22baa0c5f9362085  LICENSE
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index a126b3eeae..80d086f3c8 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MICROPYTHON_VERSION = 1.13
+MICROPYTHON_VERSION = 1.14
 MICROPYTHON_SITE = $(call github,micropython,micropython,v$(MICROPYTHON_VERSION))
 MICROPYTHON_LICENSE = MIT
 MICROPYTHON_LICENSE_FILES = LICENSE
-- 
2.25.3
