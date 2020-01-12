From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jan 2020 21:21:02 +0100
Subject: [Buildroot] [git commit] package/alure: add minimp3 decoder option
Message-ID: <20200112201134.BD55A8B580@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af4ce1f07ee6a7773d3303b5f0a6a4d6f06a503e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Alure doesn't use/need an external minimp3 library.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/alure/Config.in | 5 +++++
 package/alure/alure.mk  | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/alure/Config.in b/package/alure/Config.in
index be3f8ebfdd..e0064accba 100644
--- a/package/alure/Config.in
+++ b/package/alure/Config.in
@@ -23,6 +23,11 @@ config BR2_PACKAGE_ALURE_FLAC_DECODER
 	help
 	  Enables the built-in FLAC decoder.
 
+config BR2_PACKAGE_ALURE_MINIMP3_DECODER
+	bool "minimp3 decoder"
+	help
+	  Enables the built-in minimp3 decoder.
+
 config BR2_PACKAGE_ALURE_OPUS_DECODER
 	bool "opus decoder"
 	select BR2_PACKAGE_LIBOGG
diff --git a/package/alure/alure.mk b/package/alure/alure.mk
index 3e88e09664..f0eca8a2ee 100644
--- a/package/alure/alure.mk
+++ b/package/alure/alure.mk
@@ -16,7 +16,6 @@ ALURE_DEPENDENCIES = openal
 # Enable at least one built-in decoder (wave).
 ALURE_CONF_OPTS = -DALURE_INSTALL=ON \
 	-DALURE_BUILD_EXAMPLES=OFF \
-	-DALURE_ENABLE_MINIMP3=OFF \
 	-DALURE_ENABLE_WAVE=ON
 
 ifeq ($(BR2_PACKAGE_ALURE_FLAC_DECODER),y)
@@ -25,6 +24,12 @@ else
 ALURE_CONF_OPTS += -DALURE_ENABLE_FLAC=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_ALURE_MINIMP3_DECODER),y)
+ALURE_CONF_OPTS += -DALURE_ENABLE_MINIMP3=ON
+else
+ALURE_CONF_OPTS += -DALURE_ENABLE_MINIMP3=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_ALURE_OPUS_DECODER),y)
 ALURE_CONF_OPTS += -DALURE_ENABLE_OPUS=ON
 ALURE_DEPENDENCIES += libogg opus
