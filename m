From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Sep 2015 00:01:09 +0200
Subject: [Buildroot] [PATCHv3 08/15] directfb: add new TIFF option
In-Reply-To: <1441144876-2628-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1441144876-2628-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1441144876-2628-9-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Seiderer <ps.report@gmx.net>

[Thomas: don't enable option by default.]

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/directfb/Config.in   | 4 ++++
 package/directfb/directfb.mk | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index f8865e8..548f602 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -125,6 +125,10 @@ config BR2_PACKAGE_DIRECTFB_GIF
 	bool "enable GIF support"
 	default y
 
+config BR2_PACKAGE_DIRECTFB_TIFF
+	bool "enable TIFF support"
+	select BR2_PACKAGE_TIFF
+
 config BR2_PACKAGE_DIRECTFB_IMLIB2
 	bool "enable IMLIB2 support"
 	select BR2_PACKAGE_IMLIB2
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index ea579f5..5e68b7b 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -106,6 +106,13 @@ else
 DIRECTFB_CONF_OPTS += --disable-gif
 endif
 
+ifeq ($(BR2_PACKAGE_DIRECTFB_TIFF),y)
+DIRECTFB_CONF_OPTS += --enable-tiff
+DIRECTFB_DEPENDENCIES += tiff
+else
+DIRECTFB_CONF_OPTS += --disable-tiff
+endif
+
 ifeq ($(BR2_PACKAGE_DIRECTFB_PNG),y)
 DIRECTFB_CONF_OPTS += --enable-png
 DIRECTFB_DEPENDENCIES += libpng
-- 
2.5.1
