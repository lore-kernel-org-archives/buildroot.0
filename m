From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 31 Aug 2019 12:34:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/flatbuffers: remove 'v' prefix from
 github-fetched packages
Message-ID: <20190831103456.5261-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes version parsing for release-monitoring.org support.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/flatbuffers/flatbuffers.hash | 2 +-
 package/flatbuffers/flatbuffers.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/flatbuffers/flatbuffers.hash b/package/flatbuffers/flatbuffers.hash
index 3cd737273a..0cbdb6fe5b 100644
--- a/package/flatbuffers/flatbuffers.hash
+++ b/package/flatbuffers/flatbuffers.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	3f4a286642094f45b1b77228656fbd7ea123964f19502f9ecfd29933fd23a50b	flatbuffers-v1.11.0.tar.gz
+sha256	3f4a286642094f45b1b77228656fbd7ea123964f19502f9ecfd29933fd23a50b	flatbuffers-1.11.0.tar.gz
 sha256	7ec9661a8afafab1eee3523d6f1a193eff76314a5ab10b4ce96aefd87621b0c3	LICENSE.txt
diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
index 3664cc79cb..dcb5579e64 100644
--- a/package/flatbuffers/flatbuffers.mk
+++ b/package/flatbuffers/flatbuffers.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FLATBUFFERS_VERSION = v1.11.0
-FLATBUFFERS_SITE = $(call github,google,flatbuffers,$(FLATBUFFERS_VERSION))
+FLATBUFFERS_VERSION = 1.11.0
+FLATBUFFERS_SITE = $(call github,google,flatbuffers,v$(FLATBUFFERS_VERSION))
 FLATBUFFERS_LICENSE = Apache-2.0
 FLATBUFFERS_LICENSE_FILES = LICENSE.txt
 FLATBUFFERS_INSTALL_STAGING = YES
-- 
2.20.1
