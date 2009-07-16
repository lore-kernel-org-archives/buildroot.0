From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 16 Jul 2009 14:16:25 +0200
Subject: [Buildroot] [git commit] qtopia4: add option for STL support
Message-ID: <20090716194800.04A6577804@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c243d12d96b76136e334a8e51e8c41cb1d782b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qtopia4/Config.in  |    6 ++++++
 package/qtopia4/qtopia4.mk |    7 ++++++-
 2 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/package/qtopia4/Config.in b/package/qtopia4/Config.in
index 0524312..457b939 100644
--- a/package/qtopia4/Config.in
+++ b/package/qtopia4/Config.in
@@ -310,6 +310,12 @@ config BR2_PACKAGE_QTOPIA4_WEBKIT
 	  Build the WebKit module.
 	  If unsure, say n.
 
+config BR2_PACKAGE_QTOPIA4_STL
+	bool "STL support"
+	help
+	  Compile STL support.
+	  If unsure, say n.
+
 config BR2_PACKAGE_QTOPIA4_OPENSSL
 	bool "Enable OpenSSL support"
 	depends on BR2_PACKAGE_QTOPIA4_NETWORK
diff --git a/package/qtopia4/qtopia4.mk b/package/qtopia4/qtopia4.mk
index f7196f4..0d2b980 100644
--- a/package/qtopia4/qtopia4.mk
+++ b/package/qtopia4/qtopia4.mk
@@ -323,6 +323,12 @@ else
 QTOPIA4_CONFIGURE+= -no-webkit
 endif
 
+ifeq ($(BR2_PACKAGE_QTOPIA4_STL),y)
+QTOPIA4_CONFIGURE+= -stl
+else
+QTOPIA4_CONFIGURE+= -no-stl
+endif
+
 QTOPIA4_CONFIGURE:=$(strip $(subst ",, $(QTOPIA4_CONFIGURE)))
 #"))
 BR2_PACKAGE_QTOPIA4_EMB_PLATFORM:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)))
@@ -460,7 +466,6 @@ endif
 		-embedded $(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM) \
 		$(QTOPIA4_QCONFIG_COMMAND) \
 		$(QTOPIA4_CONFIGURE) \
-		-no-stl \
 		-no-cups \
 		-no-nis \
 		-no-accessibility \
-- 
1.6.3.3
