From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Sep 2020 14:17:55 +0200
Subject: [Buildroot] [git commit] package/harfbuzz: bump to version 2.6.8
Message-ID: <20200912121059.084D6877CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a29fd86cf4a09450a6809f43d2326f7b73406842
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- update home page URL (old one is redirected to github)
- change download to new location (github)
- update license hash because of copyright year update:

diff COPING:
-Copyright ?? 2010,2011,2012,2013,2014,2015,2016,2017,2018,2019  Google, Inc.
-Copyright ?? 2019  Facebook, Inc.
+Copyright ?? 2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020  Google, Inc.
+Copyright ?? 2018,2019,2020  Ebrahim Byagowi
+Copyright ?? 2019,2020  Facebook, Inc.

note: newer versions (2.7.x) require a migration to meson
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/harfbuzz/Config.in     | 2 +-
 package/harfbuzz/harfbuzz.hash | 6 ++----
 package/harfbuzz/harfbuzz.mk   | 4 ++--
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/harfbuzz/Config.in b/package/harfbuzz/Config.in
index e8f407bb8f..27fa102e1f 100644
--- a/package/harfbuzz/Config.in
+++ b/package/harfbuzz/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HARFBUZZ
 	help
 	  HarfBuzz is an OpenType text shaping engine
 
-	  http://www.freedesktop.org/wiki/Software/HarfBuzz/
+	  https://harfbuzz.github.io/
 
 	  Harfbuzz can make optional use of cairo, freetype,
 	  glib2 and icu packages if they are selected.
diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index ba54f477aa..660e19efc9 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,5 +1,3 @@
-# From https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-2.6.4.tar.xz.sha256
-sha256 9413b8d96132d699687ef914ebb8c50440efc87b3f775d25856d7ec347c03c12  harfbuzz-2.6.4.tar.xz
-
 # Locally computed
-sha256 1b32b6e2fea50440c128c5ba482f7691367c46fd0cd573b80fc863bf07964cea  COPYING
+sha256  6648a571a27f186e47094121f0095e1b809e918b3037c630c7f38ffad86e3035  harfbuzz-2.6.8.tar.xz
+sha256  beb3f017ceb41387667f78237a7cecf84defa0ed257c505894663d6a9f13211b  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 3006b5ab98..c7bb8f9347 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 2.6.4
-HARFBUZZ_SITE = https://www.freedesktop.org/software/harfbuzz/release
+HARFBUZZ_VERSION = 2.6.8
+HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
 HARFBUZZ_LICENSE_FILES = COPYING
