From: Ciro Santilli <ciro.santilli@gmail.com>
Date: Sat,  3 Mar 2018 07:35:06 +0000
Subject: [Buildroot] [PATCH 1/2] package/efl: add missing licenses
Message-ID: <20180303073507.20146-1-ciro.santilli@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Romain Naour <romain.naour@gmail.com>

ecore_con added with efl 1.17 is under MIT license (COPYING.NGINX-MIT)
ector added with efl 1.15 is under FTL license (COPYING.FTL)

While at it, add license file hash.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/efl/efl.hash | 8 ++++++++
 package/efl/efl.mk   | 3 ++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index 8b0543007e..5507bda3ef 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,2 +1,10 @@
 # From https://download.enlightenment.org/rel/libs/efl/efl-1.20.6.tar.xz.sha256
 sha256	56c67ea77435753a4f324a0a13488ba58f4ed7eb35a97c1a354fdc79c39a32c1	efl-1.20.6.tar.xz
+sha256 d949e42ca8fd48d275c397c5fc2ac34c9b63ada715dcaf1a670e17bb62964341  COMPLIANCE
+sha256 1f0597d326e2fdb54aa2f0caec6d8bb0afb9941ef32475f017ed02ca214fcf37  COPYING
+sha256 781ee841d15835b393bfe7d4c6497dc1b05217479abd40daceaf7aa102a758e1  licenses/COPYING.BSD
+sha256 e60d07dfb2c5264f9f405fa52bf0d4f85429dd9ae1bc2ffcff8af1924ef720d1  licenses/COPYING.FTL
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licenses/COPYING.GPL
+sha256 89f79ccd2c35ba220ddeba70ee36ca867226c41fc210bc5e7f1e9032c5b16d5f  licenses/COPYING.LGPL
+sha256 2996a1c43ee757f9c997a829d82bdd584052323e73cf02ff8126c6fbd95c2d87  licenses/COPYING.NGINX-MIT
+sha256 48f124212f8fc024392a2d1d011fbb96c7ab8f89c0b72c671c33e9e1cb1d0790  licenses/COPYING.SMALL
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 5a82479ff5..7085796756 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -7,7 +7,7 @@
 EFL_VERSION = 1.20.6
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
-EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+
+EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+, FTL, MIT
 EFL_LICENSE_FILES = \
 	COMPLIANCE \
 	COPYING \
@@ -15,6 +15,7 @@ EFL_LICENSE_FILES = \
 	licenses/COPYING.FTL \
 	licenses/COPYING.GPL \
 	licenses/COPYING.LGPL \
+	licenses/COPYING.NGINX-MIT \
 	licenses/COPYING.SMALL
 
 EFL_INSTALL_STAGING = YES
-- 
2.16.1
