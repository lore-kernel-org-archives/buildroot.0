From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  5 Jan 2020 12:32:04 +0100
Subject: [Buildroot] [PATCH 6/6] package/alure: add minimp3 decoder option
In-Reply-To: <20200105113204.30356-1-romain.naour@gmail.com>
References: <20200105113204.30356-1-romain.naour@gmail.com>
Message-ID: <20200105113204.30356-6-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alure doesn't use/need an external minimp3 library.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/alure/Config.in | 5 +++++
 package/alure/alure.mk  | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/alure/Config.in b/package/alure/Config.in
index 346e607eb8..651b6b0bab 100644
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
index 74e918f8f3..d3c87d704a 100644
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
-- 
2.24.1
