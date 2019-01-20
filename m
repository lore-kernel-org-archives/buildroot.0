From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 Jan 2019 10:47:50 +0100
Subject: [Buildroot] [PATCH 1/2] libupnpp: fix libupnp dependency
Message-ID: <20190120094751.4520-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 9b551dacf74445d58aaefef349e2817e009c9d5d added support for
libupnp18 but without updating LIBUPNPP_DEPENDENCIES

Fixes:
 - http://autobuild.buildroot.org/results/aa734318b9ad318d25e772585c8794429cc0f489

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libupnpp/libupnpp.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index 69ce0768a9..31a066a648 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -9,7 +9,8 @@ LIBUPNPP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBUPNPP_LICENSE = LGPL-2.1+
 LIBUPNPP_LICENSE_FILES = COPYING
 LIBUPNPP_INSTALL_STAGING = YES
-LIBUPNPP_DEPENDENCIES = expat libcurl libupnp
+LIBUPNPP_DEPENDENCIES = expat libcurl \
+	$(if $(BR2_PACKAGE_LIBUPNP),libupnp,libupnp18)
 # We're patching configure.ac
 LIBUPNPP_AUTORECONF = YES
 
-- 
2.14.1
