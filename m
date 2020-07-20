From: =?UTF-8?q?Alejandro=20Gonz=C3=A1lez?= <alejandro.gonzalez.correo@gmail.com>
Date: Mon, 20 Jul 2020 23:11:14 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/cryptodev-linux: bump to version
 f2927e3
Message-ID: <20200720211114.689018-1-alejandro.gonzalez.correo@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version mainly fixes build issues with more
recent kernels.

98b163a cryptlib.c: fix build on kernel v5.5+
7e72f67 enabled the support for TLS1.1 - AES128-SHA1 - AES256-SHA1
9e76506 Fix build for Linux 5.8-rc1

Signed-off-by: Alejandro Gonz?lez <alejandro.gonzalez.correo@gmail.com>

---
Changes v1 -> v2:
	- Fix download tarball hash

---
 package/cryptodev-linux/cryptodev-linux.hash | 2 +-
 package/cryptodev-linux/cryptodev-linux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptodev-linux/cryptodev-linux.hash b/package/cryptodev-linux/cryptodev-linux.hash
index 4319fd313a..53f64e6830 100644
--- a/package/cryptodev-linux/cryptodev-linux.hash
+++ b/package/cryptodev-linux/cryptodev-linux.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 50cf34ecedc897edb11d1a24076f0d4cfcb704dcd294273bc03e2f6c3632fe2c cryptodev-linux-a1e738aef6249ee3bddf997e91e59b1210553209.tar.gz
+sha256 d67a4a306a0d449298af2448f8f324bf79ec9d41411eef0c92ed764b6d505eee cryptodev-linux-f2927e313b6a74408d17d152abb21aa59d113b46.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index a02add6310..3d5d640b8a 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTODEV_LINUX_VERSION = a1e738aef6249ee3bddf997e91e59b1210553209
+CRYPTODEV_LINUX_VERSION = f2927e313b6a74408d17d152abb21aa59d113b46
 CRYPTODEV_LINUX_SITE = $(call github,cryptodev-linux,cryptodev-linux,$(CRYPTODEV_LINUX_VERSION))
 CRYPTODEV_LINUX_INSTALL_STAGING = YES
 CRYPTODEV_LINUX_LICENSE = GPL-2.0+
-- 
2.27.0
