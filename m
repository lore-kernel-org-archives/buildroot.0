From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jan 2016 11:30:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/pax-utils: bump version to 1.1.4 to
	fix musl build
Message-ID: <1454236206-28318-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The build error has not yet been found by the autobuilders:

elf.h:31:1: error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before ?typedef?
 typedef uint16_t Elf32_Half;
 ^
elf.h:59:9: error: unknown type name ?Elf32_Half?
 typedef Elf32_Half Elf32_Versym;
         ^
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pax-utils/pax-utils.hash | 2 +-
 package/pax-utils/pax-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pax-utils/pax-utils.hash b/package/pax-utils/pax-utils.hash
index 54013c9..399bae4 100644
--- a/package/pax-utils/pax-utils.hash
+++ b/package/pax-utils/pax-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	844ff25b1a11bcef92ef34b22f576f226a772b67196818656f8874513438f5b9	pax-utils-0.8.1.tar.xz
+sha256	796860fbd48c5f811e699e8492dc1110459bad0a62efa8d346b74a4f6f556414	pax-utils-1.1.4.tar.xz
diff --git a/package/pax-utils/pax-utils.mk b/package/pax-utils/pax-utils.mk
index fc0589f..fc2e0ca 100644
--- a/package/pax-utils/pax-utils.mk
+++ b/package/pax-utils/pax-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAX_UTILS_VERSION = 0.8.1
+PAX_UTILS_VERSION = 1.1.4
 PAX_UTILS_SITE = http://distfiles.gentoo.org/distfiles
 PAX_UTILS_SOURCE = pax-utils-$(PAX_UTILS_VERSION).tar.xz
 PAX_UTILS_LICENSE = GPLv2
-- 
2.7.0
