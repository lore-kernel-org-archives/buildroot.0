From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 13:17:29 +0100
Subject: [Buildroot] [git commit] tinyalsa: avoid install in /usr/local/
Message-ID: <20161105121735.C1A77802F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2362fc9c4d6add63c0a5c077d2729c0a67f239f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set the PREFIX to avoid installing files in [...]/usr/local/.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
