From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  5 Apr 2021 17:32:48 +0200
Subject: [Buildroot] [PATCH] boot/at91bootstrap: add legal information
Message-ID: <20210405153249.1352356-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The old at91bootstrap version (1.x) uses a strange variant of the BSD
license, called "BSD Source Code Attribution" and referenced by SPDX
as BSD-Source-Code.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/at91bootstrap/at91bootstrap.hash | 1 +
 boot/at91bootstrap/at91bootstrap.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/boot/at91bootstrap/at91bootstrap.hash b/boot/at91bootstrap/at91bootstrap.hash
index b1f963b825..e4a6760f12 100644
--- a/boot/at91bootstrap/at91bootstrap.hash
+++ b/boot/at91bootstrap/at91bootstrap.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  d66192a274247f4baa39fa932eadf903d7add55641d89d30402f967c4f2282a5  AT91Bootstrap1.16.zip
+sha256  cb53ea8cf7a54929944de5de10569f51068af4f6d63ddfe8735759bdd8cebf38  main.c
diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index c68b56b6ec..001427855f 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -7,6 +7,8 @@
 AT91BOOTSTRAP_VERSION = 1.16
 AT91BOOTSTRAP_SITE = ftp://www.at91.com/pub/at91bootstrap
 AT91BOOTSTRAP_SOURCE = AT91Bootstrap$(AT91BOOTSTRAP_VERSION).zip
+AT91BOOTSTRAP_LICENSE = BSD-Source-Code
+AT91BOOTSTRAP_LICENSE_FILES = main.c
 
 AT91BOOTSTRAP_BOARD = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_BOARD))
 AT91BOOTSTRAP_MEMORY = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_MEMORY))
-- 
2.30.2
