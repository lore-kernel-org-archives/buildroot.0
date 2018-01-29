From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jan 2018 21:09:35 +0100
Subject: [Buildroot] [git commit] wine: Bump to version 3.0
Message-ID: <20180129202807.4035684740@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de47508cea556e540d85aee8ab4c749d4d5aaf6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wine/wine.hash | 2 +-
 package/wine/wine.mk   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index 7f0a785eb0..176e0ee653 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 a811c664f870a3a01449443a93a6fcee41aea2e912e58f72742eb7924962be56 wine-2.0.3.tar.xz
+sha256 346a050aca5cd0d9978a655af11c30e68c201a58aea0c70d5e4c4f1b63c2fbec wine-3.0.tar.xz
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index d540886782..02c4c0f155 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-WINE_VERSION = 2.0.3
+WINE_VERSION = 3.0
 WINE_SOURCE = wine-$(WINE_VERSION).tar.xz
-WINE_SITE = https://dl.winehq.org/wine/source/2.0
+WINE_SITE = https://dl.winehq.org/wine/source/3.0
 WINE_LICENSE = LGPL-2.1+
 WINE_LICENSE_FILES = COPYING.LIB LICENSE
 WINE_DEPENDENCIES = host-bison host-flex host-wine
@@ -23,6 +23,7 @@ WINE_CONF_OPTS = \
 	--without-gphoto \
 	--without-gsm \
 	--without-hal \
+	--without-krb5 \
 	--without-opencl \
 	--without-oss
 
@@ -347,6 +348,7 @@ HOST_WINE_CONF_OPTS += \
 	--without-gstreamer \
 	--without-hal \
 	--without-jpeg \
+	--without-krb5 \
 	--without-ldap \
 	--without-mpg123 \
 	--without-netapi \
