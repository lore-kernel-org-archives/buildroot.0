From: Romain Naour <romain.naour@gmail.com>
Date: Thu,  3 Jan 2019 00:10:26 +0100
Subject: [Buildroot] [PATCH] package/terminology: bump to version 1.3.2
In-Reply-To: <20190102231026.8189-1-romain.naour@gmail.com>
References: <20190102231026.8189-1-romain.naour@gmail.com>
Message-ID: <20190102231026.8189-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See:
https://sourceforge.net/p/enlightenment/mailman/message/36497308/

This version contain a fix [1] for newer meson (0.49.0) [2]:

[1] https://git.enlightenment.org/apps/terminology.git/commit/?id=80e36857a28bb2a0b0fdd58b0cd86b110a180efc
[2] https://github.com/mesonbuild/meson/issues/3600

This affect terminology build system since data/themes/meson.build
use "in" which is now a reserved keyword.

Fixes:
http://autobuild.buildroot.net/results/6e4/6e445e8f0c973fad58937824452aac9b593b3e8d/build-end.log

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/terminology/terminology.hash | 4 ++--
 package/terminology/terminology.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/terminology/terminology.hash b/package/terminology/terminology.hash
index f341d5c2f7..1e0a85cd23 100644
--- a/package/terminology/terminology.hash
+++ b/package/terminology/terminology.hash
@@ -1,3 +1,3 @@
-# From https://sourceforge.net/p/enlightenment/mailman/message/36317484/
-sha256  ac8673a129ed78ef669a8c04e7a136f5ca95226ce5ef375a451421bac41828c6  terminology-1.2.1.tar.xz
+# From https://sourceforge.net/p/enlightenment/mailman/message/36497308/
+sha256  b5171181da42cc5f384238f71e43302c2c760938f6a8ab931647ccdad4ef94cd  terminology-1.3.2.tar.xz
 sha256  605988548c7a52562d6f64d936a579b53f690e62ca92261b6a440bf9023ff521  COPYING
diff --git a/package/terminology/terminology.mk b/package/terminology/terminology.mk
index 3d144f8655..c53f6829de 100644
--- a/package/terminology/terminology.mk
+++ b/package/terminology/terminology.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TERMINOLOGY_VERSION = 1.2.1
+TERMINOLOGY_VERSION = 1.3.2
 TERMINOLOGY_SOURCE = terminology-$(TERMINOLOGY_VERSION).tar.xz
 TERMINOLOGY_SITE = https://download.enlightenment.org/rel/apps/terminology
 TERMINOLOGY_LICENSE = BSD-2-Clause
-- 
2.14.5
