From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  2 Dec 2019 20:22:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/kyua: bump to version 0.13
Message-ID: <20191202192252.1484205-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

COPYING was renamed into LICENSE since version 0.12 and
https://github.com/jmmv/kyua/commit/db509f9d9ece719bf8452d6ddbc842ae311b1bc2

So update KYUA_LICENSE_FILES and add hash for LICENSE file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/kyua/kyua.hash | 3 ++-
 package/kyua/kyua.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/kyua/kyua.hash b/package/kyua/kyua.hash
index 298d0d85c6..66681692fc 100644
--- a/package/kyua/kyua.hash
+++ b/package/kyua/kyua.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 2b8b64a458b642df75086eeb73e8073d105b8d9cff04c9b1a905b68bc8502560 kyua-0.11.tar.gz
+sha256 db6e5d341d5cf7e49e50aa361243e19087a00ba33742b0855d2685c0b8e721d6 kyua-0.13.tar.gz
+sha256 a6a8f43f6d2ed9b801978cc012cc816c4a9421a6dcea0579d3a40eab4b349674 LICENSE
diff --git a/package/kyua/kyua.mk b/package/kyua/kyua.mk
index 9e1c810ac4..5caa203917 100644
--- a/package/kyua/kyua.mk
+++ b/package/kyua/kyua.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-KYUA_VERSION = 0.11
+KYUA_VERSION = 0.13
 KYUA_SITE = https://github.com/jmmv/kyua/releases/download/kyua-$(KYUA_VERSION)
 KYUA_DEPENDENCIES = host-pkgconf atf lutok sqlite
 KYUA_CONF_OPTS = --without-doxygen --without-atf
 KYUA_LICENSE = BSD-3-Clause
-KYUA_LICENSE_FILES = COPYING
+KYUA_LICENSE_FILES = LICENSE
 KYUA_CONF_ENV = \
 	kyua_cv_attribute_noreturn=yes \
 	kyua_cv_getcwd_dyn=yes \
-- 
2.24.0
