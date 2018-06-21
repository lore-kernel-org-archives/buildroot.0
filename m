From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 21 Jun 2018 23:11:18 +0300
Subject: [Buildroot] [PATCH] pulseaudio: remove autoreconf
Message-ID: <9f57c97750d5799dbc96ceeae29a800d80c96a76.1529611878.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 08c7b77803285 (package/pulseaudio: bump version to 12.0) removed
configure.ac patch, but forgot to drop autoreconf. Fix that.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/pulseaudio/pulseaudio.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 1f6bab2e3d6d..55f9def6397e 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -15,9 +15,6 @@ PULSEAUDIO_CONF_OPTS = \
 	--disable-legacy-database-entry-format \
 	--disable-manpages
 
-# 0001-memfd-wrappers-only-define-memfd_create-if-not-alrea.patch
-PULSEAUDIO_AUTORECONF = YES
-
 PULSEAUDIO_DEPENDENCIES = \
 	host-pkgconf libtool libsndfile speex host-intltool \
 	$(if $(BR2_PACKAGE_LIBGLIB2),libglib2) \
-- 
2.17.1
