From: Michael Nosthoff <buildroot@heine.tech>
Date: Mon,  2 Nov 2020 11:27:53 +0100
Subject: [Buildroot] [PATCH v3] package/libgpiod: bump version to 1.4.5
In-Reply-To: <20201102102139.4442-1-buildroot@heine.tech>
References: <20201102102139.4442-1-buildroot@heine.tech>
Message-ID: <20201102102753.9080-1-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* add a comment about the kernel header dependencies when bumping
versions
* set url to kernel.org as github is unmaintained and outdated
* use two spaces in hash-file

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

---
v2 -> v3:
  * use correct hash
  * add comment about url

v1 -> v2:
  * stay on the 1.4.x branch in all cases
  * further bump 1.4.4 to 1.4.5
---
 package/libgpiod/Config.in     | 2 +-
 package/libgpiod/libgpiod.hash | 4 ++--
 package/libgpiod/libgpiod.mk   | 4 +++-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libgpiod/Config.in b/package/libgpiod/Config.in
index 63a7cb6e78..293eef6c89 100644
--- a/package/libgpiod/Config.in
+++ b/package/libgpiod/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBGPIOD
 	  This is a C library that abstracts the GPIO character
 	  device operations on linux.
 
-	  https://github.com/brgl/libgpiod
+	  https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/
 
 if BR2_PACKAGE_LIBGPIOD
 
diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index f0009a7510..0ea15869b0 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256 21ae8fd1f8dafc2eb2ba50e652390cf533d21351419a7426255895cb52e21b1c  libgpiod-1.4.1.tar.xz
+sha256  a041b06907c956dd1c77836cccf4d392af29b9fe09c8ad18449a6da707b5ba2d  libgpiod-1.4.5.tar.xz
 # Hash for license file
-sha256 ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING
+sha256  ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index 2474ab90a2..83d5abb002 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-LIBGPIOD_VERSION = 1.4.1
+# be careful when bumping versions, newer branches (e.g. >= 1.6)
+# depend on pretty recent kernel headers
+LIBGPIOD_VERSION = 1.4.5
 LIBGPIOD_SOURCE = libgpiod-$(LIBGPIOD_VERSION).tar.xz
 LIBGPIOD_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD_LICENSE = LGPL-2.1+
-- 
2.25.1
