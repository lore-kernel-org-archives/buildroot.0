From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 23 Dec 2020 12:22:58 +0100
Subject: [Buildroot] [PATCH 1/2] package/sysstat: bump to version 12.4.2
Message-ID: <20201223112259.2290938-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop NLS workaround, not needed since
https://github.com/sysstat/sysstat/commit/1b4185b599730e6139aaaaaa48eb6626fb732c9d

https://github.com/sysstat/sysstat/blob/v12.4.2/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sysstat/sysstat.hash | 4 ++--
 package/sysstat/sysstat.mk   | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.hash
index 57fc8f181e..b573f312c6 100644
--- a/package/sysstat/sysstat.hash
+++ b/package/sysstat/sysstat.hash
@@ -1,5 +1,5 @@
 # From: http://sebastien.godard.pagesperso-orange.fr/download.html
-sha1  4da5a48d0152eba5b34d94bf28dcb08fc48fb32b  sysstat-12.2.1.tar.xz
+sha1  1e38bc029979def730ae1fb1e39f631bd1a3bc73  sysstat-12.4.2.tar.xz
 # Locally calculated
-sha256  8edb0e19b514ac560a098a02933a4735b881296d61014db89bf80f05dd7a4732  sysstat-12.2.1.tar.xz
+sha256  3701b2c1883d50eb384d7b95ce5b6df0a71fdcb3c23f96cb58098d1bcffa018f  sysstat-12.4.2.tar.xz
 sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  COPYING
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index f994ad6e3c..8e627f2e96 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-SYSSTAT_VERSION = 12.2.1
+SYSSTAT_VERSION = 12.4.2
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPTS = --disable-file-attr --disable-sensors
 SYSSTAT_DEPENDENCIES = host-gettext $(TARGET_NLS_DEPENDENCIES)
 SYSSTAT_LICENSE = GPL-2.0+
 SYSSTAT_LICENSE_FILES = COPYING
-SYSSTAT_MAKE_OPTS += LFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
 
 $(eval $(autotools-package))
-- 
2.29.2
