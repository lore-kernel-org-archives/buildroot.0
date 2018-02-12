From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 12 Feb 2018 22:02:31 +0200
Subject: [Buildroot] [PATCH] librsvg: security bump to version 2.40.20
Message-ID: <aaf6ad8dfb35b1dee1bcfaa1f00bb50f19fbcbf9.1518465751.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2018-1000041: information disclosure via a crafted SVG file.

Bump to the latest (maybe last) release in the 2.40.x series. Newer
versions require a Rust compiler.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/librsvg/librsvg.hash | 4 ++--
 package/librsvg/librsvg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/librsvg/librsvg.hash b/package/librsvg/librsvg.hash
index 9ab798120f92..6f4b07423a28 100644
--- a/package/librsvg/librsvg.hash
+++ b/package/librsvg/librsvg.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/librsvg/2.40/librsvg-2.40.18.sha256sum
-sha256	bfc8c488c89c1e7212c478beb95c41b44701636125a3e6dab41187f1485b564c	librsvg-2.40.18.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/librsvg/2.40/librsvg-2.40.20.sha256sum
+sha256	cff4dd3c3b78bfe99d8fcfad3b8ba1eee3289a0823c0e118d78106be6b84c92b	librsvg-2.40.20.tar.xz
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index c8afdfd69fff..4f563ce6dbe7 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBRSVG_VERSION_MAJOR = 2.40
-LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).18
+LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).20
 LIBRSVG_SITE = http://ftp.gnome.org/pub/gnome/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
 LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
 LIBRSVG_INSTALL_STAGING = YES
-- 
2.15.1
