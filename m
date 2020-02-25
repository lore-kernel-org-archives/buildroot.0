From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 25 Feb 2020 15:28:26 -0800
Subject: [Buildroot] [PATCH 1/1] package/vala: bump version to 0.46.6
Message-ID: <20200225232826.958260-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Also add the line "HOST_VALA_CONF_OPTS += --disable-valadoc"
as valadoc requires libgvc which is not available in Buildroot.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/vala/vala.hash | 4 ++--
 package/vala/vala.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/vala/vala.hash b/package/vala/vala.hash
index 7b3f0c9f76..319c7ef2f4 100644
--- a/package/vala/vala.hash
+++ b/package/vala/vala.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/vala/0.34/vala-0.34.7.sha256sum
-sha256  1b2cb14f377d4c41fa3a86d3d01b93017015ce91b6714a85f27346073b4034fa  vala-0.34.7.tar.xz
+# From https://download.gnome.org/sources/vala/0.46/vala-0.46.6.sha256sum
+sha256  ef31649932872f094971d46453b21c60a41661670f98afa334062425b4aec47a  vala-0.46.6.tar.xz
 # Locally computed
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index ad0a5650f7..b8a69f8c5e 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-VALA_VERSION_MAJOR = 0.34
-VALA_VERSION = $(VALA_VERSION_MAJOR).7
+VALA_VERSION_MAJOR = 0.46
+VALA_VERSION = $(VALA_VERSION_MAJOR).6
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_LICENSE = LGPL-2.1+
@@ -15,6 +15,7 @@ HOST_VALA_DEPENDENCIES = host-bison host-flex host-libglib2
 # Yes, the autoconf script understands ':' as "xsltproc is not
 # available".
 HOST_VALA_CONF_ENV = ac_cv_path_XSLTPROC=:
+HOST_VALA_CONF_OPTS += --disable-valadoc
 
 # We wrap vala & valac to point to the proper gir and vapi data dirs
 # Otherwise we'll get host directory data which isn't enough
-- 
2.24.1
