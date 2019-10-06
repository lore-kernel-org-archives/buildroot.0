From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  6 Oct 2019 20:04:30 +0200
Subject: [Buildroot] [PATCH v2,
 1/2] package/nbd: add host-pkgconf to dependencies
Message-ID: <20191006180431.19759-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pkg-config is used to find libglib2 since version 3.17 and
https://github.com/NetworkBlockDevice/nbd/commit/ef86bbd9da2e2116ec0da6f9c130fb52e89fc310

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nbd/nbd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index 484f3e695b..fa569f3224 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -8,7 +8,7 @@ NBD_VERSION = 3.19
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.xz
 NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
 NBD_CONF_OPTS = --enable-lfs
-NBD_DEPENDENCIES = libglib2
+NBD_DEPENDENCIES = host-pkgconf libglib2
 NBD_LICENSE = GPL-2.0
 NBD_LICENSE_FILES = COPYING
 
-- 
2.23.0
