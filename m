From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 26 Jan 2021 20:25:35 +0100
Subject: [Buildroot] [PATCH 1/2] package/libiec61850: drop BUILD_EXAMPLES=OFF
Message-ID: <20210126192536.2183792-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BUILD_EXAMPLES=OFF is already passed by cmake-infrastructure

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libiec61850/libiec61850.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/libiec61850/libiec61850.mk b/package/libiec61850/libiec61850.mk
index 6413073805..c102feeac1 100644
--- a/package/libiec61850/libiec61850.mk
+++ b/package/libiec61850/libiec61850.mk
@@ -9,8 +9,7 @@ LIBIEC61850_SITE = $(call github,mz-automation,libiec61850,v$(LIBIEC61850_VERSIO
 LIBIEC61850_INSTALL_STAGING = YES
 LIBIEC61850_LICENSE = GPL-3.0+
 LIBIEC61850_LICENSE_FILES = COPYING
-LIBIEC61850_CONF_OPTS = -DBUILD_EXAMPLES=OFF \
-	-DBUILD_PYTHON_BINDINGS=OFF
+LIBIEC61850_CONF_OPTS = -DBUILD_PYTHON_BINDINGS=OFF
 
 # 0003-COTP-fixed-possible-heap-buffer-overflow-when-handling-message.patch
 LIBIEC61850_IGNORE_CVES += CVE-2020-15158
-- 
2.29.2
