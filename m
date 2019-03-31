From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 31 Mar 2019 16:53:19 +0200
Subject: [Buildroot] [PATCH] package/gettext-tiny: fix licensing
Message-ID: <20190331145319.22234-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix the license lis: it should be a space-separated list of files, it is
not a comma-separated list.

Fixes:
    http://autobuild.buildroot.org/results/74b/74be940e5757d18452b0eb97b9973c278be20345/

Add hashes for the license files while at it, and cleanup the hash file
as well.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gettext-tiny/gettext-tiny.hash | 6 ++++--
 package/gettext-tiny/gettext-tiny.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/gettext-tiny/gettext-tiny.hash b/package/gettext-tiny/gettext-tiny.hash
index 755f7f6ecf..672e964186 100644
--- a/package/gettext-tiny/gettext-tiny.hash
+++ b/package/gettext-tiny/gettext-tiny.hash
@@ -1,5 +1,7 @@
 # Locally Computed:
 sha256 654dcd52f2650476c8822b60bee89c20a0aa7f6a1bf6001701eeacd71a9e388b  gettext-tiny-v0.3.1.tar.gz
+sha256 b57aa4fdc1c614c28d41c1e2d5c4090935964c5f86291ba7d1c99ffd1d698b34  LICENSE
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  extra/COPYING
 # From http://lists.gnu.org/archive/html/bug-gettext/2016-06/msg00008.html
-md5	df3f5690eaa30fd228537b00cb7b7590	gettext-0.19.8.1.tar.xz
-sha1	e0fe90ede22f7f16bbde7bdea791a835f2773fc9	gettext-0.19.8.1.tar.xz
+md5  df3f5690eaa30fd228537b00cb7b7590         gettext-0.19.8.1.tar.xz
+sha1 e0fe90ede22f7f16bbde7bdea791a835f2773fc9 gettext-0.19.8.1.tar.xz
diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index a555fbef50..3fe2de30b6 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -8,7 +8,7 @@ GETTEXT_TINY_VERSION = v0.3.1
 GETTEXT_TINY_SITE = $(call github,sabotage-linux,gettext-tiny,$(GETTEXT_TINY_VERSION))
 GETTEXT_TINY_LICENSE = MIT, GPL-3.0+ (extra gettext)
 GETTEXT_TINY_INSTALL_STAGING = YES
-GETTEXT_TINY_LICENSE_FILES = LICENSE, extra/COPYING
+GETTEXT_TINY_LICENSE_FILES = LICENSE extra/COPYING
 GETTEXT_TINY_OPTS = LIBINTL=NOOP
 
 GETTEXT_TINY_PROVIDES = gettext
-- 
2.14.1
