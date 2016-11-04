From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  4 Nov 2016 16:28:42 +0100
Subject: [Buildroot] [PATCH] tinyalsa: avoid install in /usr/local/
Message-ID: <20161104152842.24174-1-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set the PREFIX to avoid installing files in [...]/usr/local/.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/tinyalsa/tinyalsa.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tinyalsa/tinyalsa.mk b/package/tinyalsa/tinyalsa.mk
index 4cd01d5..87753d6 100644
--- a/package/tinyalsa/tinyalsa.mk
+++ b/package/tinyalsa/tinyalsa.mk
@@ -16,6 +16,7 @@ endef
 define TINYALSA_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) \
 		-C $(@D) \
+		PREFIX="/usr" \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
 		DESTDIR="$(STAGING_DIR)" install
 endef
@@ -23,6 +24,7 @@ endef
 define TINYALSA_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) \
 		-C $(@D) \
+		PREFIX="/usr" \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
 		DESTDIR="$(TARGET_DIR)" install
 endef
-- 
2.9.3
