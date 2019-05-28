From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 28 May 2019 18:24:11 +0300
Subject: [Buildroot] [PATCH] package/nano: bump to version 4.2
Message-ID: <65c0aeb30f578b75c7df32344a22b4f1c65526fd.1559057051.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the usual enable/disable options for the libmagic optional
dependency.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index eae648d16ef8..b7fd6a6cfd9b 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v3/nano-3.2.tar.xz.asc
+# https://www.nano-editor.org/dist/v4/nano-4.2.tar.xz.asc
 # using key BFD009061E535052AD0DF2150D28D4D2A0ACE884
-sha256 d12773af3589994b2e4982c5792b07c6240da5b86c5aef2103ab13b401fe6349  nano-3.2.tar.xz
+sha256 1143defce62e391b241252ffdb6e5c1ded56cfe26d46ee81b796abe0ccc45df9  nano-4.2.tar.xz
 sha256 fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 206d210a169d..8a315154d270 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NANO_VERSION_MAJOR = 3
+NANO_VERSION_MAJOR = 4
 NANO_VERSION = $(NANO_VERSION_MAJOR).2
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
@@ -24,8 +24,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_FILE),y)
 NANO_DEPENDENCIES += file
+NANO_CONF_OPTS += --enable-libmagic
 else
-NANO_CONF_ENV += ac_cv_lib_magic_magic_open=no
+NANO_CONF_OPTS += --disable-libmagic
 endif
 
 ifeq ($(BR2_PACKAGE_NANO_TINY),y)
-- 
2.20.1
