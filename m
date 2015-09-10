From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Sep 2015 13:55:58 +0200
Subject: [Buildroot] [git commit] directfb: add new TIFF option
Message-ID: <20150910122136.ADCCD81F77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d16db90e3111f2d191664d5773b47638b6ad6d48
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: don't enable option by default.]

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/directfb/Config.in   |    4 ++++
 package/directfb/directfb.mk |    7 +++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

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
