From: Axel Lin <axel.lin@ingics.com>
Date: Thu, 10 Oct 2013 11:06:23 +0800
Subject: [Buildroot] [PATCH 2/2] spice: bump to version 0.12.4
In-Reply-To: <1381374101.6420.1.camel@phoenix>
References: <1381374101.6420.1.camel@phoenix>
Message-ID: <1381374383.6420.4.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to the ChangeLog, spice needs glib2 since 0.12.2.
Thus add libglib2 dependency to fix build error if !BR2_PACKAGE_LIBGLIB2.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/spice/Config.in | 1 +
 package/spice/spice.mk  | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/spice/Config.in b/package/spice/Config.in
index cd91833..5b28e68 100644
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_SPICE
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_CELT051
 	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_PYTHON_PYPARSING
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index a016da6..d44e3bf 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPICE_VERSION         = 0.12.0
+SPICE_VERSION         = 0.12.4
 SPICE_SOURCE          = spice-$(SPICE_VERSION).tar.bz2
 SPICE_SITE            = http://www.spice-space.org/download/releases/
 SPICE_LICENSE         = LGPLv2.1+
@@ -14,6 +14,7 @@ SPICE_DEPENDENCIES    = \
     alsa-lib            \
     celt051             \
     jpeg                \
+    libglib2		\
     openssl             \
     pixman              \
     python-pyparsing    \
-- 
1.8.1.2
