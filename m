From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 Jan 2019 10:47:51 +0100
Subject: [Buildroot] [PATCH 2/2] libupnpp: remove AUTORECONF
In-Reply-To: <20190120094751.4520-1-fontaine.fabrice@gmail.com>
References: <20190120094751.4520-1-fontaine.fabrice@gmail.com>
Message-ID: <20190120094751.4520-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 9b551dacf74445d58aaefef349e2817e009c9d5d removed patch on
configure.ac so remove uneeded LIBUPNPP_AUTORECONF

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libupnpp/libupnpp.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index 31a066a648..3619050f10 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -11,8 +11,6 @@ LIBUPNPP_LICENSE_FILES = COPYING
 LIBUPNPP_INSTALL_STAGING = YES
 LIBUPNPP_DEPENDENCIES = expat libcurl \
 	$(if $(BR2_PACKAGE_LIBUPNP),libupnp,libupnp18)
-# We're patching configure.ac
-LIBUPNPP_AUTORECONF = YES
 
 # configure script fails to link against the dependencies of libupnp
 # and libcurl causing detection to fail when statically linking
-- 
2.14.1
