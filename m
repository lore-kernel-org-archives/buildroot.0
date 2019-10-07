From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 23:10:30 +0200
Subject: [Buildroot] [git commit] package/libcoap: bump version to 4.2.0
Message-ID: <20191007210751.1A03B8B45D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52b0c0e5a50d63ed59f35eafc9b51cf2c602896e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream dropped GPL as licensing option:
https://github.com/obgm/libcoap/commit/bfca87cfb77b965f022d32ec82343a8eb368aa00

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcoap/libcoap.hash | 7 +++----
 package/libcoap/libcoap.mk   | 6 +++---
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/libcoap/libcoap.hash b/package/libcoap/libcoap.hash
index 9bed8ff59b..579a052c8d 100644
--- a/package/libcoap/libcoap.hash
+++ b/package/libcoap/libcoap.hash
@@ -1,5 +1,4 @@
 # Locally calculated
-sha256 f7e26dc232c177336474a14487771037a8fb32e311f5ccd076a00dc04b6d7b7a libcoap-4.1.2.tar.gz
-sha256 28b61fbf3c5477611d7f6ead97d15348934496d27dca815b34d45e622730e72e COPYING
-sha256 d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388 LICENSE.GPL
-sha256 9d5aeec17bdf82369bbe6e89efb07b7b35abefa044ea1d25cb2feeb70df1c208 LICENSE.BSD
+sha256 9523e38da6ee8b2a8f5ce83ded64107dd1e514c7ad00cd74ccfe3454b679c271 libcoap-4.2.0.tar.gz
+sha256 09dd86a017bad210527085008cbf706609c58210897b69845af14099577e7eb7 COPYING
+sha256 3821a9f881344ad53c543c84675ad4b6a29e913ca500cfa160ab52e4e6965b15 LICENSE
diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index a703f45e60..e2fbaa3dfb 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBCOAP_VERSION = 4.1.2
+LIBCOAP_VERSION = 4.2.0
 LIBCOAP_SITE = $(call github,obgm,libcoap,v$(LIBCOAP_VERSION))
 LIBCOAP_INSTALL_STAGING = YES
-LIBCOAP_LICENSE = GPL-2.0+ or BSD-2-Clause
-LIBCOAP_LICENSE_FILES = COPYING LICENSE.GPL LICENSE.BSD
+LIBCOAP_LICENSE = BSD-2-Clause
+LIBCOAP_LICENSE_FILES = COPYING LICENSE
 LIBCOAP_DEPENDENCIES = host-pkgconf
 LIBCOAP_CONF_OPTS = --disable-examples
 LIBCOAP_AUTORECONF = YES
