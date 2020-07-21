From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jul 2020 22:13:06 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/freerdp: security
 bump to version 2.1.2
Message-ID: <20200721200843.1A61F81596@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5f015ca68d6fe44d0334197eb1611dc9a696bb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

- Fix CVE-2020-4030: In FreeRDP before version 2.1.2, there is an out of
  bounds read in TrioParse. Logging might bypass string length checks
  due to an integer overflow.
- Fix CVE-2020-4031: In FreeRDP before version 2.1.2, there is a
  use-after-free in gdi_SelectObject. All FreeRDP clients using
  compatibility mode with /relax-order-checks are affected.
- Fix CVE-2020-4032: In FreeRDP before version 2.1.2, there is an
  integer casting vulnerability in update_recv_secondary_order. All
  clients with +glyph-cache /relax-order-checks are affected.
- Fix CVE-2020-4033: In FreeRDP before version 2.1.2, there is an out of
  bounds read in RLEDECOMPRESS. All FreeRDP based clients with sessions
  with color depth < 32 are affected.
- Fix CVE-2020-11095: In FreeRDP before version 2.1.2, an out of bound
  reads occurs resulting in accessing a memory location that is outside
  of the boundaries of the static array
  PRIMARY_DRAWING_ORDER_FIELD_BYTES.
- Fix CVE-2020-11096: In FreeRDP before version 2.1.2, there is a global
  OOB read in update_read_cache_bitmap_v3_order. As a workaround, one
  can disable bitmap cache with -bitmap-cache (default).
- Fix CVE-2020-11097: In FreeRDP before version 2.1.2, an out of bounds
  read occurs resulting in accessing a memory location that is outside
  of the boundaries of the static array
  PRIMARY_DRAWING_ORDER_FIELD_BYTES.
- Fix CVE-2020-11098: In FreeRDP before version 2.1.2, there is an
  out-of-bound read in glyph_cache_put. This affects all FreeRDP clients
  with `+glyph-cache` option enabled.
- Fix CVE-2020-11099: In FreeRDP before version 2.1.2, there is an out
  of bounds read in license_read_new_or_upgrade_license_packet. A
  manipulated license packet can lead to out of bound reads to an
  internal buffer.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7f54bfc16963845d0294784c3c5d22e615f59a66)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freerdp/freerdp.hash | 4 ++--
 package/freerdp/freerdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index a6100271fd..6c52d38a4f 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.1.1.tar.gz.sha256
-sha256  6c6bf72fba1058ca6524c040d0825e4cdaa88682884a6c1c360e1cd5b8e21723  freerdp-2.1.1.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.1.2.tar.gz.sha256
+sha256  f33bc6aef83b8ad3cbf2cdbc82dcfa980ec2b051efb72650f6f2365d55b79b8d  freerdp-2.1.2.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index f3bc26ac52..33b83922cc 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.1.1
+FREERDP_VERSION = 2.1.2
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
